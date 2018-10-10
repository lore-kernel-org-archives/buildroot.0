From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 10 Oct 2018 11:10:31 +0200
Subject: [Buildroot] [PATCH v3] configs: bananapi_m1: bump kernel and uboot
 version
Message-ID: <20181010091031.25220-1-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New Linux kernel version 4.18.12
New u-boot version 2018.07
Config options were reordered by savedefconfig

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
Changes v1->v2:
 - set a fixed kernel version for toolchain headers and kernel
Changes v2->v3:
 - fix kernel header version typo
 - build/test with correct image
---
 configs/bananapi_m1_defconfig | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
index f8c66a33..558ef3d4 100644
--- a/configs/bananapi_m1_defconfig
+++ b/configs/bananapi_m1_defconfig
@@ -1,38 +1,28 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_EABIHF=y
-
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
-
-# Bootloader
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m1/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.12"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.7"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi"
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m1/genimage.cfg"
-- 
2.14.1
