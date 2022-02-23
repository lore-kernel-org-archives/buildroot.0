Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DC1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F262E408F6;
	Wed, 23 Feb 2022 19:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_TVZhaSz8M8; Wed, 23 Feb 2022 19:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9599408EC;
	Wed, 23 Feb 2022 19:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5912F1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 476A640309
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOZdjls0uKYd for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:14:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42284402D8
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:14:44 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v28so18685897ljv.9
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3TL43bU1eqmAm4GWnIfWffybgPb63afyHfGY/UActc=;
 b=imFPiH8XY07gQ/ow5MD5m2uQMOxA/X73gvBQVVFgqka5ApUrALdg0rLz59Nty3D2CQ
 wL9SZFWkxhbu4OeSAVBZlRpERD4T7islhnkfp7aVqCdX4cIugQnwhHs4M0evrR3wRMXn
 /mGJ6Fk/uZuX225mbgYsqI3ZkiLJsmgM+CHOyNJBENGySZl8l9zzz8KEGtOYY35Yg9q7
 fCyVhCOmYonA4/oa+UQUGremDRDRmPN5YTt9hFyEMePhHkfqEqJ92kbX6nJLu48vlZ+S
 nJk7axJcDFzYKaam0ZpImQCCjxCmk5SbSvJbCsSq5M7wv2t/2sNj01Vbb04nRWbB6zhk
 ADqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3TL43bU1eqmAm4GWnIfWffybgPb63afyHfGY/UActc=;
 b=YhW51QGuPWEVkJHjlgi9QzeH2oklbhJn6+AMziM7Vt/2adf7X899/3fs1pDfCS9D+T
 e949BmZ8P3RZ+tsa1iBl/UGlhgYo4TeL9Mvd+Jed7TJDLb65185yem1iPutbogLSKGa3
 Ext5lBlE6RmTFjkqA2gVF3bYn8omKKOBJZQk5KU3GhfmKb7uXqdyXIxm886d3fvwGa/X
 uVH13I9JJsHSNAjIqmxQ+5vPqgK9WpWTfqWJDBIcbHc2QViAsU4HhFP5+Zu5A/LWMWxC
 7Wr6MM8Yzxlj74cCTO86N98wpnmzl5XwImirkx2W/cjqm0ET/IlHuJ4hFLs2vWMUL8iR
 CQWg==
X-Gm-Message-State: AOAM533bg0sSi3xDmdjPYwHT28LM4MrI80tvz7OgAOFqWmV4F97E92kN
 kJMS2eRF0YRNBzirQwXIyor2+2/gMqLi3w==
X-Google-Smtp-Source: ABdhPJxkE9hU4u4JoMGkfUG4zloHIjhkZl5UtJzFcN8fqYpalQhCZUHMX5oqXko3fyKVBfQpUtTExA==
X-Received: by 2002:a2e:3c0b:0:b0:239:6106:8d28 with SMTP id
 j11-20020a2e3c0b000000b0023961068d28mr616217lja.416.1645643680317; 
 Wed, 23 Feb 2022 11:14:40 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id o22sm31750lfr.92.2022.02.23.11.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:14:39 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:14:34 +0300
Message-Id: <20220223191436.3045255-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223191436.3045255-1-geomatsi@gmail.com>
References: <20220223191436.3045255-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] board/orangepi/orangepi-pc-plus: switch to
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-pc-plus/boot.cmd     |  8 ----
 board/orangepi/orangepi-pc-plus/genimage.cfg | 43 --------------------
 configs/orangepi_pc_plus_defconfig           |  9 ++--
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg

diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
deleted file mode 100644
index c91f77942f..0000000000
--- a/board/orangepi/orangepi-pc-plus/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
deleted file mode 100644
index 3812d785d5..0000000000
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-# Minimal SD card image for the OrangePi PC Plus
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-pc-plus.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-		# for root=PARTLABEL support
-		partition-table-type = "gpt"
-		# default GPT location conflicts with bootloaders, move it after
-		gpt-location = 1M
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
-		partition-type-uuid  = "F"
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	# 'rootfs' will be used as the partition label, used
-	# with root=PARTLABEL=rootfs kernel command line
-	partition rootfs {
-		partition-type-uuid = "L"
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index c3ff8bc417..ba946e5285 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -27,14 +28,10 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc-plus/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # wireless driver and firmware
 BR2_PACKAGE_RTL8189FS=y
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
