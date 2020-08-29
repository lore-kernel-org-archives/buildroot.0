From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit branch/next] package/docker-containerd:
 drop <pkg>_WORKSPACE variable
Message-ID: <20200829124233.133C286CC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7ed0ae6cca1b86f03b81d461ae18fbac28df262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the go.mod integration, the <pkg>_WORKSPACE variable is no longer
needed, drop it.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 343d587907..904fa424b8 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -9,7 +9,6 @@ DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINER
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
-DOCKER_CONTAINERD_WORKSPACE = vendor
 DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 
 DOCKER_CONTAINERD_LDFLAGS = \
