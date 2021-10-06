Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F21C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6925561152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6925561152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B28D40395;
	Wed,  6 Oct 2021 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFgaZmofQcmH; Wed,  6 Oct 2021 20:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65303403C7;
	Wed,  6 Oct 2021 20:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08061BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D082360F3F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-gJpk_DHcbV for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0D1460F3E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so5273422pjb.2
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hutSnbpsY2dq5/CewKW8h2KgX51QCaUQkqvPey4ZMpo=;
 b=Q7LXgPI1jZpANx1YjB96m4zjMSGcj2lArN0Zc6WCK+wxnDVSx1Thck5gjO0KlXbnp/
 3RXQfm9fj+X0PC14PMhA+gbweiFv7qPNm4xSHEpuAOf60LQbHSsHQO5k1WewjubTZWSV
 smmYHU2E6TwCpq2cO9ZLOvxtl6L/KR+RaPqAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hutSnbpsY2dq5/CewKW8h2KgX51QCaUQkqvPey4ZMpo=;
 b=VB7E31cLvvJ12Tziw5kRmQLivRkNiDss3WNrUmJaG1+PhX8r19HDsTHB2xpocVaP3Q
 x8spdnhIc2Io85gAZq+ApplSPXs7b9HKz1nZAU7s/jjuYB70z+PUR7ud+RwSja7/Cf+r
 nQ2NpLvtomxgMhY52xiDEKbehMz3inNOeR5pecQoeT6n/RDlKKkqW8hDcczZb1EdScs/
 qaGvMSJjWYY4g4l8RbIJb60tq0ofldkdlzZd1hBXNgAqQLh7WW2hG6hGaGxe596TxNU2
 hZTrm2ImaHqnXJvOPANlSpvxNceC+fvpje5f7R+uNJKmmy1pkm5az0iekUaQA7Uc6/Dz
 fGpg==
X-Gm-Message-State: AOAM533EOeE5iHHpsK7k39FRcE9QbmBLVu0LYql4PdrTlIQXJ67Tnerg
 ei4XAbaTtxiwKBUOIDe/wyXaQEbVHUkgytBg
X-Google-Smtp-Source: ABdhPJzOhlpHs3Sc+y4ioHKV4Nvof+HV1OtmwnVL38g+nYxFpMySrV08IL3FcbgoHGumCU5pi/a3fQ==
X-Received: by 2002:a17:90a:c703:: with SMTP id
 o3mr954534pjt.176.1633552927874; 
 Wed, 06 Oct 2021 13:42:07 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:42:07 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:33 -0700
Message-Id: <20211006204135.2813745-10-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/12] configs/nitrogen*: update kernel to
 5.10.x_2.0.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also bump linux headers version to 5.10.
Based on NXP 5.10.35-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 8 ++++----
 configs/nitrogen6x_defconfig  | 8 ++++----
 configs/nitrogen7_defconfig   | 8 ++++----
 configs/nitrogen8m_defconfig  | 8 ++++----
 configs/nitrogen8mm_defconfig | 8 ++++----
 configs/nitrogen8mn_defconfig | 8 ++++----
 configs/nitrogen8mp_defconfig | 8 ++++----
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 73dfe2caff..317bf192af 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 8e4b268356..b3d97c52e9 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 8b152d931b..7656fe20d9 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 438a0bc29e..9e0e0983ee 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 567636ee4c..db5ccef156 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 71fb0e7914..95a2a45780 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 14bd26724d..53933b6b8d 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
