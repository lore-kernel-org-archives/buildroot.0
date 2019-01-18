From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 16:00:17 +0100
Subject: [Buildroot] [git commit branch/2018.11.x]
 package/docker-containerd: add missing dependency on host-pkgconf
Message-ID: <20190118150027.6085F8DF34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=876d1660e2c8074cf78207ca0994bcefdfa77c7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

When libsseccomp support is enabled, docker-containerd uses pkg-config
to find libsseccomp, so we must depend on host-pkconf.

Fixes the following build issue, detected with per-package directory
support:

pkg-config: exec: "pkg-config": executable file not found in $PATH

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14cbcbe2d4ba01754b745101b365f0e80c6c87d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 121ef0939e..71bcfcca32 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -19,7 +19,7 @@ DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
+DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
 endif
 
