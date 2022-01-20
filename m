Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4321C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 10:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1298681D34;
	Thu, 20 Jan 2022 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdLP1ed_zUcZ; Thu, 20 Jan 2022 10:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0015081D65;
	Thu, 20 Jan 2022 10:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83EA21BF38C
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 10:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F59381D65
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 10:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyCYCixhC9Ft for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 10:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D9E81D34
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 10:26:57 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AUecnfiFaroAhAUednbH7R; Thu, 20 Jan 2022 11:26:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642674416; bh=lVQzFnRf3aGFpc9KsnS2q1uLtyhivxKnsnHq+/FQL4k=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=bq1CoUx09AUV0pOU5+cmF8NJa/ZKrtNask0ZY4gk38FPwK8RS1DzzbeRANE0hoNRe
 SRTH4kenUEAHvK/zONdAdFC4C75Bx53jKw84SKQMNOwu3XLdRdmy2Ncj3vYv5yOCsl
 bzETWX1bdjHAdTKlG8d++6KlUydsa8p2VJxHz1DzK2ltczi1Oo/CDO/9/XNo6SQ7FO
 jm06uBzpmpZ7eW2jUZe18BqiT6zpCtZN3E6wkww+23Ic85QWTyoDRYEY7liVquLf1u
 9v2oL/IZ4zGtVeRrrXpgyv7WR9Yb/Hz6cdcvg/h1+nQ0MJLjjSH8ikXvVY4qUKd+Fg
 fG/XbnnhpUVDQ==
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20220120091935.15035-1-heiko.thiery@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f2abb014-c4b0-f57a-f78e-fe6f86b4452d@benettiengineering.com>
Date: Thu, 20 Jan 2022 11:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120091935.15035-1-heiko.thiery@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHwhSzTrajD06NA1h3YtSz1WJKlVBAaCP1YIOqfdhIEooUABTf/vzS9Mbks4jZrfK/HytkIjBqOZRoRPm5I84JcmnV/e0sV9ZsO4CsQET36pem3Z/qoy
 OWDThBtPetVy+6Wb4+NntCnm/Ml+Gseo3Z9dXFE8NeaxvpSk6b5O0sVki7i4u/7l3uAOCnuJBmm12TtTSNXunzgWRvMXRDzpOD7GdsDYu+fyDEi92j8VMN93
 o0KSaTK+BmvrwgcKVpKrUGwN6k4ZzpX5f2kcb/EuxAzE6BShhd0q3JFSW92409nQOgjDuD/p9pN0JdA4d7CdyaL8yFuaYTk5vBKrk8ImFElUgXs9ugwcBo6Y
 vIBbBWUeAi6L19eRq6Qph1Dx4fztXUW986HtIWMl6B2NSrZKV+oniYD+745NdTJWPVYeJ05E
Subject: Re: [Buildroot] [PATCH v4] configs/kontron_bl_imx8mm_defconfig: new
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko, Frieder,

