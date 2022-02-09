Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BCBC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14B03404F1;
	Wed,  9 Feb 2022 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wqcMcEUN9lT; Wed,  9 Feb 2022 16:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D032A404DB;
	Wed,  9 Feb 2022 16:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49EEF1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C864156D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_EdxQC44r5R for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:09:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7483A415A8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:09:10 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4Jv4ZD0Gfkz8tDT; 
 Wed,  9 Feb 2022 17:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644422948;
 bh=2+dRPWBuXUX1aQdMu49LI4GZU/dsy+1DLcrbmKF+ZdE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=fAbIOiypGVUnokXrNoNpvJzfkg3X1BsQZehykqw9LQbYUeli+9KxC6M3lrtS3UOFP
 V5CAMftkreblvrdOAmKpRXtVNspAmqH4TangIpMHHoYxWrCTGl5BNsyjytnYAYlYmG
 IiHFY+RwMtlAN1/kqKu+8cIhtCYRKPBavng9H0IhvYNcQ2PPs8Ypm8InGmBzQB2nyy
 77xrUfBwq2QaZ0BbOxxlId3E83/iXjo5YyGfDOtC31GMVUY22/4XajnfivvMDokctH
 bDq+HJa4blortfsWPfXI5McoiUpxkpXHpGHfFcuKPNfERJgW/d6NIgRn6+RNENujl1
 Z0PPj0N4q/o1A==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 17:09:05 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 17:08:47 +0100
Message-ID: <25580_1644422947_6203E723_25580_17_1_a1a52ce7fd9920435f8cc9e82513d62f9badd738.1644422916.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 5/5 v2] package/pkg-golang: host-go is also a
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
vendoring during the downlaod step.

However, when using a package in override-srcdir, there is no download
step, so host-go is not pulled in as a dependency, which will break the
build of a single package from scratch.

We fix that by adding host-go as a standard dependency too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>
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
