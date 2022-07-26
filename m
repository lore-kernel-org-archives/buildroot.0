Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76E5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E7CC60D71;
	Tue, 26 Jul 2022 13:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7CC60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOTiE0wmQ9fA; Tue, 26 Jul 2022 13:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBBC860B44;
	Tue, 26 Jul 2022 13:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBC860B44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6B001BF41B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE7141719
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE7141719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZ7bw-uFAS2h for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:01:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5467141089
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5467141089
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:01:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ez10so25867971ejc.13
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CRJJTusKftgKAMMRrQ6QsDq45uwtIRpGcmefgCgz5zs=;
 b=VQUC3vP8W0QdQ++bcQb0M5tMoxj2HawFteRA8KJmKE5b/QWf7xDy/3DDlzN5MVoOlX
 83WN/W7atnCxrqAKko8TgqjCyPmasY7BRGEw9lCEW7Jnt0phmNX36mbcXcmCmEW0ESw5
 ZsinYwIfrOSZkvG+rUmJMNT/rgV6fccwlStJA9ieJvaTjY5P5nkJRJd//BrSOf8/Wy9U
 hrv8Z2gAJ/LuSpCd56nC8vcGdu6dcEEwT+UmPj8Iz/sM+mDyu1G+hVNI8vy6519auLXP
 pyKFOwAZ1YdRRibNWMICoNc3BIg1QvMNUkPY9ju9ZzLm22VeVAmqs45+DJ6Mg60MqFjE
 ejng==
X-Gm-Message-State: AJIora8FRnGSj+va8YqYDQLWVDmnT73fT6rvGAFMPdIlj7fmBTtXE9jw
 xrfZ5qxhs7AyIrPE1IL7hLkLP7tmN4bGpC+IUDYSi5jUmM5Tbg==
X-Google-Smtp-Source: AGRyM1ta9xpcvl+cqwgwPW0st2IpiO5gZh8GtJYsEJfVdxkjzSRvQ4PkDGy2zllx/Pt+WpvczmYlOgLGEREC2YmXTMM=
X-Received: by 2002:a17:906:9b0a:b0:72e:e524:180a with SMTP id
 eo10-20020a1709069b0a00b0072ee524180amr14102081ejc.131.1658840486421; Tue, 26
 Jul 2022 06:01:26 -0700 (PDT)
MIME-Version: 1.0
From: bob mcgrath <bobwmcgrath@gmail.com>
Date: Tue, 26 Jul 2022 08:00:00 -0500
Message-ID: <CABPiF0=6w4ZGfZidXFuaikLw=M_MkoSou=8tFmrP80WWGWHDSA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CRJJTusKftgKAMMRrQ6QsDq45uwtIRpGcmefgCgz5zs=;
 b=MGraEysxX8sZVG5j/HOH+ASpc/nalLf0/Y0uwxDHFcCnAiuctZ5oVnBeTBHuXos2XB
 0J31ybFHZgfORiIuBBRjivsnaECxJpKkxb8BvRnhuLyUgSC2J0FO79LI3PJLiSOb2vSF
 Dgt4t3i286KIsoVOYZv0GWY39iAKM3eyM84UFtEUo3pQ0z2t93ulA+g7cl8zuN3HSnbn
 xcyCE3Eb94AieG6EbXiKJ+A/eXXGx0Mvj+T0FKBb3iqqwtM7OyQug3nQLsb6C67gJglw
 q+cxtt6JzHGMSJoE2pXN00rsD9OUQ7RmRc84O73RS/wvlqayNWuWjvhtMwlcxW7BbqUw
 o8LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MGraEysx
Subject: [Buildroot] google coral devboard defconfig.
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
Content-Type: multipart/mixed; boundary="===============0029929142989155998=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0029929142989155998==
Content-Type: multipart/alternative; boundary="000000000000eea91905e4b4e51c"

--000000000000eea91905e4b4e51c
Content-Type: text/plain; charset="UTF-8"

I am trying to get a google coral devboard to boot with buildroot.
Starting with the freescale_imx8qmmek_defconfig I have been able to get an
error from uboot over the serial port.

U-Boot SPL 2020.04 (Jul 25 2022 - 03:14:51 -0500)
Can't find PMIC:PFUZE100
DDRINFO: start DRAM init
DDRINFO: DRAM rate 3200MTS
Training FAILED

Since it looks like an error with the uboot DTS, I decided to change to the
uboot repo that mendel OS uses which contains fsl-imx8mq-phanbell.dtb.  Now
my system does not appear to boot at all.  I'm not sure where to go about
debugging from here.  My defconfig currently looks like this:

