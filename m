Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C7BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2C8D402A8;
	Fri, 14 Jan 2022 09:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQCk7U6LpY70; Fri, 14 Jan 2022 09:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D05B740173;
	Fri, 14 Jan 2022 09:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 733ED1BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F89240173
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dz5QNKwkWutT for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:42:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13038400F2
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:42:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p27so16753414lfa.1
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XK1dCtLtzgod0waoCa0sbV9QCn9xaFGvoTb5VSXTMwo=;
 b=VoisdpPUsgVfSycPUqQklGjR33IwEuiT0mfW9nj1PDMceBs2CzRxmtfQCZu4DhCCRt
 0YZVV7/8uWni9mlKjTUaNrG3Rk7y+TzlWH0APFdOtSXOPmzkFMS6Ep4ltggq2rCA0/9E
 A56rbQtapkc6kSS0lzx3rGohEpPtdNOVpXVAGPXKDZOINiEgxuhVHSZ9Fb90/YsUfR0O
 9p9gWFo/D/hgxBlH0Jo4gnj3TOdcAdNer5FSAeIu5S2OXcKLNv23+hz9FqeotQEqewFA
 ot6eu5ejcQp4Hm4cwGSkZAJSHkIwiKDN6WEjed0LZ52gOdfdzbXOCdyIC/pkhv24jLu9
 dMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XK1dCtLtzgod0waoCa0sbV9QCn9xaFGvoTb5VSXTMwo=;
 b=7Tj8WD3WHJu0FFh6T0xNELLgz8Dg2RSkMnWZpgn+ZeCDMH2eIg3RPxFtHPpmhr7OD+
 LWyiEU7kdVJ66EDLlGv5JCi8AV6Z2wsmRdGNyxkJh19sSnA6TxgvM3UAQed7nmw4iays
 imFODFJ2lPWV1FTKJv0AfYnK5nWwCp5j79GOMgEa9jVSXUHJ6uBFDo9wJKNVrHh0PEC4
 02u8am5OeQyljOZEVbOspo4IEyAqVW1LSoyf2rIyLzWAw6S//P1N4mKHuRG4ZJtrbAMy
 dPUokCl/L7nKYO76EhfIlRAFeK67dHZHN0AbevvZTNfl0co3ykM3wQuQl8P6yVM7xofg
 2XRQ==
X-Gm-Message-State: AOAM5305v+qWfYP4rRMX5RkPrDcsQdm/AdaSRuuOR5J6XgX95GCYVw0/
 0aV1sUdaS2SicX1BxSHhW9sxVks4RavaNjde+50=
X-Google-Smtp-Source: ABdhPJzeEmkX7ClR+yFAlRvMKijQHe+qzl3Cb19A2vT33QxOQDuEcZVFTbJIA2QM9lcFTx3ZO6YPEBLrTAeeB45uHhg=
X-Received: by 2002:a19:f00f:: with SMTP id p15mr4593743lfc.196.1642153365876; 
 Fri, 14 Jan 2022 01:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20220112184821.916646-1-heiko.thiery@gmail.com>
 <20220113220057.1db30808@windsurf>
In-Reply-To: <20220113220057.1db30808@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 14 Jan 2022 10:42:34 +0100
Message-ID: <CAEyMn7YJEuGsAJxUWpPJ96JRoUC3KwSpZvT0zdsnVfUA3-tt9g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: new
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Do., 13. Jan. 2022 um 22:00 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Wed, 12 Jan 2022 19:48:22 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > diff --git a/board/kontron/bl-imx8mm/boot.cmd b/board/kontron/bl-imx8mm/boot.cmd
> > new file mode 100644
> > index 0000000000..7ce3198dbc
> > --- /dev/null
> > +++ b/board/kontron/bl-imx8mm/boot.cmd
> > @@ -0,0 +1,8 @@
> > +echo "Root File Sytem on MMC${devnum}"
> > +setenv rootfs /dev/mmcblk${devnum}p1
> > +setenv bootargs root=${rootfs} rootwait rw ${extrabootargs}
> > +
> > +load ${devtype} ${devnum} ${kernel_addr_r} boot/Image
> > +load ${devtype} ${devnum} ${fdt_addr_r} boot/imx8mm-kontron-n801x-s.dtb
> > +
> > +booti ${kernel_addr_r} - ${fdt_addr_r}
>
> Have you considered using extlinux.conf ? This is generally much easier
> than a boot script, and removes the need to generate the boot script.

I will switch to extlinux.

>
> > diff --git a/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
> > new file mode 100644
> > index 0000000000..ed088dd0f8
> > --- /dev/null
> > +++ b/board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch
> > @@ -0,0 +1,28 @@
> > +From 95a311af81cd47c44d3d6e3f717f06a06d8f3dfd Mon Sep 17 00:00:00 2001
> > +From: Heiko Thiery <heiko.thiery@gmail.com>
> > +Date: Mon, 10 Jan 2022 14:13:02 +0100
> > +Subject: [PATCH 1/2] imx: imx8mm: imx8mm-kontron-n801x-s: convert options to Kconfig
>
> I suppose the U-Boot patches are on their way upstream?

The patches are already posted upstream:

https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-1-heiko.thiery@gmail.com/
https://patchwork.ozlabs.org/project/uboot/patch/20220112085755.7396-2-heiko.thiery@gmail.com/

>
> > diff --git a/board/kontron/bl-imx8mm/post-image.sh b/board/kontron/bl-imx8mm/post-image.sh
> > new file mode 100755
> > index 0000000000..564211c829
> > --- /dev/null
> > +++ b/board/kontron/bl-imx8mm/post-image.sh
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
>
> Could you call support/scripts/genimage.sh directly as the post-image
> script, using the BR2_ROOTFS_POST_SCRIPT_ARGS to pass the -c ...
> argument? We already do that in many defconfigs.

Ok

>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-kontron-n801x-s"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > +
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
> > +
> > +BR2_PACKAGE_FREESCALE_IMX=y
> > +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
> > +BR2_PACKAGE_FIRMWARE_IMX=y
> > +
> > +# Filesystem / image
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> > +
> > +# Bootloader
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
> > +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
> > +BR2_TARGET_UBOOT_SPL=y
> > +
> > +# Required host tools to create the SD/eMMC image
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>
> You need FIT support ?

No .. I will remove it.

>
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/kontron/bl-imx8mm/boot.cmd"
>
> These would no longer be needed if switching to extlinux.conf.

Ok.

I will prepare and test the new version. Thanks.
-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
