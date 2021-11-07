Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB05CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA17D617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA17D617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9733A6066C;
	Sun,  7 Nov 2021 02:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgdEv35ZQmDL; Sun,  7 Nov 2021 02:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49A960620;
	Sun,  7 Nov 2021 02:40:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD471BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EC24022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xp256a3vadX for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:39:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02D93400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:39:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY68munSWFf01jY68mqTFJ; Sun, 07 Nov 2021 03:39:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252796; bh=taRDr8rGSzV7WGgxoEbb6b92EIECeYauPOPiGHd/31M=;
 h=From:To:Subject:Date:MIME-Version;
 b=j6f7G1HigML5THRnQkRb5LNEULWUjW6kOXLQ/U7viBDSBBdd1+yCjl/rDp67xZEKk
 s2qk3+MjWH2IozGTDVpZ1GRdmYIhBj7HgASuw86NCkIBksx5VETNCFmFn7L7Je+urt
 IbvmQ3iwtdK+lwd0SjEZCgOPt7aau/JS/sbGw7bcdQvA32XLYy16bXByTb/IRblSN8
 ptjPwoq3WEn5pwsR/Owj719EdGLi6noLW6/7rNeoekQXPO/MnLB16kxAU/wglEFkMb
 Jrhsg3/NQ9yRyN1oCWn3JhfSZS3gxqF2ejpk0mj1Q/8bXhlKQz5v/b29bT5beCHa5b
 W0EjYstLDHV1g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:39:53 +0100
Message-Id: <20211107023953.3060728-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPyFTdHpdycd/zFWVnZn2gYZnAg336qrm6wEI2dGRKDnqnEL7kz8Hi7lBnwJ8jK/Y94n0gRd4cbBDvyCaZBrUTIDqPpqviZeo66YnLB9Y4erC6VV9O5k
 iM8Tmc5xeBpL734OwTrf7Ma7iQdyPiT48A1fOWC287svk088y+sBYIawzCP/PKDpfv3Hh6lNdi9juxJgQztqJDxz263rw85WOUNO5CRk3Ib3oNo2bbme74ya
 XbDabSpIQNY2MpSaQ8ofJj3SwxNppuU9rJxXVSXkuOE=
Subject: [Buildroot] [PATCH 043/102] board/lego/ev3/genimage.cfg: beautify
 file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/lego/ev3/genimage.cfg | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 14880e8f11..3eaf3915bb 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -5,8 +5,8 @@
 # The Flash image
 
 flash nor-16M-256 {
-	pebsize = 4096
-	numpebs = 4096
+	pebsize = 4K
+	numpebs = 4K
 	minimum-io-unit-size = 256
 }
 
@@ -14,24 +14,28 @@ image flash.bin {
 	flash {
 	}
 	flashtype = "nor-16M-256"
+
 	partition uboot {
 		image = "u-boot.bin"
 		size = 256K
 	}
+
 	partition dtb {
 		image = "da850-lego-ev3.dtb"
+		offset = 256K
 		size = 64K
-		offset = 0x40000
 	}
+
 	partition uimage {
 		image = "uImage"
+		offset = 320K
 		size = 4M
-		offset = 0x50000
 	}
+
 	partition rootfs {
 		image = "rootfs.squashfs"
+		offset = 4416K # 4M + 320KB
 		size = 10M
-		offset = 0x450000
 	}
 }
 
@@ -42,22 +46,26 @@ image boot.vfat {
 		file uImage {
 			image = "uImage"
 		}
+
 		file da850-lego-ev3.dtb {
 			image = "da850-lego-ev3.dtb"
 		}
 	}
+
 	size = 16M
 }
 
 image sdcard.img {
 	hdimage {
 	}
+
 	partition boot {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 4M
 	}
+
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext2"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
