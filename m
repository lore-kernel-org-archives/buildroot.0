Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35696C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E4961361
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3E4961361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBDE080EBF;
	Mon,  8 Nov 2021 22:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oxe-QDWBBpx4; Mon,  8 Nov 2021 22:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35CEF80EBD;
	Mon,  8 Nov 2021 22:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190491BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F8580EDA
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTrESDnxJ_IY for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016F380ECD
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BFC158B714; Mon,  8 Nov 2021 22:02:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 228672b4cdf261016fb4e1812ca6d14b4370d492
X-Git-Newrev: 5f9d2a2e668669056ac6f925b61233447e3a4a7d
X-Patchwork-Hint: ignore
Message-Id: <20211108220211.BFC158B714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pc/genimage-efi.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f9d2a2e668669056ac6f925b61233447e3a4a7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/pc/genimage-efi.cfg | 49 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 34befb7d69..9cf701b798 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -1,31 +1,32 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file bzImage {
-      image = "bzImage"
-    }
-  }
-  # 16MB - 32KB
-  size = 16744448
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
 }
 
 image disk.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition boot {
-    image = "efi-part.vfat"
-    partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
-    offset = 32768
-    bootable = true
-  }
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
+	}
 
-  partition root {
-    partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
-    partition-uuid = UUID_TMP
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-uuid = UUID_TMP
+		image = "rootfs.ext2"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
