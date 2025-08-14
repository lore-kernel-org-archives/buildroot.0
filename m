Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C89ACA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDD34071B;
	Thu, 14 Aug 2025 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OV-tkFCgPxzf; Thu, 14 Aug 2025 21:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E7340720
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E7340720;
	Thu, 14 Aug 2025 21:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 748D61BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 720FE4070A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMoEsuXr29_I for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 21:15:09 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Aug 2025 21:15:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB39D4070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB39D4070E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.160;
 helo=smtpdh19-su.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh19-su.aruba.it (smtpdh19-su.aruba.it [62.149.155.160])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB39D4070E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:15:08 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.44])
 by Aruba SMTP with ESMTPSA
 id mfB0uwzfrvoVFmfB1uNRq7; Thu, 14 Aug 2025 23:07:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 14 Aug 2025 23:07:58 +0200
Message-ID: <20250814210758.563308-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLvmoO5zSHG+I91Ej6Jg/BIfKQEv+kfG5x2TdDD4Zqb24rLXE0FzjByREINuMA4GMxX0PVPzaq5wPHRkps9iucoO35FXapGo6wh3E72ZLZ/nK5VEx3op
 Eh1dX1fzSoQLEvvavc9ZdtQENisnPz7SMjg/eh9JloIhJrvBQBtx3C92z5j9ExGy5QkZJknHwaei1SjtGt7YbfVvf62GoH9ATKbbnKywX0Lniq3UutFvRM5a
 LGnthsoz2aFpbJNu9LZFAVOmtX3FFcbuE8hC9NQHUegncaClPHQqkVBsfuRmD2fJd4wauwaomZIHqJJYHu+ghJHsm+LCaKkrumFu5lasRRE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755205679; bh=yj4IQtkP6sz+UG+L9st3qPPmPzUmnfBIOPZbPVUQCGA=;
 h=From:To:Subject:Date:MIME-Version;
 b=bnpernbj8utYkDKQLFZRLbufXfPnDZcTdiq+lxpzSdgvpbzFpudB+5NoWiWMFSTFO
 kIZBU/fMFdPNhMT6SaJ6GAfjjEfNL3dJWaghBxEAHX8uGs8SXL7tOz4PpTR6kUjOCJ
 f9gqRjz5R2fknqdGEMfQOMStg2SodJ4wQNkignchg+XFNYbYL+jGbnBxpznU0XgCxc
 RgoDSzU/oLXStNqsbOdcgztFaF5/hKQBFCiPAz+Y1Uvp7y83GWMEe8jcd07lSP2ve5
 tMkzNlA17Xw/gPag5ypsYtrmRjiXupsd2+9u5hMYewF+mha2qdtw5OB+QGSojZPoiw
 FasBr2fHhhjrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bnpernbj
Subject: [Buildroot] [PATCH] package/libtracefs: fix build failure due to
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

At the moment package libtracefs builds utest that requires
pthread_barrier_(), so since we don't need utest let's disable it.

Fixes:
https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
