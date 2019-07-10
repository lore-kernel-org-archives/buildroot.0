From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 10 Jul 2019 18:21:12 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.1
Message-ID: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit :
	- bumps Linux & U-Boot to linux4sam_6.1.
	- bumps at91bootstrap to v3.8.13

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Logs:

AT91Bootstrap 3.8.13 (mercredi 10 juillet 2019, 17:56:19 (UTC+0200))

SDHC: fix in place for SAMA5D2 SoM VDDSDMMC over-consumption errata
SD/MMC: Image: Read file u-boot.bin to 0x23f00000
...

U-Boot 2019.04-linux4sam_6.1 (Jul 10 2019 - 17:47:29 +0200)

CPU: SAMA5D27 1G bits DDR2 SDRAM
Crystal frequency:       24 MHz
CPU clock        :      492 MHz
Master clock     :      164 MHz
DRAM:  128 MiB
MMC:   sdio-host at a0000000: 0, sdio-host at b0000000: 1
...

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 4.19.56-linux4sam-6.1

...
Welcome to Buildroot
buildroot login: root

 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index fc9ce8c..ed25f04 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.0)/linux-linux4sam_6.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.1)/linux-linux4sam_6.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek"
@@ -71,13 +71,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.12"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_som1_ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
