From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Nov 2016 15:38:51 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_mali: bump u-boot to
	2016.09.01
Message-ID: <1478443131-1912-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot KConfig allows to take care of CONFIG_OLD_SUNXI_KERNEL_COMPAT
in order to properly start the kernel (Error: unrecognized/unsupported machine ID)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime_defconfig      | 3 ++-
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 49987fe..5941550 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -32,9 +32,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloaders
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index 42c8a7c..b2d7dd5 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -37,9 +37,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloaders
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.7.4
