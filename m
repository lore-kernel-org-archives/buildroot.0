Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0BA606D16C
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g0q5GZ1b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2VxzqTC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7B540881;
	Wed,  4 Nov 2026 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jn1V4O2sAjfC; Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44FB2408EB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826033;
	b=rYRd3z/kN0knu3ovrJNzAoG6/QXjRX7bedWNSQB9d2Mhvi1GXlmF0luGoyQrgPtEQtCg
	 vm6fNydUtCZ9j8PFyvpfe5YRN1Abb92ambgyvBzSKu3fSfE7SGmiICCztqwaPBAMV3MOo
	 EnfVrMfhterG5dO9dPP51zUkrdOViztvvtRKMYw1mYM9QwprrA4o0yJ+HMJvtABnmLlaq
	 4cDoQJznH79bXEPaWnvZ69xp6iTrHPKvgUZ74SD4yhDd7C3I2Xx1gMH3zEbvhj37VKpVF
	 tl6xKo0AdlO7+4M/dkfVxCOggSbuoWmj6njsUU/uUm+hIkfDe4vvv0J4F54ZZZM80Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=rSI+6WGwlOTEdqq0Ent/QSfyUHhiSwj5e+S84WOEEgI=;
	b=Fk3ELBs/6tV/FR3ddvpPtxIMKcdleci3z5WSLIPXezEn98TlQyjmu/5OxB8E75t8np2z
	 kkgkrbCC7aOJt+PmRsed660p4k9FEa48Gf/iOMQo2H0vIuawJ4lbjw9vmCKuUK03lN7m1
	 ztb59J1VxZVMgYF66PQBf6j2x+1yd5LujMwAIgF1tRxhGZ3ZJ7uS2v65PLw9udQ5SznfM
	 DpbbNaxz5pUrSnb3cXZnx2c6hRmCSRrObhTJQmBk0YpdLep73GgQQyicKnLVh/eK4BvYP
	 KlpbQI/GKuws4T9DQubgeXLX+oTB6o/Oco3jg/NTHpEJNqDICxKrAutXAlLWeXO9DNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2VxzqTC;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826033;
	bh=rSI+6WGwlOTEdqq0Ent/QSfyUHhiSwj5e+S84WOEEgI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0q5GZ1b0xXSytqWdZCNxH4OYI2Iki0W77+JQDIH39DGEE0rS8VUcRTR3RIwviZD8
	 a/PJHVrTfaHMLQu9gPyywELA/RXjwRXvX2mCBi8VpE3XWEA0sNAnzjeVk8qvKgALqV
	 pzjXxqemHjf+QssN7P+mV06xpI0PSYbVTyegbMpvG0PBWQSQWMVhn7J4UTXR7afvhc
	 zzlxvkU/kuRp3k7/MHvIK0hHQCyHL4QstPe4HeyACWqplMToB8SwfQ85TI0cgWsALr
	 Z5pY8T5AbZKFQzVonfi77kr3HBWFvhhmjpFvWW0Ag2swGNRfjDDMd2+rMYY4KIIHrA
	 iyQCz8m0gb1Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FB2408EB;
	Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B71C31F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E0E408D4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvuY5Ly08465 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F0B540881
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=g2VxzqTC
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F0B540881
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso611556f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826027; x=1794430827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n4tA6TikyBXqU82BycLts68szrbbTeIAPmk6VZpYjdA=;
 b=g2VxzqTCSfkEMLmRQLO4Jor3+EREhWVPiV38fRdCOjN7AcxikVnG4TxSp0H6QL4GVQ
 CSthoYi+tIFOkdrGG0Wya3SU3xyv0qTkzJnxzXKPlXtFCA+9UwDIgB2yZZxH0gScVvsP
 soYNhtkddrTuIkVxHmFNvdY8j5cgHs1alT7vQMRNksIL1+W1K/HmR5hNVB21/G7hbyXF
 gpuxiWH+Gjs+lwxcF8kycpBLSIGR42AhsGX8oLifPW+tBzu1quw0JQnTf/4x8UZm7oBT
 Q/UgVvlUHcN5HObNrBt/fhRkKjvKWrDdPhl//P/rUByZgrTEHn7EmBCSfnKPETIlMbHT
 eLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826027; x=1794430827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=n4tA6TikyBXqU82BycLts68szrbbTeIAPmk6VZpYjdA=;
 b=B3Vgy/lAu976hBLIx03yaajqF/zJH8aHM+mo2fdmHSHwMzJJ+5iUYTDDKUtwBj4xai
 s2i32uB6FuNRmt7d1x5XjJAIYCidwIIeIuQ0i5txJMeW+k5PK/tB0PSozhF+ttSv4npB
 wjB/JBccV104FJtLacT6xINHVZ5J9RRo0UXQKR5xJzaeRTwUXvDiyRt0XtefHNIivla+
 HrEE7K+3X6+ELF6qYF3vyZmBDz04WNQ32/63E8lxUzlGNL42TI+ovdv/+e+uyH4ZMitM
 gWIkJO6NfhX5RWCDKhEZ6sybrYduywaeiQsznMt3FQ8EYxCGSiHiha1i4lJbD1/VS69g
 NArg==
