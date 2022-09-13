Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B567C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B2C040ABA;
	Tue, 13 Sep 2022 14:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2C040ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKql_aTDDVKM; Tue, 13 Sep 2022 14:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3DC240B1D;
	Tue, 13 Sep 2022 14:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3DC240B1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8D291BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEA948305A
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA948305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1TQms_EIVGt for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C888308A
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9C888308A
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:38:06 +0000 (UTC)
Received: from opfedar01.francetelecom.fr (unknown [xx.xx.xx.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4MRmKR72sTzFqjQ
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 16:38:03 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 13 Sep 2022 16:38:01 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Sep 2022 16:37:59 +0200
Message-ID: <7149_1663079883_632095CB_7149_153_1_84f14454278c823f23654b20e44af7dc646b6fdd.1663079879.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
References: <86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663079884;
 bh=bx6wW4EbTWoJXfuRCYffXiJbvhN14y41PlnKOu13i5k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=fIdGAxMSNFTI278raOU3v67LNFlrdbo+EiBunyPFubkZ8iDx6CovMzaLtGg7+y5CY
 Q2d79fYlmR8G3MskPz6nlEbCZxeWGr61WxqUWJ8ATQSi7JrNl7dAsLg2Y6EWdDaHk3
 UlR/skb+yqzjNvIAtaDBTj+HR+J4VrgkL8qdgo3O2ZuDc5UqZZxzmN+boqiC6Addoq
 rVjTy9ijORd3xnbpX98e3mv5ABaTcbpUjQsDxrTXqvAJIhl8O/sCUmbFpvcLFXgNuY
 bXvQN8B60noTOKosWeiRc3C0u3DlmW5R7/aw8q+21AeVIKCuSsWYVu3GXZx+n+SkHI
 Z3DsIKqcWTeuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=fIdGAxMS
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Add Yann (at work) for gpsd
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a707b0e5e1..4785057d90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3104,6 +3104,9 @@ F:	package/wtfutil/
 F:	package/zisofs-tools/
 F:	support/download/
 
+N:	Yann E. MORIN <yann.morin@orange.com>
+F:	package/gpsd/
+
 N:	Yegor Yefremov <yegorslists@googlemail.com>
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
