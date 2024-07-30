Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6CC3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 08:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B33D260907;
	Tue, 30 Jul 2024 08:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCEuuQQz5Mcc; Tue, 30 Jul 2024 08:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5125608F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5125608F2;
	Tue, 30 Jul 2024 08:52:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9325B1BF420
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809F44022E
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 08:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-FXLx1Q3zVM for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 08:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=asd617140123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23F07401EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F07401EC
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23F07401EC
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 08:52:12 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4f6e36ea1ebso1123335e0c.0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 01:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722329531; x=1722934331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBMU/ufd60isDUCkuYbz0IyIcHzvCHlP0CN70doeehw=;
 b=piGPoYjdX+7ZNWENFqVUIgUPud4MlxPiY+Hbw8zjKj35Rbp9aU3BUUlsv7P+TzpbfH
 ojbAGDvbs0GjLdoqJ4NYFu00HHODDsjkDob1GoI2TOydBb8iD6obDxljVwu+Hf4Za8S0
 DYJYr+euL6lQWpGRjcQ9BObhBn8RlzQAhu1EwjyvD8Ycsvm+NPBvkvx0xmaOm/cHHm+3
 yd8lThsFmQsP1qVU+TS29zlP9/05kNaxuHaSy8lf2iC2tzcSBNh4E7niQ3XE061E/KOU
 CJcAjJpYqZwZieElEXFC+t/lWMKHb3gaIzPUKE5QfnA1ibLZttbnsMPWG1JWUY2fWXIA
 WPWQ==
X-Gm-Message-State: AOJu0Yy9OVjk+iyg35u3mD2VZOrjfeDD8xQwIhhY9M9+PbcWzw54tQyN
 8c/v6w7I35cL5cD5Oizb0Zdj9tghkDtOnbxCkwatsuSku73RHAoMYkObWpFvK8yPVZ8pNYtZcJ9
 GTLr/xcXgsRKp0ond5cKx3aRopfFtvw==
X-Google-Smtp-Source: AGHT+IH3EBDhJtmIV0Z4jmwrCSGSgST4f6p6CMSXBRbhGFSS8EFul2rSufs3v+a/ws7xS3C+y2Pw/jmW3txFY4+hR28=
X-Received: by 2002:a05:6102:944:b0:493:b055:bf56 with SMTP id
 ada2fe7eead31-493fa61c12emr11798035137.2.1722329531079; Tue, 30 Jul 2024
 01:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240207030339.3910-1-asd617140123@gmail.com>
 <0e623797-b573-4604-b89e-737c7c503350@benettiengineering.com>
 <CAKEXHNMmpdFgR8AUpn3vP9M21dgOpD6VkKKtyH58vgP5HTBSUw@mail.gmail.com>
 <840786f7-f3a2-4dc1-8250-08135ac10c51@benettiengineering.com>
In-Reply-To: <840786f7-f3a2-4dc1-8250-08135ac10c51@benettiengineering.com>
From: eric <asd617140123@gmail.com>
Date: Tue, 30 Jul 2024 16:52:00 +0800
Message-ID: <CAKEXHNOyNdanr+QuMj1LSXfMawjuz0KjO=_Zz3JA2uz4nw6fkQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722329531; x=1722934331; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uBMU/ufd60isDUCkuYbz0IyIcHzvCHlP0CN70doeehw=;
 b=I93TG1M2d203sltwGd5V5eo0HxPo3g5VE2bWySHpbM50ebQusFBo8Czm6BUHP/M1i0
 DFCWuGb8UMC1Qhw8m7TTDxEnNG2FcWgJZjsrcGHu1tYJif71J23ze5oPCxe+tHfemHID
 rJKKxMf4u7nnzjwkl8rtgfk6vfz2cPcnOdTeTqe2ZOxA4xjO7rXQIQtRXBxH8s5CQ778
 ATEwYqCtlAnbDZ/FQEqdw+hMaqaA7lC+kUJWnJMS3pd3qNNN0SheNz87mM9RwMK1wVs+
 WN+NyK0XB/TrZ9e3Jxs9fVJ25irPImcD6XVmw9iOkN3xdqQFVYDnmCD3RK+IbP+UgxpM
 MQNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I93TG1M2
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
Content-Type: multipart/mixed; boundary="===============1593297000627685671=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1593297000627685671==
Content-Type: multipart/alternative; boundary="000000000000e2e477061e731778"

