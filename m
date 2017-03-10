From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 14:21:00 +0100
Subject: [Buildroot] [git commit] configs: beagleboardx15: fixate the header
	series
Message-ID: <20170310132314.66C2481F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88090d98461d06c7b3ad9f6e3e2c7f2fdbf143af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel headers version used to be default when the default was
still 4.9. Now, however, we switched the default headers version to
4.10 but the beagleboardx15 kernel is still 4.9, so we have to set
the kernel headers version explicitly.

Fixes https://gitlab.com/buildroot.org/buildroot/builds/11700987

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beagleboardx15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
index 25ee21b..393b29e 100644
--- a/configs/beagleboardx15_defconfig
+++ b/configs/beagleboardx15_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
