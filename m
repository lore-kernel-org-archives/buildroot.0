Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DCFC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 17:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7026740AE8;
	Tue, 13 Aug 2024 17:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9M2r_p-cgQp; Tue, 13 Aug 2024 17:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8ABE403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8ABE403C4;
	Tue, 13 Aug 2024 17:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DE31BF5AD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 34165403C7
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id zui_IMX8JgrG for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 17:21:08 +0000 (UTC)
X-Greylist: delayed 489 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Aug 2024 17:21:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4142406F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4142406F9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.155;
 helo=out203-205-221-155.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id B4142406F9
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 17:21:07 +0000 (UTC)
Received: from localhost.localdomain ([106.120.7.242])
 by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
 id 3341AC12; Wed, 14 Aug 2024 01:12:52 +0800
X-QQ-mid: xmsmtpt1723569172tch0k9wdw
Message-ID: <tencent_96D562A129814C4EA71CECCDB60D1B060707@qq.com>
X-QQ-XMAILINFO: OW5zxOp0HHYwNRs+FGjzY+vkQ+1osi6+AsCAbOSeSpoKtjdCpHvzaWEtvHYBPb
 cOdfGrVqbrqDeD6VgKjZatd+6h6d5lleKDccPqA+toS+KTYLeQJ5ZkhdIaFCi60L+sk3bDN0eqi/
 cUjVOYltVnRvPi516+ajnx8ykz7qwMsLrkysTPEXyEwDHi7kAA/DqUdR9ihMtJ+eOF8aQb8hLgNa
 8BFo/yk1EpW0Tk8rj4ChZLIxZoTQP0HGJsbxx9653AGrK1G2E4kK732sRvJRQgtOtTpSLJPuNiNI
 TDqOCv4oFNc73SbY5qA4au0lHDEKFpZIkJ0fHfp1H815uqTCMPml2bKCUOJoJSw/6gsMgKbBRWYI
 8JzGMbJcve+VHNTf6rRbiMZI7bkh6nPAyGHeu+eU7YENFDfYZLENUoPYcjCp2jV8hBe4YUmS55su
 yHXVMnvCZnM89FtzLp/5hPIhTU4CSC9KA04mE+UA+SgBq6YfCuCvTiYN5JwhZAbjIYHCQrTfHl6c
 pG/N+DEUDxkPfxLXURDp5vY6Z/iJO6HAeBBRzS5BeoUnZoK6nhHh+MtYlLdNgcQBa1zcjSxFNRsu
 YuZncNRInDLvyDBtf6sWqYu5XFzL7sg3mrTuBlLehU1bdVYbtzUEsJBtAJbDUKKzAAh85dvVlfSV
 5sedUzdB5wB012dRFvW3HhNopIx+Shmf4ubvFvO1UabI8jaxf1tslMpnGYxxcO9QVRrFLjDGq8xR
 adVaevzm8CxEN+TMwS+D5kHWlaJxjw79w7UzFjAPeA1e3VOK2NQu3x1lfmzUjXp8k/F3y+0b/0jB
 z/SSwKwt+1EKSkDRFvbEv8MVQonO58mWSiYxNWYwl2Z3+/rHX7QVH/3C0VZvnVs+dw+mjlN7b9+D
 gnGzgAeCjmNVWFUqm8zDgubgeGCQadPG4T55POfs8Yzwa2f0O/K02jx4MlJaN++kKtbDvYwShl6g
 bGsiSxAC5yXsw/12KwpGZ84yvpthQBd1qmzM9LvyOoBWkJLuaS5C64uZ0FGZpol2uQzE503Jo=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 01:02:44 +0800
X-OQ-MSGID: <20240813170241.29243-1-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
References: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723569662;
 bh=Xup6ibh4Hs8B3W3kb3AuWOrr8GkLyZWIkm32/9ZxWzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mEtDJ6puCAqXndA+H7ppSXVFqxfvNvi8MIMopUN6tWyoRAydIUlWR9ygecs4N862V
 1ruSEvR3MIPgzmy2cMhzaIbx1K0Y3a/44eqm2rWJrdi3x+TW2hwMxxL4no9bmAb5kk
 5fTq9NB0P2cPJCrlstZ3G6U5tTa2RNrAgrdBgc1Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=mEtDJ6pu
