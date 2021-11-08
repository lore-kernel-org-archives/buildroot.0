Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:31:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A35604D7
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45A35604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21BEE80F16;
	Mon,  8 Nov 2021 22:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHjGNHL3u1FE; Mon,  8 Nov 2021 22:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830A180F0A;
	Mon,  8 Nov 2021 22:31:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312AC1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D6BA402E0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMlE6L1H5jpF for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5908E402F6
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 139748A47B; Mon,  8 Nov 2021 22:08:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d0990d7b57cbe4c6739c4ea52a2c869f265414c
X-Git-Newrev: e49df28cc4857502f6b8f2f8bdbb3ba159205ab0
X-Patchwork-Hint: ignore
Message-Id: <20211108220801.139748A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/grinn/chiliboard/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=e49df28cc4857502f6b8f2f8bdbb3ba159205ab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/grinn/chiliboard/genimage.cfg | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/board/grinn/chiliboard/genimage.cfg b/board/grinn/chiliboard/genimage.cfg
index ffe027e7ab..f335d7de4e 100644
--- a/board/grinn/chiliboard/genimage.cfg
+++ b/board/grinn/chiliboard/genimage.cfg
@@ -2,30 +2,31 @@
 #
 
 image boot.vfat {
-  vfat {
-    files = {
-      "MLO",
-      "u-boot.img",
-      "am335x-chiliboard.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"am335x-chiliboard.dtb",
+			"zImage"
+		}
+	}
+
+	size = 16M
 }
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition u-boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 1M
-  }
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
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
