Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA24CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:44:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A300E6134F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A300E6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D3C680DA9;
	Mon,  8 Nov 2021 22:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1x8igG3oT8I; Mon,  8 Nov 2021 22:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E0D80D9A;
	Mon,  8 Nov 2021 22:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEFB1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EFF7402E0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVcfaIZXxABE for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F1A4402F7
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 46C2A8A47B; Mon,  8 Nov 2021 22:08:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 26b1b9a7ede718fbfa6de78cf8b72a587a5f36ad
X-Git-Newrev: b2279c32c7325ce0d91e76e054fda54d9a43d408
X-Patchwork-Hint: ignore
Message-Id: <20211108220801.46C2A8A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/lego/ev3/genimage.cfg:
 beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2279c32c7325ce0d91e76e054fda54d9a43d408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
