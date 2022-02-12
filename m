Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B082414E7;
	Sat, 12 Feb 2022 13:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lf3JQiNkkxbZ; Sat, 12 Feb 2022 13:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28FD41504;
	Sat, 12 Feb 2022 13:42:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59D7A1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E30819B8
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVRYR5HjSUQf for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:40:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7DD281991
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DD38B82AA5; Sat, 12 Feb 2022 13:33:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:39:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3675131e6c654d7536a184db0184fde7a97040e0
X-Git-Newrev: ed5bbb7606c8b2614b3cfae640803eab79a1f2ac
X-Patchwork-Hint: ignore
Message-Id: <20220212133302.DD38B82AA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Content-Type: multipart/mixed; boundary="===============7924596485851298461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7924596485851298461==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ed5bbb7606c8b2614b3cfae640803eab79a1f2ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BL i.MX8M Mini is a baseboard that includes the SoM SL i.MX8M Mini.

https://www.kontron.com/produkte/baseboard-bl-i.mx8m-mini/p158549

Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Arnout: explicitly set BR2_cortex_a53=y]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |   2 +
 board/kontron/bl-imx8mm/extlinux.conf              |   4 +
 board/kontron/bl-imx8mm/genimage.cfg               |  18 ++
 ...imx8mm-kontron-n801x-s-convert-options-to.patch |  31 +++
 ...imx8mm-kontron-n801x-s-add-common-board-u.patch | 305 +++++++++++++++++++++
 board/kontron/bl-imx8mm/post-build.sh              |   7 +
 board/kontron/bl-imx8mm/readme.txt                 |  85 ++++++
 configs/kontron_bl_imx8mm_defconfig                |  59 ++++
 8 files changed, 511 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcfcacb91d..d29d8f3a21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1180,7 +1180,9 @@ F:	package/python-sip/
 F:	package/uhd/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
+F:	board/kontron/bl-imx8mm/
 F:	board/kontron/pitx-imx8m/
+F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
 F:	package/ipmitool/
