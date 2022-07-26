Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B9C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7569A41BA3;
	Tue, 26 Jul 2022 13:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7569A41BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivtizEddau_w; Tue, 26 Jul 2022 13:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC69641997;
	Tue, 26 Jul 2022 13:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC69641997
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6451BF354
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56087610A1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56087610A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryuBAqeZuelE for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:49:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E778B61081
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E778B61081
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:49:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id oy13so26280492ejb.1
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6J7LmuF9ber5y14JC7rPNYjQxkW3RSNm7itocoHCOiE=;
 b=bEg2E5wqd2YKVud9TmYgyocSdLkwT+Y0qyW5/gu2aQ1PXKzpojJlvLZl6MNxpBwMHc
 4JJvOviJpHcIhRmfkt3Ho+YTQVXEw/S086Cz24L9iOrpauozDGBVx09urD6TKFhpcJ4e
 RO6cA3+EAY+1JZiHu6c4kMTq6iab4NGZ77Cb/Fb5JeCeke5YAjXHEQb2/OEf6CRLGeTY
 eMeOz/saiff8Qr7nZR7KkFNay02RdaSpBFfcKk2nIOD/cv2uEdBEaPfB4u5Sw8QDPkuZ
 Ev3+60Pv1r0YF1OKt6mXwEjqRHfChxMH4l4mSqVwqU1aIo9Qyl6ZAonnTrlHCRRVo79a
 Z4bg==
X-Gm-Message-State: AJIora8V8KMy0S/P6S6Fw7XH3Q8sFL2eAFpyk1fhrRfV96SYne18v38q
 I+wK/BNMOnXRwTJwWB0TZ4426DGA6Zgo9jNrcuz5UuaabAQVRg==
X-Google-Smtp-Source: AGRyM1tzOnfvyVFm7dcdlfPJjDPrwhkCtK9u22CIh7VIzStPBkoV5QTobfqdO5ha2zr8ypElOkmp0ZJUB+kITPILPQo=
X-Received: by 2002:a17:907:2e0d:b0:72b:8cd4:ca52 with SMTP id
 ig13-20020a1709072e0d00b0072b8cd4ca52mr13784555ejc.541.1658843357863; Tue, 26
 Jul 2022 06:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABPiF0=6w4ZGfZidXFuaikLw=M_MkoSou=8tFmrP80WWGWHDSA@mail.gmail.com>
 <CAOMZO5DqxwGsNAXsimRy8q1DqT=PNVD=C3ezGu-KR7vUmQRqdg@mail.gmail.com>
In-Reply-To: <CAOMZO5DqxwGsNAXsimRy8q1DqT=PNVD=C3ezGu-KR7vUmQRqdg@mail.gmail.com>
From: bob mcgrath <bobwmcgrath@gmail.com>
Date: Tue, 26 Jul 2022 08:49:04 -0500
Message-ID: <CABPiF0mTt6ow_g5q04VPn50+ekLR--jng2ZxOKujS+dq94YBhA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6J7LmuF9ber5y14JC7rPNYjQxkW3RSNm7itocoHCOiE=;
 b=pa6/6FVhkZDGKZ5d6Z64GM92JvA1suFq/8h07uWTjjxs9htS5vs9il6Ia6DkzmsXNL
 tPaV2Vs7Pe+Ox5koRgkPv2l4md/qzTElzCSVW6dcSTMIO0g4PdGUbKTKcyih3wg2tuY4
 QNuINgpUN3YACTZxIIYsBKNUJC9+GMqa8zbSuS94JP58Aszhrh6CKSWjSzSLtRDaNVLe
 cSYnHbZm55FlRhozOUVIf0mditkUNigVJKhkJMWscIcTk08jLhoJFy22YzwWQarViIxU
 RRoS/1/HJTSdtBwFDyjE196NTo4cZk10Ev5sED8jeAJ7JCxm0YGZGDr42yElzvEu/Q9c
 JO+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pa6/6FVh
