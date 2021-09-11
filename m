Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E4FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:16:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 348E261206
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 348E261206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7B90400CF;
	Sat, 11 Sep 2021 16:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hRY9Aia1DrR; Sat, 11 Sep 2021 16:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77048400FC;
	Sat, 11 Sep 2021 16:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F24D41BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC6F3400FC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3grxZmytpt4z for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:16:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CCCD400CF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:16:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 405AB890A1; Sat, 11 Sep 2021 16:14:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 18:15:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db13226394ff7e6f5e7ca643e275f35d6c633bb
X-Git-Newrev: f20589cbc7ad83e4e8017025a9ca4fa9efe8161e
X-Patchwork-Hint: ignore
Message-Id: <20210911161434.405AB890A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp157c_odyssey: new defconfig
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2265853254812362759=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2265853254812362759==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f20589cbc7ad83e4e8017025a9ca4fa9efe8161e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

STM32MP157C-Odyssey reference:
https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
[Arnout: use default rootfs size, remove version-specific dir from
         patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |   4 +
 board/seeed/stm32mp157c-odyssey/genimage.cfg       |  22 +++
 board/seeed/stm32mp157c-odyssey/linux.config       | 182 +++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |   4 +
 ...stm32-fix-stm32mp157c-odyssey-card-detect.patch |  36 ++++
 board/seeed/stm32mp157c-odyssey/readme.txt         |  38 +++++
 configs/stm32mp157c_odyssey_defconfig              |  30 ++++
 7 files changed, 316 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index abb54aa41c..98628d3992 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2484,6 +2484,10 @@ F:	package/xscreensaver/
 F:	package/zmqpp/
 F:	package/zyre/
 
+N:	Simon Doppler <dopsi@dopsi.ch>
+F:	board/seeed/
+F:	configs/stm32mp157c_odyssey_defconfig
+
 N:	Spenser Gilliland <spenser@gillilanding.com>
 F:	arch/Config.in.microblaze
 F:	package/a10disp/
diff --git a/board/seeed/stm32mp157c-odyssey/genimage.cfg b/board/seeed/stm32mp157c-odyssey/genimage.cfg
new file mode 100644
index 0000000000..170dedc254
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "tf-a-stm32mp157c-odyssey.stm32"
+	}
+
+	partition fsbl2 {
+		image = "tf-a-stm32mp157c-odyssey.stm32"
+	}
+
+	partition ssbl {
+		image = "u-boot.stm32"
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/seeed/stm32mp157c-odyssey/linux.config b/board/seeed/stm32mp157c-odyssey/linux.config
new file mode 100644
index 0000000000..878a0c39f1
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/linux.config
@@ -0,0 +1,182 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_754327=y
+CONFIG_ARM_ERRATA_764369=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_ARM_ERRATA_798181=y
+CONFIG_SMP=y
+CONFIG_MCPM=y
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_ARM_CRYPTO=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_STM32=y
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_WATCHDOG=y
+CONFIG_STPMIC1_WATCHDOG=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_REGULATOR_STPMIC1=y
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_DRM_SII902X=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=y
+CONFIG_USB_ULPI=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_STUSB=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_TTY=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_ADC_TEMP=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_LPTIMER_CNT=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_EXT4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..b5795415eb
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-odyssey-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157c-odyssey.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch b/board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch
new file mode 100644
index 0000000000..ab2dc5dea8
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch
@@ -0,0 +1,36 @@
+From 0171b07373cc8c2815ca5fa79a7308fdefa54ca4 Mon Sep 17 00:00:00 2001
+From: Grzegorz Szymaszek <gszymaszek@short.pl>
+Date: Sat, 10 Apr 2021 21:35:21 +0200
+Subject: [PATCH] ARM: dts: stm32: fix stm32mp157c-odyssey card detect pin
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The microSD card detect pin is physically connected to the MPU pin PI3.
+The Device Tree configuration of the card detect pin was wrong—it was
+set to pin PB7 instead. If such configuration was used, the kernel would
+hang on “Waiting for root device” when booting from a microSD card.
+
+Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
+Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
+Backported from: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/stm32mp157c-odyssey.dts?id=0171b07373cc8c2815ca5fa79a7308fdefa54ca4
+---
+ arch/arm/boot/dts/stm32mp157c-odyssey.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+index a7ffec8f1516..be1dd5e9e744 100644
+--- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
++++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+@@ -64,7 +64,7 @@ &sdmmc1 {
+ 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+ 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+ 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+-	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	cd-gpios = <&gpioi 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+ 	disable-wp;
+ 	st,neg-edge;
+ 	bus-width = <4>;
+--
+2.30.2
+
diff --git a/board/seeed/stm32mp157c-odyssey/readme.txt b/board/seeed/stm32mp157c-odyssey/readme.txt
new file mode 100644
index 0000000000..0932867393
--- /dev/null
+++ b/board/seeed/stm32mp157c-odyssey/readme.txt
@@ -0,0 +1,38 @@
+STM32MP157C-Odyssey
+
+Intro
+=====
+
+This configuration supports the STM32MP157C-Odyssey platform:
+
+  https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
+
+How to build
+============
+
+ $ make stm32mp157c_odyssey_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Insert the microSD card in connector J21.
+
+ (2) Connect to the UART connector J24 (located next the the DC jack
+     J24 and the battery connector J20) and run your serial communication
+     program on /dev/ttyACM0.
+
+ (3) Plug a USB-C cable in J6 or a center-positive 12V jack into J17
+     to power-up the board.
+
+ (4) The system will start, with the console on UART.
diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
new file mode 100644
index 0000000000..8639c6ee6c
--- /dev/null
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_GLOBAL_PATCH_DIR="board/seeed/stm32mp157c-odyssey/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/seeed/stm32mp157c-odyssey/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-odyssey"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-odyssey.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
+BR2_PACKAGE_HOST_GENIMAGE=y

--===============2265853254812362759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2265853254812362759==--
