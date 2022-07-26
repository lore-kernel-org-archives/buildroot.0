Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA50C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0406A84745;
	Tue, 26 Jul 2022 13:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0406A84745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwah9YPnrHuq; Tue, 26 Jul 2022 13:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB33A8420B;
	Tue, 26 Jul 2022 13:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB33A8420B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D76601BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06A6419C9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B06A6419C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mFz6iHS0Jr6 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:14:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 321B740288
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 321B740288
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6351185ECF; Tue, 26 Jul 2022 13:00:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 15:13:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 934788d162596d5ed634c5fb2914d76a6bf554ec
X-Git-Newrev: 7451295826865fc08eb067ad226a11fd1c2b4512
X-Patchwork-Hint: ignore
Message-Id: <20220726130027.6351185ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_bl_imx8mm_defconfig: bump
 U-Boot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7451295826865fc08eb067ad226a11fd1c2b4512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to version 2022.04 and remove the two patches
that have already been upstreamed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-By: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...imx8mm-kontron-n801x-s-convert-options-to.patch |  31 ---
 ...imx8mm-kontron-n801x-s-add-common-board-u.patch | 305 ---------------------
 configs/kontron_bl_imx8mm_defconfig                |   4 +-
 3 files changed, 1 insertion(+), 339 deletions(-)

