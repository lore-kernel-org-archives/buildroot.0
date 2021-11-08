Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE191C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C97B61052
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C97B61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D55403B9;
	Mon,  8 Nov 2021 22:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBPgZnjx4ZQM; Mon,  8 Nov 2021 22:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39E7403C6;
	Mon,  8 Nov 2021 22:32:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3E171BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC3A80EBF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7w4rJ0gSfH4 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A39EF80EB8
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B6628A47B; Mon,  8 Nov 2021 22:08:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e4621f7dc4b6dd5661eb054e982c1bca7759ab06
X-Git-Newrev: 543b8e906dfebc133c6afe77bb6e43b3d41d9d58
X-Patchwork-Hint: ignore
Message-Id: <20211108220800.6B6628A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/qemu/aarch64-sbsa/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=543b8e906dfebc133c6afe77bb6e43b3d41d9d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/qemu/aarch64-sbsa/genimage.cfg | 42 +++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index de585b3b91..957f1a0530 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -1,27 +1,29 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file Image {
-      image = "Image"
-    }
-  }
-  size = 64M
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 64M
 }
 
 image disk.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition boot {
-    partition-type = 0xEF
-    image = "efi-part.vfat"
-  }
+	partition boot {
+		partition-type = 0xEF
+		image = "efi-part.vfat"
+	}
 
-  partition root {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
