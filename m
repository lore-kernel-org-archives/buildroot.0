Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1D8C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 14:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32B360846;
	Sun, 25 Feb 2024 14:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pjbh01YbFEcr; Sun, 25 Feb 2024 14:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC386081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC386081E;
	Sun, 25 Feb 2024 14:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB08E1BF422
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 14:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4EA44074E
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 14:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZANwXYNfPEhv for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 14:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C14AA4074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14AA4074D
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14AA4074D
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:04:41 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso1935166b3a.1
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 06:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708869880; x=1709474680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3fT1lHsfYKefRakwHREzZ+2CwK6i0l0q3/qMnma+Ig=;
 b=Bc2aHygaKCJZEGy1/MH02/kifckSi0DxoHNbgCIXc1I8F8eVRtwbBPeN/+Kvw7I3g6
 6no5iN6hd2UHmNtHyfNEbCY+2Z1OoR/TeJ/INBGbItRw1NdVXtCBWTtGrJ0QsB7zrjz9
 pOkI12Z91ysM5Ei9NcimSOOwiMqANNAqCxoBzV6oF/gv6bugvnJ5e+36jNB+aTsr1gGR
 SqMUcJK+IqP8XZaDvfEM18oW21dTbZ/SzZzh4KPcQJx5pcgmOAFeWheqDPrVjMaudonn
 mXruOJE6h/ggN8QiXlAhps8ZA9A1mAqjXhjMbOF6pJiLFdfOC1mbH/aW4OVHNKshXoJk
 ZYHA==
X-Gm-Message-State: AOJu0Ywz/0YQY+lKRiFJZm0D8ir9uZ92bDrz2ogq3GdtvcswxmvP1MP6
 1h03sygKE3Dc1ZO0IcrsVHlCl6uA6I9UeCT+gkwaJlvfnMnCfgt6IVjBUgw5YCo=
X-Google-Smtp-Source: AGHT+IE4iaMK87WZteE20vBXM1ubsAXr7+j7uBN8ac7ONuAPni8stwviZ1zH09JRppGXOeW4fDcUXg==
X-Received: by 2002:aa7:9ecb:0:b0:6e0:df2d:e7fe with SMTP id
 r11-20020aa79ecb000000b006e0df2de7femr4905093pfq.11.1708869879799; 
 Sun, 25 Feb 2024 06:04:39 -0800 (PST)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 w27-20020aa79a1b000000b006e4891d0e2bsm2362754pfj.7.2024.02.25.06.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 06:04:39 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 22:04:33 +0800
Message-Id: <20240225140434.7310-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223131603.2313178-1-fancp2007@gmail.com>
References: <20240223131603.2313178-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708869880; x=1709474680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3fT1lHsfYKefRakwHREzZ+2CwK6i0l0q3/qMnma+Ig=;
 b=ZAKA3rx1oZZIz8df4Er9QCyuFT4n2YNRJBEfCUBshGHu2ZBJomthc/chtQxpNt5IPF
 C8t37wgBXu1QyLNY1i4PjF+ENGxUL+a7cjLfwTS1bL1/w6vE2aUxqldlAhYwyngGH+kJ
 FHcm8JARRhejkJjX/HvqcoG4cxWJd8c2OB0lDYo02Ne8yEuGCmRP4CyDUSh8bZJ5bU8P
 PMuvnQNMfxWeA0Ac1s5l4y9THimNawwv7QeTVvTgJ16Bpuwiwv5LoxiKxLxeOn/jn5Z7
 cBI0qEnNzdjyXyMGXhnNUH9jRxPnj1CZL+4Q8tBumsoPR9EC+Wzechl9mULQIx4riRbS
 Dj4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZAKA3rx1
Subject: [Buildroot] [PATCH v8] configs/friendlyarm_nanopi_neo2_defconfig:
 new board
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
Cc: giulio.benetti@benettiengineering.com, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the FriendlyARM NanoPi NEO2 with mainline components:
  - ATF v2.7
  - U-Boot 2024.01
  - Linux 6.6.18

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the ethernet driver
to be automatically loaded on boot. Otherwise, it will report the
'device not found' error while run the 'ifconfig eth0' command.

Board's wiki page:
  - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - Fix issues from 'utils/docker-run make check-package'
  - Add atf custom version in the defconfig
  - No need for sudo to run sync

Changes v2 -> v3:
  - Update patch file, add the upstream tag

Changes v3 -> v4:
  - Use a single integrated image file (u-boot-sunxi-with-spl.bin)
  - Remove patch file for uboot, switch to binman
  - Merge boot partition into rootfs partition
  - Bump kernel version to 6.1.61

Changes v4 -> v5:
  - Bump kernel version to 6.1.65

Changes v5 -> v6:
  - Bump kernel version to 6.6.17
  - Bump uboot version to 2024.01
  - Add option BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

Changes v6 -> v7:
  - Bump kernel version to 6.6.18
  - Add option BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
  - Resort sections in the defconfig

Changes v7 -> v8:
  - Update commit log to add ATF version
  - Update commit log to add explanation for the MDEV config
---
 board/friendlyarm/nanopi-neo2/extlinux.conf |  4 ++
 board/friendlyarm/nanopi-neo2/genimage.cfg  | 16 ++++++
 board/friendlyarm/nanopi-neo2/post-build.sh |  5 ++
 board/friendlyarm/nanopi-neo2/readme.txt    | 34 ++++++++++++
 configs/friendlyarm_nanopi_neo2_defconfig   | 57 +++++++++++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo2/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo2/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_neo2_defconfig

diff --git a/board/friendlyarm/nanopi-neo2/extlinux.conf b/board/friendlyarm/nanopi-neo2/extlinux.conf
new file mode 100644
index 0000000000..482a069f74
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/extlinux.conf
@@ -0,0 +1,4 @@
+label friendlyarm-nanopi-buildroot
+  kernel /boot/Image
+  devicetree /boot/sun50i-h5-nanopi-neo2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
new file mode 100644
index 0000000000..67e4e5efdb
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo2/post-build.sh b/board/friendlyarm/nanopi-neo2/post-build.sh
new file mode 100755
index 0000000000..c7ec875068
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${TARGET_DIR}/boot/extlinux/extlinux.conf"
diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
new file mode 100644
index 0000000000..c896a57525
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo2/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi NEO2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Wiki link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sync
+
+Insert the micro SDcard in your NanoPi NEO2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
new file mode 100644
index 0000000000..3118d45625
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -0,0 +1,57 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# System
+BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM NanoPi NEO2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo2/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
