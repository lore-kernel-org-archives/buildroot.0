From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 17:30:52 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/docker-containerd: fix version output ldflags
Message-ID: <20210105162037.52CF186370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fcaac63a9dca30712401957631bbfd55260dcf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8107509a1d1994321ed681b00b7185ae1dc898fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
