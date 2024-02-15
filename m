Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0429EC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 05:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FC82418B7;
	Thu, 15 Feb 2024 05:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufen5yl4-Clo; Thu, 15 Feb 2024 05:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DADA8403C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DADA8403C7;
	Thu, 15 Feb 2024 05:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D731C1BF5A7
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 05:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BC3403C7
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 05:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uK9M4BxHnn6 for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 05:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com;
 envelope-from=asd617140123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A86AF400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86AF400FC
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A86AF400FC
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 05:57:44 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7d5cbc4a585so176026241.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 21:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707976663; x=1708581463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/TDhXGA2yPU1qBE5sq8KNT1Jigrej0rKaUI/dtxQYw=;
 b=f5QWTyJiTdR+RcY3qdVZWBv2KhPfiGce1asBQq7M7oPEdcpobr9udXX562d8KgabpE
 q+VW/8r2x0C18MQ2pIx9vsTaKSUi47X5o7D7757dGtA+sfro4swPICjGU5cdMqkQMiBC
 ZOuYOLP2MSOzoWmLN0tMIdWkusAWmFgkbw2bBsk3xx9nNS/YP5Dwx3E6nWhfBOG8h1+5
 oICHN/6ZsdXz2ap2nZOSi4AEo/lEK7d/FyWG9iynPmkNA7+kxvtyseQxOqPLyyGz4Lm8
 HaipMWOeA0ZAriCpYzMln8R0v1DKtlzLxy05/4d1lyUatfLlq4E/zBIaBCnyuLObYDor
 347w==
X-Gm-Message-State: AOJu0YxkDEQVOzpsNL6IMz9XYwS6GTIl54PbF0cZ1hw60lPV2gqUS0oi
 320LcT9Q5ixdzQOq2HW53EmN6MUPMkUS0SMScqvtxOteNXA+tBLleC8HslAZFYuWvhgT7V9LPQL
 +InpWouQvrXnuJLZARgit6yDYSA4=
X-Google-Smtp-Source: AGHT+IEZq7J/P8hg+QTjExUTb5GINM8CFnBVqss7uPPYTLzzxbeEcxYIx+oVz6svoCGXQA68oyVzvBwj219+D5lsqn4=
X-Received: by 2002:a05:6102:2256:b0:46e:dcb2:a2b6 with SMTP id
 e22-20020a056102225600b0046edcb2a2b6mr794611vsb.1.1707976663028; Wed, 14 Feb
 2024 21:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20240207030339.3910-1-asd617140123@gmail.com>
 <0e623797-b573-4604-b89e-737c7c503350@benettiengineering.com>
In-Reply-To: <0e623797-b573-4604-b89e-737c7c503350@benettiengineering.com>
From: eric <asd617140123@gmail.com>
Date: Thu, 15 Feb 2024 13:57:29 +0800
Message-ID: <CAKEXHNMmpdFgR8AUpn3vP9M21dgOpD6VkKKtyH58vgP5HTBSUw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707976663; x=1708581463; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/TDhXGA2yPU1qBE5sq8KNT1Jigrej0rKaUI/dtxQYw=;
 b=gTpUNnNLc+cX1IRhUh0z5sgCvtCoLfXY92g7Eg0Q0QZdjdgCrSj72H4qQrdDpsA8SU
 vELf4FwmIcOzZPRtR5yW3hq7FnC6nHIonWkp5ZVnezgt4un41l5oZ/Bs9TTavH8Cb8sp
 NsOKgMySz3Oxz8KQQyJh9OkEnURXvkdcS4Oc8RboRl+KEaeVKmqO52wVrQsQ50cRXzn8
 p2TXTeF/aTqgidNq+7vK1R/t8Ta3s2FKARo5WS4NMvUHGDrGodltj1VrgOE/zhWq3BN5
 ZIkVSx0ZrLz4CGVmw3mz7RFUXxaDz8RcCunMmbya7DpDVhmw4ubrZM5ryOlQ5XjSiOjl
 aFlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gTpUNnNL
Subject: Re: [Buildroot] [PATCH v2] board/cubietech/cubieboard4 : Add config
 file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8747089383867880608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8747089383867880608==
Content-Type: multipart/alternative; boundary="00000000000048df210611654e7d"

--00000000000048df210611654e7d
Content-Type: text/plain; charset="UTF-8"

Hi Giulio,


