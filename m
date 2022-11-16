Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A7C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 08:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5706180C38;
	Wed, 16 Nov 2022 08:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5706180C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y43B3Giqmobs; Wed, 16 Nov 2022 08:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D6F80C0E;
	Wed, 16 Nov 2022 08:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D6F80C0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B30341BF36A
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E42D40292
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E42D40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83JHxuHJXe5U for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 08:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A59940131
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A59940131
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 08:43:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0716140008;
 Wed, 16 Nov 2022 08:43:40 +0000 (UTC)
To: <buildroot@buildroot.org>
Date: Wed, 16 Nov 2022 09:43:40 +0100
Message-Id: <20221116084340.1068161-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668588221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QhHordmwio2FtLJ19L3te4ZGM+B4GSbNogQG6p9lepw=;
 b=QYLSd81nrCRqs2nKKoYLdsDKhSv382GQhPrRhaqfVm6Kjm7ARDLJsbjcRCgZ2UEtp2XqQy
 QFYOugaVp0NjUyYIIKq9NGFbsHpPfPho8KtyuDn2b63G5kUXPONrINeVCl/RsDTplNlvAc
 DpCY8BH9qpKmI/CS0n7Nw+uxnEwVDtxfwUQ4NXH+gE422fy1NHFxtuwo4Ni+dxs340eaVs
 BSLXhm0/ZEJXA9s8WZFH5JcZnj4I4ajJ8HP1DbOY7NhClTz3U15UH3TAFvRDT0HJhLKBq3
 2Gg5oc2FqOXrXX6YTqcJ8FmkAbrJb7EXl3U+33YaTCAP2Xz9SX5WfutYuACDMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QYLSd81n
Subject: [Buildroot] [PATCH] README: fix reference to submitting-patches
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While looking for refreshing my mind about Buildroot contribution
guidelines, I actually stumbled upon a 404 error. It seems like the
manual URL has slightly evolved since 2016, so fix it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 008e996f5f..2d33c8ce37 100644
--- a/README
+++ b/README
@@ -23,4 +23,4 @@ buildroot mailing list: buildroot@buildroot.org
 You can also find us on #buildroot on OFTC IRC.
 
 If you would like to contribute patches, please read
-https://buildroot.org/manual.html#submitting-patches
+https://buildroot.org/downloads/manual/manual.html#submitting-patches
\ No newline at end of file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
