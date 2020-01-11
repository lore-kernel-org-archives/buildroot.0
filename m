From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:13:52 -0800
Subject: [Buildroot] [PATCH v2 3/6] package/docker-containerd: fix go-module
 package identifier/targets
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <20200111041355.21705-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 69068e44f8..1d090d2326 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -9,13 +9,14 @@ DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINER
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
-DOCKER_CONTAINERD_WORKSPACE = vendor
-
+DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 DOCKER_CONTAINERD_LDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
-
-DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
+	-X $(DOCKER_CONTAINERD_GOMOD).GitCommit=$(DOCKER_CONTAINERD_VERSION)
 
+DOCKER_CONTAINERD_BUILD_TARGETS = \
+	$(DOCKER_CONTAINERD_GOMOD)/cmd/ctr \
+	$(DOCKER_CONTAINERD_GOMOD)/cmd/containerd \
+	$(DOCKER_CONTAINERD_GOMOD)/cmd/containerd-shim
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-- 
2.24.1
