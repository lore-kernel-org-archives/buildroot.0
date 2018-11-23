From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:48:03 +0100
Subject: [Buildroot] [git commit] orangepi_zero_defconfig: bump linux to
 4.19.3, u-boot to 2018.11
Message-ID: <20181202071557.7DFA181583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aabd7f6ad02a3c533fc7dbb549102b2c47887360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.18 brought cpufreq support for H3, but sunxi_defconfig does not enable the
ondemand cpufreq govenor so the frequency is dynamically adjusted - So
enable it in linux-extra.config.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-zero/linux-extras.config | 3 +++
 configs/orangepi_zero_defconfig                  | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.config
index fe00af5ef7..2db241de28 100644
--- a/board/orangepi/orangepi-zero/linux-extras.config
+++ b/board/orangepi/orangepi-zero/linux-extras.config
@@ -15,3 +15,6 @@ CONFIG_CFG80211_WEXT=y
 
 # wireless drivers
 CONFIG_WLAN=y
+
+# ondemand cpufreq governor
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 87962152f3..3c65665cd1 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -3,13 +3,13 @@ BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
