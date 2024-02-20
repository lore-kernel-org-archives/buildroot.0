Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106CC48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 05:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 688B04056F;
	Tue, 20 Feb 2024 05:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iL84w7jtnou0; Tue, 20 Feb 2024 05:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 136DB408CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136DB408CA;
	Tue, 20 Feb 2024 05:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6981BF3DE
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 05:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F558408CA
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 05:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6AydMv4hA5r for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 05:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=jan.kraval@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49B674056F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49B674056F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49B674056F
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 05:19:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4126fe5a514so640145e9.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708406389; x=1709011189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B54Rm88swLwJyb4bSGN7rej6QnqTaowTc1LRxigRuM0=;
 b=S4he1/V664U7rBwFpSlS+e/nxSICfrQe2CyN+cu/GAWq9eyhEubnDo/B2qFFySjXGo
 9AwT7WjmjyFv6SHWPlgdO/EQ4jbHwtWPUXDByY5DxBbAKDyDHxe3huzE64hVD1NkZDhf
 CFl4TRDPE4RmnXeKdzXD7ioMOmVuuxrKi9NDuShecUFhyidpGiircNllyMDEXtHHkEeD
 UfVxdV9Ilp3J+ibE8W96GKy0gYf3WvUqazHUvckxn9AdAPDQ2T9IfhkcBDlk0wlba9Ep
 qzQLNatuPnoo4CBtD1bp4siG/hgpOViQ1yJFxnC7uTZUPKZJctIq+zh7gu4z5Sl+XZvt
 7JwA==
X-Gm-Message-State: AOJu0YyfhMKKvveJdq+rWax7g+OgaEJ4rNyPnpUkTZGxNQCOX7JUiMq+
 Jv4eUGTS7vOAmVpCBbu7MEzM9VJNNOwMn5tfVlMpuGX3XUwr+SVbJs8wrwSF
X-Google-Smtp-Source: AGHT+IFymhShLTCoyleTAirHxbdv3UtAktWOhcEDTBXxMFG8HoZWdZOvUSMydk73KY4U2cx843GISQ==
X-Received: by 2002:a05:600c:4fc4:b0:410:68e1:d9ca with SMTP id
 o4-20020a05600c4fc400b0041068e1d9camr10976059wmq.2.1708406388907; 
 Mon, 19 Feb 2024 21:19:48 -0800 (PST)
Received: from envy.example.org (ip-89-102-235-73.bb.vodafone.cz.
 [89.102.235.73]) by smtp.gmail.com with ESMTPSA id
 ay23-20020a05600c1e1700b004125ff0b572sm8431289wmb.8.2024.02.19.21.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 21:19:48 -0800 (PST)
From: Jan Kraval <jan.kraval@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 06:19:25 +0100
Message-Id: <20240220051926.68559-1-jan.kraval@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708406389; x=1709011189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B54Rm88swLwJyb4bSGN7rej6QnqTaowTc1LRxigRuM0=;
 b=RbG9NWVee8ICIJFA5rtc32Bk4xBVoXCOcrFmhsDDbasVMr6cpjTZMRsELZNX7Rd+93
 dbUi1jxYLnaVRXy8lZ1ypKdEcCTlFHoevugUsWb+xocExNcsbPBo+l7vMHVH9xVYe5j+
 ZkC6mK2LEzhCwAWQJZlEtgW5+KqiJi5oTvlZFsAwLGOazo0ZL5Byfic15ezy/KeUpfn2
 SH8ZqPoqredVWboB2R7sjvGFrCMa2KMD2npRXoPwvdc3FfOtcq7ja6P9yOtSgm25dESJ
 KwaqPhCKHurdrU6mE1DwkpfeaV3SnDn8zXjQC6tuJXQLiMIYcg7DHcomVEroRNX9v/aX
 3PJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RbG9NWVe
Subject: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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
Cc: Jan Kraval <jan.kraval@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 board/orangepi/orangepi-lite/boot.cmd     |  8 -----
 board/orangepi/orangepi-lite/genimage.cfg | 37 -----------------------
 configs/orangepi_lite_defconfig           | 12 +++-----
 3 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 board/orangepi/orangepi-lite/boot.cmd
 delete mode 100644 board/orangepi/orangepi-lite/genimage.cfg

diff --git a/board/orangepi/orangepi-lite/boot.cmd b/board/orangepi/orangepi-lite/boot.cmd
deleted file mode 100644
index 5c29dabfe8..0000000000
--- a/board/orangepi/orangepi-lite/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-lite.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-lite/genimage.cfg b/board/orangepi/orangepi-lite/genimage.cfg
deleted file mode 100644
index b422a751a8..0000000000
--- a/board/orangepi/orangepi-lite/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the OrangePi Lite
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-lite.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index e834816456..eff5af938b 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -4,6 +4,9 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
@@ -11,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-lite"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RTL8189FS=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
@@ -25,15 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-lite/genimage.cfg"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
