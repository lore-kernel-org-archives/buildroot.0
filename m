Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18867C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB74F61994
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB74F61994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A70A640297;
	Mon,  8 Nov 2021 22:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfKIV5hZFRGo; Mon,  8 Nov 2021 22:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1789D40280;
	Mon,  8 Nov 2021 22:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 091A91BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B21840369
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLlEjSFn9yPv for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75017402C1
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 301CC8A47B; Mon,  8 Nov 2021 22:08:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06b90e9cd0e780bab820cfdd1c6b304b92968025
X-Git-Newrev: 17b2c9b7ed27177c72cd247919daca3f111b49a9
X-Patchwork-Hint: ignore
Message-Id: <20211108220800.301CC8A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/beaglev/genimage.cfg:
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

commit: https://git.buildroot.net/buildroot/commit/?id=17b2c9b7ed27177c72cd247919daca3f111b49a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/beaglev/genimage.cfg | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
index f38bb7f86c..3b28e8dbb6 100644
--- a/board/beaglev/genimage.cfg
+++ b/board/beaglev/genimage.cfg
@@ -1,12 +1,12 @@
 image sdcard.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition rootfs {
-    partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
-    partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
-    bootable = "true"
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
