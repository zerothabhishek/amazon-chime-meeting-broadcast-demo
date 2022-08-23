IMAGE_NAME=meetingbcast
IMAGE_VERSION=latest
ENV_FILE=container.env
CONTAINER_NAME=bcast
IMAGE_LABEL=$(IMAGE_NAME):$(IMAGE_VERSION)
RECORDINGS_DIR=/var/recordings/

all: image

image:
	docker image build -t $(IMAGE_LABEL) .

run:
	docker run --rm --shm-size 2g --env-file $(ENV_FILE) --volume $(RECORDINGS_DIR):/data --name $(CONTAINER_NAME) $(IMAGE_LABEL) 2>&1 | tee $(CONTAINER_NAME).log

.PHONY: all image run