>
> Here you have to keep the previous tags when sending new version of
> patches:

   I didn't get it, what is the  previous tags?

>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Build Tested]
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> > ---
> > v1 -> v2
> > * Add BR2_cortex_a15_a7=y in buildroot defconfig.
> > * Bump linux version to 6.6.8
> > * Using sunxi_defconfig in kernel.
> > * Using "make savedefconfig" to save defconfig.
> > * Remove boot.cmd.
>
> this patch had to be V3, but don't mind at this point.
> I ask you when you send newer patches to set as superseded
> the previous patch in patchwork:
> https://patchwork.ozlabs.org/project/buildroot/list/
>
> I just need to add v3 tag, right? or I need to add other tags, e.g.,
resend?

> > ---
> >   DEVELOPERS                                |  4 +++
> >   board/cubietech/cubieboard4/extlinux.conf |  5 +++
> >   board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
> >   board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
> >   configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
> >   5 files changed, 104 insertions(+)
> >   create mode 100644 board/cubietech/cubieboard4/extlinux.conf
> >   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
> >   create mode 100755 board/cubietech/cubieboard4/post-image.sh
> >   create mode 100644 configs/cubieboard4_defconfig
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index a03018ab2b..bffb8f2069 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -3297,3 +3297,7 @@ F:      package/quazip/
> >   F:  package/shapelib/
> >   F:  package/simple-mail/
> >   F:  package/tinc/
> > +
> > +N:   Nigel Wang <asd617140123@gmail.com>
> > +F:   board/cubietech/cubieboard4/
> > +F:   configs/cubieboard4_defconfig
> > diff --git a/board/cubietech/cubieboard4/extlinux.conf
> b/board/cubietech/cubieboard4/extlinux.conf
> > new file mode 100644
> > index 0000000000..5084e2237b
> > --- /dev/null
> > +++ b/board/cubietech/cubieboard4/extlinux.conf
> > @@ -0,0 +1,5 @@
> > +label linux
> > +    kernel /boot/zImage
> > +    devicetree /sun9i-a80-cubieboard4.dtb
> > +    append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> > +
> > diff --git a/board/cubietech/cubieboard4/genimage.cfg
> b/board/cubietech/cubieboard4/genimage.cfg
> > new file mode 100644
> > index 0000000000..f1dee13923
> > --- /dev/null
> > +++ b/board/cubietech/cubieboard4/genimage.cfg
> > @@ -0,0 +1,38 @@
> > +# Minimal SD card image for the Cubieboard2
> > +# Based in the Orange Pi genimage.cfg
> > +
> > +image boot.vfat {
> > +     vfat {
> > +             files = {
> > +                     "zImage",
> > +                     "sun9i-a80-cubieboard4.dtb",
> > +                     "extlinux"
> > +             }
> > +     }
> > +
> > +     size = 8M
> > +}
> > +
> > +image sdcard.img {
> > +     hdimage {
> > +     }
> > +
> > +     partition u-boot {
> > +             in-partition-table = "no"
> > +             image = "u-boot-sunxi-with-spl.bin"
> > +             offset = 8K
> > +             size = 1016K # 1MB - 8KB
> > +     }
> > +
> > +     partition boot {
> > +             partition-type = 0xC
> > +             bootable = "true"
> > +             image = "boot.vfat"
> > +     }
> > +
> > +     partition rootfs {
> > +             partition-type = 0x83
> > +             image = "rootfs.ext4"
> > +             size = 512M
> > +     }
> > +}
> > diff --git a/board/cubietech/cubieboard4/post-image.sh
> b/board/cubietech/cubieboard4/post-image.sh
> > new file mode 100755
> > index 0000000000..e37b960a4d
> > --- /dev/null
> > +++ b/board/cubietech/cubieboard4/post-image.sh
> > @@ -0,0 +1,18 @@
> > +#!/bin/sh
> > +
> > +BOARD_DIR="$(dirname "$0")"
> > +install -m 0644 -D $BOARD_DIR/extlinux.conf
> $BINARIES_DIR/extlinux/extlinux.conf
> > +
> > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +
> > +rm -rf "${GENIMAGE_TMP}"
> > +
> > +genimage                           \
> > +     --rootpath "${TARGET_DIR}"     \
> > +     --tmppath "${GENIMAGE_TMP}"    \
> > +     --inputpath "${BINARIES_DIR}"  \
> > +     --outputpath "${BINARIES_DIR}" \
> > +     --config "${GENIMAGE_CFG}"
> > +
> > +exit $?
> > diff --git a/configs/cubieboard4_defconfig
> b/configs/cubieboard4_defconfig
> > new file mode 100644
> > index 0000000000..0592fe4a2d
> > --- /dev/null
> > +++ b/configs/cubieboard4_defconfig
> > @@ -0,0 +1,39 @@
> > +# Architecture
> > +BR2_arm=y
> > +BR2_cortex_a15_a7=y
> > +BR2_ARM_FPU_NEON_VFPV4=y
> > +
> > +# System
> > +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
>
> Here the option below is missing and it's needed otherwise the newest
> Linux version will be picked and build will fail.
> Now we don't see the problem because the latest version is exactly 6.6,
> so need this:
>
> # Linux headers same as kernel, a 6.6 series
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.8"
> > +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun9i-a80-cubieboard4"
> > +
> > +# Filesystem
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +
> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> > +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> > +BR2_TARGET_UBOOT_SPL=y
> > +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> > +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_HOST_MTOOLS=y
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> > --
> > 2.34.1
> >
>
> This patch looks to me, except missing Linux header version.
>
> I've added that option and re-built successfully so I confirm my:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Build Tested]
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Maybe a Maintainer can edit while committing, of if you can please send
> a V3 with that missing line.
>
> Thank you!
>
> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>

