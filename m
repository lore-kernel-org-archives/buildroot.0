Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC563C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17CD84B9D;
	Mon,  6 Dec 2021 18:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ut89tUXPImct; Mon,  6 Dec 2021 18:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3ABB826AA;
	Mon,  6 Dec 2021 18:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6649B1BF989
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D598E60D66
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwjNmIrpOOM7 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309FE60D6A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC9DC81504; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:40:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ac19f1bf0b7872f5913dcd9d60075c9ed3c2452
X-Git-Newrev: f863c6ca874acd060a7db90bf67ef43267345257
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.CC9DC81504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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

commit: https://git.buildroot.net/buildroot/commit/?id=f863c6ca874acd060a7db90bf67ef43267345257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Option 'offset = 4k' must be 'offset = 4K'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/kontron/smarc-sal28/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index f3fb77e00a..8c8a7baaae 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard-emmc.img {
 	}
 
 	partition rcw {
-		offset = 4k
+		offset = 4K
 		in-partition-table = "no"
 		image = "rcw.bin"
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
