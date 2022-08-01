Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D12CC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285688138C;
	Mon,  1 Aug 2022 20:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285688138C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjrDFqbrb1BV; Mon,  1 Aug 2022 20:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3686B8137A;
	Mon,  1 Aug 2022 20:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3686B8137A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAA81BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233E8408E9
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233E8408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvA-gRkKVFFm for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:50:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66006408D0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66006408D0
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:50:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6D7960006;
 Mon,  1 Aug 2022 20:50:45 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:50:44 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20220801225044.63ead8d4@windsurf>
In-Reply-To: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
References: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659387047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbCwucQ4IiJ5esHnsR6Cs87qPtTdQ/M3pHW1/FQ9X38=;
 b=SxiLrc8ac+55awLWwPhRjZbyvG+FSErwS3pFPi8NkEmyz4VSv7Ija7L5kKVUG7GIf1s7L8
 NHNNpOSj1Bg21d5MfADaNBRbXfD+XAU8LR+iJrYSl9xrXmXiIejKHW86JCqZIuW2TA9/e0
 NncKhBgYGgkk5Nh5c+d/YY/PobOAT6eP5hXqSNy8AtLKigJ9f3NJOvq80V4FZjWTe4efal
 aOv1yDDGhbbLILEy/JyTOTrVXQA1bB8vUHA+M4p0mnmT8m0gW/aZPZGzHNXhqVFQozd/4v
 SdakhBHsCsYwbspr8lKnFBrcyBsIbXNm7EH4H7L5V/s/UOy4NzMM2nRD0VTfcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SxiLrc8a
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk: New defconfig
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
Cc: festevam@gmail.com, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

Thanks for your contribution!

On Sat, 30 Jul 2022 02:12:19 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add defconfig for imxrt1050-evk is a development board from NXP.
> 
> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> Seeing that these chips are comparable to the STM32F7xxs which have
> buildroot ported to them it seems reasonable to add support for them.
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks a lot, it looks mostly good, but I have a few comments/questions.

>  N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*
>  F:	board/olimex/a*
>  F:	configs/amarula_vyasa_rk3288_defconfig
>  F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/imxrt1050-evk_defconfig
>  F:	configs/olimex_a*
>  F:	package/at/
>  F:	package/binutils/

Any reason to add Giulio here?


> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> new file mode 100755
> index 0000000000..476958a691
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/post-build.sh
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +
> +if [ -e $BINARIES_DIR/Image ]; then

Why is this test needed? The Image file will be produced by the kernel
build, so it should be there. If it's not, we should really error out
hard. So I think doing without the test is better.

> +	$MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
> +fi
> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> new file mode 100644
> index 0000000000..bbbcd5307f
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/readme.txt
> @@ -0,0 +1,24 @@
> +NXP i.MXRT1050 EVK board
> +---------------------

Add the few missing '-'

Also, as requested by Giulio, a short intro about the board + a link
would be useful here.


> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"

5.19 is out now, so you can use a non-rc version :)

> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"

Why limit to 3 MB ? Is there a strong reason? Also, leave the label
undefined.

> +# Bootloader
> +BR2_TARGET_UBOOT=y

Please used a version of U-Boot explicitly defined in the defconfig.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +
> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# Misc
> +BR2_BINUTILS_VERSION_2_36_X=y
> +# thumb2 ADR bug introduced in 2.37 fix is not yet in u-boot

Do you have some detail on this bug? Like a link to the bug report, or
something like this? Note that binutils 2.39 is soon going to arrive,
so we will get rid of binutils 2.36... which means we will very soon
have a problem with this defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
