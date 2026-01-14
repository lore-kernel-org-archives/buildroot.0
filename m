Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385DED3901A
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09ECE60DAA;
	Wed, 14 Jan 2026 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6iqIzEjuv7k; Wed, 14 Jan 2026 20:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328A460D9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423214;
	bh=6pV1/zdpC5P0GqXfEBAxCnTEz7x7/xu0R+FgxeKrbSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p5pcyQMfOpg9R/79MgjkEBX1DeBFNmdWrB5hNg+JPTYKv5J5zok1AKTIbrJ9KIj5i
	 jDUIxDXs8BATcn8c5YfKax5OCheLWT4JtA3MVQ7iB88X6yVoMT0ljD2RZ839ek7//q
	 pDL5PdLfpUlH6Urt/F/73d4vPEo1sr/9DRAiPn2BAWFcIbj5SK2IDi5ecdgxso27ZX
	 ihSQcPzCJe1R2DLSNP2CjenMIl3woWAzptjBI/0ooe3Q5fT8Cafu9yo58y/wt1kR4O
	 eDzGcNMe6rVW+DXaj4JAr2eKXqGwiwQMQP1W+U+U/cCkw+7980ayxDN9sau+QOxNtj
	 b/2sDaedKRsFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 328A460D9C;
	Wed, 14 Jan 2026 20:40:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CE625D
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3712407D1
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPviqkwN9o-T for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1838406A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1838406A5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0636885C1; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:29:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 517af4da0194e1e6d207c323014d062dcb54498b
X-Git-Newrev: c183602cb37214e47294cddb785bbb73536b810f
X-Patchwork-Hint: ignore
Message-Id: <20260114204010.C0636885C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: bump to version
 5.5.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c183602cb37214e47294cddb785bbb73536b810f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change logs, since version 5.5.0:
https://github.com/tesseract-ocr/tesseract/releases/tag/5.5.1
https://github.com/tesseract-ocr/tesseract/releases/tag/5.5.2

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Julien: update change log links]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index b45e892966..fbc209b892 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  f2fb34ca035b6d087a42875a35a7a5c4155fa9979c6132365b1e5a28ebc3fc11  tesseract-ocr-5.5.0.tar.gz
+sha256  6235ea0dae45ea137f59c09320406f5888383741924d98855bd2ce0d16b54f21  tesseract-ocr-5.5.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 81a1e8097c..4f5be993dc 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.5.0
+TESSERACT_OCR_VERSION = 5.5.2
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
