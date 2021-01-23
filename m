From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jan 2021 16:44:48 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_pc_defconfig: bump kernel to
 5.10.9, u-boot to 2020.10
Message-ID: <20210123154449.27156-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HDMI support is enabled by default in sunxi_defconfig since commit
c822a3ec17 (ARM: configs: sunxi: Add DRM output-related options), so drop
from fragment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-pc/linux.fragment | 1 -
 configs/orangepi_pc_defconfig             | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/board/orangepi/orangepi-pc/linux.fragment b/board/orangepi/orangepi-pc/linux.fragment
index 602e42776c..b1dda162bb 100644
--- a/board/orangepi/orangepi-pc/linux.fragment
+++ b/board/orangepi/orangepi-pc/linux.fragment
@@ -1,4 +1,3 @@
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_REGULATOR_SY8106A=y
-CONFIG_DRM_SUN8I_DW_HDMI=y
 CONFIG_SUN8I_DE2_CCU=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index c1afb8566a..44ea9b95c4 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.20.1