BR2_aarch64=y
BR2_ARM_FPU_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh
board/freescale/common/imx/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-phanbell.dtb"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/linux-imx"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
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
#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/imx-atf"
#BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
https://coral.googlesource.com/imx-atf"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="release-chef"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qm"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
#BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
https://source.codeaurora.org/external/imx/uboot-imx"
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://coral.googlesource.com/uboot-imx"
#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="release-chef"
#output_imx8mq/build/uboot-release-chef/configs/mx8mq_phanbell_defconfig
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx8mq_phanbell"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_IMX_MKIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

--000000000000eea91905e4b4e51c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font color=3D"#000000" style=3D"background-color:rgb(255,=
255,255)">I am trying to get a google coral devboard=C2=A0to boot with buil=
droot.=C2=A0 Starting with the=C2=A0freescale_imx8qmmek_defconfig I have be=
en able to get an error from uboot over the serial port.=C2=A0=C2=A0<br><br=
>U-Boot SPL 2020.04 (Jul 25 2022 - 03:14:51 -0500)<br>Can&#39;t find PMIC:P=
FUZE100<br>DDRINFO: start DRAM init<br>DDRINFO: DRAM rate 3200MTS<br>Traini=
ng FAILED<br><br>Since it looks like an error with the uboot DTS, I decided=
 to change to the uboot repo that mendel OS uses which contains=C2=A0<span =
style=3D"font-family:Consolas,&quot;Courier New&quot;,monospace;font-size:1=
4px;white-space:pre">fsl-imx8mq-phanbell.dtb</span>.=C2=A0 Now my system do=
es not appear=C2=A0to boot at all.=C2=A0 I&#39;m not sure where to go about=
 debugging from here.=C2=A0 My defconfig currently looks like this:<br><br>=
</font><div style=3D"font-family:Consolas,&quot;Courier New&quot;,monospace=
;font-size:14px;line-height:19px;white-space:pre-wrap"><div style=3D""><fon=
t color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_aarch64=
=3Dy</font></div><div style=3D""><font color=3D"#000000" style=3D"backgroun=
d-color:rgb(255,255,255)">BR2_ARM_FPU_VFPV4=3Dy</font></div><div style=3D""=
><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PA=
CKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=3Dy</font></div><div style=3D""><font =
color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_ROOTFS_PO=
ST_IMAGE_SCRIPT=3D&quot;board/freescale/common/imx/imx8-bootloader-prepare.=
sh board/freescale/common/imx/post-image.sh&quot;</font></div><div style=3D=
""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_=
ROOTFS_POST_SCRIPT_ARGS=3D&quot;${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-phanbe=
ll.dtb&quot;</font></div><div style=3D""><font color=3D"#000000" style=3D"b=
ackground-color:rgb(255,255,255)">BR2_LINUX_KERNEL=3Dy</font></div><div sty=
le=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)"=
>BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy</font></div><div style=3D""><font color=3D=
"#000000" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_CUST=
OM_REPO_URL=3D&quot;<a href=3D"https://source.codeaurora.org/external/imx/l=
inux-imx" target=3D"_blank">https://source.codeaurora.org/external/imx/linu=
x-imx</a>&quot;</font></div><div style=3D""><font color=3D"#000000" style=
=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=
=3D&quot;lf-5.10.y-1.0.0&quot;</font></div><div style=3D""><font color=3D"#=
000000" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_DEFCON=
FIG=3D&quot;imx_v8&quot;</font></div><div style=3D""><font color=3D"#000000=
" style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_DTS_SUPPORT=
=3Dy</font></div><div style=3D""><font color=3D"#000000" style=3D"backgroun=
d-color:rgb(255,255,255)">BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;freescal=
e/imx8mq-phanbell&quot;</font></div><div style=3D""><font color=3D"#000000"=
 style=3D"background-color:rgb(255,255,255)">BR2_LINUX_KERNEL_NEEDS_HOST_OP=
