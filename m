Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF07C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 08:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4EBE60F65;
	Wed, 16 Nov 2022 08:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4EBE60F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAn4gjurZBOV; Wed, 16 Nov 2022 08:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3376460B2F;
	Wed, 16 Nov 2022 08:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3376460B2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 057421BF228
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD9C41697
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD9C41697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obZAnrRZqIu2 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 08:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7915D4162D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7915D4162D
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 08:59:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C890DD368A
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 08:37:13 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62E991BF208;
 Wed, 16 Nov 2022 08:37:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 09:37:02 +0100
Message-Id: <20221116083702.1067161-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668587828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QhHordmwio2FtLJ19L3te4ZGM+B4GSbNogQG6p9lepw=;
 b=LTW66n8FC/Cm/Qr5A8kSUrUPyZoVQxh34gS0zRxL4fyIHH1ZTNDr/zDKNX8n5qpbEjQjQR
 OftJdHgutuq9tV4h0M1R3fYmUBvZ7kLFFKftEJnRTHDbTGfkcXbyciI1TlxoVmti30cQ7a
 SLgFLlFkn29mlhEG+PTsC3IiR14yTFNsMUygzwNG0iITKAaGWf0toEfErkA6tfk+YQpbJm
 ORyEBgs/FzwBycSUoL6up5c1f3sSpl8lAW+fEsjvKLAdzGVlRZGNeyuX2gyxJlimkSd+Dx
 xBBWV4XqmkKGQp5GmSmPb2Hpgl56Kh2iLPDVO3iSquwW/q83J+MkDQg/0ipdeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LTW66n8F
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
