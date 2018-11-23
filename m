From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:48:00 +0100
Subject: [Buildroot] [git commit] orangepi_pc_defconfig: bump linux to
 4.19.3, u-boot to 2018.11
Message-ID: <20181202071557.7673D81583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91887cf778081d31b408d8f527eb4bc24fdcb1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.18 brought cpufreq support for H3, but sunxi_defconfig does not enable the
driver for the sy8106a regulator used on the board or enable the ondemand
cpufreq govenor so the frequency is dynamically adjusted - So enable these in
linux.fragment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-pc/linux.fragment | 2 ++
 configs/orangepi_pc_defconfig             | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-pc/linux.fragment b/board/orangepi/orangepi-pc/linux.fragment
index cdd522452a..581b715bd5 100644
--- a/board/orangepi/orangepi-pc/linux.fragment
+++ b/board/orangepi/orangepi-pc/linux.fragment
@@ -1,3 +1,5 @@
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_REGULATOR_SY8106A=y
 CONFIG_DRM_SUN8I_DW_HDMI=y
 CONFIG_SUN8I_DE2_CCU=y
 CONFIG_SND_SUN8I_CODEC_ANALOG=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 313b7ab3a4..130a4e7088 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
