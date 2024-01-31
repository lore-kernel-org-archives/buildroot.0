Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA63C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 17:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 748DA4039D;
	Wed, 31 Jan 2024 17:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748DA4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTrVrxfa5P7U; Wed, 31 Jan 2024 17:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36CD240465;
	Wed, 31 Jan 2024 17:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36CD240465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF1601BF2A3
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A861281295
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 17:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A861281295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqkAckeLx4en for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 17:38:33 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B18FF81381
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 17:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B18FF81381
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40faf6788d1so7100605e9.0
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 09:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706722710; x=1707327510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQpWNH9owTBK0nIejHJmjIUsjizWoJUGQ7enZsKw0qk=;
 b=qCkEvpbm4dNK+LzdnmaraTrI8jtpF247gv81XofnsH/SeWHiLs455vrhaTiIVuKk69
 bQnLWKwH0sX7OJdEivH5FzxvpPZ1R/1Y7YuXak2cYLJrVvguW4Ket5rtD/fy4PytAQOZ
 kZ7luiuPIyjkpspzVwEzqIF70j7O2QmObj79zsRf+n5MUdZ2m2UuM4bhf0p9r6nQCxv/
 gAPKQkMZk+4jIl4+DlEqpzHjHezAlOLsCYt7vse+U1qtB3k07fs0PcshrsT6XegRu47P
 iNiewQQZoQclpAUNY4ZoYxDzAyuy5XJEak+tStkT0K/VNLw8lY65K+QL9lK6ONBOYMfb
 Dm5w==
X-Gm-Message-State: AOJu0YzoWrB7zHjARGyP1KORZt4Dt3xO8Bo1gIm+d5kA48cwqtbx+9V1
 u+3ukGEOOA9SnOKjwnr0byDtjblvh3HxTfVxSGfubXuIP34NrmvVr6VZ4uNY40LZCSW6oPJ5qG4
 v
X-Google-Smtp-Source: AGHT+IH1qlChRXb8jeUzIgIQrxvV7/xsZncG1EvnO4YR1EiHkRW/oxxCRFkt65qpBWD+i9uMaRt6oA==
X-Received: by 2002:a5d:6608:0:b0:337:d84c:1d6 with SMTP id
 n8-20020a5d6608000000b00337d84c01d6mr4708016wru.18.1706722710549; 
 Wed, 31 Jan 2024 09:38:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a05600c46d200b0040efd192a95sm2190662wmo.1.2024.01.31.09.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:38:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 18:38:27 +0100
Message-ID: <20240131173827.1281120-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706722710; x=1707327510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQpWNH9owTBK0nIejHJmjIUsjizWoJUGQ7enZsKw0qk=;
 b=j1af1jXZEgcY/6RomGqwCq9zD161C1gjpPYiiC2rECnRtt3X3/Z0d4JUeZ2rVkkR2Y
 LfVtNGHJL2Fpek11zuMSeZT46LjalhIKmwHP4tu6LaUMTVVGaEWWubkqVd/KHT6ptAi1
 7mXk/8gBDDelJ4uIU+o9bKmNMU3vH1fEIPuAh2XOfR1d3lCWcU5uk2Cs7hx5QHMNVHbQ
 29pIvAAqDs/yn2jTBjDkpt8TfE5fozgVPrBg2wz4N6zZI6jTtazMecrXtqQzcEOqkfWV
 5AE9lyP0+8miX+pk/F0h2nuVauTYWE0Nepp3omUjybBgFLgmGNjeeaxdxOCCWX3h0EKr
 pyYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=j1af1jXZ
Subject: [Buildroot] [PATCH] configs/am574x_idk_defconfig: new defconfig
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

This patch adds a basic support for AM574x Industrial Development Kit
[1].

Use multi_v7_defconfig as kernel configuration file instead of
the deprecated omap2plus_defconfig [2].

The main differences between upstream kernels and the TI vendor tree
(5.10.x based) are:

  - pru based 100M ethernet ports will not work with upstream kernels
  since the prueth driver for AM57 is not upstream yet (as of 6.8-rc2)
  [3].

  - The ARM/DSP examples provided by TI [4] will not work either since
  they requires an experimental patch [5] adding "remote-processor
  messaging sockets".

  - There is no support for the POWERVR GPU SGX544 that requires
  additional userpace vendor (closed source) libraries.

[1] https://www.ti.com/tool/TMDSIDK574
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cca9f6838bac3441a42fa906314bf5e3bff50ac5
[3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=792b57aac224416f66175c15d60379a4cf581d0f
[4] https://git.ti.com/cgit/processor-sdk/big-data-ipc-examples
[5] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=f4b978a978c38149f712ddd137f12ed5fb914161

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am574x-idk/extlinux.conf |  4 +++
 board/ti/am574x-idk/genimage.cfg  | 30 +++++++++++++++++++++
 board/ti/am574x-idk/post-build.sh |  4 +++
 board/ti/am574x-idk/readme.txt    | 28 +++++++++++++++++++
 configs/am574x_idk_defconfig      | 45 +++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 board/ti/am574x-idk/extlinux.conf
 create mode 100644 board/ti/am574x-idk/genimage.cfg
 create mode 100755 board/ti/am574x-idk/post-build.sh
 create mode 100644 board/ti/am574x-idk/readme.txt
 create mode 100644 configs/am574x_idk_defconfig

diff --git a/board/ti/am574x-idk/extlinux.conf b/board/ti/am574x-idk/extlinux.conf
new file mode 100644
index 0000000000..29e0ecfa14
--- /dev/null
+++ b/board/ti/am574x-idk/extlinux.conf
@@ -0,0 +1,4 @@
+label am5749-idk-buildroot
+  kernel /zImage
+  fdtdir /
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
diff --git a/board/ti/am574x-idk/genimage.cfg b/board/ti/am574x-idk/genimage.cfg
new file mode 100644
index 0000000000..02a9ffe013
--- /dev/null
+++ b/board/ti/am574x-idk/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"am574x-idk.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 1G
+	}
+}
diff --git a/board/ti/am574x-idk/post-build.sh b/board/ti/am574x-idk/post-build.sh
new file mode 100755
index 0000000000..5dcdb352eb
--- /dev/null
+++ b/board/ti/am574x-idk/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
diff --git a/board/ti/am574x-idk/readme.txt b/board/ti/am574x-idk/readme.txt
new file mode 100644
index 0000000000..4869984cf1
--- /dev/null
+++ b/board/ti/am574x-idk/readme.txt
@@ -0,0 +1,28 @@
+Texas Instuments AM574x IDK Test and Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the TI AM574x IDK
+board: https://www.ti.com/tool/TMDSIDK574
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make am574x_idk_defconfig
+
+Compile everything and build the USB flash drive image:
+
+    $ make
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
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
new file mode 100644
index 0000000000..bbae73dff4
--- /dev/null
+++ b/configs/am574x_idk_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
