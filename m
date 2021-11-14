Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD18C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74D8408D5;
	Mon,  6 Dec 2021 18:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zlL9qCg2Z1B; Mon,  6 Dec 2021 18:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165A7403D7;
	Mon,  6 Dec 2021 18:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 142991BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9099041C2F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1x4HrJdXBUv for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2DB41C1C
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D56AC81468; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:40:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f863c6ca874acd060a7db90bf67ef43267345257
X-Git-Newrev: ba9f42d5ebab83d8302b5da9e8c28b2fb7121940
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.D56AC81468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/nezha/genimage.cfg: fix offset value
 notation
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
