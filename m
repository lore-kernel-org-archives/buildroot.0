Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F61C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:43:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD37560F38
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD37560F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1EF401FD;
	Sun, 14 Nov 2021 14:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Aq-7O1xokYe; Sun, 14 Nov 2021 14:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B161A400F3;
	Sun, 14 Nov 2021 14:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 215921BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6093E402DF
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yg7Bqmdr1MhW for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A84BD40237
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 378968D26D; Sun, 14 Nov 2021 14:37:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:40:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f863c6ca874acd060a7db90bf67ef43267345257
X-Git-Newrev: ba9f42d5ebab83d8302b5da9e8c28b2fb7121940
X-Patchwork-Hint: ignore
Message-Id: <20211114143758.378968D26D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/nezha/genimage.cfg: fix
 offset value notation
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba9f42d5ebab83d8302b5da9e8c28b2fb7121940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Option "offset = 12288K" must be "offset = 12M" according to the new
guidelines specified in Buildroot Manual with previous patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/nezha/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/nezha/genimage.cfg b/board/nezha/genimage.cfg
index 9860b83eca..783391fb99 100644
--- a/board/nezha/genimage.cfg
+++ b/board/nezha/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot-1 {
 		in-partition-table = "no"
 		image = "u-boot.toc1"
-		offset = 12288K
+		offset = 12M
 	}
 
 	partition u-boot-2 {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
