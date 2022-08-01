Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B1C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367B26070A;
	Mon,  1 Aug 2022 21:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 367B26070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST9LcRnrdBlq; Mon,  1 Aug 2022 21:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286D060675;
	Mon,  1 Aug 2022 21:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286D060675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2F1C1BF29C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D1760675
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D1760675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l76_4nY-5bih for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83D6605AB
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D83D6605AB
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:47:00 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id kb8so8157491ejc.4
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 14:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6A1vuvGxlM6jzwVr2letpNiY8zJXrkGcvoxDZghckgw=;
 b=zmYo/z+6HuEo9657nXrReolBowbm9H7RJ60D4NFSHYF+iS8HkBhMzn/qV9/OIPooog
 ULwFMZsEYllWSIozo2OVaFvFSVitXTBHz6EI6w8aVCD1wTOFgTLufKpXJwD2PfcgsC3C
 m56n+wEm80ozu5l021YEra8VVEJpsl1GtQRTTrU0Ii+F4MTDQBTPSo/nUo31FpWWnJEN
 mjJgipxUgdEdldjr0WY9AHoiZy8jZX6lZfnwqlypOhq83w9JrBKCaOSlz9tmXIdutUss
 Ma1g1CdWgpWyXTcb0pUJ1edFZ886+WuV8bSxdL1xqblrfZgY75NUNUnMrnTykbNxTiYb
 me/Q==
X-Gm-Message-State: AJIora9tVrAk9WVsNKQflZ+XOn6CUXmWHGmjehysfne5py04+mxfmjTR
 XY7rGqlkjbpXYg3jcn6Pfsph1b8Q/GFNT5LRe34=
X-Google-Smtp-Source: AGRyM1s1LoBcdjfdZkHJ/J5helQFy+7yuv+3oFI8VOPyeySbzu4YSm4A2l8PPmpiWcp2KokPj+o7Z9GxElop/ltofpQ=
X-Received: by 2002:a17:906:84e8:b0:72b:6d91:a0d1 with SMTP id
 zp8-20020a17090684e800b0072b6d91a0d1mr13958131ejb.60.1659390419014; Mon, 01
 Aug 2022 14:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
 <20220801225044.63ead8d4@windsurf>
In-Reply-To: <20220801225044.63ead8d4@windsurf>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 1 Aug 2022 17:46:48 -0400
Message-ID: <CAJFTR8SkMjAe1=V411g9BmdzYDZv+5mtLMQ29w=2BJj4LS1sWw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6A1vuvGxlM6jzwVr2letpNiY8zJXrkGcvoxDZghckgw=;
 b=mXtatwQi63wu3DnVwDFAMhWFKUm7BQTg6zGOgVnu6s9OHg19z6wHRWtxJGujvIkbzu
 PZ7aCHg9ubcFMKK7hznEnbLyEqYxzRJi5w6Ov1GGqtrKAeBIjOGEk1KupjM4yOxK13z4
 Z5mEnnh1uZZc67Ohmza531A7SsbRMmjyt+njER4WLgjJRewBwnujVqQGCtgi0qbVI/Ln
 +qU9IwapW2xxRxNDfFHMT6pae8MIVDtEOn5g7axzz3i25RXQ6To3V4Uq5eg4NW12285h
 882oVZrfL8/4AsAi5fvD1Zu+vMxMtomAXJoWhNnTxT02KMNNp1wfzlgjlIRUyNxMyWcv
 L2iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mXtatwQi
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 1, 2022 at 4:50 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Jesse,
>
> Thanks for your contribution!
>
> On Sat, 30 Jul 2022 02:12:19 -0400
> Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> > Add defconfig for imxrt1050-evk is a development board from NXP.
> >
> > The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> > first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> > up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> > cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> > 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> > uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> > Seeing that these chips are comparable to the STM32F7xxs which have
> > buildroot ported to them it seems reasonable to add support for them.
> >
> > https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Thanks a lot, it looks mostly good, but I have a few comments/questions.
>
> >  N:   Giulio Benetti <giulio.benetti@benettiengineering.com>
> > +F:   board/freescale/imxrt1050evk/*
> >  F:   board/olimex/a*
> >  F:   configs/amarula_vyasa_rk3288_defconfig
> >  F:   configs/asus_tinker_rk3288_defconfig
> > +F:   configs/imxrt1050-evk_defconfig
> >  F:   configs/olimex_a*
> >  F:   package/at/
> >  F:   package/binutils/
>
> Any reason to add Giulio here?

We worked on Linux and U-Boot together.

>
> > diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
> > new file mode 100755
> > index 0000000000..476958a691
> > --- /dev/null
> > +++ b/board/freescale/imxrt1050evk/post-build.sh
> > @@ -0,0 +1,6 @@
> > +#!/bin/sh
> > +MKIMAGE=$HOST_DIR/bin/mkimage
> > +
> > +if [ -e $BINARIES_DIR/Image ]; then
>
> Why is this test needed? The Image file will be produced by the kernel
> build, so it should be there. If it's not, we should really error out
> hard. So I think doing without the test is better.

I was using board/nexbox/a95x/post-build.sh as a base, I can drop it.

> > +     $MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
> > +fi
> > diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
> > new file mode 100644
> > index 0000000000..bbbcd5307f
> > --- /dev/null
> > +++ b/board/freescale/imxrt1050evk/readme.txt
> > @@ -0,0 +1,24 @@
> > +NXP i.MXRT1050 EVK board
> > +---------------------
>
> Add the few missing '-'
>
> Also, as requested by Giulio, a short intro about the board + a link
> would be useful here.
>
>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
>
> 5.19 is out now, so you can use a non-rc version :)

Sorry I forgot to change when submitting...

> > +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> > +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
> > +
> > +# Filesystem
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
>
> Why limit to 3 MB ? Is there a strong reason?

Because that's the nearest ceil(MB) size of the ext4 filesystem.
I like dd-ing the images fast.

Also, leave the label
> undefined.
>
> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
>
> Please used a version of U-Boot explicitly defined in the defconfig.

Read below.

>
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> > +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
> > +BR2_TARGET_UBOOT_FORMAT_IMG=y
> > +BR2_TARGET_UBOOT_SPL=y
> > +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> > +
> > +# Required tools to create the SD card image
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_HOST_MKPASSWD=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > +
> > +# Misc
> > +BR2_BINUTILS_VERSION_2_36_X=y
> > +# thumb2 ADR bug introduced in 2.37 fix is not yet in u-boot
>
> Do you have some detail on this bug? Like a link to the bug report, or
> something like this? Note that binutils 2.39 is soon going to arrive,
> so we will get rid of binutils 2.36... which means we will very soon
> have a problem with this defconfig.
>

https://patchwork.ozlabs.org/project/uboot/patch/20220712110023.3163770-1-andre.przywara@arm.com/

The patch above removes the need for binutils 2.36 and a U-Boot
version hasn't been released with that commit yet.
This is the reason for no U-Boot version.

Thanks,
Jesse T

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
