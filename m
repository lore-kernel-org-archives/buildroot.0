Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D160C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 03:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCA160F79;
	Thu,  2 Mar 2023 03:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FCA160F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQAPyYETxQtd; Thu,  2 Mar 2023 03:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F666113B;
	Thu,  2 Mar 2023 03:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78F666113B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3931BF2C5
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 03:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B4341A38
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 03:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B4341A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgVHxx0FX-A2 for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 03:26:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B96419E2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3B96419E2
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 03:26:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so697310wmq.2
 for <buildroot@buildroot.org>; Wed, 01 Mar 2023 19:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vsXUUzEwAXfn5b948zGhxg3oGMHxL7AVFT3NqhlQgOA=;
 b=5katerRYUphp0af0JOigavPrGiXM4pKO9Q3jhhYMAiho4xvv16OkFL+1TPpCSJL13o
 bVGZK6pHo499pl1wL2nM5Nuo0e1cAJbyBjs7NvSWzaS4AZqLS5PeDTGyfWIE/h/UvQXF
 c7RQ3GGXTxjHzV0ReykpemPPbH5jmAzzrsOuLPJbUseeVgdXBmm4ysmu+HOVpu2+1kUt
 DaEDzPWwooOpxnkFpjgz7T2iSoCNZvz7UMsiifrH3ryO4sBSECK1glTOyD1HqSN8aQwH
 RYAEf2Cpwmyz/Meng1bWVhDHYTxj00Lpz4Zl/oIhDOifEDFNuwbWLDkdtNtrJttBUP89
 CXAg==
X-Gm-Message-State: AO0yUKUHXtckamnuJF9lzrCntEjJlaJqfWxQ7NKyAECbofIBUjEQ3gIT
 g/p93VhxHYLcLN2D6Pl/nlekC6H6jAbMA0V6Zc6uMUsxmZwKBw==
X-Google-Smtp-Source: AK7set/mR7p/ATzH08o8Vvm/CiJ7XeCUfE9YYwXy545uxxAX8fE/Oew9K2kfe7RinKwGIf3gModVaKPUBnikph52AoE=
X-Received: by 2002:a05:600c:474f:b0:3df:980c:6a84 with SMTP id
 w15-20020a05600c474f00b003df980c6a84mr2469965wmo.4.1677727560527; Wed, 01 Mar
 2023 19:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20230301083556.2408221-1-javad321javad@gmail.com>
In-Reply-To: <20230301083556.2408221-1-javad321javad@gmail.com>
From: Javad Rahimipetroudi <javad321javad@gmail.com>
Date: Thu, 2 Mar 2023 06:55:48 +0330
Message-ID: <CAL245asPpZhFrHDCPxax-QLke1Q-f2v6QA6Zdx+P8kyqoOdWtA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vsXUUzEwAXfn5b948zGhxg3oGMHxL7AVFT3NqhlQgOA=;
 b=LzHw+JB92QB3YUESK8HdyjZwJ0s3N7bPrgU6b+QBFIE6U8IRUypvbUBqhLwFrB3kH5
 vQxgGRgpJadMSDWaTJlvzx8Q2xB8rNGqnkR7cbltnJuAgK6OcOOXfopp+n6/HnHoPCYe
 nram1BLmrQJN7B5IaoRBa0YvmbtuqJkPJr6QYISm3558YeeRP5FmkfOvDGHla8VOb0JQ
 MIqmte+jN6pRzQL/lXY6MtrVYe/a1dFNa+AyZPfu9wANlDr4lxBIeGrej6dcK9JBpick
 8OZDk9fTkA+PlqykxBOAriDtZBTiqZOW4yKu2Z9o0BBuj2byPkXOneHtw4ZLzymlxQl4
 Eh1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LzHw+JB9
Subject: [Buildroot] Help for the first patch: [PATCH 1/1]
 configs/orangepi_pc2: add board support
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
Content-Type: multipart/mixed; boundary="===============0605491787709703494=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0605491787709703494==
Content-Type: multipart/alternative; boundary="0000000000004671f305f5e26368"