Subject: Re: [Buildroot] google coral devboard defconfig.
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6892909672885162737=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6892909672885162737==
Content-Type: multipart/alternative; boundary="0000000000001562ea05e4b591c6"

--0000000000001562ea05e4b591c6
Content-Type: text/plain; charset="UTF-8"

Thanks Fabio.  I tried kernel 5.10, but there are still no signs of life.
I checked the serial, the hdmi, and scanned the network.  I did a full
rebuild.  I'm unclear about what arm trusted firmware is, or if it's
necessary.  Currently my defconfig looks like this:
BR2_aarch64=y
BR2_ARM_FPU_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh
board/freescale/common/imx/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-phanbell.dtb"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.00"
#BR2_LINUX_KERNEL_CUSTOM_GIT=y
#BR2_LINUX_KERNEL_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/linux-imx"
#BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-phanbell"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y
BR2_PACKAGE_FIRMWARE_IMX=y
BR2_PACKAGE_IMX_SC_FIRMWARE=y
BR2_PACKAGE_IMX_SECO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/imx-atf"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
https://coral.googlesource.com/imx-atf"
#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="release-chef"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qm"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
#BR2_TARGET_UBOOT_CUSTOM_GIT=y
#BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/uboot-imx"
#BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://coral.googlesource.com/uboot-imx"
#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="release-chef"
#output_imx8mq/build/uboot-release-chef/configs/mx8mq_phanbell_defconfig
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx8mq_phanbell"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_IMX_MKIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y


On Tue, Jul 26, 2022 at 8:05 AM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Bob,
>
> On Tue, Jul 26, 2022 at 10:02 AM bob mcgrath <bobwmcgrath@gmail.com>
> wrote:
> >
> > I am trying to get a google coral devboard to boot with buildroot.
> Starting with the freescale_imx8qmmek_defconfig I have been able to get an
> error from uboot over the serial port.
> >
> > U-Boot SPL 2020.04 (Jul 25 2022 - 03:14:51 -0500)
>
> I suggest you use mainline U-Boot 2022.07 instead.
>
> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL="
> https://source.codeaurora.org/external/imx/linux-imx"
> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
>
> Use a mainline kernel, such as 5.18 as well.
>

