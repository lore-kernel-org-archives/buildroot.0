Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F490C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 05:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E5E540018;
	Wed, 26 Jan 2022 05:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcItnMlmL4_R; Wed, 26 Jan 2022 05:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B404055E;
	Wed, 26 Jan 2022 05:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85C451BF591
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 05:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D6CB60E39
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 05:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0FPON8HSCmX for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 05:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3ECD60E15
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 05:18:14 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id q127so5023863ljq.2
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWwmvZZO7jvzesztavG2P2LZ+PVUfSZ2szwP52WVjJE=;
 b=UrhR7MBRHflN9A3z7wk4L2y8Rk3lBsEplCWN860jtLOxsn//A/3gl+ZpnJ+0nAH3jI
 2EddxvTDLq7ecde9kZet7mF9dPUjiTX5o5YfbROdAB+w49r+OwowwpRbDtEsbs3J/z4H
 7ZtHAi4gioyeL//xQAGNlccSlgJDEcjw4IGkUGbixKb5r8MMfV4Pv8udU75DF8qgzf+K
 btXteIAGmBTBYopxqacgSkZasZYHZJDxTPChi4mCTH6LYyLgnhwQv/EOaIXMMRAZYKAg
 UCBnNre7q/zd7Hl/djY4/2dqTvX7x6xeU2yCFjrNQIDokG8mnysKsfMKvciI/NZ+K3Yo
 stcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWwmvZZO7jvzesztavG2P2LZ+PVUfSZ2szwP52WVjJE=;
 b=fXPgDsEjOtzaJMRwKHihzbBiT1EDvPD+QJd1tP8xGp/IP2JdBrNCyEG0geeLXL4veB
 nN9HBE09AMS5debLAZlS7oqdWTQFURGZ7z9o4vj2xpcRC24ZuWm1Uk6dwoUXRHelspei
 MMP8Q/rCNgBJhHy4dQY2rmJcTN88VY30IeVVN0nAjHfcoSvHIAobFh4nSs8PMGL7I4XL
 Q784vsoXIypAM2pCXr8yeowTX9wAnbTubmqI7AOVrEbwzBvo+yRoWk8mlIdVjo64c5Zl
 HgCiXdmYH+EsOUejJOmOhnnn65h2a6Of4s6XIK/ejrvp4VFc0yLxN78ygL+bItgUWwNm
 sQ4w==
X-Gm-Message-State: AOAM5302PYOO5Cluv1d1aITfnX/klimqivrKkZTYMCO/cZwbZjax5zXv
 55t6vV6fI2Tjd07JBOcBJsWaTmfkm7M=
X-Google-Smtp-Source: ABdhPJxVLj+Xg9LO21Fxn7CSHicCPtPV6yyoQWREPGCkY9BkvvL4rgyyvtfsjEztb+b19za5iM07sQ==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr4035155ljg.179.1643174292168; 
 Tue, 25 Jan 2022 21:18:12 -0800 (PST)
Received: from hellfire.local ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id bq32sm985031lfb.142.2022.01.25.21.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 21:18:11 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 08:18:08 +0300
Message-Id: <20220126051808.26581-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/orangepi_zero_defconfig: refactoring,
 bump Linux and U-Boot versions
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
- Refactoring configs/orangepi_zero_defconfig.
- Linux: bump to version 5.15.16 (from 5.12.2).
- U-Boot: bump to version 2022.01 (from 2021.04).

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 ...ux-extras.config => linux-extras.fragment} |  0
 configs/orangepi_zero_defconfig               | 32 +++++++++++++------
 2 files changed, 22 insertions(+), 10 deletions(-)
 rename board/orangepi/orangepi-zero/{linux-extras.config => linux-extras.fragment} (100%)

diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
similarity index 100%
rename from board/orangepi/orangepi-zero/linux-extras.config
rename to board/orangepi/orangepi-zero/linux-extras.fragment
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 1c107b10e6..5aaa1566c5 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,49 +1,61 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# System
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
 
-# wireless driver and firmware
+# Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
 
-# wireless support
+# Wireless support
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
@@ -51,5 +63,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
 BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 
-# spi flash support
+# Spi flash support
 BR2_PACKAGE_MTD=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