ENSSL=3Dy</font></div><div style=3D""><font color=3D"#000000" style=3D"back=
ground-color:rgb(255,255,255)">BR2_PACKAGE_FREESCALE_IMX=3Dy</font></div><d=
iv style=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255=
,255)">BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=3Dy</font></div><div style=
=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">B=
R2_PACKAGE_FIRMWARE_IMX=3Dy</font></div><div style=3D""><font color=3D"#000=
000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_IMX_SC_FIRMWAR=
E=3Dy</font></div><div style=3D""><font color=3D"#000000" style=3D"backgrou=
nd-color:rgb(255,255,255)">BR2_PACKAGE_IMX_SECO=3Dy</font></div><div style=
=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">B=
R2_TARGET_ROOTFS_EXT2=3Dy</font></div><div style=3D""><font color=3D"#00000=
0" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_ROOTFS_EXT2_4=3Dy=
</font></div><div style=3D""><font color=3D"#000000" style=3D"background-co=
lor:rgb(255,255,255)">BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;</font>=
</div><div style=3D""><font color=3D"#000000" style=3D"background-color:rgb=
(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy</font></div><div style=
=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">B=
R2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=3Dy</font></div><div style=3D""><=
font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">#BR2_TAR=
GET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.=
codeaurora.org/external/imx/imx-atf" target=3D"_blank">https://source.codea=
urora.org/external/imx/imx-atf</a>&quot;</font></div><div style=3D""><font =
color=3D"#000000" style=3D"background-color:rgb(255,255,255)">#BR2_TARGET_A=
RM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D&quot;lf-5.10.y-1.0.0&quot;</font=
></div><div style=3D""><font color=3D"#000000" style=3D"background-color:rg=
b(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D&quot;<a =
href=3D"https://coral.googlesource.com/imx-atf" target=3D"_blank">https://c=
oral.googlesource.com/imx-atf</a>&quot;</font></div><div style=3D""><font c=
olor=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_ARM=
_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D&quot;release-chef&quot;</font></di=
v><div style=3D""><font color=3D"#000000" style=3D"background-color:rgb(255=
,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;imx8qm&quot;</f=
ont></div><div style=3D""><font color=3D"#000000" style=3D"background-color=
:rgb(255,255,255)">BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy</font></div><di=
v style=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,=
255)">BR2_TARGET_UBOOT=3Dy</font></div><div style=3D""><font color=3D"#0000=
00" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_UBOOT_BUILD_SYST=
EM_KCONFIG=3Dy</font></div><div style=3D""><font color=3D"#000000" style=3D=
"background-color:rgb(255,255,255)">BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy</font><=
/div><div style=3D""><font color=3D"#000000" style=3D"background-color:rgb(=
255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://=
source.codeaurora.org/external/imx/uboot-imx" target=3D"_blank">https://sou=
rce.codeaurora.org/external/imx/uboot-imx</a>&quot;</font></div><div style=
=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">B=
R2_TARGET_UBOOT_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://coral.googlesour=
ce.com/uboot-imx" target=3D"_blank">https://coral.googlesource.com/uboot-im=
x</a>&quot;</font></div><div style=3D""><font color=3D"#000000" style=3D"ba=
ckground-color:rgb(255,255,255)">#BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D&q=
uot;lf-5.10.y-1.0.0&quot;</font></div><div style=3D""><font color=3D"#00000=
0" style=3D"background-color:rgb(255,255,255)">BR2_TARGET_UBOOT_CUSTOM_REPO=
_VERSION=3D&quot;release-chef&quot;</font></div><div style=3D""><font color=
=3D"#000000" style=3D"background-color:rgb(255,255,255)">#output_imx8mq/bui=
ld/uboot-release-chef/configs/mx8mq_phanbell_defconfig</font></div><div sty=
le=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)"=
>BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;mx8mq_phanbell&quot;</font></div>=
<div style=3D""><font color=3D"#000000" style=3D"background-color:rgb(255,2=
55,255)">BR2_TARGET_UBOOT_NEEDS_DTC=3Dy</font></div><div style=3D""><font c=
olor=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HO=
ST_DOSFSTOOLS=3Dy</font></div><div style=3D""><font color=3D"#000000" style=
=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HOST_GENIMAGE=3Dy</font>=
</div><div style=3D""><font color=3D"#000000" style=3D"background-color:rgb=
(255,255,255)">BR2_PACKAGE_HOST_IMX_MKIMAGE=3Dy</font></div><div style=3D""=
><font color=3D"#000000" style=3D"background-color:rgb(255,255,255)">BR2_PA=
CKAGE_HOST_MTOOLS=3Dy</font></div><div style=3D""><font color=3D"#000000" s=
tyle=3D"background-color:rgb(255,255,255)">BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy=
</font></div><div style=3D""><font color=3D"#000000" style=3D"background-co=
lor:rgb(255,255,255)">BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy</font></=
div><br></div></div>

--000000000000eea91905e4b4e51c--

--===============0029929142989155998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0029929142989155998==--