--0000000000001562ea05e4b591c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#000000" style=3D"backgrou=
nd-color:rgb(255,255,255)">Thanks Fabio.=C2=A0 I tried kernel 5.10, but the=
re are still no signs of life.=C2=A0 I checked the serial, the hdmi, and sc=
anned the network.=C2=A0 I did a full rebuild.=C2=A0 I&#39;m unclear about =
what arm trusted firmware is, or if it&#39;s necessary.=C2=A0 Currently my =
defconfig looks like this:<br></font><div style=3D"font-family:Consolas,&qu=
ot;Courier New&quot;,monospace;font-size:14px;line-height:19px;white-space:=
pre"><div><font color=3D"#000000" style=3D"background-color:rgb(255,255,255=
)">BR2_aarch64=3Dy</font></div><div><font color=3D"#000000" style=3D"backgr=
ound-color:rgb(255,255,255)">BR2_ARM_FPU_VFPV4=3Dy</font></div><div><font c=
olor=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HO=
ST_LINUX_HEADERS_CUSTOM_5_10=3Dy</font></div><div><font color=3D"#000000" s=
tyle=3D"background-color:rgb(255,255,255)">BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&=
quot;board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/=
common/imx/post-image.sh&quot;</font></div><div><font color=3D"#000000" sty=
le=3D"background-color:rgb(255,255,255)">BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quo=
t;${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-phanbell.dtb&quot;</font></div><div>=
<font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_LIN=
UX_KERNEL=3Dy</font></div><div><font color=3D"#000000" style=3D"background-=
color:rgb(255,255,255)">BR2_LINUX_KERNEL=3Dy</font></div><div><font color=
=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_C=
USTOM_VERSION=3Dy</font></div><div><font color=3D"#000000" style=3D"backgro=
und-color:rgb(255,255,255)">BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5=
.10.00&quot;</font></div><div><font color=3D"#000000" style=3D"background-c=
olor:rgb(255,255,255)">#BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy</font></div><div><f=
ont color=3D"#000000" style=3D"background-color:rgb(255,255,255)">#BR2_LINU=
X_KERNEL_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.codeaurora.org/e=
xternal/imx/linux-imx">https://source.codeaurora.org/external/imx/linux-imx=
</a>&quot;</font></div><div><font color=3D"#000000" style=3D"background-col=
or:rgb(255,255,255)">#BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D&quot;lf-5.10.=
y-1.0.0&quot;</font></div><div><font color=3D"#000000" style=3D"background-=
color:rgb(255,255,255)">BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v8&quot;</fo=
nt></div><div><font color=3D"#000000" style=3D"background-color:rgb(255,255=
,255)">BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy</font></div><div><font color=3D"#00=
0000" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_INTREE_D=
TS_NAME=3D&quot;freescale/imx8mq-phanbell&quot;</font></div><div><font colo=
r=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_=
NEEDS_HOST_OPENSSL=3Dy</font></div><div><font color=3D"#000000" style=3D"ba=
ckground-color:rgb(255,255,255)">BR2_PACKAGE_FREESCALE_IMX=3Dy</font></div>=
<div><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR=
2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=3Dy</font></div><div><font color=3D"#=
000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_FIRMWARE_IM=
X=3Dy</font></div><div><font color=3D"#000000" style=3D"background-color:rg=
b(255,255,255)">BR2_PACKAGE_IMX_SC_FIRMWARE=3Dy</font></div><div><font colo=
r=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_IMX_S=
ECO=3Dy</font></div><div><font color=3D"#000000" style=3D"background-color:=
rgb(255,255,255)">BR2_TARGET_ROOTFS_EXT2=3Dy</font></div><div><font color=
=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_ROOTFS_=
EXT2_4=3Dy</font></div><div><font color=3D"#000000" style=3D"background-col=
or:rgb(255,255,255)">BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;</font><=
/div><div><font color=3D"#000000" style=3D"background-color:rgb(255,255,255=
)">BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy</font></div><div><font color=3D"#000=
000" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIR=
MWARE_CUSTOM_GIT=3Dy</font></div><div><font color=3D"#000000" style=3D"back=
ground-color:rgb(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_=
URL=3D&quot;<a href=3D"https://source.codeaurora.org/external/imx/imx-atf">=
https://source.codeaurora.org/external/imx/imx-atf</a>&quot;</font></div><d=
iv><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_=
TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D&quot;lf-5.10.y-1.0.0&quo=
t;</font></div><div><font color=3D"#000000" style=3D"background-color:rgb(2=
55,255,255)">#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D&quot;<a hr=
ef=3D"https://coral.googlesource.com/imx-atf">https://coral.googlesource.co=
m/imx-atf</a>&quot;</font></div><div><font color=3D"#000000" style=3D"backg=
round-color:rgb(255,255,255)">#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_=
VERSION=3D&quot;release-chef&quot;</font></div><div><font color=3D"#000000"=
 style=3D"background-color:rgb(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWAR=
