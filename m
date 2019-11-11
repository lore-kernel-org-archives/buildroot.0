From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 11 Nov 2019 09:17:14 +0000
Subject: [Buildroot] [PATCH] configs/microchip: addition of the sama5d27
 wlsom1 ek board
Message-ID: <1573463816-7843-1-git-send-email-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eugen Hristev <eugen.hristev@microchip.com>

Add the new SAMA5D27 WLSOM1 Evaluation Kit with linux4sam_6.2 components.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg | 31 +++++++
 ...ochip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 87 +++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
 create mode 100644 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig

diff --git a/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
new file mode 100644
index 0000000000..dce32524e9
--- /dev/null
+++ b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAMA5D27 WLSOM1 EK
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d27_wlsom1_ek.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
new file mode 100644
index 0000000000..a23642d83a
--- /dev/null
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -0,0 +1,87 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_wlsom1_ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_FFMPEG=y
+BR2_PACKAGE_FFMPEG_GPL=y
+BR2_PACKAGE_FFMPEG_SWSCALE=y
+BR2_PACKAGE_MPG123=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_UNZIP=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_I2C_TOOLS=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBSYSFS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_ARGP_STANDALONE=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WGET=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_HTOP=y
+BR2_PACKAGE_VIM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_wlsom1_ek_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1
