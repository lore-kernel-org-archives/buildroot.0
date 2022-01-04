Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA080C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FB7818E6;
	Tue,  4 Jan 2022 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HvALnQWJiaX; Tue,  4 Jan 2022 20:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75EF8188B;
	Tue,  4 Jan 2022 20:32:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29C251BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24BC2409C6
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdBBxBPPvqIn for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:32:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D626410AC
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:32:56 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id h67so21517009vkh.1
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Q7gInAjQN4fAlqEWK8/q3+JHK45XcUFvXjtpdkWR9c=;
 b=N+7xivqWStoBUMOai2dKhUeyYZNJOdFN9Nogx2GsvrGIx6VKqxKQuAwb/mvxnu/yCF
 g4LAnP8mlpTZB8uSGYr+fs7ixa6qBuFPoI5q7Fmh68TJiCRX4/IBvoLag3skCAx1m3S+
 UmPMvEo05iXNY0IrpxHX0SwKaT3ShoQvw1NTDTrDUgGPEyYXPUMNpmF/Tc1IkBqHNe18
 2WPw33bhg5WuJGZ2X3tQ9eSe+z4YFgsCjAzctzkkzUfMbWAyIzE8jnVbpgXMSuvEtILC
 hTUBbNBBAuq/t+b/1LBvKHzaOuBkGCCGslozShLLf/YzfAhvyP9yLTMgy9dweCOCPEhP
 45Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Q7gInAjQN4fAlqEWK8/q3+JHK45XcUFvXjtpdkWR9c=;
 b=L6MujEC6SRAXTQ3DPWKNwooc8HfBjKDB9j2bf+TUV/WWffBg7xDkYX/3mUwU7wZVC1
 tJHmLNu71PfJSrUG+nBafmjD1cf5fIyMk+6VVAdB5KLcYWyPtUUwiZ5+BvRLK89QV5ka
 PSviTnPmEOgB3KzWrU5lP3GSW+ZABP+yZFyLRkUlIhCJc3nuht0jrxpHigpV9C7QB5zQ
 AbR32tw59076PrOxBqNlRff9gyE2t4FmpXHY5yG3Gu1i4CrQLNxycyoUSg3PWSYC6nHS
 mxmiZcG8BJAexNQ6k5xlN/yn8Zj1VBbpnS9xt5lgHjy1t4jkf9F/0ZTV5ZoN6gZ8vjvj
 JgNg==
X-Gm-Message-State: AOAM5331RN8zMAtUFsgO7Q66+eJSkM7p04gO+nalKBw4Urwv9H2QTzfB
 4Eyw7nBFYeK2LhuMnwytzQmhss1MXBA=
X-Google-Smtp-Source: ABdhPJw0KqdFnOEBSdMn90l+ohxj7RJjgty0CXGgVuFfRWMNBn/lRJHEyA0jVB0Ojtz8jteZQXeFqw==
X-Received: by 2002:a05:6122:d9b:: with SMTP id
 bc27mr8423392vkb.14.1641328375105; 
 Tue, 04 Jan 2022 12:32:55 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:ffc6:8cd3:a2dd:67a9])
 by smtp.gmail.com with ESMTPSA id
 x19sm8145364vsh.6.2022.01.04.12.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:32:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 17:32:42 -0300
Message-Id: <20220104203242.1175845-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/imx6-sabresd: Bump U-Boot and kernel
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
Changes since v1:
- Also select BR2_TARGET_UBOOT_NEEDS_OPENSSL=y as a requirement for
U-Boot 2021.10.

 configs/imx6-sabresd_defconfig     | 9 +++++----
 configs/imx6-sabresd_qt5_defconfig | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index 5a39f333d1ac..19986f2cbb54 100644
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
@@ -24,15 +24,16 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 1330b5cfbfa1..38a86131dda3 100644
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
@@ -30,15 +30,16 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
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
