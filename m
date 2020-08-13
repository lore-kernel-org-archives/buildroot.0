From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:32:17 -0700
Subject: [Buildroot] [PATCH v4 4/7] package/docker-engine: fix go-module
 package identifier
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200813213220.260112-4-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 6bb382f5a7..5809e3e6c4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -11,14 +11,14 @@ DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
-DOCKER_ENGINE_SRC_SUBDIR = github.com/docker/docker
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
 	-X main.Version=$(DOCKER_ENGINE_VERSION)
-
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
-DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
+
+DOCKER_ENGINE_GOMOD = github.com/docker/docker
+DOCKER_ENGINE_BUILD_TARGETS = $(DOCKER_ENGINE_GOMOD)/cmd/dockerd
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_TAGS += seccomp
-- 
2.28.0
