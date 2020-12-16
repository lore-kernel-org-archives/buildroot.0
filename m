From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:00:08 -0800
Subject: [Buildroot] [PATCH 1/5] package/docker-containerd: fix version
 output ldflags
Message-ID: <20201216080013.547261-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tian Yuanhao <52117554+tianyuanhao@users.noreply.github.com>

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/docker-containerd/docker-containerd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index d9a0eb28a6..6b79bd14ae 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -12,7 +12,7 @@ DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 
 DOCKER_CONTAINERD_LDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+	-X $(DOCKER_CONTAINERD_GOMOD)/version.Version=$(DOCKER_CONTAINERD_VERSION)
 
 DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 
-- 
2.28.0
