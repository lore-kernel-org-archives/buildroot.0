From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 30 Apr 2019 23:28:20 +0200
Subject: [Buildroot] [PATCH 1/1] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.0
Message-ID: <1556659700-17918-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit :
	- bumps Linux & U-Boot to linux4sam_6.0.
	- bumps at91bootstrap to v3.8.12.
	- removes old in-tree dts (now in dt-overlay-at91 [1][2])
	- adapts genimage accordingly.

[1] https://github.com/linux4sam/dt-overlay-at91/tree/master/sama5d27_som1_ek
[2] http://www.at91.com/linux4sam/bin/view/Linux4SAM/DT-Overlay

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 board/atmel/sama5d27_som1_ek_mmc/genimage.cfg    |  3 ---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 10 +++++-----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg b/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
index f5222ff..eaa3896 100644
--- a/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
+++ b/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
@@ -5,9 +5,6 @@ image boot.vfat {
 		files = {
 			"zImage",
 			"at91-sama5d27_som1_ek.dtb",
-			"at91-sama5d27_som1_ek_pda4.dtb",
-			"at91-sama5d27_som1_ek_pda7.dtb",
-			"at91-sama5d27_som1_ek_pda7b.dtb",
 			"boot.bin",
 			"u-boot.bin"
 		}
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 1ae4b85..fc9ce8c 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -12,10 +12,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.0)/linux-linux4sam_6.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek at91-sama5d27_som1_ek_pda4 at91-sama5d27_som1_ek_pda7 at91-sama5d27_som1_ek_pda7b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek"
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_ALSA_UTILS=y
 BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
@@ -71,13 +71,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.12"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.8"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.0"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_som1_ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
