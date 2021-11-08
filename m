Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F528C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBFD61506
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDBFD61506
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5203402D4;
	Mon,  8 Nov 2021 22:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En-Y2EWNgUb4; Mon,  8 Nov 2021 22:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E3040365;
	Mon,  8 Nov 2021 22:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA221BF995
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C7D402DC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKRouVnmN12s for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912D9402AA
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4B0F18B70F; Mon,  8 Nov 2021 22:02:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 827cb07b2dafa25b3d4830fef9085583dd215f90
X-Git-Newrev: 1812ef56671c2b9f177635ebd2ade996ffd85cd2
X-Patchwork-Hint: ignore
Message-Id: <20211108220209.4B0F18B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ci20/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=1812ef56671c2b9f177635ebd2ade996ffd85cd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/ci20/genimage.cfg | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/board/ci20/genimage.cfg b/board/ci20/genimage.cfg
index 5f8a16c610..2d4a18a99b 100644
--- a/board/ci20/genimage.cfg
+++ b/board/ci20/genimage.cfg
@@ -1,28 +1,28 @@
 image sdcard.img {
-    hdimage {
-    }
+	hdimage {
+	}
 
-    partition uboot-spl {
-        in-partition-table = "no"
-        image = "u-boot-spl.bin"
-        offset = 512
-    }
+	partition uboot-spl {
+		in-partition-table = "no"
+		image = "u-boot-spl.bin"
+		offset = 512
+	}
 
-    partition uboot {
-        in-partition-table = "no"
-        image = "u-boot.img"
-        offset = 14k
-    }
+	partition uboot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 14K
+	}
 
-    partition uboot-env {
-        in-partition-table = "no"
-        image = "uboot-env.bin"
-        offset = 526k
-    }
+	partition uboot-env {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 526K
+	}
 
-    partition rootfs {
-        partition-type = 0x83
-        image = "rootfs.ext4"
-        offset = 2M
-    }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 2M
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
