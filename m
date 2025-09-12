Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6724BCAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AB84152F;
	Fri, 12 Sep 2025 21:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYLgPUxygDqT; Fri, 12 Sep 2025 21:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336EC41529
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336EC41529;
	Fri, 12 Sep 2025 21:23:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B35E425B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A7E4084B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 846uqzATALu7 for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 21:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 997FE40837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 997FE40837
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 997FE40837
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id xBEVutAGSqg4pxBEWuHfcQ; Fri, 12 Sep 2025 23:23:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 12 Sep 2025 23:22:57 +0200
Message-ID: <20250912212302.1057923-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
References: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLLMhbc87dZB6/xbehw1HvUDEPmRTgewQdCTqBaJGr+MG1OChnx/cTAuLZYAttglhpzOAJmBixpJ05LFrXGKeebhJ+bBF3fjBYY11w1z7Ckrefns2RPE
 0Nq3EyMtqe4WJYHvXdILXoIVGZBhBj/POcLXfEOUVFGIeToI3B+73qf3sDP/KvOVUVPxDR3f8ql4qsLYu3czGp6rU4j+oKXZMgI46E0IbYzOw9s0TROHG+dM
 s4WKNrURJLobKFTHmJjT9G0yYzmqteRV0XvQe6cFyTtiLCiHFhLkg0JnkPqqrTWFZkqpHKBKohl4T2S/KldMLVh6RpAkB6SX+H23EOFgE2FxdHwc/dFdV/iB
 JDFtJi9J
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757712184; bh=4R8D1iIz4OGYrgHkj1ysHiYoxN4N63BgI1NU9G3IDiM=;
 h=From:To:Subject:Date:MIME-Version;
 b=YcSOcApy8/ooLU4vuI/Q7ngkq/rFI0PdsHsudDX6pexrWNtLzjqJ+oBs1Pwdg6P1v
 GekMxs4HECvVAtuZi25m7CIeki0rhv+aGqcTv/9n6F/336S7ivCMEMTyyfgJpH1Ijh
 v2K4nkofyDA5hw12XyL0yciqMMXmbxZSO8hYDB8qf0paynzwUjWFk8GhKIGcKA/pqW
 1gNoT/b8WIzCakCl2Ocigtaf1uxCna+qO/1jTy9Ay8tMKQR6Yrdo0EyzrjuUVmlqFn
 Gv1BceB5meGR3JRf11jWFVGamuhOswUHIZB6Gkr+ott1NQQMwep3SenolPZD0x3tnA
 vSmBrDp0leL2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YcSOcApy
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.116
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_116.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index abd550d5c8..c839d58b80 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_1_RTM/src/SHA256SUMS
-sha256  b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf  nss-3.115.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_116_RTM/src/SHA256SUMS
+sha256  3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73  nss-3.116.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9e8e7d36cf..b0f15a6317 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.115.1
+LIBNSS_VERSION = 3.116
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
