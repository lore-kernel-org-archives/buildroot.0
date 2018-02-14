From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:03:27 +0100
Subject: [Buildroot] [git commit branch/next] configs/orange-pi-zero-plus2:
 bump kernel and u-boot versions
Message-ID: <20180214210440.7AF5B84331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c5f274601902c9faa585233b774a5926b6105ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump versions:
- use U-Boot 2008.01
- use Linux kernel v4.15.2

Drop patch with dts sdcard fix since it has been
merged to Linux v4.15.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ts-orange-pi-zero-plus2-fix-sdcard-detect.patch | 30 ----------------------
 configs/orangepi_zero_plus2_defconfig              | 11 +++-----
 2 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch
deleted file mode 100644
index 203402932b..0000000000
--- a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f88e9301948173dd35afad4a6939092c7f269aed Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Fri, 3 Nov 2017 22:58:54 +0300
-Subject: [PATCH] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
-
-The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
-Fix cd-gpio description to enable sdcard detect.
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-index b6b7a56..a42fd79 100644
---- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-@@ -71,7 +71,7 @@
- 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
- 	vmmc-supply = <&reg_vcc3v3>;
- 	bus-width = <4>;
--	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
-+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
- 	status = "okay";
- };
- 
--- 
-1.9.1
-
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 5b1ff3500c..7906dba5c7 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,11 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
-
-# Patch dir
-BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -20,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -34,7 +31,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
