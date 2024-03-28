Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF2C54E67
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB27D60C17;
	Thu, 28 Mar 2024 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuRQk_lKnsPV; Thu, 28 Mar 2024 07:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0484F60C08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0484F60C08;
	Thu, 28 Mar 2024 07:48:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D81A1BF384
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 07:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 517AC40323
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 07:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmEiUJ0JGA34 for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 07:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=asd617140123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FC5B403B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC5B403B9
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FC5B403B9
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 07:48:05 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1e2178b2cf2so2578675ad.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 00:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711612084; x=1712216884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2xEuCWwUx6da01xOoGBYYnusCnpiAQuF+LWHSgeSaJU=;
 b=IAVuuKRtVxCkOVFcpK0g+GjxSDxhhzAmWOeAyXFiMUTfl7h/tXrwtcUOSlIRwFFkCY
 uCeVTYr9x8gZRPwVawNs2FYSVQRqZsQWg/xG//43wTd48qUx1Ezfdl8VVc2HAzI08eB6
 qiA3EngHOy2hPNAkJAOiw/2nIsik6wOwl1QIgXmTJZJO99yiQepk7/WFJYBbT+CrJDwO
 Np9H32AscslBjat7GA2F2egFnpfdT0otmdn12mXuwfVS7hVL6hAlEpMDIcCydzuxQ9TJ
 /Lh97ZTq4BxTr+ngRT0bAusWfyNnewMziMqtpy5ZhAWbhRjh/gYEBCYJ06b/1JRc+X/7
 XJLg==
X-Gm-Message-State: AOJu0Yz9eAebc26zZUZ8nOhfFh5oBTYLdgE0H7X+yARarsSlfe6ZjREx
 c6U1snZjP0qrjiC5bkkzbgsseWwh9GQg+eur7n6OnYV4T+IW7TAqsdb1Qd4iIYY=
X-Google-Smtp-Source: AGHT+IGt3XtKepBcwGPzToS0tvsVhWbfvjCzEG3ZKkFyk1jA2XrJcO67X4Hx9kTFy/88q5NkFeDOhw==
X-Received: by 2002:a17:903:948:b0:1e2:1db3:ebeb with SMTP id
 ma8-20020a170903094800b001e21db3ebebmr327241plb.57.1711612084058; 
 Thu, 28 Mar 2024 00:48:04 -0700 (PDT)
Received: from localhost.localdomain (61-220-176-180.hinet-ip.hinet.net.
 [61.220.176.180]) by smtp.gmail.com with ESMTPSA id
 b18-20020a170902d51200b001defd3e64d5sm845924plg.263.2024.03.28.00.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 00:48:03 -0700 (PDT)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 15:47:52 +0800
Message-Id: <20240328074752.148829-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711612084; x=1712216884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2xEuCWwUx6da01xOoGBYYnusCnpiAQuF+LWHSgeSaJU=;
 b=M89ijmnhIL6TbB6bVoD1RwE/jhfcPgige6COJQFuIPbHaT2BPz9+Ir13g2X2Wsj9n/
 ATxd4b8j6Yxvv/W6qD1xs50ZHrMhiIPW9lnlt2X1c/9uLTcb6JQOHPrDn1kU5IuSmSbO
 nOPfGy1Rjz5hKYuRqjdVQmMjxceJpPtKi5ZDz2AplBayLiW75bYGWqQNBWI0nCwG4MZ0
 5/+S+6fztPZeIbxGnIVe6+gCyVmyN79lACfGc+xvyaeJxGuPlQxH0fz2l31sS1R8s3p5
 eAtuFLuYPRw6eyVcNOaptgp1sZUl3CLR2OniLRf+KZh2GZE5jIsev9T9mQOJViC1fVAF
 XMXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M89ijmnh
Subject: [Buildroot] [PATCH v3 1/1] board/cubietech/cubieboard4 : Add config
 file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, nigel_wang <asd617140123@gmail.com>,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: nigel_wang <asd617140123@gmail.com>

add Cubieboard4 board support.

- SOC: Allwinner A80.
- DRAM: 2GiB DDR3 @ 672MHZ.
- NAND: 8GBeMMC
- Power: DC 5V.
- Wifi: 80211 b/g/n. (module is AP6330)
Reference: https://hirokun.jp/AP6330.pdf
- Ethernet: RTL8211E

The detail of board: https://linux-sunxi.org/Cubietech_Cubieboard4

Board support package includes the following components:
- mainline Linux Kernel 6.6.8
- mainline U-boot 2021.10.

Signed-off-by: Nigel Wang <asd617140123@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
v2 -> v3
* Added my name in DEVELOPERS.
* Added BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y in cubieboard4_defconfig.
v1 -> v2
* Add BR2_cortex_a15_a7=y in buildroot defconfig.
* Bump linux version to 6.6.8
* Using sunxi_defconfig in kernel.
* Using "make savedefconfig" to save defconfig.
* Remove boot.cmd.
---
 DEVELOPERS                                |  4 +++
 board/cubietech/cubieboard4/extlinux.conf |  5 +++
 board/cubietech/cubieboard4/genimage.cfg  | 38 +++++++++++++++++++++
 board/cubietech/cubieboard4/post-image.sh | 18 ++++++++++
 configs/cubieboard4_defconfig             | 41 +++++++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 board/cubietech/cubieboard4/extlinux.conf
 create mode 100644 board/cubietech/cubieboard4/genimage.cfg
 create mode 100755 board/cubietech/cubieboard4/post-image.sh
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 313fc16b9d..c70707c8ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3362,3 +3362,7 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Maintainer Nigel Wang <asd617140123@gmail.com>
+F:	board/cubietech/cubieboard4/
+F:	configs/cubieboard4_defconfig
diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubietech/cubieboard4/extlinux.conf
new file mode 100644
index 0000000000..a003337d36
--- /dev/null
+++ b/board/cubietech/cubieboard4/extlinux.conf
@@ -0,0 +1,5 @@
+label linux
+    kernel /zImage
+    devicetree /sun9i-a80-cubieboard4.dtb
+    append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
new file mode 100644
index 0000000000..f1dee13923
--- /dev/null
+++ b/board/cubietech/cubieboard4/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the Cubieboard2
+# Based in the Orange Pi genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun9i-a80-cubieboard4.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
new file mode 100755
index 0000000000..e37b960a4d
--- /dev/null
+++ b/board/cubietech/cubieboard4/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
new file mode 100644
index 0000000000..e3df5025c8
--- /dev/null
+++ b/configs/cubieboard4_defconfig
@@ -0,0 +1,41 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.8"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun9i-a80-cubieboard4"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
