Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F3C48297
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 03:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43380400D9;
	Wed,  7 Feb 2024 03:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQXJolikdNvO; Wed,  7 Feb 2024 03:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7A54042B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7A54042B;
	Wed,  7 Feb 2024 03:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEAC41BF976
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 03:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F356404EC
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 03:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vBFF4ftXVfF for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 03:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=asd617140123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DCF14044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DCF14044C
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DCF14044C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 03:03:47 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso102984a12.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 19:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707275026; x=1707879826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gZFvplNzFFdamPS1yxRI7kuktFFERZ9x0tg61NsLhF8=;
 b=v2i8brGrtawfGAJzQd5ygnXSpB8SQpaw9Ba8+36YiUbBdIjFaQr/khnd+c4tmpXG8l
 0ZUYb+1wyPwq7N2H3DNwYL2DARO3yqK4UWsKB9cmcYCa/jBlX8aA+zmL9pvxEdEZskA+
 1SQt2HiNeaea2f//PHVi+d+l/BKgmmW6TqeEozIAt4jRbVaoLQLFzaxn8sIghz2tWGbO
 toRzIyYdagLqMkkT/2MbenAoAWC1n1yFmU4SqAfRReyix552t1OCzrxiswFDyWe4NKZE
 LpSSdLGZD4HFkN4ZZT3T6cD1nyDRQzxglrjT1oizScuKGuCnK58iu1i+isXNCb93DR7n
 5T6A==
X-Gm-Message-State: AOJu0YwzCniMtG57UfgPC9kujhbuMHbtJb1pNYblKQ+b4yqpyC2x1E3j
 rqEer4anWP2XMTM18gtTAuLVIDILLwXhLN/ZI+GELOV+XTy5ggy4X6DUEDCacUnwYQ==
X-Google-Smtp-Source: AGHT+IEcc2Gmni4tWMSqZiimmtaUeRvt3tc41SkbhZ+2XlAGgf18Cazin3rg6KHOZkr9QSlgAU9vHw==
X-Received: by 2002:a17:90a:e601:b0:296:dde5:58dc with SMTP id
 j1-20020a17090ae60100b00296dde558dcmr1088872pjy.10.1707275026321; 
 Tue, 06 Feb 2024 19:03:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdwlmLpMaQPGoiKuwZTCNdlrbyqNpsY/5ni3ZdVyZvzDPAR+PRX/XltXwzGQw+fS9e8iRlPuimGP6XGKQKTjErGFju8ofFGSdhh2OtAIokZftanDEfd0fvzcqIY909B5RbKRnDtJ+pwoFe3T1p
Received: from localhost.localdomain (61-216-248-199.hinet-ip.hinet.net.
 [61.216.248.199]) by smtp.gmail.com with ESMTPSA id
 ph6-20020a17090b3bc600b00296dd430e3fsm322965pjb.5.2024.02.06.19.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 19:03:46 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 11:03:39 +0800
Message-Id: <20240207030339.3910-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707275026; x=1707879826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gZFvplNzFFdamPS1yxRI7kuktFFERZ9x0tg61NsLhF8=;
 b=Xm4WNie3Bt0FfE/qLc1VKBNOC1SNCPVdS73YX+glTJBYdpLaeHrFR9AffVShIZK1gv
 aJangxavHATTcqTPGTob8qvE1sGVpIZdBfHbUjbOgsPfvu/c44ulJLOjIa3L096qYMhL
 qQrIrCHCHM1+qeqUpi286vXK51x6+yCDU6BsULbOcwpV0yeOq0QaEsGA8U6ClZ/W0KbZ
 vwWLmocsiyTJUzi4r0GtBaCm4nRI5QNpU8vAQeFGkqtBevA613TbWahJGP/H3dBqA0qj
 0bIz5/c7clUxTL4ermRbitD3w5Pc+9IrnNQe1tQvw4PQDdt+Fsh60bQuDmqxXOVG34LE
 zj2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Xm4WNie3
Subject: [Buildroot] [PATCH v2] board/cubietech/cubieboard4 : Add config
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
---
v1 -> v2
* Add BR2_cortex_a15_a7=y in buildroot defconfig.
* Bump linux version to 6.6.8
* Using sunxi_defconfig in kernel.
* Using "make savedefconfig" to save defconfig.
* Remove boot.cmd.
---
 DEVELOPERS                                |  4 +++
 board/cubietech/cubieboard4/extlinux.conf |  5 +++
 board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
 board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
 configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 board/cubietech/cubieboard4/extlinux.conf
 create mode 100644 board/cubietech/cubieboard4/genimage.cfg
 create mode 100755 board/cubietech/cubieboard4/post-image.sh
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index a03018ab2b..bffb8f2069 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3297,3 +3297,7 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Nigel Wang <asd617140123@gmail.com>
+F:	board/cubietech/cubieboard4/
+F:	configs/cubieboard4_defconfig
diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubietech/cubieboard4/extlinux.conf
new file mode 100644
index 0000000000..5084e2237b
--- /dev/null
+++ b/board/cubietech/cubieboard4/extlinux.conf
@@ -0,0 +1,5 @@
+label linux
+    kernel /boot/zImage
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
index 0000000000..0592fe4a2d
--- /dev/null
+++ b/configs/cubieboard4_defconfig
@@ -0,0 +1,39 @@
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
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
