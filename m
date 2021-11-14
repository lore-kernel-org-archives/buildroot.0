Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B89EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0B860ED7
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B0B860ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF47780D51;
	Sun, 14 Nov 2021 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCuoEWHKF1Yp; Sun, 14 Nov 2021 14:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F4E780D4F;
	Sun, 14 Nov 2021 14:42:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44D831BF976
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32544400F3
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrwaOLhyaHpE for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D625400DA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E267C8D2AD; Sun, 14 Nov 2021 14:37:57 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:31:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd680ed98d6b5dc21ba130efc2f3886d91170b9a
X-Git-Newrev: f89b3e14cf3510887d959e7c8f53c1dfde052935
X-Patchwork-Hint: ignore
Message-Id: <20211114143757.E267C8D2AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/olimex/a20_olinuxino/genimage.cfg: fix option suffix
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

commit: https://git.buildroot.net/buildroot/commit/?id=f89b3e14cf3510887d959e7c8f53c1dfde052935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With commit[1] I've introduced a code style bug:
offset = 8KB
so let's substitute 8KB with 8K.

[1]: https://gitlab.com/buildroot.org/buildroot/-/commit/43bfa1cf1046b0e44e87a02bc5a358bf1de5bfdd

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a20_olinuxino/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
index 5a735ed2de..b48e12a831 100644
--- a/board/olimex/a20_olinuxino/genimage.cfg
+++ b/board/olimex/a20_olinuxino/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8KB
+		offset = 8K
 		size = 1016K # 1MB - 8KB
 	}
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
