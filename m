Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC45C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D5640470;
	Sun,  3 Dec 2023 16:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D5640470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dUSOWjZuSrt; Sun,  3 Dec 2023 16:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AD5E408DA;
	Sun,  3 Dec 2023 16:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD5E408DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4401BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25DF1607BC
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25DF1607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0v835-o58Be for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:16:17 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC57460792
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC57460792
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2866951b6e0so1550578a91.2
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 08:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701620176; x=1702224976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8mTMN9d2aapFN/ab28dcsmdwLqYYNgM+OY/9PHPBNg=;
 b=wNwk6ehlIQe6voD14HgeQYPtUJfv4ppOqjL85lCR4HAkqDemZ5pVGEec1MX7B51uRz
 evEFCYimGUccBM4uM89cFlo6Pzbd3qkaQNLtpIZEf1fDIi9wW89QkGimGk+gE3bTKUeB
 75HyV9g0HldyEuM2mfViFHsS+CWtulFRLwVXH0BjWMGXoSLM2Xph13qk51S78mdVlOa1
 dhi8O6cM7PT4fSirmRtqhmB6xXt7D8zXgaVmQljiN4xsrE4iJF3hlLsqEUyb9+7R3O/7
 tbxYP/Z11rsjbRHJ8V3IGbAgOAtFPGc3kdRiiY3hxNj3ST2oMU2sl+N3ikYYRMvKorSi
 j7xA==
X-Gm-Message-State: AOJu0YwT6wO6XZVYmRHwy4vM7yykpUnz9fN8SuRfw0sAVUGAKV9eeDTG
 feAcY9dEPFwot/URLiQsuF/8K6+YCRcnhexzRMXvY/CgxSyelLvO5gc=
X-Google-Smtp-Source: AGHT+IHITbkGgxH0Yd3Ol5znzKX910hpBqaU/5wnTNDj83/c5PpF/E0X9pdR+wdrKtUzsAg2M2pMu5RKgCoXo7xfDdg=
X-Received: by 2002:a17:90a:d3d6:b0:286:6cc0:cadd with SMTP id
 d22-20020a17090ad3d600b002866cc0caddmr1875706pjw.84.1701620176152; Sun, 03
 Dec 2023 08:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
 <20231129172615.1683565-11-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231129172615.1683565-11-dario.binacchi@amarulasolutions.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 3 Dec 2023 17:16:04 +0100
Message-ID: <CAAE6iEVKprOOZ2dAOA4ELHp7meft_8JBsrun0MErwk-9O=p_QQ@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1701620176; x=1702224976; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r8mTMN9d2aapFN/ab28dcsmdwLqYYNgM+OY/9PHPBNg=;
 b=WfUI3Sc+kbWFwxzKEeGV4HRFrX5+hi9RKZgdnqR/dvLGQD75nIKTFITizYmeA5E5/e
 77TXso1RodBfSz8SaAUCFb2KiEK4lJ+sQ0vPRcHvCUE5nwuln2OJCkEe+WTKTGLJA7K2
 eP7TOD4d752GKMCbtqG60Y7HEuRd6JSyQvMl18cpMx/sr5Ola46PjE3yPboTEHgp6ciu
 Aas8YcTi5CSK3KD2MYsyRP9LPZ7aESWzvCyYM+r+iOW1we9c3FBxf0U50YbOrLm+xlL9
 JW1ySBOFHhz81Ecok0jvRIIh8V4cUpm1fdu9T+IrhRlbaLywV6anCKFwmDs0v4egZxjq
 +6bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=WfUI3Sc+
Subject: Re: [Buildroot] [PATCH 10/11] configs/ti_am62x_sk_defconfig: bump
 U-Boot version to 2023.10
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============4293000927522570754=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4293000927522570754==
Content-Type: multipart/alternative; boundary="00000000000025b9f2060b9d52f1"

