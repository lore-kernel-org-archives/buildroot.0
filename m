From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:23:00 +0200
Subject: [Buildroot] [git commit] raspberrypi2: switch Linux kernel to
	rpi-3.18.y
Message-ID: <20150501082317.AE80581DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d5326d9a1934c57063a80c840027f072d22c749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This changes the kernel used on the Raspberry Pi 2 from the 3.19 branch
back to the 3.18 branch. This provides a couple of advantages:

  1. mmc0 works again. Floris Bos found out that this was due to using
     the precompiled DTB files from rpi-firmware. These DTBs were built
     using 3.18.
  2. The rpi-3.18.y branch is not regularly rebased like rpi-3.19.y
     according to popcornmix. See
     https://github.com/raspberrypi/linux/issues/915.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 6a48b26..5859749 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,15 +7,15 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Lock to 3.19 headers as the RPi2 kernel is based off the 3.19 branch
+# Lock to 3.18 headers as the RPi2 kernel is based off the 3.18 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2c4959b772a35d9d459b0a92f39bb066e9a44d37"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2747cc0bde4ca441691260fae1e34c9ef954ccae"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
