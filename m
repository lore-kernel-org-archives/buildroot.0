From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 10:51:42 +0100
Subject: [Buildroot] [git commit] configs: atmel: at91sam9g20dfc: update
	defconfig
Message-ID: <20161110095612.EEF63802F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e214d710f17490db98584dbaba70c69aa8b1b0e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to a recent version of AT91bootstrap and use mainline version of
U-Boot and Linux. This is needed to fix the build with gcc 5.x.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
[Thomas: add missing BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91sam9g20dfc_defconfig | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 4ed5a9b..15a8d87 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -2,28 +2,31 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 3.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
-
-# Host utilities
-#
-BR2_PACKAGE_HOST_SAM_BA=y
-
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9g20ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
-
-# Second stage bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek_nandflash"
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.6"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20ek"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g20ek"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
+
+# Bootloaders
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9g20eknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9g20ek_nandflash"
+
+# Host packages
+BR2_PACKAGE_HOST_SAM_BA=y