--000000000000e2e477061e731778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,
 long time no see, I already added v3 patch, can you help me review again?

Best regards,
Nigel

Giulio Benetti <giulio.benetti@benettiengineering.com> =E6=96=BC 2024=E5=B9=
=B42=E6=9C=8816=E6=97=A5 =E9=80=B1=E4=BA=94
=E4=B8=8A=E5=8D=881:10=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi Eric,
>
> please use plan-text and not HTML e-mail,
>
> On 15/02/24 06:57, eric wrote:
> > Hi Giulio,
> >
> >
> >     Here you have to keep the previous tags when sending new version of
> >     patches:
> >
> >     I didn't get it, what is the  previous tags?
>
> My Reviewed-by and Tested-by: you see below,
>
> >
> >
> >     Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com
> >     <mailto:giulio.benetti@benettiengineering.com>>
> >     [Build Tested]
> >     Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com
> >     <mailto:giulio.benetti@benettiengineering.com>>
> >
> >      > ---
> >      > v1 -> v2
> >      > * Add BR2_cortex_a15_a7=3Dy in buildroot defconfig.
> >      > * Bump linux version to 6.6.8
> >      > * Using sunxi_defconfig in kernel.
> >      > * Using "make savedefconfig" to save defconfig.
> >      > * Remove boot.cmd.
> >
> >     this patch had to be V3, but don't mind at this point.
> >     I ask you when you send newer patches to set as superseded
> >     the previous patch in patchwork:
> >     https://patchwork.ozlabs.org/project/buildroot/list/
> >     <https://patchwork.ozlabs.org/project/buildroot/list/>
> >
> > I just need to add v3 tag, right? or I need to add other tags, e.g.,
> resend?
>
> for the upcoming one yes, it must be V3,
>
> >
> >      > ---
> >      >   DEVELOPERS                                |  4 +++
> >      >   board/cubietech/cubieboard4/extlinux.conf |  5 +++
> >      >   board/cubietech/cubieboard4/genimage.cfg  | 38
> >     ++++++++++++++++++++++
> >      >   board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
> >      >   configs/cubieboard4_defconfig             | 39
> >     +++++++++++++++++++++++
> >      >   5 files changed, 104 insertions(+)
> >      >   create mode 100644 board/cubietech/cubieboard4/extlinux.conf
> >      >   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
> >      >   create mode 100755 board/cubietech/cubieboard4/post-image.sh
> >      >   create mode 100644 configs/cubieboard4_defconfig
> >      >
> >      > diff --git a/DEVELOPERS b/DEVELOPERS
> >      > index a03018ab2b..bffb8f2069 100644
> >      > --- a/DEVELOPERS
> >      > +++ b/DEVELOPERS
> >      > @@ -3297,3 +3297,7 @@ F:      package/quazip/
> >      >   F:  package/shapelib/
> >      >   F:  package/simple-mail/
> >      >   F:  package/tinc/
> >      > +
> >      > +N:   Nigel Wang <asd617140123@gmail.com
> >     <mailto:asd617140123@gmail.com>>
> >      > +F:   board/cubietech/cubieboard4/
> >      > +F:   configs/cubieboard4_defconfig
> >      > diff --git a/board/cubietech/cubieboard4/extlinux.conf
> >     b/board/cubietech/cubieboard4/extlinux.conf
> >      > new file mode 100644
> >      > index 0000000000..5084e2237b
> >      > --- /dev/null
> >      > +++ b/board/cubietech/cubieboard4/extlinux.conf
> >      > @@ -0,0 +1,5 @@
> >      > +label linux
> >      > +    kernel /boot/zImage
> >      > +    devicetree /sun9i-a80-cubieboard4.dtb
> >      > +    append console=3DttyS0,115200 earlyprintk root=3D/dev/mmcbl=
k0p2
> >     rootwait
> >      > +
> >      > diff --git a/board/cubietech/cubieboard4/genimage.cfg
> >     b/board/cubietech/cubieboard4/genimage.cfg
> >      > new file mode 100644
> >      > index 0000000000..f1dee13923
> >      > --- /dev/null
> >      > +++ b/board/cubietech/cubieboard4/genimage.cfg
> >      > @@ -0,0 +1,38 @@
> >      > +# Minimal SD card image for the Cubieboard2
> >      > +# Based in the Orange Pi genimage.cfg
> >      > +
> >      > +image boot.vfat {
> >      > +     vfat {
> >      > +             files =3D {
> >      > +                     "zImage",
> >      > +                     "sun9i-a80-cubieboard4.dtb",
> >      > +                     "extlinux"
> >      > +             }
> >      > +     }
> >      > +
> >      > +     size =3D 8M
> >      > +}
> >      > +
> >      > +image sdcard.img {
> >      > +     hdimage {
> >      > +     }
> >      > +
> >      > +     partition u-boot {
> >      > +             in-partition-table =3D "no"
> >      > +             image =3D "u-boot-sunxi-with-spl.bin"
> >      > +             offset =3D 8K
> >      > +             size =3D 1016K # 1MB - 8KB
> >      > +     }
> >      > +
> >      > +     partition boot {
> >      > +             partition-type =3D 0xC
> >      > +             bootable =3D "true"
> >      > +             image =3D "boot.vfat"
> >      > +     }
> >      > +
> >      > +     partition rootfs {
> >      > +             partition-type =3D 0x83
> >      > +             image =3D "rootfs.ext4"
> >      > +             size =3D 512M
> >      > +     }
> >      > +}
> >      > diff --git a/board/cubietech/cubieboard4/post-image.sh
> >     b/board/cubietech/cubieboard4/post-image.sh
> >      > new file mode 100755
> >      > index 0000000000..e37b960a4d
> >      > --- /dev/null
> >      > +++ b/board/cubietech/cubieboard4/post-image.sh
> >      > @@ -0,0 +1,18 @@
> >      > +#!/bin/sh
> >      > +
> >      > +BOARD_DIR=3D"$(dirname "$0")"
> >      > +install -m 0644 -D $BOARD_DIR/extlinux.conf
> >     $BINARIES_DIR/extlinux/extlinux.conf
> >      > +
> >      > +GENIMAGE_CFG=3D"${BOARD_DIR}/genimage.cfg"
> >      > +GENIMAGE_TMP=3D"${BUILD_DIR}/genimage.tmp"
> >      > +
> >      > +rm -rf "${GENIMAGE_TMP}"
> >      > +
> >      > +genimage                           \
> >      > +     --rootpath "${TARGET_DIR}"     \
> >      > +     --tmppath "${GENIMAGE_TMP}"    \
> >      > +     --inputpath "${BINARIES_DIR}"  \
> >      > +     --outputpath "${BINARIES_DIR}" \
> >      > +     --config "${GENIMAGE_CFG}"
> >      > +
> >      > +exit $?
> >      > diff --git a/configs/cubieboard4_defconfig
> >     b/configs/cubieboard4_defconfig
> >      > new file mode 100644
> >      > index 0000000000..0592fe4a2d
> >      > --- /dev/null
> >      > +++ b/configs/cubieboard4_defconfig
> >      > @@ -0,0 +1,39 @@
> >      > +# Architecture
> >      > +BR2_arm=3Dy
> >      > +BR2_cortex_a15_a7=3Dy
> >      > +BR2_ARM_FPU_NEON_VFPV4=3Dy
> >      > +
> >      > +# System
> >      > +BR2_TARGET_GENERIC_HOSTNAME=3D"Cubieboard4"
> >      > +BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Cubieboard4!"
> >      > +BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyS0"
> >      >
> >
>  +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/cubietech/cubieboard4/post-image.=
sh"
> >
> >     Here the option below is missing and it's needed otherwise the newe=
st
> >     Linux version will be picked and build will fail.
> >     Now we don't see the problem because the latest version is exactly
> 6.6,
> >     so need this:
> >
> >     # Linux headers same as kernel, a 6.6 series
> >     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy
>
> This ^^^ must be part of V3 patch and reported in patch changelog,
>
> >
> >      > +# Kernel
> >      > +BR2_LINUX_KERNEL=3Dy
> >      > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> >      > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.6.8"
> >      > +BR2_LINUX_KERNEL_DEFCONFIG=3D"sunxi"
> >      > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> >      >
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"allwinner/sun9i-a80-cubieboard4"
> >      > +
> >      > +# Filesystem
> >      > +BR2_TARGET_ROOTFS_EXT2=3Dy
> >      > +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> >      > +
> >      > +# Bootloader
> >      > +BR2_TARGET_UBOOT=3Dy
> >      > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> >      > +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> >      > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2021.10"
> >      > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"Cubieboard4"
> >      > +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> >      > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> >      > +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=3Dy
> >      > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> >      > +BR2_TARGET_UBOOT_SPL=3Dy
> >      > +BR2_TARGET_UBOOT_SPL_NAME=3D"u-boot-sunxi-with-spl.bin"
> >      > +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> >      > +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> >      > +BR2_PACKAGE_HOST_MTOOLS=3Dy
> >      > +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
> >      > --
> >      > 2.34.1
> >      >
> >
> >     This patch looks to me, except missing Linux header version.
> >
> >     I've added that option and re-built successfully so I confirm my:
> >     Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com
> >     <mailto:giulio.benetti@benettiengineering.com>>
> >     [Build Tested]
> >     Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com
> >     <mailto:giulio.benetti@benettiengineering.com>>
> >
> >     Maybe a Maintainer can edit while committing, of if you can please
> send
> >     a V3 with that missing line.
> >
> >     Thank you!
> >
> >     Best regards
> >     --
> >     Giulio Benetti
> >     CEO&CTO@Benetti Engineering sas
> >
>
> While sending V3 with modifies listed above please add under your SoB
> also my:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Build Tested]
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Thank you!
>
> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>