--0000000000004671f305f5e26368
Content-Type: text/plain; charset="UTF-8"

Hello,

It is my first time that I sent a patch. I followed the guidelines to add
support for a missed board (OrangePi PC2)
Is anything else required? I would be grateful if you help me.

Best Regards,
Javad

---------- Forwarded message ---------
From: Javad Rahimi <javad321javad@gmail.com>
Date: Wed, Mar 1, 2023, 12:06
Subject: [PATCH 1/1] configs/orangepi_pc2: add board support
To: <buildroot@buildroot.org>
Cc: <javad321javad@gmail.com>


add board support for orangepi pc2

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 configs/orangepi_pc2_defconfig | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 configs/orangepi_pc2_defconfig

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
new file mode 100644
index 0000000000..63ee554caf
--- /dev/null
+++ b/configs/orangepi_pc2_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LIBNL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

--0000000000004671f305f5e26368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">It is=
 my first time that I sent a patch. I followed the guidelines to add suppor=
t for a missed board (OrangePi PC2)=C2=A0</div><div dir=3D"auto">Is anythin=
g else required? I would be grateful if you help me.=C2=A0<br><br><div data=
-smartmail=3D"gmail_signature" dir=3D"auto">Best Regards,<br>Javad</div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">---------- Forwarded message ---------<br>From: <strong class=3D"gmail_s=
endername" dir=3D"auto">Javad Rahimi</strong> <span dir=3D"auto">&lt;<a hre=
f=3D"mailto:javad321javad@gmail.com">javad321javad@gmail.com</a>&gt;</span>=
<br>Date: Wed, Mar 1, 2023, 12:06<br>Subject: [PATCH 1/1] configs/orangepi_=
pc2: add board support<br>To:  &lt;<a href=3D"mailto:buildroot@buildroot.or=
g">buildroot@buildroot.org</a>&gt;<br>Cc:  &lt;<a href=3D"mailto:javad321ja=
vad@gmail.com">javad321javad@gmail.com</a>&gt;<br></div><br><br>add board s=
upport for orangepi pc2<br>
<br>
Signed-off-by: Javad Rahimi &lt;<a href=3D"mailto:javad321javad@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">javad321javad@gmail.com</a>&gt;<br>
---<br>
=C2=A0configs/orangepi_pc2_defconfig | 41 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 41 insertions(+)<br>
=C2=A0create mode 100644 configs/orangepi_pc2_defconfig<br>
<br>
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfi=
g<br>
new file mode 100644<br>
index 0000000000..63ee554caf<br>
--- /dev/null<br>
+++ b/configs/orangepi_pc2_defconfig<br>
@@ -0,0 +1,41 @@<br>
+BR2_aarch64=3Dy<br>
+BR2_ARM_FPU_VFPV4=3Dy<br>
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=3Dy<br>
+BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>
+BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Orangepi PC2&quot;<br>
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=3Dy<br>
+BR2_SYSTEM_DHCP=3D&quot;eth0&quot;<br>
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/orangepi/common/post-build.sh&q=
uot;<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c $(BINARIES_DIR)/genimage.cfg&quot;<=
br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.16.1&quot;<br>
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun50i-h5-orangepi-pc2&=
quot;<br>
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
+BR2_PACKAGE_LIBNL=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D&quot;v2.5&quot;<br=
>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;sun50i_a64&quot;<br>
+BR2_TARGET_UBOOT=3Dy<br>
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2022.01&quot;<br>
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;orangepi_pc2&quot;<br>
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy<br>
+BR2_TARGET_UBOOT_SPL=3Dy<br>
+BR2_TARGET_UBOOT_SPL_NAME=3D&quot;u-boot-sunxi-with-spl.bin&quot;<br>
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D&quot;SCP=3D/dev/null&quot;<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-- <br>
2.34.1<br>
<br>
</div>

--0000000000004671f305f5e26368--

--===============0605491787709703494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0605491787709703494==--
