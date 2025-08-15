Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371EBCA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 20:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C5E18232F;
	Fri, 15 Aug 2025 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mcn19t5h9XNM; Fri, 15 Aug 2025 20:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD60082240
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD60082240;
	Fri, 15 Aug 2025 20:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8619223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 20:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAB9B409C8
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 20:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3lWyKvBx7gS for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 20:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.143;
 helo=smtpcmd12143.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1824240979
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1824240979
Received: from smtpcmd12143.aruba.it (smtpcmd12143.aruba.it [62.149.156.143])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1824240979
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 20:35:51 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.45])
 by Aruba SMTP with ESMTPSA
 id n19QuK2sf8eo9n19RuAq3r; Fri, 15 Aug 2025 22:35:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Fri, 15 Aug 2025 22:35:45 +0200
Message-ID: <20250815203545.10042-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815203247.14ecd5f5@windsurf>
References: <20250815203247.14ecd5f5@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIiiJyjAsAzgIcaQf9Nbjlx1NxeGj/9bq9NFBWdIr1q8tsL0HqiZZrUh4roxbJq7cLfLad04hXnKQM148IiZKUCleR+Dx2QbCRmsCO3paIl/mu43VnA/
 Vwazu5ikjJaVY6oq+zuKtfDnc48Cp3Lf4zrZVloKTdGBnKiDrqatolNbblJDPzHhvYtLOf6mQEwpOHiT16ZUbJ0QmcAKD4mIrH6rzq/vmEX+8aKyiFnsaMbv
 6aMrVts44BPQ8NMddp6SBr5Pa7bYiv0Id0UU2HK+rNVEerKgAYCvDoV/w7j7PYAyKZ/fROqonzZdGsFcFVBKNvfqO/Bhh4/uKau0/MQC24M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755290149; bh=y5NC/xWwkCM/j26eKNw0RhytQB/QR1S9SUomDyPEkno=;
 h=From:To:Subject:Date:MIME-Version;
 b=jMbVlKOShR9sKxTLNs6x6MKFB7LOjaTT5MyF5CWJDzI/CkRZlrNMQiOLv28okZP2k
 lZocnLXsdSPyVk6TjUjIvM/9oKPJx2IHv4LeZlXycpGxHi+WwBKqmq13YptapAZZYD
 uNMPFMzE1CGckcYhk/YTCnTfZ9pK0c0sIoeSBp853Fz8+PHiuoDu/JympRv+gYQk6y
 EKkr78lVxJ47+N7GBoOKTZTm24Er2pCI9rBdhYKyvArKPyAW1FVUurRjFkwTQHQZ+A
 jZVJTq6b+Zuv/PW3iNS3PQm3O67GIe2iwnyLg2ll/DBzMSt06lvzNm0AAvWgyZ9mfy
 /T7lh4dCMfnpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jMbVlKOS
Subject: [Buildroot] [PATCH v3] package/libtracefs: fix build failure due to
 missing NPTL
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

With commit:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=31acfe1747b273e147f864b5a62a4e39197ca1a2
package libtracefs utest started to use pthread_barrier_() functions and
this lead to build failure when we build without NPTL. Since utest is
not needed on the target we can avoid to build it, so let's disable it.

Fixes: 117ece4835 ("package/libtracefs: bump to version 1.8.0")
Fixes:
https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* improve commit log to point when problem began as requested by Thomas Petazzoni
V2->V3:
* improve commit log again by pointing which Buildroot commit introduced
  the build failure as pointed by Thomas Petazzoni
---
 package/libtracefs/libtracefs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index d24763fa7d..6b8f838c2e 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
 	-Ddoc=false \
-	-Dsamples=false
+	-Dsamples=false \
+	-Dutest=false
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
