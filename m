Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27033C48260
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 03:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913D4418A0;
	Tue,  6 Feb 2024 03:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913D4418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8rjerB9UKZk; Tue,  6 Feb 2024 03:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F7141898;
	Tue,  6 Feb 2024 03:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F7141898
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099E11BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 03:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AE041898
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 03:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AE041898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lALKAEvApBgq for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 03:34:52 +0000 (UTC)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8093E4188F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 03:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8093E4188F
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-783f553fdabso12388085a.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 19:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707190491; x=1707795291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BonMA9A7SCmtBAjj6oamP9nqNFawOcfqKm2Z5FdQABI=;
 b=vWEAEDBavYjeKsDDDvqIazI743f8NxJRVOynyJwcIYBZNBqp+KBFCPrPA9GYKQYSlP
 tUNY2Z00wRfi5ISs01/cxXSmYFnsg7keFrwAsJoF36fpUY8UbjdDE0PNxT8UmsIc7NNt
 bTxCryvaP0pPTJhJMYiujJmYEXt1pqM/wz40FwLqfQ8mtbxCz49EfqSL96zMkZK8eKCI
 xezyq0C83IOPp3365vHsed6Id/ffP/wANgOH07f7Ebjkfjb8x4emk9IiSbouFEalX9jr
 eQg4hCEzEKKso8d0i8/FV5HraSZOAt6mgrTpqJMnWoOR7ldG2WuaEZT7rpGG/mtXpdJ9
 OgEw==
X-Gm-Message-State: AOJu0YwCKIS9/nlMAvbDxTd1q+NAOF4qXEXd5tn1M4xJLUOBEJmyDxoz
 b9CzA1HAeJVRCbVO15AkerdZloxiz4vCbl/mth/91/inciy3KyNX+DPuVB1AMwV0zg==
X-Google-Smtp-Source: AGHT+IGQPx+MRRgO3OR+PNUAjzL6sla03HIHQDAWZKS/3LTnmIqHh2Q+bv91LMbYI+J4twu8UXhkTw==
X-Received: by 2002:a05:620a:911:b0:785:469c:3ef5 with SMTP id
 v17-20020a05620a091100b00785469c3ef5mr11804690qkv.13.1707190490847; 
 Mon, 05 Feb 2024 19:34:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW3wzN/AU0i3Xi3NsJDWXYFJIPmS6X6baNCp7YGKHgLe+OW5Vacmn05ibJCEf6xloCoc/9IcZEyvSv8paErQ3uZ/TjFo/UpzUYoTonDD/c1tGJFphyu7KpKEC1u8E5vpRSHAWiKXxf8n7+RSSzE
Received: from localhost.localdomain (61-216-248-199.hinet-ip.hinet.net.
 [61.216.248.199]) by smtp.gmail.com with ESMTPSA id
 a2-20020a05620a02e200b007853f736893sm551985qko.5.2024.02.05.19.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:34:50 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:34:36 +0800
Message-Id: <20240206033436.38436-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707190491; x=1707795291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BonMA9A7SCmtBAjj6oamP9nqNFawOcfqKm2Z5FdQABI=;
 b=kVdRZ2djuuS0qpB/dAgGM88TKg+OU4BKHL3SA5mbaIjXlk/waHY3hSbdaOcAVyYheJ
 OcMLe6TFa2ueOg0bQJk05IMT8jh2f7YgpvXMxXAXwzn5odKt5T46dBl1aQbmHqv9qCoC
 xW6Ii60Z0qte1LPqgQQtYw4FR7YPL7rSV+lQAiegUUd9Ajlu+vlgpKWJlpx1MaJ2VZtV
 aKbL6Me9/Es/XcLqixdB/h2Yc9om4iu67MDoRjHBWb7NJlnWwL0rB7Gvut2qpEkN/YsN
 XJ0DQ1AU5j+z9yfbaoQFqMgw8vUZefN3Nf7/x3UOB6fvE6bhYOh+ZEQWbXcqpsSjScOH
 X+Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kVdRZ2dj
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

This is a new defconfig for cubieboard4. The following is board's
detail.
- SOC: sunxiA80.
- DRAM: 2GiB DDR3 @ 672MHZ.
- NAND: 8GBeMMC
- Power: DC 5V.
- Network: Wifi 80211 b/g/n.
- Ethernet: RTL8211E
reference:
https://linux-sunxi.org/Cubietech_Cubieboard4

Board support package includes the following components:
- mainline Linux Kernel 6.6.8
- mainline U-boot 2021.10.

Signed-off-by: Nigel Wang <asd617140123@gmail.com>

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