On 20/01/22 10:19, Heiko Thiery wrote:
> The BL i.MX8M Mini is a baseboard that includes the SoM SL i.MX8M Mini.
> 
> https://www.kontron.com/produkte/baseboard-bl-i.mx8m-mini/p158549
> 
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v4:
>   - remove BR2_ARM_FPU_VFPV3 since this option is not used for aarch64.
>     The FPU options are set implicit.
> 
> v3:
>   - change offset value to use capitol 'K' value (thanks Guilio)
>   - add info to uboot patches about submitting to upstream
> 
> v2:
>   - switch to extlinux
>   - directly call genimage.sh
>    - remove post-image.sh
>   - remove BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
>   - add BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
> 
> 
>   DEVELOPERS                                    |   2 +
>   board/kontron/bl-imx8mm/extlinux.conf         |   4 +
>   board/kontron/bl-imx8mm/genimage.cfg          |  18 ++
>   ...m-kontron-n801x-s-convert-options-to.patch |  31 ++
>   ...m-kontron-n801x-s-add-common-board-u.patch | 305 ++++++++++++++++++
>   board/kontron/bl-imx8mm/post-build.sh         |   7 +
>   board/kontron/bl-imx8mm/readme.txt            |  85 +++++
>   configs/kontron_bl_imx8mm_defconfig           |  58 ++++
>   8 files changed, 510 insertions(+)
>   create mode 100644 board/kontron/bl-imx8mm/extlinux.conf
>   create mode 100644 board/kontron/bl-imx8mm/genimage.cfg
>   create mode 100644 board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
>   create mode 100644 board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
>   create mode 100755 board/kontron/bl-imx8mm/post-build.sh
>   create mode 100644 board/kontron/bl-imx8mm/readme.txt
>   create mode 100644 configs/kontron_bl_imx8mm_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0bfde69da..93c5760489 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1179,7 +1179,9 @@ F:	package/python-sip/
>   F:	package/uhd/
>   
>   N:	Heiko Thiery <heiko.thiery@gmail.com>
> +F:	board/kontron/bl-imx8mm/
>   F:	board/kontron/pitx-imx8m/
> +F:	configs/kontron_bl_imx8mm_defconfig
>   F:	configs/kontron_pitx_imx8m_defconfig
>   F:	package/altera-stapl/
>   F:	package/ipmitool/
> diff --git a/board/kontron/bl-imx8mm/extlinux.conf b/board/kontron/bl-imx8mm/extlinux.conf
> new file mode 100644
> index 0000000000..d38f7f81b7
> --- /dev/null
> +++ b/board/kontron/bl-imx8mm/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +  kernel /boot/Image
> +  devicetree /boot/freescale/imx8mm-kontron-n801x-s.dtb
> +  append root=PARTUUID=%PARTUUID% rootwait rw
> diff --git a/board/kontron/bl-imx8mm/genimage.cfg b/board/kontron/bl-imx8mm/genimage.cfg
> new file mode 100644
> index 0000000000..c98bc4f150
> --- /dev/null
> +++ b/board/kontron/bl-imx8mm/genimage.cfg
> @@ -0,0 +1,18 @@
> +image sdcard.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +		gpt-location = 16K
> +	}
> +
> +	partition imx-boot {
> +		in-partition-table = "no"
> +		image = "flash.bin"
> +		offset = 33K
> +	}
> +
> +	partition rootfs {
> +		image = "rootfs.ext4"
> +		offset = 8M
> +		partition-uuid = %PARTUUID%
> +	}
> +}
> diff --git a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
> new file mode 100644
> index 0000000000..6d76282def
> --- /dev/null
> +++ b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
> @@ -0,0 +1,31 @@
> +From 95a311af81cd47c44d3d6e3f717f06a06d8f3dfd Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Mon, 10 Jan 2022 14:13:02 +0100
> +Subject: [PATCH 1/2] imx: imx8mm: imx8mm-kontron-n801x-s: convert options to Kconfig
> +
> +CONFIG_SPL_MMC and CONFIG_SPL_SERIAL
> +
> +Patch submitted upstream:
> +https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-1-heiko.thiery@gmail.com/
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + configs/kontron-sl-mx8mm_defconfig | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
> +index 35d12fca32..940bf07a92 100644
> +--- a/configs/kontron-sl-mx8mm_defconfig
> ++++ b/configs/kontron-sl-mx8mm_defconfig
> +@@ -15,6 +15,8 @@ CONFIG_SPL_DM_SPI=y
> + CONFIG_DEFAULT_DEVICE_TREE="imx8mm-kontron-n801x-s"
> + CONFIG_SPL_TEXT_BASE=0x7E1000
> + CONFIG_TARGET_KONTRON_MX8MM=y
> ++CONFIG_SPL_MMC=y
> ++CONFIG_SPL_SERIAL=y
> + CONFIG_BOOTCOUNT_BOOTLIMIT=3
> + CONFIG_SPL=y
> + CONFIG_DISTRO_DEFAULTS=y
> +--
> +2.30.2
> +
> diff --git a/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
> new file mode 100644
> index 0000000000..a88d7aba87
> --- /dev/null
> +++ b/board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch
> @@ -0,0 +1,305 @@
> +From ef694c19c074333fd16589ec6ffef3e7ca895186 Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Wed, 12 Jan 2022 08:44:36 +0100
> +Subject: [PATCH 2/2] imx: imx8mm: imx8mm-kontron-n801x-s: add common board
> + u-boot.dtsi
> +
> +When using a board variant that selects the lvds specific dtb the
> +*.u-boot.dtsi file will not be included. To have a lvds dtb specific
> +u-boot.dtsi file move this part to a common board u-boot.dtsi file and
> +include this in the board base u-boot.dtsi and create an additional one
> +for the lvds variant.
> +
> +Patch submitted upstream:
> +https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-2-heiko.thiery@gmail.com/
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + .../imx8mm-kontron-n801x-s-lvds-u-boot.dtsi   |   6 +
> + .../dts/imx8mm-kontron-n801x-s-u-boot.dtsi    | 124 +----------------
> + arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi | 128 ++++++++++++++++++
> + 3 files changed, 135 insertions(+), 123 deletions(-)
> + create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
> + create mode 100644 arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
> +
> +diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
> +new file mode 100644
> +index 0000000000..4bf75722bf
> +--- /dev/null
> ++++ b/arch/arm/dts/imx8mm-kontron-n801x-s-lvds-u-boot.dtsi
> +@@ -0,0 +1,6 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * Copyright (C) 2019 Kontron Electronics GmbH
> ++ */
> ++
> ++#include "imx8mm-kontron-n801x-u-boot.dtsi"
> +diff --git a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
> +index 22d18e6f1c..4bf75722bf 100644
> +--- a/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
> ++++ b/arch/arm/dts/imx8mm-kontron-n801x-s-u-boot.dtsi
> +@@ -3,126 +3,4 @@
> +  * Copyright (C) 2019 Kontron Electronics GmbH
> +  */
> +
> +-#include "imx8mm-u-boot.dtsi"
> +-
> +-/ {
> +-	aliases {
> +-		usb0 = &usbotg1;
> +-		usb1 = &usbotg2;
> +-	};
> +-
> +-	wdt-reboot {
> +-		compatible = "wdt-reboot";
> +-		wdt = <&wdog1>;
> +-		u-boot,dm-spl;
> +-	};
> +-
> +-	firmware {
> +-		optee {
> +-			compatible = "linaro,optee-tz";
> +-			method = "smc";
> +-		};
> +-	};
> +-};
> +-
> +-&fec1 {
> +-	phy-mode = "rgmii-rxid";
> +-};
> +-
> +-&i2c1 {
> +-	u-boot,dm-spl;
> +-	u-boot,dm-pre-reloc;
> +-};
> +-
> +-&i2c2 {
> +-	status = "okay";
> +-	u-boot,dm-spl;
> +-	u-boot,dm-pre-reloc;
> +-};
> +-
> +-&pinctrl_ecspi1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pinctrl_i2c1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pinctrl_pmic {
> +-	u-boot,dm-spl;
> +-	fsl,pins = <
> +-		MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x141
> +-		/* Disable Pullup for SD_VSEL */
> +-		MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0x41
> +-	>;
> +-};
> +-
> +-&pinctrl_uart3 {
> +-	u-boot,dm-spl;
> +-	u-boot,dm-pre-reloc;
> +-};
> +-
> +-&pinctrl_usdhc1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pinctrl_usdhc1_100mhz {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pinctrl_usdhc1_200mhz {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pinctrl_usdhc2 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&pca9450 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&ecspi1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&gpio1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&gpio2 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&gpio3 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&gpio4 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&gpio5 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&uart3 {
> +-	u-boot,dm-spl;
> +-	u-boot,dm-pre-reloc;
> +-};
> +-
> +-&usdhc1 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&usdhc2 {
> +-	u-boot,dm-spl;
> +-};
> +-
> +-&wdog1 {
> +-	u-boot,dm-spl;
> +-};
> ++#include "imx8mm-kontron-n801x-u-boot.dtsi"
> +diff --git a/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
> +new file mode 100644
> +index 0000000000..22d18e6f1c
> +--- /dev/null
> ++++ b/arch/arm/dts/imx8mm-kontron-n801x-u-boot.dtsi
> +@@ -0,0 +1,128 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * Copyright (C) 2019 Kontron Electronics GmbH
> ++ */
> ++
> ++#include "imx8mm-u-boot.dtsi"
> ++
> ++/ {
> ++	aliases {
> ++		usb0 = &usbotg1;
> ++		usb1 = &usbotg2;
> ++	};
> ++
> ++	wdt-reboot {
> ++		compatible = "wdt-reboot";
> ++		wdt = <&wdog1>;
> ++		u-boot,dm-spl;
> ++	};
> ++
> ++	firmware {
> ++		optee {
> ++			compatible = "linaro,optee-tz";
> ++			method = "smc";
> ++		};
> ++	};
> ++};
> ++
> ++&fec1 {
> ++	phy-mode = "rgmii-rxid";
> ++};
> ++
> ++&i2c1 {
> ++	u-boot,dm-spl;
> ++	u-boot,dm-pre-reloc;
> ++};
> ++
> ++&i2c2 {
> ++	status = "okay";
> ++	u-boot,dm-spl;
> ++	u-boot,dm-pre-reloc;
> ++};

any findings for i2c1 and i2c2 nodes?
This is not mandatory to be accepted anyway.
I've successfully built it so:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
