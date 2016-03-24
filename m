From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 09:29:09 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: unify and update defconfig
	for Xplained boards
Message-ID: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unify and update the defconfig files for Atmel Xplained boards:
- use bootstrap as first stage bootloader
- build all dtb variants
- bump to latest version available on linux4sam github

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 configs/atmel_sama5d3_xplained_defconfig     | 16 ++++++++------
 configs/atmel_sama5d3_xplained_mmc_defconfig | 32 ++++++++++++++--------------
 configs/atmel_sama5d4_xplained_defconfig     | 16 ++++++++------
 3 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 665a3d7..16e4521 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -2,26 +2,28 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.1-at91"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="at91bootstrap-3.x"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_nandflash"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
-BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_nandflash"
 BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 1a75767..6de479b 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -1,24 +1,24 @@
-# Architecture
 BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
-
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-
-# Kernel configuration
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.8"
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.1-at91"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
-
-# First/second stage bootloader
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="at91bootstrap-3.x"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_mmc"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_mmc"
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 0991f86..7ab37dc 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -3,16 +3,15 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.1-at91"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
 BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
@@ -21,11 +20,14 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="at91bootstrap-3.x"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sama5d4_xplained_nandflash"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
-BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_nandflash"
 BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.5.0
