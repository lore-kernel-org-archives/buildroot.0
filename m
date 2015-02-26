From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:46:26 +0100
Subject: [Buildroot] [git commit branch/next] configs/raspberrypi2: update
	and fix our defconfig
Message-ID: <20150226220121.4853C7FF28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79e8d730ad6d414f6a67724a68057e2025d3dda6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Lock to 3.19 kernel headers; and comment about installing DTBs; bump
kernel sha1.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi2_defconfig |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index d2f97fb..b523a4a 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -2,14 +2,24 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
+
 BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+# Lock to 3.19 headers as the RPi2 kernel is based off the 3.19 branch
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3c9fd364bfa6c0f6ef725d74b72a9b77dd0d0fb4"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="23c76b7f608e51258c6fca02aebeb5d588583149"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Install the DTB files, as the RPi2 uses the Device Tree
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