Subject: [Buildroot] [PATCH v2] configs/friendlyarm_nanopi_neo_defconfig:
 new defconfig
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
Cc: Dong Wang <wangdong115@foxmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new defconfig for the NanoPi NEO board made by
FriendlyARM. This board is based on the Allwinner H3 SoC.

See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO

This patch uses the mainline kernel and u-boot for the board.

The configurations are based on the previously dropped defconfig
maintained by Yann E. MORIN <yann.morin.1998@free.fr>.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---

Changes v1 -> v2:
  - Use extlinux.conf instead of boot.scr (suggested by Thomas)
  - Drop boot.vfat partition (suggested by Thomas)
  - Remove 'size' argument for rootfs partition (suggested by Thomas)
  - Fix missing dependecies for uboot after running utils/docker-run
  - Add hashes for linux and uboot as suggested by check-package
  - Bump linux and uboot version 
  

 DEVELOPERS                                    |  4 ++
 board/friendlyarm/nanopi-neo/extlinux.conf    |  4 ++
 board/friendlyarm/nanopi-neo/genimage.cfg     | 17 +++++++
 .../friendlyarm/nanopi-neo/patches/linux.hash |  2 +
 .../friendlyarm/nanopi-neo/patches/uboot.hash |  2 +
 board/friendlyarm/nanopi-neo/post-build.sh    |  5 ++
 board/friendlyarm/nanopi-neo/readme.txt       | 41 +++++++++++++++
 configs/friendlyarm_nanopi_neo_defconfig      | 50 +++++++++++++++++++
 8 files changed, 125 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo/patches/linux.hash
 create mode 100644 board/friendlyarm/nanopi-neo/patches/uboot.hash
 create mode 100755 board/friendlyarm/nanopi-neo/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_neo_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..9eb54bc2bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -868,6 +868,10 @@ F:	package/logsurfer/
 N:	Dominik Michael Rauh <dmrauh@posteo.de>
 F:	package/gdal/
 
+N:	Dong Wang <wangdong115@foxmail.com>
+F:	board/friendlyarm/nanopi-neo
+F:	configs/friendlyarm_nanopi_neo_defconfig
+
 N:	Doug Kehn <rdkehn@gmail.com>
 F:	package/nss-pam-ldapd/
 F:	package/sp-oops-extract/
diff --git a/board/friendlyarm/nanopi-neo/extlinux.conf b/board/friendlyarm/nanopi-neo/extlinux.conf
new file mode 100644
index 0000000000..e65951f9d9
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi NEO linux
+  kernel /boot/zImage
+  devicetree /boot/sun8i-h3-nanopi-neo.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait panic=10
diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
new file mode 100644
index 0000000000..ec78fd0e56
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -0,0 +1,17 @@
+# Minimal SD card image for the NanoPi NEO.
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo/patches/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux.hash
new file mode 100644
index 0000000000..fe059dcd03
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/patches/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
diff --git a/board/friendlyarm/nanopi-neo/patches/uboot.hash b/board/friendlyarm/nanopi-neo/patches/uboot.hash
new file mode 100644
index 0000000000..e86d9c9b8a
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/patches/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
new file mode 100644
index 0000000000..cfe7714a41
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/readme.txt
@@ -0,0 +1,41 @@
+Nanopi NEO
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi NEO. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+FriendlyARM Nanopi NEO link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo_defconfig
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
+  $ sudo sync
+
+Insert the micro SD card in your Nanopi NEO and power it up. The console
+is on the debug TTL UART, 115200 8N1.
+
+Ethernet
+==========
+
+  # udhcpc -i eth0
+
+Enjoy!
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
new file mode 100644
index 0000000000..8d1dde247d
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -0,0 +1,50 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Host utilities
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