--000000000000e2e477061e731778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Giulio,<div>=C2=A0long time no see, I already added v3 =
patch, can you help me review again?<br><br>Best regards,<br>Nigel</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Giu=
lio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">gi=
ulio.benetti@benettiengineering.com</a>&gt; =E6=96=BC 2024=E5=B9=B42=E6=9C=
=8816=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:10=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Eri=
c,<br>
<br>
please use plan-text and not HTML e-mail,<br>
<br>
On 15/02/24 06:57, eric wrote:<br>
&gt; Hi Giulio,<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Here you have to keep the previous tags when sendin=
g new version of<br>
&gt;=C2=A0 =C2=A0 =C2=A0patches:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I didn&#39;t get it, what is the=C2=A0 previous tag=
s?<br>
<br>
My Reviewed-by and Tested-by: you see below,<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:g=
iulio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@bene=
ttiengineering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a=
>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[Build Tested]<br>
&gt;=C2=A0 =C2=A0 =C2=A0Tested-by: Giulio Benetti &lt;<a href=3D"mailto:giu=
lio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@benett=
iengineering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a=
>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; v1 -&gt; v2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; * Add BR2_cortex_a15_a7=3Dy in buildroot defc=
onfig.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; * Bump linux version to 6.6.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; * Using sunxi_defconfig in kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; * Using &quot;make savedefconfig&quot; to sav=
e defconfig.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; * Remove boot.cmd.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0this patch had to be V3, but don&#39;t mind at this=
 point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I ask you when you send newer patches to set as sup=
