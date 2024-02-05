Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD46C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD180404A8;
	Mon,  5 Feb 2024 13:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD180404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6deIZLaw3uj; Mon,  5 Feb 2024 13:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 753A2409E6;
	Mon,  5 Feb 2024 13:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753A2409E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5D01BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A643415BA
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A643415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIdLW72t0ygK for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:58:47 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04DD3408A9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04DD3408A9
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e03c50dc68so256197b3a.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707141526; x=1707746326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BlRsjgMj1e7Wah3xISW6O+OGtKNokULEsSoq7c5Gow=;
 b=JhN1On8+EuyCCBM4d5KIfz7MKvIvAFIt2jowAFzN7NEWJvxhD94WxMQQk4vHMtg+66
 sZgblhbIquxMe167iGEjL8fxI69GvnkiKJdCr2LwaUglWaTcmAkvbt1eauyr8jBcDSSs
 NzROLLUOgexrBztMJ4uBhFKWjTo+ltt4TL1bx3Tmh7jxqu5STEjGzau5XmJyk42Wn7a5
 48Fy5+KsxU6xQhBZ+GeX6VoVgXXSpH2hnxPHjlxKiFIn08YbXR4ntZ0Z7/VWPnNcWxOz
 zgpEeW+j0Q93os9nQJs7Ub7bKAl43qguIan4n+ExVDrw524ny4/dPyf+LXrSZoyHxXNm
 A0DQ==
X-Gm-Message-State: AOJu0Yydlyn9T6/PGH724u8IUIfwc4ZyfDDZGhpbB004LFjnrn0alpIY
 zVPOB1SKmLXbVG4ul3/NzKY8/KD78Pnsdck6COGq6F7actNWg+IILY22+ZVJeEnZsw==
X-Google-Smtp-Source: AGHT+IG9FMAE5rMipG6qTZMcd2gp5OhNUipnl0kjMeDRSjNSFpwz0Bm1LJsdNWHPJ5ob6DgxXS0dUw==
X-Received: by 2002:a05:6a00:188f:b0:6e0:4c3b:3b5c with SMTP id
 x15-20020a056a00188f00b006e04c3b3b5cmr1726519pfh.4.1707141525786; 
 Mon, 05 Feb 2024 05:58:45 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUVcCTERpJlgpGi/xq6sxvzlTpKOMXo+bKckp7N3IKWPBH9LA8ln41govmuHG0aDlZFVB6AS48qk/Dn+OJfpu0tJMCK/NptbdHouwfOGpzQ2eUhPjEoBShb91OYiUWdCGAuzrYyuqVfzijslw==
Received: from localhost.localdomain (122-116-32-72.hinet-ip.hinet.net.
 [122.116.32.72]) by smtp.gmail.com with ESMTPSA id
 n41-20020a056a000d6900b006e02da3a158sm4348943pfv.17.2024.02.05.05.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 05:58:45 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 21:58:31 +0800
Message-Id: <20240205135831.34656-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707141526; x=1707746326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6BlRsjgMj1e7Wah3xISW6O+OGtKNokULEsSoq7c5Gow=;
 b=idTrog1chaymfPzlPpJ+e/UQRuF9krmCZtTkR4AED/yyrhjHeqDQMVOVmsXkZGdC9F
 aX9vtcdPnaSpKtsxFApELgXoSo1TaXyAaQDSHH6tm2PW+utCgjldm+4vUtAk9kQbbHgw
 e1/X0HSBTgdEHfQ+ZjOQbs9WCbCBDVFc1RDImqCbxaRZW1iF0zdE090vTsVM7Am0jyRo
 hM3sGkKlMYGYv7vF4yD3j6vCFcVGXiP+OUi1SukIp3pup4tilTqdBxyVzcDbjLFrhqUD
 BHJTUdDNcCemeCREcHuZwx6aTt8NAzGhv8o2SgaqpC9jOklZK5y6GPiH1ZVv+Y4E44zi
 yspw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=idTrog1c
Subject: [Buildroot] [PATCH 1/1] board/cubietech/cubieboard4 : Add config
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
v3 -> v4
* squash all commit, make the commit log is clear.

v2 -> v3
* Add BR2_cortex_a15_a7=y in buildroot defconfig.
* Bump linux version to 6.6.8
* Using sunxi_defconfig in kernel.
* Using "make savedefconfig" to save defconfig, it can only save the
changed config in buildroot.
* Change kernel's path in extlinux. Make it can boot up successfully.

---
 board/cubietech/cubieboard4/boot.cmd      |  5 +++
 board/cubietech/cubieboard4/extlinux.conf |  5 +++
 board/cubietech/cubieboard4/genimage.cfg  | 38 ++++++++++++++++++++++
 board/cubietech/cubieboard4/post-image.sh | 18 +++++++++++
 configs/cubieboard4_defconfig             | 39 +++++++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 board/cubietech/cubieboard4/boot.cmd
 create mode 100644 board/cubietech/cubieboard4/extlinux.conf
 create mode 100644 board/cubietech/cubieboard4/genimage.cfg
 create mode 100755 board/cubietech/cubieboard4/post-image.sh
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/board/cubietech/cubieboard4/boot.cmd b/board/cubietech/cubieboard4/boot.cmd
new file mode 100644
index 0000000000..6521243696
--- /dev/null
+++ b/board/cubietech/cubieboard4/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun9i-a80-cubieboard4.dtb
+bootz $kernel_addr_r - $fdt_addr_r
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
