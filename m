Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839C9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474EE619A6
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 474EE619A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244C86088A;
	Mon,  8 Nov 2021 22:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tViiZjshNUvW; Mon,  8 Nov 2021 22:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 963ED60889;
	Mon,  8 Nov 2021 22:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 800091BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0E840331
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3qhr4ZaI-PH for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E7F402EF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 72F598B718; Mon,  8 Nov 2021 22:08:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8eb94081de2bbfa6320be8d0d2217ce0bce1d377
X-Git-Newrev: 228672b4cdf261016fb4e1812ca6d14b4370d492
X-Patchwork-Hint: ignore
Message-Id: <20211108220802.72F598B718@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/pc/genimage-bios.cfg:
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

commit: https://git.buildroot.net/buildroot/commit/?id=228672b4cdf261016fb4e1812ca6d14b4370d492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/pc/genimage-bios.cfg | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
index c669499915..26d12d9ab3 100644
--- a/board/pc/genimage-bios.cfg
+++ b/board/pc/genimage-bios.cfg
@@ -1,24 +1,22 @@
 image disk.img {
+	hdimage {
+	}
 
-  hdimage {
-  }
+	partition boot {
+		in-partition-table = "no"
+		image = "boot.img"
+		offset = 0
+		size = 512
+	}
 
-  partition boot {
-    in-partition-table = "no"
-    image = "boot.img"
-    offset = 0
-    size = 512
-  }
-
-  partition grub {
-    in-partition-table = "no"
-    image = "grub.img"
-    offset = 512
-  }
-
-  partition root {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
+	partition grub {
+		in-partition-table = "no"
+		image = "grub.img"
+		offset = 512
+	}
 
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