erseded<br>
&gt;=C2=A0 =C2=A0 =C2=A0the previous patch in patchwork:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.ozlabs.org/project/bui=
ldroot/list/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs=
.org/project/buildroot/list/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchwork.ozlabs.org/project=
/buildroot/list/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.oz=
labs.org/project/buildroot/list/</a>&gt;<br>
&gt; <br>
&gt; I just need to add v3 tag, right? or I need to add other tags, e.g., r=
esend?<br>
<br>
for the upcoming one yes, it must be V3,<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/extli=
nux.conf |=C2=A0 5 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/genim=
age.cfg=C2=A0 | 38<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/post-=
image.sh | 18 +++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0configs/cubieboard4_defconfig=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A05 files changed, 104 insertions(+=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 board/cubietec=
h/cubieboard4/extlinux.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 board/cubietec=
h/cubieboard4/genimage.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100755 board/cubietec=
h/cubieboard4/post-image.sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 configs/cubieb=
oard4_defconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index a03018ab2b..bffb8f2069 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/DEVELOPERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/DEVELOPERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -3297,3 +3297,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =
package/quazip/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0F:=C2=A0 package/shapelib/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0F:=C2=A0 package/simple-mail/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0F:=C2=A0 package/tinc/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +N:=C2=A0 =C2=A0Nigel Wang &lt;<a href=3D"mai=
lto:asd617140123@gmail.com" target=3D"_blank">asd617140123@gmail.com</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:asd617140123@gmail.com=
" target=3D"_blank">asd617140123@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +F:=C2=A0 =C2=A0board/cubietech/cubieboard4/<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +F:=C2=A0 =C2=A0configs/cubieboard4_defconfig=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/board/cubietech/cubieboard4/extl=
inux.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/board/cubietech/cubieboard4/extlinux.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..5084e2237b<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/board/cubietech/cubieboard4/extlinux.co=
nf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,5 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +label linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 kernel /boot/zImage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 devicetree /sun9i-a80-cubieboa=
rd4.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 append console=3DttyS0,115200 =
earlyprintk root=3D/dev/mmcblk0p2<br>
&gt;=C2=A0 =C2=A0 =C2=A0rootwait<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/board/cubietech/cubieboard4/geni=
mage.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/board/cubietech/cubieboard4/genimage.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..f1dee13923<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/board/cubietech/cubieboard4/genimage.cf=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,38 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Minimal SD card image for the Cubieboard2<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Based in the Orange Pi genimage.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +image boot.vfat {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0vfat {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0files =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zImage&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sun9i-a80-cubieboard4.dtb&quot;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;extlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0size =3D 8M<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +image sdcard.img {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0hdimage {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0in-partition-table =3D &quot;no&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0image =3D &quot;u-boot-sunxi-with-spl.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offset =3D 8K<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size =3D 1016K # 1MB - 8KB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0partition boot {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0partition-type =3D 0xC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bootable =3D &quot;true&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0image =3D &quot;boot.vfat&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0partition-type =3D 0x83<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0image =3D &quot;rootfs.ext4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size =3D 512M<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/board/cubietech/cubieboard4/post=
-image.sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/board/cubietech/cubieboard4/post-image.sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..e37b960a4d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/board/cubietech/cubieboard4/post-image.=
sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,18 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BOARD_DIR=3D&quot;$(dirname &quot;$0&quot;)&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +install -m 0644 -D $BOARD_DIR/extlinux.conf<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0$BINARIES_DIR/extlinux/extlinux.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +GENIMAGE_CFG=3D&quot;${BOARD_DIR}/genimage.c=
fg&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +GENIMAGE_TMP=3D&quot;${BUILD_DIR}/genimage.t=
mp&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +rm -rf &quot;${GENIMAGE_TMP}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +genimage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0--rootpath &quot;${TARGE=
T_DIR}&quot;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0--tmppath &quot;${GENIMA=
GE_TMP}&quot;=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0--inputpath &quot;${BINA=
RIES_DIR}&quot;=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0--outputpath &quot;${BIN=
ARIES_DIR}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0--config &quot;${GENIMAG=
E_CFG}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +exit $?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/configs/cubieboard4_defconfig<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0b/configs/cubieboard4_defconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..0592fe4a2d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/configs/cubieboard4_defconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,39 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_arm=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_cortex_a15_a7=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_ARM_FPU_NEON_VFPV4=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# System<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_GENERIC_HOSTNAME=3D&quot;Cubieboa=
rd4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to =
Cubieboard4!&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/cubiete=
ch/cubieboard4/post-image.sh&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Here the option below is missing and it&#39;s neede=
d otherwise the newest<br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux version will be picked and build will fail.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0Now we don&#39;t see the problem because the latest=
 version is exactly 6.6,<br>
&gt;=C2=A0 =C2=A0 =C2=A0so need this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0# Linux headers same as kernel, a 6.6 series<br>
&gt;=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=3Dy<br>
<br>
This ^^^ must be part of V3 patch and reported in patch changelog,<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quo=
t;6.6.8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;sunxi&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;all=
winner/sun9i-a80-cubieboard4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Filesystem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_ROOTFS_EXT2=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Bootloader<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quo=
t;2021.10&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;Cub=
ieboard4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_SPL=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_TARGET_UBOOT_SPL_NAME=3D&quot;u-boot-sun=
xi-with-spl.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2.34.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This patch looks to me, except missing Linux header=
 version.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ve added that option and re-built successfull=
y so I confirm my:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:g=
iulio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@bene=
ttiengineering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a=
>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[Build Tested]<br>
&gt;=C2=A0 =C2=A0 =C2=A0Tested-by: Giulio Benetti &lt;<a href=3D"mailto:giu=
lio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@benett=
iengineering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a=
>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Maybe a Maintainer can edit while committing, of if=
 you can please send<br>
&gt;=C2=A0 =C2=A0 =C2=A0a V3 with that missing line.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0CEO&amp;CTO@Benetti Engineering sas<br>
&gt; <br>
<br>
While sending V3 with modifies listed above please add under your SoB <br>
also my:<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br>
[Build Tested]<br>
Tested-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengin=
eering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;=
<br>
<br>
Thank you!<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
</blockquote></div>

--000000000000e2e477061e731778--

--===============1593297000627685671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1593297000627685671==--