--00000000000048df210611654e7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Hi Giulio,<br>=C2=A0 =C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Here you have to keep the previous tags when sending new version of patches=
:</blockquote><div>=C2=A0 =C2=A0I didn&#39;t get it, what is the=C2=A0 prev=
ious tags?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br>
[Build Tested]<br>
Tested-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengin=
eering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;=
<br>
<br>
&gt; ---<br>
&gt; v1 -&gt; v2<br>
&gt; * Add BR2_cortex_a15_a7=3Dy in buildroot defconfig.<br>
&gt; * Bump linux version to 6.6.8<br>
&gt; * Using sunxi_defconfig in kernel.<br>
&gt; * Using &quot;make savedefconfig&quot; to save defconfig.<br>
&gt; * Remove boot.cmd.<br>
<br>
this patch had to be V3, but don&#39;t mind at this point.<br>
I ask you when you send newer patches to set as superseded<br>
the previous patch in patchwork:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/" rel=3D"nor=
eferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/l=
ist/</a><br>
<br></blockquote><div>I just need to add v3 tag, right? or I need to add ot=
her tags, e.g., resend?</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; ---<br>
&gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +=
++<br>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/extlinux.conf |=C2=A0 5 +++<br=
>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/genimage.cfg=C2=A0 | 38 ++++++=
++++++++++++++++<br>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++=
<br>
&gt;=C2=A0 =C2=A0configs/cubieboard4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 39 +++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 104 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/cubietech/cubieboard4/extlinux.co=
nf<br>
&gt;=C2=A0 =C2=A0create mode 100644 board/cubietech/cubieboard4/genimage.cf=
g<br>
&gt;=C2=A0 =C2=A0create mode 100755 board/cubietech/cubieboard4/post-image.=
sh<br>
&gt;=C2=A0 =C2=A0create mode 100644 configs/cubieboard4_defconfig<br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index a03018ab2b..bffb8f2069 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -3297,3 +3297,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/quazip/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/shapelib/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/simple-mail/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/tinc/<br>
&gt; +<br>
&gt; +N:=C2=A0 =C2=A0Nigel Wang &lt;<a href=3D"mailto:asd617140123@gmail.co=
m" target=3D"_blank">asd617140123@gmail.com</a>&gt;<br>
&gt; +F:=C2=A0 =C2=A0board/cubietech/cubieboard4/<br>
&gt; +F:=C2=A0 =C2=A0configs/cubieboard4_defconfig<br>
&gt; diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubiete=
ch/cubieboard4/extlinux.conf<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5084e2237b<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/cubietech/cubieboard4/extlinux.conf<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +label linux<br>
&gt; +=C2=A0 =C2=A0 kernel /boot/zImage<br>
&gt; +=C2=A0 =C2=A0 devicetree /sun9i-a80-cubieboard4.dtb<br>
&gt; +=C2=A0 =C2=A0 append console=3DttyS0,115200 earlyprintk root=3D/dev/m=
mcblk0p2 rootwait<br>
&gt; +<br>
&gt; diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietec=
h/cubieboard4/genimage.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f1dee13923<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/cubietech/cubieboard4/genimage.cfg<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +# Minimal SD card image for the Cubieboard2<br>
&gt; +# Based in the Orange Pi genimage.cfg<br>
&gt; +<br>
&gt; +image boot.vfat {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vfat {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;zImage&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;sun9i-a80-cubieboard4.dtb&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;extlinux&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size =3D 8M<br>
&gt; +}<br>
&gt; +<br>
&gt; +image sdcard.img {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdimage {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-boo=
t-sunxi-with-spl.bin&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8K<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 1016K # 1MB =
- 8KB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition boot {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D 0x=
C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;tr=
ue&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boot.=
vfat&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D 0x=
83<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;rootf=
s.ext4&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 512M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubiete=
ch/cubieboard4/post-image.sh<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..e37b960a4d<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/cubietech/cubieboard4/post-image.sh<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +BOARD_DIR=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
&gt; +install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/ex=
tlinux.conf<br>
&gt; +<br>
&gt; +GENIMAGE_CFG=3D&quot;${BOARD_DIR}/genimage.cfg&quot;<br>
&gt; +GENIMAGE_TMP=3D&quot;${BUILD_DIR}/genimage.tmp&quot;<br>
&gt; +<br>
&gt; +rm -rf &quot;${GENIMAGE_TMP}&quot;<br>
&gt; +<br>
&gt; +genimage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--rootpath &quot;${TARGET_DIR}&quot;=C2=A0 =C2=A0=
 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--tmppath &quot;${GENIMAGE_TMP}&quot;=C2=A0 =C2=
=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--inputpath &quot;${BINARIES_DIR}&quot;=C2=A0 \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0--outputpath &quot;${BINARIES_DIR}&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--config &quot;${GENIMAGE_CFG}&quot;<br>
&gt; +<br>
&gt; +exit $?<br>
&gt; diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defco=
nfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0592fe4a2d<br>
&gt; --- /dev/null<br>
&gt; +++ b/configs/cubieboard4_defconfig<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +# Architecture<br>
&gt; +BR2_arm=3Dy<br>
&gt; +BR2_cortex_a15_a7=3Dy<br>
&gt; +BR2_ARM_FPU_NEON_VFPV4=3Dy<br>
&gt; +<br>
&gt; +# System<br>
&gt; +BR2_TARGET_GENERIC_HOSTNAME=3D&quot;Cubieboard4&quot;<br>
&gt; +BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Cubieboard4!&quot;<br>
&gt; +BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&quot;<br>
&gt; +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/cubietech/cubieboard4/post=
-image.sh&quot;<br>
<br>
Here the option below is missing and it&#39;s needed otherwise the newest<b=
r>
Linux version will be picked and build will fail.<br>
Now we don&#39;t see the problem because the latest version is exactly 6.6,=
<br>
so need this:<br>
<br>
# Linux headers same as kernel, a 6.6 series<br>
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy<br>
<br>
&gt; +# Kernel<br>
&gt; +BR2_LINUX_KERNEL=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.6.8&quot;<br>
&gt; +BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;sunxi&quot;<br>
&gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun9i-a80-cubieboa=
rd4&quot;<br>
&gt; +<br>
&gt; +# Filesystem<br>
&gt; +BR2_TARGET_ROOTFS_EXT2=3Dy<br>
&gt; +BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
&gt; +<br>
&gt; +# Bootloader<br>
&gt; +BR2_TARGET_UBOOT=3Dy<br>
&gt; +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
&gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
&gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2021.10&quot;<br>
&gt; +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;Cubieboard4&quot;<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
&gt; +BR2_TARGET_UBOOT_SPL=3Dy<br>
&gt; +BR2_TARGET_UBOOT_SPL_NAME=3D&quot;u-boot-sunxi-with-spl.bin&quot;<br>
&gt; +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
&gt; +BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
&gt; +BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
&gt; +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt; <br>
<br>
This patch looks to me, except missing Linux header version.<br>
<br>
I&#39;ve added that option and re-built successfully so I confirm my:<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br>
[Build Tested]<br>
Tested-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengin=
eering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;=
<br>
<br>
Maybe a Maintainer can edit while committing, of if you can please send<br>
a V3 with that missing line.<br>
<br>
Thank you!<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
</blockquote></div></div>

--00000000000048df210611654e7d--

--===============8747089383867880608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8747089383867880608==--
