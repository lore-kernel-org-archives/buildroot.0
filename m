Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975E5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C92611C1
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56C92611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E56402DF;
	Mon,  8 Nov 2021 22:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1DEcRPuVuBg; Mon,  8 Nov 2021 22:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FF4F402AA;
	Mon,  8 Nov 2021 22:15:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15C531BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6335480EB8
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8Q3i9URg4KG for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A47BC80EA1
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 619318B708; Mon,  8 Nov 2021 22:02:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e49df28cc4857502f6b8f2f8bdbb3ba159205ab0
X-Git-Newrev: 0ef71d56657d38db8b5373005a8dd96f4721dec0
X-Patchwork-Hint: ignore
Message-Id: <20211108220210.619318B708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/grinn/liteboard/genimage.cfg:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ef71d56657d38db8b5373005a8dd96f4721dec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/grinn/liteboard/genimage.cfg | 59 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/board/grinn/liteboard/genimage.cfg b/board/grinn/liteboard/genimage.cfg
index cbce2db585..d0b29819d8 100644
--- a/board/grinn/liteboard/genimage.cfg
+++ b/board/grinn/liteboard/genimage.cfg
@@ -9,40 +9,41 @@
 #
 
 image boot.vfat {
-  vfat {
-    files = {
-      "imx6ul-liteboard.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
+	vfat {
+		files = {
+			"imx6ul-liteboard.dtb",
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
 
-  partition SPL {
-    in-partition-table = "no"
-    image = "SPL"
-    offset = 1K
-  }
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+	}
 
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.img"
-    offset = 69K
-  }
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 69K
+	}
 
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
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
