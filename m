Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC79E743EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A1F83C2B;
	Fri, 29 Sep 2023 07:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A1F83C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oCBmq1vMqOK; Fri, 29 Sep 2023 07:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0271683C24;
	Fri, 29 Sep 2023 07:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0271683C24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3E71BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 150B383C0A
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 150B383C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Akfnav7Rpdvf for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D80FF83C27
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80FF83C27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B5D82D98; Fri, 29 Sep 2023 07:14:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 09:12:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e37ee5acdcebb59c0bcc89eca69540cea2ed441d
X-Git-Newrev: fc5cdeed724174d248dd1f979acea40af6e344ce
X-Patchwork-Hint: ignore
Message-Id: <20230929071414.C6B5D82D98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: drop variant-specific
 genimage files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc5cdeed724174d248dd1f979acea40af6e344ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a template generating an equivalent genimage configuration.

The generated genimage is identical to these +/- file ordering and a
trailing comma / newline that is ignored by genimage, E.G. for rpi3-64:

@@ -8,9 +8,10 @@
                        "rpi-firmware/cmdline.txt",
                        "rpi-firmware/config.txt",
                        "rpi-firmware/fixup.dat",
-                       "rpi-firmware/start.elf",
                        "rpi-firmware/overlays",
-                       "Image"
+                       "rpi-firmware/start.elf",
+                       "Image",
+
                }

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi.cfg         | 33 ---------------------
 board/raspberrypi/genimage-raspberrypi0.cfg        | 32 --------------------
 board/raspberrypi/genimage-raspberrypi0w.cfg       | 32 --------------------
 board/raspberrypi/genimage-raspberrypi2.cfg        | 32 --------------------
 board/raspberrypi/genimage-raspberrypi3-64.cfg     | 34 ----------------------
 board/raspberrypi/genimage-raspberrypi3.cfg        | 34 ----------------------
 board/raspberrypi/genimage-raspberrypi4-64.cfg     | 31 --------------------
 board/raspberrypi/genimage-raspberrypi4.cfg        | 31 --------------------
 board/raspberrypi/genimage-raspberrypicm4io-64.cfg | 31 --------------------
 board/raspberrypi/genimage-raspberrypicm4io.cfg    | 31 --------------------
 board/raspberrypi/genimage-raspberrypizero2w.cfg   | 32 --------------------
 11 files changed, 353 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
deleted file mode 100644
index 04be16cce6..0000000000
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ /dev/null
@@ -1,33 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-b.dtb",
-			"bcm2708-rpi-b-plus.dtb",
-			"bcm2708-rpi-cm.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
deleted file mode 100644
index 313f85f651..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-zero.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
deleted file mode 100644
index de7652f99e..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-zero-w.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
deleted file mode 100644
index dad9275537..0000000000
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2709-rpi-2-b.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
deleted file mode 100644
index 8cbcd91638..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-3-b.dtb",
-			"bcm2710-rpi-3-b-plus.dtb",
-			"bcm2837-rpi-3-b.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
deleted file mode 100644
index a617823379..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-3-b.dtb",
-			"bcm2710-rpi-3-b-plus.dtb",
-			"bcm2710-rpi-cm3.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
deleted file mode 100644
index 3ae938db20..0000000000
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-4-b.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
deleted file mode 100644
index 2e578ad556..0000000000
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-4-b.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
deleted file mode 100644
index 73d31a57ba..0000000000
--- a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-cm4.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
deleted file mode 100644
index 4d09b03556..0000000000
--- a/board/raspberrypi/genimage-raspberrypicm4io.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-cm4.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypizero2w.cfg b/board/raspberrypi/genimage-raspberrypizero2w.cfg
deleted file mode 100644
index b510fea563..0000000000
--- a/board/raspberrypi/genimage-raspberrypizero2w.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-zero-2-w.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
