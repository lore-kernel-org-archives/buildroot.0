Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72518C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C228D60C14;
	Tue, 20 Feb 2024 22:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXKv9F53t_7q; Tue, 20 Feb 2024 22:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E6460C2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E6460C2C;
	Tue, 20 Feb 2024 22:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7281BF29D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C2A6606CB
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSbD4EsjgInP for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 22:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA49A60659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA49A60659
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA49A60659
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 22:50:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4125e435b38so30051205e9.0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 14:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708469429; x=1709074229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+voblAXtBogndz4llWIhuXOaA4xoIVct/YWoD/3sRE=;
 b=OKdAZGKs+ioZ3CdCsvt1LORXQawhQ8AyToMUalt0cE1HOprq7mbzTCawLG1ZPIpCty
 ZjhIJlI1mGckVpnVhOj5BL86pYbFflBTfcAIlS/w1j4x+oC4jDIb++vw5hUqWnNVzwIw
 dtcFkYIQkug03kbeqOSpy8HbSJ8Jw7GUd2ydQ0XiJINty+BGy6UONyxQuTI+Vci1G3W6
 9rMN2A7ulxsAVRM5uhFeOjZj33GdNXm3MSuT7YQ1Zf8luAVdlG6JfGAfvGgiPdZeKBZs
 8nT7rlVdLPUk3tec6e2kMzHVKe8phvV4LRVSRgEKwrCCrVa16CMXvLj9TCl8ykDrF6gl
 O/ag==
X-Gm-Message-State: AOJu0Yz+PH+lViKA4CLW9J+oCTBB23TzIfC6YNncZBrciR5ByPe/EGpu
 T+BWw2obIKfoNGA1hk5r1CQxSCkkAfprhyKQzbQLRML3IJ1XSKYXXKPV10jbKfcQwintYAsxEts
 p
X-Google-Smtp-Source: AGHT+IE+nTv9sX3qnbvJbnrLsU5baJxe8Qsh8YtjQKexq4rZblVpZr2KRBgFI/skTUJ4DR3CNPb0vg==
X-Received: by 2002:a05:6000:70c:b0:33d:34a9:94d with SMTP id
 bs12-20020a056000070c00b0033d34a9094dmr7170992wrb.62.1708469428769; 
 Tue, 20 Feb 2024 14:50:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d5184000000b0033b4f82b301sm15060057wrv.3.2024.02.20.14.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:50:28 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 23:50:25 +0100
Message-ID: <20240220225025.781466-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220225025.781466-1-romain.naour@smile.fr>
References: <20240220225025.781466-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708469429; x=1709074229;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+voblAXtBogndz4llWIhuXOaA4xoIVct/YWoD/3sRE=;
 b=btI7rg8Vt8hcaZdebbO08v5ZzMrljLb/lJCnigHwzDXjhj5DFQmwIGhYO7lodWCq7w
 J2HmqxAsxY0FTqQUcIE/arf0zZgKUvPKt5sRJi90HzN9nYD9iiSW7i3Yz0efFjs4koH4
 sDUeOr51CB0MMVuUM+//yDAdCyCYWYklTSSvDcM4itnLSOLEKHU7kcZm6d/azWZNvOR9
 DoLczlQfZZfcVG0fWZQRXPmBS7fDwS6qeKkkLQ20U1BdIMVqtz4c5cHwTeXCouWhSwAg
 UpFEliHyr3GYOdOC5RQL9HXBJ0QGAm/g5yK6KVx6zRd/S74rKxP5RUIqT4LWAtcKeRKI
 MZ3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=btI7rg8V
Subject: [Buildroot] [PATCH] configs/lepotato_defconfig: new defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add basic support for the Libre Computer "Le Potato" SBC.

https://libre.computer/products/aml-s905x-cc

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                 |  2 +
 board/librecomputer/lepotato/extlinux.conf |  4 ++
 board/librecomputer/lepotato/genimage.cfg  | 33 +++++++++
 board/librecomputer/lepotato/post-build.sh |  5 ++
 board/librecomputer/lepotato/post-image.sh | 23 ++++++
 board/librecomputer/lepotato/readme.txt    | 82 ++++++++++++++++++++++
 configs/lepotato_defconfig                 | 50 +++++++++++++
 7 files changed, 199 insertions(+)
 create mode 100644 board/librecomputer/lepotato/extlinux.conf
 create mode 100644 board/librecomputer/lepotato/genimage.cfg
 create mode 100755 board/librecomputer/lepotato/post-build.sh
 create mode 100755 board/librecomputer/lepotato/post-image.sh
 create mode 100644 board/librecomputer/lepotato/readme.txt
 create mode 100644 configs/lepotato_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ff44741f9f..b44246ee5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2667,9 +2667,11 @@ F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
