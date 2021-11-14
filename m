Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50817C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C0860EFD
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9C0860EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8182380D4F;
	Sun, 14 Nov 2021 14:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9JPPa26giaA; Sun, 14 Nov 2021 14:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E814080D3C;
	Sun, 14 Nov 2021 14:42:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2089C1BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A2C80D51
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZ0DoOG7uWKn for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77FA080D3C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D0288D2AD; Sun, 14 Nov 2021 14:37:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:32:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e89a95ca4a103a169007793a060d08acfd50901a
X-Git-Newrev: 9fa7dbbbba298db9b99f442b171fa47640bf3cb8
X-Patchwork-Hint: ignore
Message-Id: <20211114143758.0D0288D2AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/orangepi/orangepi-pc2/genimage.cfg: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fa7dbbbba298db9b99f442b171fa47640bf3cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-pc2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
index 72adc47518..cc8695c9f1 100644
--- a/board/orangepi/orangepi-pc2/genimage.cfg
+++ b/board/orangepi/orangepi-pc2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