E_PLATFORM=3D&quot;imx8qm&quot;</font></div><div><font color=3D"#000000" st=
yle=3D"background-color:rgb(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE_B=
L31=3Dy</font></div><div><font color=3D"#000000" style=3D"background-color:=
rgb(255,255,255)">BR2_TARGET_UBOOT=3Dy</font></div><div><font color=3D"#000=
000" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_UBOOT_BUILD_SYS=
TEM_KCONFIG=3Dy</font></div><div><font color=3D"#000000" style=3D"backgroun=
d-color:rgb(255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy</font></div><div=
><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">#BR2_T=
ARGET_UBOOT_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.codeaurora.or=
g/external/imx/uboot-imx">https://source.codeaurora.org/external/imx/uboot-=
imx</a>&quot;</font></div><div><font color=3D"#000000" style=3D"background-=
color:rgb(255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D&quot;<a href=
=3D"https://coral.googlesource.com/uboot-imx">https://coral.googlesource.co=
m/uboot-imx</a>&quot;</font></div><div><font color=3D"#000000" style=3D"bac=
kground-color:rgb(255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D&qu=
ot;lf-5.10.y-1.0.0&quot;</font></div><div><font color=3D"#000000" style=3D"=
background-color:rgb(255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D=
&quot;release-chef&quot;</font></div><div><font color=3D"#000000" style=3D"=
background-color:rgb(255,255,255)">#output_imx8mq/build/uboot-release-chef/=
configs/mx8mq_phanbell_defconfig</font></div><div><font color=3D"#000000" s=
tyle=3D"background-color:rgb(255,255,255)">BR2_TARGET_UBOOT_CUSTOM_VERSION=
=3Dy</font></div><div><font color=3D"#000000" style=3D"background-color:rgb=
(255,255,255)">BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2022.07&quot;<=
/font></div><div><font color=3D"#000000" style=3D"background-color:rgb(255,=
255,255)">BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;mx8mq_phanbell&quot;</fo=
nt></div><div><font color=3D"#000000" style=3D"background-color:rgb(255,255=
,255)">BR2_TARGET_UBOOT_NEEDS_DTC=3Dy</font></div><div><font color=3D"#0000=
00" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HOST_DOSFSTOOLS=
=3Dy</font></div><div><font color=3D"#000000" style=3D"background-color:rgb=
(255,255,255)">BR2_PACKAGE_HOST_GENIMAGE=3Dy</font></div><div><font color=
=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HOST_I=
MX_MKIMAGE=3Dy</font></div><div><font color=3D"#000000" style=3D"background=
-color:rgb(255,255,255)">BR2_PACKAGE_HOST_MTOOLS=3Dy</font></div><div><font=
 color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_=
HOST_UBOOT_TOOLS=3Dy</font></div><div><font color=3D"#000000" style=3D"back=
ground-color:rgb(255,255,255)">BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy=
</font></div><font color=3D"#000000" style=3D"background-color:rgb(255,255,=
255)"><br></font></div></div><font color=3D"#000000" style=3D"background-co=
lor:rgb(255,255,255)"><br></font><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr"><font color=3D"#000000" style=3D"background-color:rg=
b(255,255,255)">On Tue, Jul 26, 2022 at 8:05 AM Fabio Estevam &lt;<a href=
=3D"mailto:festevam@gmail.com">festevam@gmail.com</a>&gt; wrote:<br></font>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><font color=3D"#000=
000" style=3D"background-color:rgb(255,255,255)">Hi Bob,<br>
<br>
On Tue, Jul 26, 2022 at 10:02 AM bob mcgrath &lt;<a href=3D"mailto:bobwmcgr=
ath@gmail.com" target=3D"_blank">bobwmcgrath@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I am trying to get a google coral devboard to boot with buildroot.=C2=
=A0 Starting with the freescale_imx8qmmek_defconfig I have been able to get=
 an error from uboot over the serial port.<br>
&gt;<br>
&gt; U-Boot SPL 2020.04 (Jul 25 2022 - 03:14:51 -0500)<br>
<br>
I suggest you use mainline U-Boot 2022.07 instead.<br>
<br>
&gt; BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.cod=
eaurora.org/external/imx/linux-imx" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.codeaurora.org/external/imx/linux-imx</a>&quot;<br>
&gt; BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D&quot;lf-5.10.y-1.0.0&quot;<br>
<br>
Use a mainline kernel, such as 5.18 as well.</font><br>
</blockquote></div></div>

--0000000000001562ea05e4b591c6--

--===============6892909672885162737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6892909672885162737==--