+F:	board/librecomputer/lepotato/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
+F:	configs/lepotato_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
diff --git a/board/librecomputer/lepotato/extlinux.conf b/board/librecomputer/lepotato/extlinux.conf
new file mode 100644
index 0000000000..e0fea6c7aa
--- /dev/null
+++ b/board/librecomputer/lepotato/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /meson-gxl-s905x-libretech-cc.dtb
+  append console=ttyAML0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/librecomputer/lepotato/genimage.cfg b/board/librecomputer/lepotato/genimage.cfg
new file mode 100644
index 0000000000..b10e5d9440
--- /dev/null
+++ b/board/librecomputer/lepotato/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"meson-gxl-s905x-libretech-cc.dtb",
+			"extlinux"
+		}
+
+		label = "boot"
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image="boot.vfat"
+		size = 64M
+		offset = 2M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 128M
+		offset = 0
+	}
+}
diff --git a/board/librecomputer/lepotato/post-build.sh b/board/librecomputer/lepotato/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/librecomputer/lepotato/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/librecomputer/lepotato/post-image.sh b/board/librecomputer/lepotato/post-image.sh
new file mode 100755
index 0000000000..69fb382dc1
--- /dev/null
+++ b/board/librecomputer/lepotato/post-image.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
+
+AMLOGIC_DIR=${BINARIES_DIR}/amlogic-boot-fip
+FIP_DIR=${BINARIES_DIR}/fip
+
+mkdir -p "${FIP_DIR}"
+
+(cd "${AMLOGIC_DIR}" && \
+	./build-fip.sh lepotato \
+	"${BINARIES_DIR}"/u-boot.bin \
+	"${FIP_DIR}")
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=1 count=444
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=512 skip=1 seek=1
diff --git a/board/librecomputer/lepotato/readme.txt b/board/librecomputer/lepotato/readme.txt
new file mode 100644
index 0000000000..391b030e1f
--- /dev/null
+++ b/board/librecomputer/lepotato/readme.txt
@@ -0,0 +1,82 @@
+Libre Computer Le Potato (AML-S905X-CC)
+
+Intro
+=====
+
+Libre Computer "Le Potato" is a low cost SBC based around an Amlogic
+s905x SoC (quad A53), 2GB DDR3, Mali-450:
+
+https://libre.computer/products/aml-s905x-cc/
+
+How to build it
+===============
+
+Configure Buildroot:
+
+  $ make lepotato_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile everything and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+output/images/
++-- amlogic-boot-fip
++   +-- axg.inc
++   +--  build-fip.sh
++   +--  g12a.inc
++   +--  gxbb.inc
++   +--  gxl.inc
++   `-- lepotato
++       +-- acs.bin
++       +-- acs_tool.py
++       +-- aml_encrypt_gxl
++       +-- bl21.bin
++       +-- bl2.bin
++       +-- bl301.bin
++       +-- bl30.bin
++       +-- bl31.img
++       +-- blx_fix.sh
++       `-- Makefile
++-- boot.vfat
++-- extlinux
++   `-- extlinux.conf
++-- fip
++   +--  u-boot.bin
++   +--  u-boot.bin.sd.bin
++   +--  u-boot.bin.usb.bl2
++   `-- u-boot.bin.usb.tpl
++-- Image
++-- meson-gxl-s905x-libretech-cc.dtb
++-- rootfs.ext2
++-- rootfs.ext4 -> rootfs.ext2
++-- rootfs.tar
++-- sdcard.img
+`-- u-boot.bin
+
+The post-image script uses the files in the amlogic-boot-fip folder to sign
+the bootloader image before integrating it into the sdcard image.
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the micro SDcard into your Le Potato and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/lepotato_defconfig b/configs/lepotato_defconfig
new file mode 100644
index 0000000000..e144fd5197
--- /dev/null
+++ b/configs/lepotato_defconfig
@@ -0,0 +1,50 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/librecomputer/lepotato/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/librecomputer/lepotato/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.17"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s905x-libretech-cc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# For kernel modules autoloading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="libretech-cc"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tool to sign the bootloader image
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE="lepotato"
+
+# Required tools to create the SD image
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