diff --git a/board/kontron/bl-imx8mm/extlinux.conf b/board/kontron/bl-imx8mm/extlinux.conf
new file mode 100644
index 0000000000..d38f7f81b7
--- /dev/null
+++ b/board/kontron/bl-imx8mm/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mm-kontron-n801x-s.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/kontron/bl-imx8mm/genimage.cfg b/board/kontron/bl-imx8mm/genimage.cfg
new file mode 100644
index 0000000000..c98bc4f150
--- /dev/null
+++ b/board/kontron/bl-imx8mm/genimage.cfg
@@ -0,0 +1,18 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+		gpt-location = 16K
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 33K
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		offset = 8M
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
new file mode 100644
index 0000000000..6d76282def
--- /dev/null
+++ b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
@@ -0,0 +1,31 @@
+From 95a311af81cd47c44d3d6e3f717f06a06d8f3dfd Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Mon, 10 Jan 2022 14:13:02 +0100
+Subject: [PATCH 1/2] imx: imx8mm: imx8mm-kontron-n801x-s: convert options to Kconfig
+
+CONFIG_SPL_MMC and CONFIG_SPL_SERIAL
+
+Patch submitted upstream:
+https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-1-heiko.thiery@gmail.com/
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ configs/kontron-sl-mx8mm_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
+index 35d12fca32..940bf07a92 100644
+--- a/configs/kontron-sl-mx8mm_defconfig
++++ b/configs/kontron-sl-mx8mm_defconfig
+@@ -15,6 +15,8 @@ CONFIG_SPL_DM_SPI=y
+ CONFIG_DEFAULT_DEVICE_TREE="imx8mm-kontron-n801x-s"
+ CONFIG_SPL_TEXT_BASE=0x7E1000
+ CONFIG_TARGET_KONTRON_MX8MM=y
++CONFIG_SPL_MMC=y
++CONFIG_SPL_SERIAL=y
+ CONFIG_BOOTCOUNT_BOOTLIMIT=3
+ CONFIG_SPL=y
+ CONFIG_DISTRO_DEFAULTS=y
+-- 
+2.30.2
+
diff --git a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
new file mode 100644
index 0000000000..a88d7aba87
--- /dev/null
+++ b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
@@ -0,0 +1,305 @@
+From ef694c19c074333fd16589ec6ffef3e7ca895186 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Wed, 12 Jan 2022 08:44:36 +0100
+Subject: [PATCH 2/2] imx: imx8mm: imx8mm-kontron-n801x-s: add common board
+ u-boot.dtsi
+
+When using a board variant that selects the lvds specific dtb the
+*.u-boot.dtsi file will not be included. To have a lvds dtb specific
+u-boot.dtsi file move this part to a common board u-boot.dtsi file and
+include this in the board base u-boot.dtsi and create an additional one
+for the lvds variant.
+
+Patch submitted upstream:
+https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-2-heiko.thiery@gmail.com/
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ .../imx8mm-kontron-n801x-s-lvds-u-boot.dtsi   |   6 +
+ .../dts/imx8mm-kontron-n801x-s-u-boot.dtsi    | 124 +----------------
+ arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi | 128 ++++++++++++++++++
+ 3 files changed, 135 insertions(+), 123 deletions(-)
+ create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
+ create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
+
+diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
+new file mode 100644
+index 0000000000..4bf75722bf
+--- /dev/null
++++ b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
+@@ -0,0 +1,6 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright (C) 2019 Kontron Electronics GmbH
++ */
++
++#include "imx8mm-kontron-n801x-u-boot.dtsi"
+diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
+index 22d18e6f1c..4bf75722bf 100644
+--- a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
++++ b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
+@@ -3,126 +3,4 @@
+  * Copyright (C) 2019 Kontron Electronics GmbH
+  */
+ 
+-#include "imx8mm-u-boot.dtsi"
+-
+-/ {
+-	aliases {
+-		usb0 = &usbotg1;
+-		usb1 = &usbotg2;
+-	};
+-
+-	wdt-reboot {
+-		compatible = "wdt-reboot";
+-		wdt = <&wdog1>;
+-		u-boot,dm-spl;
+-	};
+-
+-	firmware {
+-		optee {
+-			compatible = "linaro,optee-tz";
+-			method = "smc";
+-		};
+-	};
+-};
+-
+-&fec1 {
+-	phy-mode = "rgmii-rxid";
+-};
+-
+-&i2c1 {
+-	u-boot,dm-spl;
+-	u-boot,dm-pre-reloc;
+-};
+-
+-&i2c2 {
+-	status = "okay";
+-	u-boot,dm-spl;
+-	u-boot,dm-pre-reloc;
+-};
+-
+-&pinctrl_ecspi1 {
+-	u-boot,dm-spl;
+-};
+-
+-&pinctrl_i2c1 {
+-	u-boot,dm-spl;
+-};
+-
+-&pinctrl_pmic {
+-	u-boot,dm-spl;
+-	fsl,pins = <
+-		MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x141
+-		/* Disable Pullup for SD_VSEL */
+-		MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x41
+-	>;
+-};
+-
+-&pinctrl_uart3 {
+-	u-boot,dm-spl;
+-	u-boot,dm-pre-reloc;
+-};
+-
+-&pinctrl_usdhc1 {
+-	u-boot,dm-spl;
+-};
+-
+-&pinctrl_usdhc1_100mhz {
+-	u-boot,dm-spl;
+-};
+-
+-&pinctrl_usdhc1_200mhz {
+-	u-boot,dm-spl;
+-};
+-
+-&pinctrl_usdhc2 {
+-	u-boot,dm-spl;
+-};
+-
+-&pca9450 {
+-	u-boot,dm-spl;
+-};
+-
+-&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
+-	u-boot,dm-spl;
+-};
+-
+-&ecspi1 {
+-	u-boot,dm-spl;
+-};
+-
+-&gpio1 {
+-	u-boot,dm-spl;
+-};
+-
+-&gpio2 {
+-	u-boot,dm-spl;
+-};
+-
+-&gpio3 {
+-	u-boot,dm-spl;
+-};
+-
+-&gpio4 {
+-	u-boot,dm-spl;
+-};
+-
+-&gpio5 {
+-	u-boot,dm-spl;
+-};
+-
+-&uart3 {
+-	u-boot,dm-spl;
+-	u-boot,dm-pre-reloc;
+-};
+-
+-&usdhc1 {
+-	u-boot,dm-spl;
+-};
+-
+-&usdhc2 {
+-	u-boot,dm-spl;
+-};
+-
+-&wdog1 {
+-	u-boot,dm-spl;
+-};
++#include "imx8mm-kontron-n801x-u-boot.dtsi"
+diff --git a/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
+new file mode 100644
+index 0000000000..22d18e6f1c
+--- /dev/null
++++ b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
+@@ -0,0 +1,128 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright (C) 2019 Kontron Electronics GmbH
++ */
++
++#include "imx8mm-u-boot.dtsi"
++
++/ {
++	aliases {
++		usb0 = &usbotg1;
++		usb1 = &usbotg2;
++	};
++
++	wdt-reboot {
++		compatible = "wdt-reboot";
++		wdt = <&wdog1>;
++		u-boot,dm-spl;
++	};
++
++	firmware {
++		optee {
++			compatible = "linaro,optee-tz";
++			method = "smc";
++		};
++	};
++};
++
++&fec1 {
++	phy-mode = "rgmii-rxid";
++};
++
++&i2c1 {
++	u-boot,dm-spl;
++	u-boot,dm-pre-reloc;
++};
++
++&i2c2 {
++	status = "okay";
++	u-boot,dm-spl;
++	u-boot,dm-pre-reloc;
++};
++
++&pinctrl_ecspi1 {
++	u-boot,dm-spl;
++};
++
++&pinctrl_i2c1 {
++	u-boot,dm-spl;
++};
++
++&pinctrl_pmic {
++	u-boot,dm-spl;
++	fsl,pins = <
++		MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x141
++		/* Disable Pullup for SD_VSEL */
++		MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x41
++	>;
++};
++
++&pinctrl_uart3 {
++	u-boot,dm-spl;
++	u-boot,dm-pre-reloc;
++};
++
++&pinctrl_usdhc1 {
++	u-boot,dm-spl;
++};
++
++&pinctrl_usdhc1_100mhz {
++	u-boot,dm-spl;
++};
++
++&pinctrl_usdhc1_200mhz {
++	u-boot,dm-spl;
++};
++
++&pinctrl_usdhc2 {
++	u-boot,dm-spl;
++};
++
++&pca9450 {
++	u-boot,dm-spl;
++};
++
++&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
++	u-boot,dm-spl;
++};
++
++&ecspi1 {
++	u-boot,dm-spl;
++};
++
++&gpio1 {
++	u-boot,dm-spl;
++};
++
++&gpio2 {
++	u-boot,dm-spl;
++};
++
++&gpio3 {
++	u-boot,dm-spl;
++};
++
++&gpio4 {
++	u-boot,dm-spl;
++};
++
++&gpio5 {
++	u-boot,dm-spl;
++};
++
++&uart3 {
++	u-boot,dm-spl;
++	u-boot,dm-pre-reloc;
++};
++
++&usdhc1 {
++	u-boot,dm-spl;
++};
++
++&usdhc2 {
++	u-boot,dm-spl;
++};
++
++&wdog1 {
++	u-boot,dm-spl;
++};
+-- 
+2.30.2
+
diff --git a/board/kontron/bl-imx8mm/post-build.sh b/board/kontron/bl-imx8mm/post-build.sh
new file mode 100755
index 0000000000..bf8861f6a9
--- /dev/null
+++ b/board/kontron/bl-imx8mm/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/kontron/bl-imx8mm/readme.txt b/board/kontron/bl-imx8mm/readme.txt
new file mode 100644
index 0000000000..df47ba5174
--- /dev/null
+++ b/board/kontron/bl-imx8mm/readme.txt
@@ -0,0 +1,85 @@
+Kontron BL i.MX8M Mini
+======================
+
+https://www.kontron.com/produkte/baseboard-bl-i.mx8m-mini/p158549
+
+
+How to build it
+===============
+
+Configure buildroot:
+
+  $ make kontron_bl_imx8mm_defconfig
+
+Change settings to fit your needs (optional):
+
+  $ make menuconfig
+
+Compile everything and build the rootfs image:
+
+  $ make
+
+
+Result of the build
+===================
+
+After building, the output/images directory contains:
+
+  output/images/
+    ├── bl31.bin
+    ├── boot.scr
+    ├── ddr_fw.bin
+    ├── flash.bin
+    ├── Image
+    ├── imx8mm-kontron-n801x-s.dtb
+    ├── lpddr4_pmu_train_1d_dmem_201904.bin
+    ├── lpddr4_pmu_train_1d_dmem_202006.bin
+    ├── lpddr4_pmu_train_1d_dmem.bin
+    ├── lpddr4_pmu_train_1d_dmem_pad.bin
+    ├── lpddr4_pmu_train_1d_fw.bin
+    ├── lpddr4_pmu_train_1d_imem_201904.bin
+    ├── lpddr4_pmu_train_1d_imem_202006.bin
+    ├── lpddr4_pmu_train_1d_imem.bin
+    ├── lpddr4_pmu_train_1d_imem_pad.bin
+    ├── lpddr4_pmu_train_2d_dmem_201904.bin
+    ├── lpddr4_pmu_train_2d_dmem_202006.bin
+    ├── lpddr4_pmu_train_2d_dmem.bin
+    ├── lpddr4_pmu_train_2d_dmem_pad.bin
+    ├── lpddr4_pmu_train_2d_fw.bin
+    ├── lpddr4_pmu_train_2d_imem_201904.bin
+    ├── lpddr4_pmu_train_2d_imem_202006.bin
+    ├── lpddr4_pmu_train_2d_imem.bin
+    ├── lpddr4_pmu_train_2d_imem_pad.bin
+    ├── lpddr4_pmu_train_fw.bin
+    ├── rootfs.ext2
+    ├── rootfs.ext4 -> rootfs.ext2
+    ├── rootfs.tar
+    ├── sdcard.img
+    ├── u-boot.bin
+    └── u-boot-spl.bin
+
+
+Flashing the SD card image
+==========================
+
+To install the image on a SDCard simply copy sdcard.img to the storage (e.g. SD, eMMC)
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>
+
+
+Preparing the board
+===================
+
+ * Connect a serial line to the board
+ * Insert the SD card
+ * Power-up the board
+
+
+Booting the board
+=================
+
+By default the bootloader will search for the first valid image, starting
+with the internal eMMC. To make sure the bootloader loads bootscript from
+the correct location (SD card) set the boot_targets environment variable:
+
+  $ setenv boot_targets mmc1
diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
new file mode 100644
index 0000000000..57e7e9683d
--- /dev/null
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -0,0 +1,59 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV3=y
+
+BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-kontron-n801x-s"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+
+# Bootloader
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+
+# Required host tools to create the SD/eMMC image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/bl-imx8mm/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_PACKAGE_HOST_GENIMAGE=y

--===============7924596485851298461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7924596485851298461==--
