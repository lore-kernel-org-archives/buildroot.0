From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:57:14 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: add missing
 dependency on host-pkgconf
Message-ID: <20181230155239.56267813FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14cbcbe2d4ba01754b745101b365f0e80c6c87d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libsseccomp support is enabled, docker-containerd uses pkg-config
to find libsseccomp, so we must depend on host-pkconf.

Fixes the following build issue, detected with per-package directory
support:

pkg-config: exec: "pkg-config": executable file not found in $PATH

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index cc7ec0710e..12f2324a8c 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -19,7 +19,7 @@ DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
+DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
 endif
 