X-Gm-Message-State: APuU4Z+FCsxwcLvOmzIjNCqlYRQZcylNZSa7NjtMv2iq7CPd77IDq5X2
 thEYHOcDWxdYV1Gmwhv+6sW+jdDOS/YXneYV+uLLl69gFKXfEl9dMa9CowqI3Q==
X-Gm-Gg: AYBFou1AoTRG7QTtKF/5i24wgG6kDjQgxn+yQAUwiK6l0LMvnbiBt9lIoC0lb/dfeO+
 pWSshCH+QNOXA9FKkvVKeGjJwuTAZijKrck1D5T+kFNnX+CezguNrxEsG2WS3KMaOPPZam1bfeK
 bbv/PWryu2uSlbNqn21vk2gXj7woGrdqA7XGurqLdql3q0GxE8jWmJlnVlzHTYQTEFlYhM/47K8
 DHbv5bIrHfl0Ka5H1+Dz6YNB6jnHXtNllnqYwsXkAEtNPR1oCtGSU3W8lmwBQmbIukwXg+DC9sm
 9J9rrO3yRStY6tmjAr6fyWhq3Pfi/v9uw0MaVgIvYGuGc7ThO5xaZ1VdfWvxT2BxoSXZN/3YzFf
 beSVDcgtsOdBu1KlNtBKfqcsAHrE7V4+ZzXHjyvA3yt3McThjCxK5oZU+gjqM4Eyvwdgykbiipi
 NSlKq2EYWXkr1By0spHLE7GpIGMlJLfb3inSgEwO8PU6ALa/8iDjyx89PqPKOrVPLu/wxLNV8IB
 Fa1wiKUxB+g02eULMrIYt7NCQhC/RecCVB9yLGLAW7Vr4UIzt2EKmSa3cV2v75DP0KNrJ3elD86
 78sKbWCCymcvXePGLVrzSTIEodYEdJia6542rjU+3mXxu+rGVpgu4/U=
X-Received: by 2002:a05:6000:40dc:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-48e6e3071f9mr39137604f8f.15.1793826027248; 
 Wed, 04 Nov 2026 13:00:27 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:14 +0100
Message-Id: <20261104210019.3509258-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] website/index: align the hero on the grid
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The logo of the hero is centered in the left half of the row, with a
fixed maximum width, while the title and the buttons fill the right
half: the hero looks shifted to the right with respect to the rest of
the page.

Lay it out on the grid instead: the logo fills a 4 columns wide column,
followed by an empty column and by the title and the buttons in the
remaining 7 columns. On phones, the logo stays centered above the
title.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/index.html | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index c1a5d90483..712d22d98c 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -4,11 +4,11 @@
   <div class="container">
 <div class="row justify-content-center">
 <div class="col-xxl-10">
-    <div class="row align-items-center">
-      <div class="col-md-6">
-	<img class="img-fluid mx-auto d-block" src="images/logo.png" alt="" style="max-width:300px">
-      </div><!-- /col-lg-6 -->
-      <div class="col-md-6">
+    <div class="row align-items-center justify-content-center gy-4">
+      <div class="col-8 col-sm-6 col-md-4">
+	<img class="img-fluid w-100" src="images/logo.png" alt="">
+      </div><!-- /col-md-4 -->
+      <div class="col-md-7 offset-md-1">
 	<h1 class="display-3 fw-bold text-white">Buildroot<br>
 	  <small class="d-block mt-2 fs-2 fw-normal text-white-50">Making Embedded Linux Easy</small></h1>
 	<div class="row g-3 mt-1">
@@ -19,7 +19,7 @@
 	    <a class="btn btn-secondary btn-lg w-100" href="/download.html"><span class="bi bi-cloud-download-fill"></span>&nbsp; Download</a>
 	  </div>
 	</div>
-      </div><!-- /col-lg-6 -->
+      </div><!-- /col-md-7 -->
     </div><!-- /row -->
   </div>
 </div>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
