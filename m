Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB304C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:11:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D39961353
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D39961353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 781F36086C;
	Mon,  8 Nov 2021 22:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ewcLxZ8QUf5; Mon,  8 Nov 2021 22:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C802B60867;
	Mon,  8 Nov 2021 22:11:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7491BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 302644034F
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJi41OVJSH_X for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F4AF40332
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2B6648B708; Mon,  8 Nov 2021 22:02:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11ec7c558e49eb41a0f2313d5a042acb776964c8
X-Git-Newrev: 76421d8eed9b0606a0a58135dcf8bd78f8a041fc
X-Patchwork-Hint: ignore
Message-Id: <20211108220212.2B6648B708@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/raspberrypi/genimage-raspberrypi0w.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=76421d8eed9b0606a0a58135dcf8bd78f8a041fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/raspberrypi/genimage-raspberrypi0w.cfg | 49 ++++++++++++++--------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
index f76256ef8a..de7652f99e 100644
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -1,31 +1,32 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-zero-w.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2708-rpi-zero-w.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
+			"zImage"
+		}
+	}
+
+	size = 32M
 }
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
