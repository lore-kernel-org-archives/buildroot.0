Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925CAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A985619A6
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A985619A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3774A80F0F;
	Mon,  8 Nov 2021 22:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNBmqRRntl_b; Mon,  8 Nov 2021 22:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F72680F08;
	Mon,  8 Nov 2021 22:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6087F1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A902C4036A
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9d8jCU4YJfZi for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013FA40362
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B01AE8B718; Mon,  8 Nov 2021 22:08:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0d962a3668a7017ca65e809f61d420d2b4795afe
X-Git-Newrev: 20ee9419de7010be8830c01d0aaa7a470634ece7
X-Patchwork-Hint: ignore
Message-Id: <20211108220800.B01AE8B718@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/friendlyarm/nanopc-t4/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ee9419de7010be8830c01d0aaa7a470634ece7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/friendlyarm/nanopc-t4/genimage.cfg | 60 ++++++++++++++++----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index b3202f75d4..e616be6349 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
@@ -1,39 +1,39 @@
 image boot.vfat {
-        vfat {
-                files = {
-                        "Image",
-                        "rk3399-nanopc-t4.dtb",
-                        "extlinux"
-                }
-        }
-        size = 64M
+	vfat {
+		files = {
+			"Image",
+			"rk3399-nanopc-t4.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 64M
 }
 
 image sdcard.img {
+	hdimage {
+		gpt = true
+	}
 
-        hdimage {
-                gpt = true
-        }
-
-        partition loader1 {
-                image = "idbloader.img"
-                offset = 32K
-        }
+	partition loader1 {
+		image = "idbloader.img"
+		offset = 32K
+	}
 
-        partition loader2 {
-                image = "u-boot.itb"
-                offset = 8M
-        }
+	partition loader2 {
+		image = "u-boot.itb"
+		offset = 8M
+	}
 
-        partition boot {
-                partition-type = 0xC
-                bootable = "true"
-                image = "boot.vfat"
-                offset = 16M
-        }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 16M
+	}
 
-        partition rootfs {
-                partition-type = 0x83
-                image = "rootfs.ext4"
-        }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
