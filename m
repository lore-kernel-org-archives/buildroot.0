Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F622C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:06:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0B26152A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE0B26152A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAC060855;
	Mon,  8 Nov 2021 22:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZUKlQQL-BqN; Mon,  8 Nov 2021 22:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2968F6085F;
	Mon,  8 Nov 2021 22:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94F731BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C0B6085F
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yjb7tvoG574 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D694A607F5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E4798B708; Mon,  8 Nov 2021 22:02:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:20:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c1c535ad3f2db12d211a60d165836c75bdb52a
X-Git-Newrev: 7ad6b54469a52e8342fc1f2f4538933967d7ecec
X-Patchwork-Hint: ignore
Message-Id: <20211108220208.8E4798B708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/aarch64-efi/genimage.cfg: beautify
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ad6b54469a52e8342fc1f2f4538933967d7ecec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/aarch64-efi/genimage-efi.cfg | 45 +++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 2daa70c361..8ec1f10fd8 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -1,29 +1,30 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file Image {
-      image = "Image"
-    }
-  }
-  size = 32M
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 32M
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
-    partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		image = "rootfs.ext2"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
