Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B3FC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F106119B;
	Tue,  8 Aug 2023 16:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F106119B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLwr2E7svDtq; Tue,  8 Aug 2023 16:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C05610F1;
	Tue,  8 Aug 2023 16:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C05610F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF1131BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9637240C09
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9637240C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6NWfb9HziQS for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:21:14 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2E9040BCB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2E9040BCB
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id EA2EDAA8
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:21:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34TAq9qJkEXB for <buildroot@buildroot.org>;
 Tue,  8 Aug 2023 18:21:09 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id 9EB1C83A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:21:07 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 1F2C8CA7;
 Tue,  8 Aug 2023 18:21:07 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 18:20:27 +0200
Message-Id: <20230808162027.100470-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20160331; t=1691511669; x=1693326070; bh=fDRJT/Aqx5vset7U5Hu
 0PpqKGkbzsr3CAvZX+ACw9XM=; b=ADk5dcOMMS5bOhHgGSPj0IUqJNtvUAyKR2q
 f3q6BJRKp+J/WI0tRWSX4EZ/0IYhXcEsXGUDiFrol4NWmFSRp48bb4aafkwekPZW
 00EI1F3p3YBM8CHRycPbJNrt/haniOxyCLKmgLLO2opO7K6dwp7QQrzjaSKn1Gwd
 lQN+yC4hW2o5PWfzZ6CBUG44FwFasesaF2ayu9aTtsKxYbVCQoAZW3m2P4yysCcD
 hxAeufsAJtij7B6XfdVGZSwIgEQVsmGbhnlGGaTEGMREWhq8g2Bhb+zwtOx+81BA
 g9LeabmTLlMMqklwIkPlaMcAhehgbbP52Eak9trZLriLCkRgSmaZMbMqb+MYES0U
 4yhVovmFLl841R6PqMzF/FMNY4bxjg3bw+3q0OacV3vRMwv/Z+fr0ma7A1NooLVB
 wMGb/99mTVqZNnQIWys+hr+7JlxVeuOtxqG4CdrDdBlh7ii+v3B7CqFtrCyat9y8
 ReGvqcOJxzkO0sCwHmSPbp+fxNqVIh32rzIHo4OnEueYwoAsfr5EwWT1XZQ69HB4
 jTP67W7gKHUsg21vcclxnx8bXNlse5V8B4bgYOBoMTZNmL1EKRlQkvlLoUwVwnvD
 QOicimc+OZwHx74IRF/dMV429SFTvekmZWCGVz/KxS0D2rOF8kDvMWllhf/XCVNb
 Cxbw3j2g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=ADk5dcOM
X-Mailman-Original-Authentication-Results: ext-mx-out001.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/quazip: bump to 1.4
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 16d299fdf4..1c5c614caf 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1239559cd6860cab80a0fd81f4204e606f9324f702dab6166b0960676ee1754  quazip-1.3.tar.gz
+sha256  79633fd3a18e2d11a7d5c40c4c79c1786ba0c74b59ad752e8429746fe1781dd6  quazip-1.4.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 70534b63b3..bf3b844624 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.3
+QUAZIP_VERSION = 1.4
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
