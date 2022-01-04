Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F3FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBDE4091F;
	Tue,  4 Jan 2022 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFLpnJBVBwAJ; Tue,  4 Jan 2022 20:25:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A39A84091B;
	Tue,  4 Jan 2022 20:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B50E71BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A225260BCD
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wH7Qv3Vuh0h0 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:25:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4E8860783
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:25:51 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id kd9so35399136qvb.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=APHtFWmy63Ei7iRsGEZU2+phdHKcMJZqfn6Cwma5ng8=;
 b=O+VNa7Yt633ysE3onvkzcna9zzTT2ZHlzsJahC2y5IUzKFgYVI8TQRL+aPVHpvJMFN
 hTrdoOEchJPzDc8J07f5jXWQP7n7W0J21tZF4Gy9TEyjIpixbztXSL5To3oHVDQ5xXiA
 aLyfkTaxRCgdDhUMfAq1E/kPqLsPiARqJTgy3TCsQ4pXMpB3Z61G7X/yHb4Kv6JbTYSJ
 LJa0NyfdZLOhttpIQS9LoY01sCKEO1vjnkzCGMuHvAvovM3huty19kvtIe6i6h7emy7q
 FUryc7SbQxrR8ybrcsVklWdT4Xv1ERKhWkRH99jsyb1uCwWLegyRrAma7m9Gb37uh/w6
 Z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=APHtFWmy63Ei7iRsGEZU2+phdHKcMJZqfn6Cwma5ng8=;
 b=rKUzlYbDKRnDx22mr/B02wdoT+JSGOR1Frn1LIwJHhCOq86xmYDAf+BajIWtVLt9a1
 vmIyiuGrcXQ3cbYM1v5vJU6KdXn9YY8aZDWy4iDglzU7SwgNUm7GRgjfYdDmJJX6H66N
 wjXwqjFuDBw4mc9sjalmnbsRPhgeiFbtEzYHSKrSs6BMOztPi1aOD7OJ29GyD3sWnXS9
 PRW85gsmIxx7yyeqxegZRLgiF6cokdYHoVume2eS+TL039p7VaPnSGBuRS2krhG+w3Dq
 aPQ3WM/W4G7tQLrYg+l8Cjm6DcZC7rvhjrhW5syZ/8JbQ9AX3GtREjYhs3libkcNo0yf
 orEg==
X-Gm-Message-State: AOAM5316HhwvM8voBLWSMGFYP3bb+oYDUeOiKvuQ3CHBR+4WPD1owE1T
 /B2l1O24qGy3aQG85rDT4XlKAsptwDo=
X-Google-Smtp-Source: ABdhPJyhjbV+Z/UN2bdVw+lNYIl/bMLAqRFd87n5xTEnfKX0OJD6cFVEvWSAQbir/cRWA+427Oqd0Q==
X-Received: by 2002:a05:6214:1ccb:: with SMTP id
 g11mr20455020qvd.97.1641327950514; 
 Tue, 04 Jan 2022 12:25:50 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:ffc6:8cd3:a2dd:67a9])
 by smtp.gmail.com with ESMTPSA id
 o9sm33864729qtk.81.2022.01.04.12.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:25:50 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 17:25:41 -0300
Message-Id: <20220104202541.1175048-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: Bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to 2021.10 and kernel to 5.15.12 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_defconfig     | 8 ++++----
 configs/imx6-sabresd_qt5_defconfig | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index 5a39f333d1ac..0e8300438fcd 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 1330b5cfbfa1..47d14da6a6d6 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Additional features needed for packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
@@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