diff --git a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
deleted file mode 100644
index 6d76282def..0000000000
--- a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 95a311af81cd47c44d3d6e3f717f06a06d8f3dfd Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Mon, 10 Jan 2022 14:13:02 +0100
-Subject: [PATCH 1/2] imx: imx8mm: imx8mm-kontron-n801x-s: convert options to Kconfig
-
-CONFIG_SPL_MMC and CONFIG_SPL_SERIAL
-
-Patch submitted upstream:
-https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-1-heiko.thiery@gmail.com/
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- configs/kontron-sl-mx8mm_defconfig | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
-index 35d12fca32..940bf07a92 100644
---- a/configs/kontron-sl-mx8mm_defconfig
-+++ b/configs/kontron-sl-mx8mm_defconfig
-@@ -15,6 +15,8 @@ CONFIG_SPL_DM_SPI=y
- CONFIG_DEFAULT_DEVICE_TREE="imx8mm-kontron-n801x-s"
- CONFIG_SPL_TEXT_BASE=0x7E1000
- CONFIG_TARGET_KONTRON_MX8MM=y
-+CONFIG_SPL_MMC=y
-+CONFIG_SPL_SERIAL=y
- CONFIG_BOOTCOUNT_BOOTLIMIT=3
- CONFIG_SPL=y
- CONFIG_DISTRO_DEFAULTS=y
--- 
-2.30.2
-
diff --git a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
deleted file mode 100644
index a88d7aba87..0000000000
--- a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
+++ /dev/null
@@ -1,305 +0,0 @@
-From ef694c19c074333fd16589ec6ffef3e7ca895186 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Wed, 12 Jan 2022 08:44:36 +0100
-Subject: [PATCH 2/2] imx: imx8mm: imx8mm-kontron-n801x-s: add common board
- u-boot.dtsi
-
-When using a board variant that selects the lvds specific dtb the
-*.u-boot.dtsi file will not be included. To have a lvds dtb specific
-u-boot.dtsi file move this part to a common board u-boot.dtsi file and
-include this in the board base u-boot.dtsi and create an additional one
-for the lvds variant.
-
-Patch submitted upstream:
-https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-2-heiko.thiery@gmail.com/
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- .../imx8mm-kontron-n801x-s-lvds-u-boot.dtsi   |   6 +
- .../dts/imx8mm-kontron-n801x-s-u-boot.dtsi    | 124 +----------------
- arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi | 128 ++++++++++++++++++
- 3 files changed, 135 insertions(+), 123 deletions(-)
- create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
- create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
-
-diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
-new file mode 100644
-index 0000000000..4bf75722bf
---- /dev/null
-+++ b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
-@@ -0,0 +1,6 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright (C) 2019 Kontron Electronics GmbH
-+ */
-+
-+#include "imx8mm-kontron-n801x-u-boot.dtsi"
-diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
-index 22d18e6f1c..4bf75722bf 100644
---- a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
-+++ b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
-@@ -3,126 +3,4 @@
-  * Copyright (C) 2019 Kontron Electronics GmbH
-  */
- 
--#include "imx8mm-u-boot.dtsi"
--
--/ {
--	aliases {
--		usb0 = &usbotg1;
--		usb1 = &usbotg2;
--	};
--
--	wdt-reboot {
--		compatible = "wdt-reboot";
--		wdt = <&wdog1>;
--		u-boot,dm-spl;
--	};
--
--	firmware {
--		optee {
--			compatible = "linaro,optee-tz";
--			method = "smc";
--		};
--	};
--};
--
--&fec1 {
--	phy-mode = "rgmii-rxid";
--};
--
--&i2c1 {
--	u-boot,dm-spl;
--	u-boot,dm-pre-reloc;
--};
--
--&i2c2 {
--	status = "okay";
--	u-boot,dm-spl;
--	u-boot,dm-pre-reloc;
--};
--
--&pinctrl_ecspi1 {
--	u-boot,dm-spl;
--};
--
--&pinctrl_i2c1 {
--	u-boot,dm-spl;
--};
--
--&pinctrl_pmic {
--	u-boot,dm-spl;
--	fsl,pins = <
--		MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x141
--		/* Disable Pullup for SD_VSEL */
--		MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x41
--	>;
--};
--
--&pinctrl_uart3 {
--	u-boot,dm-spl;
--	u-boot,dm-pre-reloc;
--};
--
--&pinctrl_usdhc1 {
--	u-boot,dm-spl;
--};
--
--&pinctrl_usdhc1_100mhz {
--	u-boot,dm-spl;
--};
--
--&pinctrl_usdhc1_200mhz {
--	u-boot,dm-spl;
--};
--
--&pinctrl_usdhc2 {
--	u-boot,dm-spl;
--};
--
--&pca9450 {
--	u-boot,dm-spl;
--};
--
--&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
--	u-boot,dm-spl;
--};
--
--&ecspi1 {
--	u-boot,dm-spl;
--};
--
--&gpio1 {
--	u-boot,dm-spl;
--};
--
--&gpio2 {
--	u-boot,dm-spl;
--};
--
--&gpio3 {
--	u-boot,dm-spl;
--};
--
--&gpio4 {
--	u-boot,dm-spl;
--};
--
--&gpio5 {
--	u-boot,dm-spl;
--};
--
--&uart3 {
--	u-boot,dm-spl;
--	u-boot,dm-pre-reloc;
--};
--
--&usdhc1 {
--	u-boot,dm-spl;
--};
--
--&usdhc2 {
--	u-boot,dm-spl;
--};
--
--&wdog1 {
--	u-boot,dm-spl;
--};
-+#include "imx8mm-kontron-n801x-u-boot.dtsi"
-diff --git a/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
-new file mode 100644
-index 0000000000..22d18e6f1c
---- /dev/null
-+++ b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
-@@ -0,0 +1,128 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright (C) 2019 Kontron Electronics GmbH
-+ */
-+
-+#include "imx8mm-u-boot.dtsi"
-+
-+/ {
-+	aliases {
-+		usb0 = &usbotg1;
-+		usb1 = &usbotg2;
-+	};
-+
-+	wdt-reboot {
-+		compatible = "wdt-reboot";
-+		wdt = <&wdog1>;
-+		u-boot,dm-spl;
-+	};
-+
-+	firmware {
-+		optee {
-+			compatible = "linaro,optee-tz";
-+			method = "smc";
-+		};
-+	};
-+};
-+
-+&fec1 {
-+	phy-mode = "rgmii-rxid";
-+};
-+
-+&i2c1 {
-+	u-boot,dm-spl;
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&i2c2 {
-+	status = "okay";
-+	u-boot,dm-spl;
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&pinctrl_ecspi1 {
-+	u-boot,dm-spl;
-+};
-+
-+&pinctrl_i2c1 {
-+	u-boot,dm-spl;
-+};
-+
-+&pinctrl_pmic {
-+	u-boot,dm-spl;
-+	fsl,pins = <
-+		MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x141
-+		/* Disable Pullup for SD_VSEL */
-+		MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x41
-+	>;
-+};
-+
-+&pinctrl_uart3 {
-+	u-boot,dm-spl;
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&pinctrl_usdhc1 {
-+	u-boot,dm-spl;
-+};
-+
-+&pinctrl_usdhc1_100mhz {
-+	u-boot,dm-spl;
-+};
-+
-+&pinctrl_usdhc1_200mhz {
-+	u-boot,dm-spl;
-+};
-+
-+&pinctrl_usdhc2 {
-+	u-boot,dm-spl;
-+};
-+
-+&pca9450 {
-+	u-boot,dm-spl;
-+};
-+
-+&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
-+	u-boot,dm-spl;
-+};
-+
-+&ecspi1 {
-+	u-boot,dm-spl;
-+};
-+
-+&gpio1 {
-+	u-boot,dm-spl;
-+};
-+
-+&gpio2 {
-+	u-boot,dm-spl;
-+};
-+
-+&gpio3 {
-+	u-boot,dm-spl;
-+};
-+
-+&gpio4 {
-+	u-boot,dm-spl;
-+};
-+
-+&gpio5 {
-+	u-boot,dm-spl;
-+};
-+
-+&uart3 {
-+	u-boot,dm-spl;
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&usdhc1 {
-+	u-boot,dm-spl;
-+};
-+
-+&usdhc2 {
-+	u-boot,dm-spl;
-+};
-+
-+&wdog1 {
-+	u-boot,dm-spl;
-+};
--- 
-2.30.2
-
diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index 2b7e121e25..705222df28 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -3,8 +3,6 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV3=y
 
-BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
-
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 
@@ -40,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
