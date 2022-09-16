Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE289C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87ABB61363;
	Fri, 16 Sep 2022 13:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87ABB61363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vz0gM2dsJyDr; Fri, 16 Sep 2022 13:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA630611DA;
	Fri, 16 Sep 2022 13:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA630611DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEC141BF2C0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5E7B41637
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5E7B41637
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJzX1IfmSYIj for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 13:06:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2AD640FB9
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2AD640FB9
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 13:06:24 +0000 (UTC)
Received: from opfednr03.francetelecom.fr (unknown [xx.xx.xx.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4MTZ8G3WlYz104v
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 15:06:22 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 15:06:20 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 16 Sep 2022 15:06:17 +0200
Message-ID: <23687_1663333582_632474CE_23687_360_21_914425a46303c0772aa60688496968e329a379df.1663333493.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a3b3a73905917c76ad928862912b96e167b7d876.1663333493.git.yann.morin@orange.com>
References: <a3b3a73905917c76ad928862912b96e167b7d876.1663333493.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX408.corporate.adroot.infra.ftgroup
 (10.115.27.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663333582;
 bh=bx6wW4EbTWoJXfuRCYffXiJbvhN14y41PlnKOu13i5k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=iJBgt3zksD/h0i1uc2gG71vGTISbe8aRx6Nh/kM9bVUa1znEbmnY6xbHdMf6rdLMP
 wDtEXZqtUv1AXy/fWd6m8Fcg5r0aM5LmYBjBML86XvRyFjUYgxYpySIQ1r2u7s/tCC
 ec6DNH+nJdec8d+LdeOHkPmD4ev0hvo8fvwC7AsQts18sydTuJAjk9Qg6ZezKxU/Br
 P6t3fWalQP5nHw+LaCixFJTcNJQB07/jDgToDWqTR02VyMBzgX2Atcl3UzZ6gaNHBl
 ZQivTXInJ6UsR+8DMl0DlG6nr79gKMuGvQH1TODmfcpSZysSGyrznkRXSon2B/lqcE
 0/b2Lp7RkRzfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=iJBgt3zk
Subject: [Buildroot] [PATCH v2 3/3] DEVELOPERS: Add Yann (at work) for gpsd
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
