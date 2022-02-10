Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9340C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73AC681BBD;
	Thu, 10 Feb 2022 15:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT3mK-4MCWyS; Thu, 10 Feb 2022 15:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE49681B26;
	Thu, 10 Feb 2022 15:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 879091BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 768C081A5F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SM5AgkNX6hUS for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:29:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FA2E81A12
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:29:39 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4Jvgf91k2fzyvj;
 Thu, 10 Feb 2022 16:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506977;
 bh=ag1NsXPX273jpJKXzhmjkOPdYIqZoPYWCY6/w8Za6i8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=nPkNkmIn8YIKU4wiTr1rJUbmsOh5+LO1d4Hl2mrkY4TBe9m4pzLWWkAU7/EquFh2o
 njs4dqybhvR2gFNR3GVlL4mZsIRnSiyx6OOGt9cp0ZHu8TlE2yWa7kyRl3r5HAVoeo
 PoEPxt4GxF8eaDYDemZSp7j4liGAr58efNET26n0EVSqVCyarUO4iYDkQLfeyYs/tp
 lKyA5oAZH5K59rrnbsiZGa4DBCfKhHPQ+ZzycdiKbfaAWuBoM0Jf4PwQ+UftBKSG0O
 0d2se0MZCW1KFvf9LIjULF3fH2Vag+ag0ogxJhU6ewIFkmA3pKrMFPLJRdFtRYOli7
 Vh+1zC1xS8//A==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:29:35 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 16:29:28 +0100
Message-ID: <11477_1644506977_62052F61_11477_142_1_1cfdf4aa3ac96d2d2cf246385325f93b451d773b.1644506959.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644506959.git.yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 5/5 v3] package/pkg-golang: host-go is also a
 build dependency
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, host-go is a download dependency, because we need go for the
vendoring during the download step.

However, when using a package in override-srcdir, there is no download
step, so host-go is not pulled in as a dependency, which will break the
build of a single package from scratch.

We fix that by adding host-go as a standard dependency too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Christian Stewart <christian@paral.in>
---
 package/pkg-golang.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 69eae02830..ddefdf1214 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -47,8 +47,10 @@ $(2)_BUILD_OPTS += \
 	-trimpath \
 	-p $(PARALLEL_JOBS)
 
-# Target packages need the Go compiler on the host.
+# Target packages need the Go compiler on the host at download time (for
+# vendoring), and at build and install time.
 $(2)_DOWNLOAD_DEPENDENCIES += host-go
+$(2)_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
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