--00000000000025b9f2060b9d52f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 29 nov. 2023 =C3=A0 18:28, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> The 2023.10 version of U-Boot for the am62x-sk board has introduced two
> major changes:
> - The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
>   /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
>   and the use of extlinux.conf for the proper loading of the device tree.
>   Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
>   auto-generate the extlinux.conf file so that developers can change the
>   kernel loading options by modifying the .config.
> - The use of binman for building images. This application uses several
>   Python modules that must be enabled in their host variant.
>
> Tested on SK-AM62B-P1.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/ti/am62x-sk/genimage.cfg  |  7 ++++-
>  board/ti/am62x-sk/post-build.sh | 49 +++++++++++++++++++++++++++++++++
>  board/ti/am62x-sk/post-image.sh |  5 ++++
>  configs/ti_am62x_sk_defconfig   | 17 +++++++++---
>  4 files changed, 73 insertions(+), 5 deletions(-)
>  create mode 100755 board/ti/am62x-sk/post-build.sh
>  create mode 100755 board/ti/am62x-sk/post-image.sh
>
> diff --git a/board/ti/am62x-sk/genimage.cfg
> b/board/ti/am62x-sk/genimage.cfg
> index 26304fe98f99..398209f4d831 100644
> --- a/board/ti/am62x-sk/genimage.cfg
> +++ b/board/ti/am62x-sk/genimage.cfg
> @@ -4,10 +4,15 @@ image boot.vfat {
>                         "tiboot3.bin",
>                         "tispl.bin",
>                         "u-boot.img",
> +                       "k3-am625-sk.dtb",
> +                       "Image"
> +               }
> +               file extlinux/extlinux.conf {
> +                       image =3D extlinux.conf
>                 }
>         }
>
> -       size =3D 16M
> +       size =3D 64M
>  }
>
>  image sdcard.img {
> diff --git a/board/ti/am62x-sk/post-build.sh
> b/board/ti/am62x-sk/post-build.sh
> new file mode 100755
> index 000000000000..0f1f98ef217a
> --- /dev/null
> +++ b/board/ti/am62x-sk/post-build.sh
> @@ -0,0 +1,49 @@
> +#!/bin/sh -x
> +
> +# genimage will need to find the extlinux.conf
> +# in the binaries directory
> +
> +die() {
> +  cat <<EOF >&2
> +Error: $@
> +
> +Usage: ${0} -c <console> -r <root> [-x <extra-args>]
> +EOF
> +  exit 1
> +}
> +
> +o=3D'c:r:x:'
> +O=3D'console:,root:,extra-args:'
> +opts=3D"$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
> +eval set -- "${opts}"
> +while [ ${#} -gt 0 ]; do
> +    case "${1}" in
> +    (-c|--console)
> +        CONSOLE=3D"${2}"; shift 2
> +        ;;
> +    (-r|--root)
> +        ROOT=3D"${2}"; shift 2
> +        ;;
> +    (-x|--extra-args)
> +        EXTRA_ARGS=3D"${2}"; shift 2
> +        ;;
> +    (--)
> +        shift 1; break
> +        ;;
> +    esac
> +done
> +
> +[ -n "${CONSOLE}" ] || die "Missing argument"
> +[ -n "${ROOT}" ] || die "Missing argument"
> +append=3D"console=3D${CONSOLE} root=3D${ROOT} rw rootfstype=3Dext4 rootw=
ait"
> +if [ -n "${EXTRA_ARGS}" ]; then
> +    append=3D"${append} ${EXTRA_ARGS}"
> +fi
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +       label am62x-sk-buildroot
> +         kernel /Image
> +         fdtdir /
> +         append ${append}
> +       __HEADER_EOF
> diff --git a/board/ti/am62x-sk/post-image.sh
> b/board/ti/am62x-sk/post-image.sh
> new file mode 100755
> index 000000000000..34f732c091ad
> --- /dev/null
> +++ b/board/ti/am62x-sk/post-image.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh -x
> +
> +BOARD_DIR=3D"$(dirname "$0")"
> +
> +support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfi=
g
> index b98a68ff153f..9e4df5e8b2ed 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -1,11 +1,11 @@
>  BR2_aarch64=3Dy
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/ti/am62x-sk/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/ti/am62x-sk/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/ti/am62x-sk/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c ttyS2,115200n8 -r PARTUUID=3D00000000-=
02 -x
> earlycon=3Dns16550a,mmio32,0x02800000"
>  BR2_LINUX_KERNEL=3Dy
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am625-sk"
> -BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
>  BR2_PACKAGE_LINUX_FIRMWARE=3Dy
>  BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
>  BR2_TARGET_ROOTFS_EXT2=3Dy
> @@ -23,13 +23,16 @@ BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=3Dy
>  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=3Dy
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE=3D"2023.10"
>  BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D"am62x_evm_r5"
>  BR2_TARGET_UBOOT=3Dy
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2023.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"am62x_evm_a53"
>  BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy
>  BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=3Dy
> @@ -41,3 +44,9 @@
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D"TEE=3D$(BINARIES_DIR)/tee-pager_v2.bi=
n"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
>  BR2_PACKAGE_HOST_GENIMAGE=3Dy
>  BR2_PACKAGE_HOST_MTOOLS=3Dy
> +BR2_PACKAGE_HOST_PYTHON_ATTRS=3Dy
> +BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA=3Dy
> +BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS=3Dy
> +BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy
> +BR2_PACKAGE_HOST_PYTHON_REFERENCING=3Dy
> +BR2_PACKAGE_HOST_PYTHON_RPDS_PY=3Dy
>

as mentioned in previous patches, all these host python packages are used
by binman,
so they could be selected in boot/ti-k3-r5-loader/Config.in instead of here
in configs/ti_am62x_sk_defconfig

Fran=C3=A7ois


> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000025b9f2060b9d52f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 29 nov. 2023 =C3=A0=C2=
=A018:28, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasoluti=
ons.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The 2023.10 versio=
n of U-Boot for the am62x-sk board has introduced two<br>
major changes:<br>
- The device tree k3-am625-sk.dtb is no longer searched in /boot, but in<br=
>
=C2=A0 /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGE=
T<br>
=C2=A0 and the use of extlinux.conf for the proper loading of the device tr=
ee.<br>
=C2=A0 Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to<b=
r>
=C2=A0 auto-generate the extlinux.conf file so that developers can change t=
he<br>
=C2=A0 kernel loading options by modifying the .config.<br>
- The use of binman for building images. This application uses several<br>
=C2=A0 Python modules that must be enabled in their host variant.<br>
<br>
Tested on SK-AM62B-P1.<br>
<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
=C2=A0board/ti/am62x-sk/genimage.cfg=C2=A0 |=C2=A0 7 ++++-<br>
=C2=A0board/ti/am62x-sk/post-build.sh | 49 ++++++++++++++++++++++++++++++++=
+<br>
=C2=A0board/ti/am62x-sk/post-image.sh |=C2=A0 5 ++++<br>
=C2=A0configs/ti_am62x_sk_defconfig=C2=A0 =C2=A0| 17 +++++++++---<br>
=C2=A04 files changed, 73 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100755 board/ti/am62x-sk/post-build.sh<br>
=C2=A0create mode 100755 board/ti/am62x-sk/post-image.sh<br>
<br>
diff --git a/board/ti/am62x-sk/genimage.cfg b/board/ti/am62x-sk/genimage.cf=
g<br>
index 26304fe98f99..398209f4d831 100644<br>
--- a/board/ti/am62x-sk/genimage.cfg<br>
+++ b/board/ti/am62x-sk/genimage.cfg<br>
@@ -4,10 +4,15 @@ image boot.vfat {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;tiboot3.bin&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;tispl.bin&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;u-boot.img&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;k3-am625-sk.dtb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Image&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file extlinux/extli=
nux.conf {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0image =3D extlinux.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 64M<br>
=C2=A0}<br>
<br>
=C2=A0image sdcard.img {<br>
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build=
.sh<br>
new file mode 100755<br>
index 000000000000..0f1f98ef217a<br>
--- /dev/null<br>
+++ b/board/ti/am62x-sk/post-build.sh<br>
@@ -0,0 +1,49 @@<br>
+#!/bin/sh -x<br>
+<br>
+# genimage will need to find the extlinux.conf<br>
+# in the binaries directory<br>
+<br>
+die() {<br>
+=C2=A0 cat &lt;&lt;EOF &gt;&amp;2<br>
+Error: $@<br>
+<br>
+Usage: ${0} -c &lt;console&gt; -r &lt;root&gt; [-x &lt;extra-args&gt;]<br>
+EOF<br>
+=C2=A0 exit 1<br>
+}<br>
+<br>
+o=3D&#39;c:r:x:&#39;<br>
+O=3D&#39;console:,root:,extra-args:&#39;<br>
+opts=3D&quot;$(getopt -n &quot;${0##*/}&quot; -o &quot;${o}&quot; -l &quot=
;${O}&quot; -- &quot;${@}&quot;)&quot;<br>
+eval set -- &quot;${opts}&quot;<br>
+while [ ${#} -gt 0 ]; do<br>
+=C2=A0 =C2=A0 case &quot;${1}&quot; in<br>
+=C2=A0 =C2=A0 (-c|--console)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CONSOLE=3D&quot;${2}&quot;; shift 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 (-r|--root)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ROOT=3D&quot;${2}&quot;; shift 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 (-x|--extra-args)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXTRA_ARGS=3D&quot;${2}&quot;; shift 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 (--)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shift 1; break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 esac<br>
+done<br>
+<br>
+[ -n &quot;${CONSOLE}&quot; ] || die &quot;Missing argument&quot;<br>
+[ -n &quot;${ROOT}&quot; ] || die &quot;Missing argument&quot;<br>
+append=3D&quot;console=3D${CONSOLE} root=3D${ROOT} rw rootfstype=3Dext4 ro=
otwait&quot;<br>
+if [ -n &quot;${EXTRA_ARGS}&quot; ]; then<br>
+=C2=A0 =C2=A0 append=3D&quot;${append} ${EXTRA_ARGS}&quot;<br>
+fi<br>
+<br>
+mkdir -p &quot;${BINARIES_DIR}&quot;<br>
+cat &lt;&lt;-__HEADER_EOF &gt; &quot;${BINARIES_DIR}/extlinux.conf&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label am62x-sk-buildroot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel /Image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdtdir /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0append ${append}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__HEADER_EOF<br>
diff --git a/board/ti/am62x-sk/post-image.sh b/board/ti/am62x-sk/post-image=
.sh<br>
new file mode 100755<br>
index 000000000000..34f732c091ad<br>
--- /dev/null<br>
+++ b/board/ti/am62x-sk/post-image.sh<br>
@@ -0,0 +1,5 @@<br>
+#!/bin/sh -x<br>
+<br>
+BOARD_DIR=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
+<br>
+support/scripts/genimage.sh -c &quot;${BOARD_DIR}/genimage.cfg&quot;<br>
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig<=
br>
index b98a68ff153f..9e4df5e8b2ed 100644<br>
--- a/configs/ti_am62x_sk_defconfig<br>
+++ b/configs/ti_am62x_sk_defconfig<br>
@@ -1,11 +1,11 @@<br>
=C2=A0BR2_aarch64=3Dy<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/ti/am62x-sk/genimage.cfg&quot=
;<br>
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/ti/am62x-sk/post-build.sh&quot;=
<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/ti/am62x-sk/post-image.sh&quot;=
<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c ttyS2,115200n8 -r PARTUUID=3D000000=
00-02 -x earlycon=3Dns16550a,mmio32,0x02800000&quot;<br>
=C2=A0BR2_LINUX_KERNEL=3Dy<br>
=C2=A0BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
=C2=A0BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
=C2=A0BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;ti/k3-am625-sk&quot;<br>
-BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
=C2=A0BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
=C2=A0BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>
=C2=A0BR2_TARGET_ROOTFS_EXT2=3Dy<br>
@@ -23,13 +23,16 @@ BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE=3D&quot;2023.10&quot;<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D&quot;am62x_evm_r5&quot;=
<br>
=C2=A0BR2_TARGET_UBOOT=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2022.10&quot;<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2023.10&quot;<br>
=C2=A0BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;am62x_evm_a53&quot;<br>
=C2=A0BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=3Dy<br>
@@ -41,3 +44,9 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D&quot;TEE=3D$(BINARIES=
_DIR)/tee-pager_v2.bin&quot;<br>
=C2=A0BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
=C2=A0BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
=C2=A0BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_ATTRS=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_REFERENCING=3Dy<br>
+BR2_PACKAGE_HOST_PYTHON_RPDS_PY=3Dy<br></blockquote><div><br></div><div>as=
 mentioned in previous patches, all these host python packages are used by =
binman,<br>so they could be selected in boot/ti-k3-r5-loader/Config.in inst=
ead of here in configs/ti_am62x_sk_defconfig</div><div><br></div><div>Fran=
=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
-- <br>
2.43.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000025b9f2060b9d52f1--

--===============4293000927522570754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4293000927522570754==--
