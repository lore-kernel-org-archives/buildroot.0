From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 10 Nov 2016 08:05:38 +0100
Subject: [Buildroot] [PATCH v2 4/4] configs: atmel: at91sam9g45m10ek: update
	defconfig
In-Reply-To: <20161110070538.7193-1-ludovic.desroches@atmel.com>
References: <20161110070538.7193-1-ludovic.desroches@atmel.com>
Message-ID: <20161110070538.7193-5-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to a recent version of AT91bootstrap and use mainline version of
U-Boot and Linux.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 configs/at91sam9g45m10ek_defconfig | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
index 35618d5..6e3e068 100644
--- a/configs/at91sam9g45m10ek_defconfig
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -1,22 +1,31 @@
+# Architecture
 BR2_arm=y
 BR2_arm926t=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9m10g45ek"
+
+# Filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
 BR2_TARGET_ROOTFS_UBI=y
+
+# Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9m10g45eknf_uboot"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9m10g45ek_nandflash"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9m10g45ek_nandflash"
+
+# Host packages
 BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.9.0
