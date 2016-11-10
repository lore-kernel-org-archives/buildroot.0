From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:04:20 +0100
Subject: [Buildroot] [git commit] configs/atmel_sama5d4ek: remove defconfig
Message-ID: <20161110100439.52701804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dca2c33af71712128baf2d480d9103fdfa36e000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Atmel sama5d4ek board is no longer sold. Since there is the Xplained
board and we won't maintain anymore the EK board, the defconfig can be
removed. In addition, the defconfig was failing to build with gcc 5.x.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atmel_sama5d4ek_defconfig | 30 ------------------------------
 1 file changed, 30 deletions(-)

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
