From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 10 Nov 2016 11:14:39 +0100
Subject: [Buildroot] [PATCH v2] configs: atmel: sama5d4ek removal
In-Reply-To: <20161110095409.y25d3vkzeebozw2j@tarshish>
References: <20161110095409.y25d3vkzeebozw2j@tarshish>
Message-ID: <20161110101439.27671-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Atmel sama5d4ek board is no longer sold. Since there is the Xplained
board and we won't maintain anymore the EK board, the defconfig can be
removed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---

Thanks to Baruch, I have remove the mention to atmel_sama5d4ek_defconfig in
board/atmel/readme.txt

 board/atmel/readme.txt            |  1 -
 configs/atmel_sama5d4ek_defconfig | 30 ------------------------------
 2 files changed, 31 deletions(-)
 delete mode 100644 configs/atmel_sama5d4ek_defconfig

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 3a79e57..0b66346 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -13,7 +13,6 @@ This guide covers the following configurations:
  - atmel_sama5d3_xplained_dev_defconfig
  - atmel_sama5d3_xplained_mmc_defconfig
  - atmel_sama5d3_xplained_mmc_dev_defconfig
- - atmel_sama5d4ek_defconfig
  - atmel_sama5d4_xplained_defconfig
  - atmel_sama5d4_xplained_dev_defconfig
  - atmel_sama5d4_xplained_mmc_defconfig
diff --git a/configs/atmel_sama5d4ek_defconfig b/configs/atmel_sama5d4ek_defconfig
deleted file mode 100644
index 9d74eee..0000000
--- a/configs/atmel_sama5d4ek_defconfig
+++ /dev/null
@@ -1,30 +0,0 @@
-BR2_arm=y
-BR2_cortex_a5=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_INSTRUCTIONS_THUMB2=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
-BR2_LINUX_KERNEL_DEFCONFIG="sama5"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4ek"
-BR2_TARGET_ROOTFS_UBIFS=y
-BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
-BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
-BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2082
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
-BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4eknf_uboot_secure"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sama5d4ek_nandflash"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.9.0
