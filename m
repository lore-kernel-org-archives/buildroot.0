Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E2C48260
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 03:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9BC74189E;
	Tue,  6 Feb 2024 03:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9BC74189E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsUuWqqlTbri; Tue,  6 Feb 2024 03:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087814188F;
	Tue,  6 Feb 2024 03:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087814188F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 354721BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 03:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ADDB4188F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 03:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADDB4188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLMYsWBgGldk for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 03:33:20 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AA874187F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 03:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA874187F
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-429de32dad9so29259221cf.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 19:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707190399; x=1707795199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FMDpjF53A+TS9r40haljn5zv0rtDoNSTiWrZJ7DmnA=;
 b=KkeGtubO2kLEyCzWMBMVkERTqOyMLd5RLjYYevXsLK4RkKk7+YSEZ9w6Au0y+4jYnA
 sU2AaiPeUi40bQsoeJaWdCi7FyP73cRqYPvcX8EqKRlYr884mRryzfTFtK7VAuvF4Brc
 O5HOSVmsIQSmw12jV+ARUcYSkemyTbJohAUHLWhRLiw0mU3frSlmbbZESC5lZNqqHWac
 6M1n8win7VRuXIczurcuMYTQ35nUWHHg6rdZK0OjLjvM7Tku3tdd9qPOH3jsP0a/hB/l
 RB5SRqAq8zxB6Xso0PYusOp54howhsy+njkOU9iy823w0P5sKLluGkVxEF0IM+B4nLlk
 CC7g==
X-Gm-Message-State: AOJu0YzPD+vlTbAk5ebP61BN9GsOREsOUZRqmXpKaumm8062HIfMZzfX
 yWCqy1/EqNlfMxqKO+NqNDAoG4ZmqhkirL5o28Ll/O9xEwKCL/sd8I8iF1epIct3cw==
X-Google-Smtp-Source: AGHT+IEdtcJ9ZELmVcC2YDia8vu1YhXBtQmr5luSh43vrTxqKXNYyMK7W/XRAvGu47Ph8eb/YZYgTA==
X-Received: by 2002:ac8:7f42:0:b0:42b:fd5b:a48c with SMTP id
 g2-20020ac87f42000000b0042bfd5ba48cmr1388170qtk.2.1707190398510; 
 Mon, 05 Feb 2024 19:33:18 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWO4Tlpw8+8101FI28DdubYXEPCZ3lcMBZdWI074A8xps/5qCX0R2nE9zn1GhJpIAFW+kMk1TBnnR/xPQksU35CoSdWfusLHTHVtGBHpX4GXLO5FYlYT8pJWnwpaAbE8OM8/7IaVktMPn56zvxu
Received: from localhost.localdomain (61-216-248-199.hinet-ip.hinet.net.
 [61.216.248.199]) by smtp.gmail.com with ESMTPSA id
 g5-20020ac84dc5000000b0042a41b27d3fsm525072qtw.90.2024.02.05.19.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:33:18 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:33:03 +0800
Message-Id: <20240206033303.38280-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707190399; x=1707795199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3FMDpjF53A+TS9r40haljn5zv0rtDoNSTiWrZJ7DmnA=;
 b=Dkgi5EUxesMZO/bHZaJE7hUJgkVTDVsNtinOpfyn6bJSVRKXia6qdSP5KdySYEFoih
 mhuSQkWrH3cWZoKVawRN+g2huyumPy2MikXWTVk3+LKNU7lrBEtS/rvOzwKQHRq7NEww
 omVxqouL6hbU64QpFpQ8EJxOnO8vijyhkrptq+dqY79zBf2DBHoxekhkIEUaOQUl1ZuL
 8olVEVuDCZLze5R7k3SzOrSc6OBG7vJ37eOmavFqGP8KOYACdE+M2s1WU9x6r+OJPjQM
 QF85lZEYB2kYxzcI6JyY8WPbkgCEeWTrsl5RA36cHzvxRBHn4v3Opff/iYX4DZbp3pIZ
 Uv+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dkgi5EUx
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

configs/cubieboard4_defconfig : add defconfig for cubieboard4.

board/cubietech/cubieboard4/extlinux.conf: using the config to make
device can boot uboot/kernel correctly.
board/cubietech/cubieboard4/genimage.cfg: Adjust boot dtb/sdcard memory
layout.
board/cubietech/cubieboard4/post-image.sh: using extlinux.conf in the
file, it can use "genimage" to generate sdcard image.
modified: configs/cubieboard4_defconfig: remove unnecessary option.

Replaced boot.cmd by extlinux.conf.
Append name in DEVELOPERS file.

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
