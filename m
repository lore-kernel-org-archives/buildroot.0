From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:03:01 +0100
Subject: [Buildroot] [git commit] configs/atmel_sama5d3xek: bump to
	linux4sam_5.5
Message-ID: <20161110100316.05B2080822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e09a4e3cfd3d0c766138ad978713409bae1598e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to linux4sam_5.5 and remove dtb variants which are no longer
supported. This is needed to fix the build with gcc 5.x.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atmel_sama5d3xek_defconfig | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index 086c18e..c57076c 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -1,26 +1,40 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d31ek_pda4 sama5d31ek_pda7 sama5d31ek_revc sama5d31ek_revc_pda4 sama5d31ek_revc_pda7 sama5d33ek sama5d33ek_pda4 sama5d33ek_pda7 sama5d33ek_revc sama5d33ek_revc_pda4 sama5d33ek_revc_pda7 sama5d34ek sama5d34ek_pda4 sama5d34ek_pda7 sama5d34ek_revc sama5d34ek_revc_pda4 sama5d34ek_revc_pda7 sama5d35ek sama5d35ek_revc sama5d36ek sama5d36ek_pda4 sama5d36ek_pda7 sama5d36ek_revc sama5d36ek_revc_pda4 sama5d36ek_revc_pda7"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d33ek sama5d34ek sama5d35ek sama5d36ek"
+
+# Filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+
+# Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sama5d3xek_nandflash"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3xek_nandflash"
 BR2_TARGET_UBOOT_SPL=y
+
+# Host packages
 BR2_PACKAGE_HOST_SAM_BA=y
