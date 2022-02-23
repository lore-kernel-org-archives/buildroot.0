Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A4CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07257415C5;
	Wed, 23 Feb 2022 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVF_Bg2Wbp0O; Wed, 23 Feb 2022 19:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BFA415BC;
	Wed, 23 Feb 2022 19:14:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 525E81BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FE2E403B3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnXdwkoE3MRu for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3967403E9
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:14:41 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t14so26117100ljh.8
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCbT7w/9FfYrGIZz5G0Q/VicFg80jCt+y2SQGrzrl98=;
 b=LDV3QPBIonI0sVlOiVC5ghOwOYoJbdBgvz3KhecOZvrvgP5PYeXBbm5ugGrR7u1n0j
 tQTX/kAs22n8goCvHLstiLJPXTTPmvJ13Ox8uAyI+iLskHCqfhWNFmc9ND4QUinAHtYJ
 t1zXjZCmj/LjVpcEYMFxDP7utoRLjycNswqwJPsVNk7KP9h6cpdyJLYiwJxIdSgiNXq/
 8S+snWze7YFgbvjL0JDbTJyIkFkzKe92COblBshgiZkbILALWSBSoLmgCdRo08EsUzfD
 9qQB4Ml23uv6I1AWkBJLaZwGe5iSYN65ZqLwz0Hhhb/IbFFKEYTSmIihZ8BGnXwQ9kcc
 5bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCbT7w/9FfYrGIZz5G0Q/VicFg80jCt+y2SQGrzrl98=;
 b=XMPw9H1tMRYh/Y17LjCo7Q/lZE+Amdo3GIF/CAGhhVuwzVW3Y4VfSB5+wLk8mXtCZw
 7o/C2Jrk/+KkwIYEhEQigC6S5+7d7JnGqVhuk4UQjvcrYYzNjpt2Bqp3v3HuU8B85LF8
 AqQ3DiEvR2/pfCDjBU6pF9ga38vEfkIHYSOCFejO9iBhXEh0L8sy5KQ4aPnlJmG+e7/0
 OvxogQNgrf2rccVPJNI8Le5py4CWP9fybrMQnHxLwwgzGlyPG1j8mIEq42cpIAqkGsRd
 gN9fSDNAflA5WOXkoGedovsII9V7Yk8zbNj6q5wBl0UwAYiOzDB/5waMs08IduePiegy
 9E3A==
X-Gm-Message-State: AOAM530DWPqfcamozOWJqBuynFFOqDIsQ2m4bEcDKGUDHAwycQrS/M/w
 kKoBt6w/ByCuhjtduo0m1QARLmj/crPQ4w==
X-Google-Smtp-Source: ABdhPJzj6RCzgCGu7ZR/nTkTNJmvsZ5+QOz2ukSp64l3mcLAYXAom9BTA2frH92asJ2Sp1xReaqMWQ==
X-Received: by 2002:a2e:5c49:0:b0:246:3d3b:b6d7 with SMTP id
 q70-20020a2e5c49000000b002463d3bb6d7mr548461ljb.297.1645643679570; 
 Wed, 23 Feb 2022 11:14:39 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id o22sm31750lfr.92.2022.02.23.11.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:14:39 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:14:33 +0300
Message-Id: <20220223191436.3045255-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223191436.3045255-1-geomatsi@gmail.com>
References: <20220223191436.3045255-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] board/orangepi/orangepi-zero-plus2: switch
 to extlinux
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
 board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
 .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 -------------------
 configs/orangepi_zero_plus2_defconfig         | 14 ++++---
 3 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg

diff --git a/board/orangepi/orangepi-zero-plus2/boot.cmd b/board/orangepi/orangepi-zero-plus2/boot.cmd
deleted file mode 100644
index aa5162004b..0000000000
--- a/board/orangepi/orangepi-zero-plus2/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus2.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
deleted file mode 100644
index 5a7ee7707a..0000000000
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-orangepi-zero-plus2.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
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
-	partition spl {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type-uuid = "F"
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	# 'rootfs' will be used as the partition label, used
-	# with root=PARTLABEL=rootfs kernel command line
-	partition rootfs {
-		partition-type-uuid = "L"
-		image = "rootfs.ext4"
-		size = 256M
-	}
-}
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 9d88b37ac9..ef171c3ad3 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -27,9 +27,6 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -40,6 +37,8 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 
 # wireless firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -58,8 +57,11 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
+
+# host tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
+
+# image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus2/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
