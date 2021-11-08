Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22EDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D9461361
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5D9461361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9182E4036D;
	Mon,  8 Nov 2021 22:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7isuWctDM2n; Mon,  8 Nov 2021 22:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F104016B;
	Mon,  8 Nov 2021 22:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 693FF1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169D7402F0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJc5Lh_Zk04p for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2311F401CB
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D281F8B70F; Mon,  8 Nov 2021 22:02:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7837e73981c133b3147cb5c7c02b8002dffc91aa
X-Git-Newrev: 447b46cae054b9bf72551940120fede8bb74050b
X-Patchwork-Hint: ignore
Message-Id: <20211108220211.D281F8B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pine64/rock64/genimage.cfg: beautify
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

commit: https://git.buildroot.net/buildroot/commit/?id=447b46cae054b9bf72551940120fede8bb74050b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/pine64/rock64/genimage.cfg | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/board/pine64/rock64/genimage.cfg b/board/pine64/rock64/genimage.cfg
index 0b5a0d8804..7b749d1dd6 100644
--- a/board/pine64/rock64/genimage.cfg
+++ b/board/pine64/rock64/genimage.cfg
@@ -1,23 +1,23 @@
 image sdcard.img {
-    hdimage {
-    }
+	hdimage {
+	}
 
-    partition uboot-spl {
-        in-partition-table = "no"
-        image = "u-boot-tpl-spl.img"
-        offset = 32768 # 512 * 0x40 from start of sd card
-    }
+	partition uboot-spl {
+		in-partition-table = "no"
+		image = "u-boot-tpl-spl.img"
+		offset = 32K # 512 * 0x40 from start of sd card
+	}
 
-    partition uboot {
-        in-partition-table = "no"
-        image = "u-boot.itb"
-        offset = 262144 # 512 * 0x200 from start of sd card
-    }
+	partition uboot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 256K # 512 * 0x200 from start of sd card
+	}
 
-    partition rootfs {
-        partition-type = 0x83
-        bootable = "yes"
-        image = "rootfs.ext2"
-        size = 500M
-    }
+	partition rootfs {
+		partition-type = 0x83
+		bootable = "yes"
+		image = "rootfs.ext2"
+		size = 500M
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
