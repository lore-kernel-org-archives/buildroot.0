From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 Jan 2019 12:28:10 +0200
Subject: [Buildroot] [PATCH] configs/clearfog: update U-Boot and kernel
Message-ID: <b9ceb96abc71e4283017c904879f1928cfa0d165.1546424890.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot and kernel to their latest releases.

Remove the documented limitations. Recent kernels added support for the
SOM SPI flash, and the carrier SFP port.

Mention the 'dd' command in the warning text. No script is involved.

Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/solidrun/clearfog/readme.txt  | 9 +--------
 configs/solidrun_clearfog_defconfig | 8 ++++----
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
index 6046836f01a0..60bf95329cde 100644
--- a/board/solidrun/clearfog/readme.txt
+++ b/board/solidrun/clearfog/readme.txt
@@ -15,13 +15,6 @@ built-in microSD card slot *WILL NOT WORK*. The Internet says that you have to
 upload the first bootloader via UART. This manual does not cover these steps;
 only MicroSoMs without the eMMC are supported.
 
-Limitations
-===========
-
-There's no access to the SPI flash in this combination of kernel/uboot/dts.
-
-There is no support for the SFP.
-
 Build
 =====
 
@@ -49,7 +42,7 @@ command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-microsd-device> conv=fdatasync
 
-*** WARNING! The script will destroy all the card content. Use with care! ***
+*** WARNING! The dd command will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
 board/solidrun/clearfog/genimage.cfg.
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 8c6cb83a59f4..fd6f278aa13f 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 4.20 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
 
 # System configuration
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog/post-build.sh"
@@ -16,7 +16,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,7 +33,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.19.2
