Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FA1C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 19:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83A54038E;
	Sat,  6 Jul 2024 19:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr-lRI582037; Sat,  6 Jul 2024 19:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63604403D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63604403D7;
	Sat,  6 Jul 2024 19:33:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 246361BF83B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11448403D7
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 19:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNYHyqW-11i6 for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 19:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05F184038E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05F184038E
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05F184038E
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 19:33:43 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QBABsJjy3TSwmQBABs4bo6; Sat, 06 Jul 2024 21:33:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 21:33:38 +0200
Message-Id: <20240706193338.296510-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNz8sRzQsDL7uLk9iZyxx/GYaGm/pEo7FVCwPf9bB60It8D4Uv/NU4X0an5ZKxDIUmj7vn2iP9TyDMYS9ZygK29NGFBiHnInu3fV5BhqTLA4moc3GTi1
 PiGerWpWo1ZMH1KCBMJD4yRwn4pfs20x4xgoBdskuGWCU1LvurkW3Pz8wQJaA857nWyTUQD3QSiPZx7DbhuiqxEp2Hrabo9ApDh93T6oiQEBoPOr0WILo0r8
 ebhwRhHVkEKZw6AVAUwjZdR5b9iskmUNoq+M8VzzSsS18KU95T8ajSKW4w4HcoVcHkQdPj3S7r1L4F+9JqiBcA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1720294419; bh=Evq0Es6M8E2r7WKSIV0/l14dGLph7a4DhW+jOwMkCgE=;
 h=From:To:Subject:Date:MIME-Version;
 b=gBFuIywFjrpVYwLOD+7dEiC+LwmAXd2Cz8/wZXVO7WsVU3eNRwMICRmPkklnd26rR
 dn38WF7cvR5StT/b++zCbFHCLXtffgZTMIrktlU3MVMeNRzxZTqK/zbZO8kbzQWYzb
 u/CH5RTWHbr7pj/Yf+RjjY59qtRTvxTxXDSAYUGDoVfvoBrXGEqU//uQW8BKax6mu/
 1YFDg/3KOQKq4ETp5nF3jHDTybgCnWWSXygM1njqXC65hPeWWnX0zP35MTAZFGlAzK
 DxTyyi+0mbMs8upJrfCgfIhl2ziTrzy86CdysTcnzsCSrfgvjQpFKyxnRhpJxt8EaA
 r0JwOEsNaABKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gBFuIywF
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.102
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index ccc5951929..8c21316b7b 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_101_1_RTM/src/SHA256SUMS
-sha256  f20e8c5daafd89419d229ec8c54100a5c320dce1467377c9dfcd5e4d8446b468  nss-3.101.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_102_RTM/src/SHA256SUMS
+sha256  c29b03f24856db18a34fbcde737fcca6407c27b5f3f60baba5111460e6cb307b  nss-3.102.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 60ffc92b1b..3916a78381 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.101.1
+LIBNSS_VERSION = 3.102
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
