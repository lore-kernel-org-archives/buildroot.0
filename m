From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:13:53 -0800
Subject: [Buildroot] [PATCH v2 4/6] package/docker-engine: fix go-module
 package identifier
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <20200111041355.21705-4-christian@paral.in>
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
index eb3a7fd29f..e44d561b45 100644
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
2.24.1
