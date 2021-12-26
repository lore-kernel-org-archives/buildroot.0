Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DECBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3755940298;
	Sun, 26 Dec 2021 22:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9BeXmv0daOU; Sun, 26 Dec 2021 22:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1015540441;
	Sun, 26 Dec 2021 22:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 034BD1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7209401BB
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pG8AS69JzYF for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E267F401B4
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 210DD82B82; Sun, 26 Dec 2021 22:36:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:41:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1118f2c51c357d968e2d08e31ad3c741f5fa7df8
X-Git-Newrev: 47913a504b9122ea17542ebacbc7796c6e62e054
X-Patchwork-Hint: ignore
Message-Id: <20211226223625.210DD82B82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/olimex/stmp1_olinuxino: add
 STMP157-OLinuXino-LIME2 board support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47913a504b9122ea17542ebacbc7796c6e62e054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kernel & uboot come from Olimex forks

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   2 +
 board/olimex/stmp1_olinuxino/genimage.cfg          |  25 +++++
 board/olimex/stmp1_olinuxino/linux.config          | 125 +++++++++++++++++++++
 board/olimex/stmp1_olinuxino/readme.txt            |  53 +++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |   4 +
 configs/olimex_stmp157_olinuxino_lime_defconfig    |  47 ++++++++
 6 files changed, 256 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 64db6c51d0..0359a4832f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -945,8 +945,10 @@ F:	package/ser2net/
 N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
+F:	board/olimex/stmp1_olinuxino/
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
+F:	configs/olimex_stmp157_olinuxino_lime_defconfig
 F:	package/4th/
 F:	package/cgilua/
 F:	package/chipmunk/
diff --git a/board/olimex/stmp1_olinuxino/genimage.cfg b/board/olimex/stmp1_olinuxino/genimage.cfg
new file mode 100644
index 0000000000..2f00ee979a
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/genimage.cfg
@@ -0,0 +1,25 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition fsbl2 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition ssbl {
+		image = "u-boot.img"
+		size = 2M
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/olimex/stmp1_olinuxino/linux.config b/board/olimex/stmp1_olinuxino/linux.config
new file mode 100644
index 0000000000..592c44368c
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/linux.config
@@ -0,0 +1,125 @@
+CONFIG_SYSVIPC=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+CONFIG_SMP=y
+CONFIG_HIGHMEM=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_ARM_CRYPTO=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CAN=m
+CONFIG_CAN_M_CAN=m
+CONFIG_CAN_M_CAN_PLATFORM=m
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_OF_OVERLAY=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
+CONFIG_INPUT_MOUSEDEV=m
+CONFIG_INPUT_EVDEV=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AXP20X_PEK=m
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_NULL_TTY=m
+CONFIG_SERIAL_DEV_BUS=m
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_MEM=y
+CONFIG_SPI_STM32=m
+CONFIG_SPI_STM32_QSPI=m
+CONFIG_PINCTRL_AXP209=m
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
+CONFIG_CPU_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_DRM=y
+CONFIG_DRM_STM=m
+CONFIG_DRM_STM_DSI=m
+CONFIG_DRM_PANEL_LVDS=m
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
+CONFIG_DRM_ITE_IT66121=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=m
+CONFIG_BACKLIGHT_GPIO=m
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_UIO=m
+CONFIG_UIO_PDRV_GENIRQ=m
+CONFIG_UIO_DMEM_GENIRQ=m
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_CLKSRC_STM32_LP=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_PWM_STM32=m
+CONFIG_PWM_STM32_LP=m
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_VFAT_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/olimex/stmp1_olinuxino/readme.txt b/board/olimex/stmp1_olinuxino/readme.txt
new file mode 100644
index 0000000000..8c641c6c86
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/readme.txt
@@ -0,0 +1,53 @@
+STMP157-OLinuXino-LIME2
+
+Intro
+=====
+
+These are open hardware boards, all based on the STmicro STMP157 SoC.
+
+for more details about the board see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/open-source-hardware
+ - https://www.olimex.com/Products/OLinuXino/STMP1/STMP157-OLinuXino-LIME2/
+
+The following defconfigs are available:
+ - olimex_stmp157_olinuxino_lime_defconfig
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make <board>_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- stm32mp1xx-olinuxino-lime.dtb
+    +-- u-boot-spl.stm32
+    +-- u-boot.img
+    `-- zImage
+
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+Eject the SD card, insert it in the STMP1-OLinuXino board, and power it up.
+
diff --git a/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..edb601c7c9
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stmp1-olinuxino-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp1xx-olinuxino-lime.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
new file mode 100644
index 0000000000..f54d899b3e
--- /dev/null
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_ROOTFS_OVERLAY="board/olimex/stmp1_olinuxino/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
+# branch release-20210821-v5.10.60
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="081be4c4c634cf9345b8bf59fe141a0236383ae4"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp1xx-olinuxino-lime"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
+# release-20210821, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="acda542100fa83e4bc82634e4668f8106af37a61"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
