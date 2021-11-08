Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E747DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05346162E
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B05346162E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B6F80EB2;
	Mon,  8 Nov 2021 22:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehdCLRB769pB; Mon,  8 Nov 2021 22:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC29280E9D;
	Mon,  8 Nov 2021 22:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18C211BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E412980EAD
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKKF3kSFWZHf for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 058C180EB4
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B5B6F8B711; Mon,  8 Nov 2021 22:02:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8eb94081de2bbfa6320be8d0d2217ce0bce1d377
X-Git-Newrev: 228672b4cdf261016fb4e1812ca6d14b4370d492
X-Patchwork-Hint: ignore
Message-Id: <20211108220211.B5B6F8B711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pc/genimage-bios.cfg: beautify file
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
