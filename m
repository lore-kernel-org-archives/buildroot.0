Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E2606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RahzJude;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wczZIJnK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0082281227;
	Fri, 27 Nov 2026 11:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZagFfdQcf191; Fri, 27 Nov 2026 11:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1EC6E8121B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795777557;
	b=OIBdW81vKtw9ikdp8K/Hkm8TDPWIt7+Hl5BrqGnXAfXKmhrJqfRRUWd3qleUKvgTtY5y
	 ZV9Bmh/0Y8TBLFzej4Msq3prVFe+2U8kIeyKOY/8EQniTHBQ8oPwzdCJNauJKEfqgUSFy
	 TPWx/cRYduYn9VRzblG+HzDds3fGnFZNFLggjc1oAvLjsX8uad7P3yHlXInIBowVvD85j
	 3czfcYZtXITRJHrQ4EFBL0uuLv42YjdXYyNJzF5aSo37c3JNZlY6d81/uKzKW4fvo55H5
	 WPKArnTPJqE7HfzdBEf/2FRaNicv0MtPME3OeRZPZAwT1afWIZ8BxMZ1N74aj4U8oWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qmNTilTQ8a05ZFgHrUL4+ho8pgSOiVGVJuwWRj4uLGA=;
	b=ehuxj1QNshkTgjfyOmw7JIYilYwWzPCOxMirJmJWEaGmztSBdTqCyIsipIFTmC4DQPT2
	 L1gmU65ffB767FeRxuIP3RpGP+ILJZnLEY8w7POGAM3ws/w9en9/mLPD/8ZuKwsBT4rGU
	 IEoAJEMkCKt4gpxqF1gnAjiyBd7rls0ctscLytNM9Bqwh4GAfn6gJJrVvEFhnazUG71gT
	 CXLS3dZaBpdY2X8wcOAhiCAYn4/WWcB+qLUrvLwPwrk5+R7OZauIPlDP5uteXA22m03Wp
	 mkO6cqath37Mp05AAuGIHBRZT/7UCDnqEbBzbNRWm0n1dDcisp240OEB1j1FANk/7IQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795777557;
	bh=qmNTilTQ8a05ZFgHrUL4+ho8pgSOiVGVJuwWRj4uLGA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RahzJudeFlBi1ZwTR6qinuQeKSULIXGA57YCCkk/q8c28nii3S5rhRL+S4QCY3lNQ
	 MY7GLbHQkRJtrcCi2Pj/LaZkw4KB1dzDufURZP9yqNuIMeu1IUNTQQ3V+/SCARXf1i
	 S5zvzO7BJaAR4ZCisjEtP4VAoCm/obquQKDJG6RW4BzmubLXGtkVrnD/hLLw6PwOjU
	 zk4Ff0Pqb3uyCZfiHmOHfQ+7UlI+yLqt/opuRhNsgctqIeD0V47TpPr7FW2POSyIsQ
	 sGHfHGDHkgDoP/pPjVro4yyWMqLkZLUklXsIe7Q9wqqGV9pilIWUTEtsJTmwEqFE7r
	 vwg4DrEee0L/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC6E8121B;
	Fri, 27 Nov 2026 11:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 518F5266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43015408E1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tBuU_VGY_hR for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61846408CD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=wczZIJnK
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61846408CD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb69f5b161so51973785e9.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795777553; x=1796382353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eJUgXHp9FdjzHyP5sPqN76nfkD0N2ZUOblsEzwCZoWU=;
 b=wczZIJnKozQB7IbH6hpCp968ZMkzsqpWpZwsYaFVSmOZKSmBzUCV9CAc+yB9BSezKK
 1hoUZOUdMPdwwwHV9N4RSLasGOiGaMURWAiy3GXk5z4E58ON9mFXvACfIvvLKFmE8y2M
 OvDGpS3XGuMc1B1/PTn/kEGPy8F06IgVe6q+dmCHODN2rFZ/o95WzQsMKRuZ3nMhtl2M
 Zpq1M1ho853HDidT6dHH0SelnmVk3YfdsL2B/q1O8rahI+sHbiEWs2juAyI/UpSRz61/
 d3qbySC+v8Q6U/A5Xy5PrRWDxc2u3ClT68qTK+/RQ1DqO8I1sPMkAdJR4D7PE8WDcU3D
 hHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795777553; x=1796382353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eJUgXHp9FdjzHyP5sPqN76nfkD0N2ZUOblsEzwCZoWU=;
 b=ysKBrNi7M1IY0258lExIR0/v5jvhnMnRDrYn0lAC9aQTB56WXTZnUBcbF/pa/uYZm2
 7yHDa7ccrn+3wPgYZzJjOGls3Row2u0wDuApov2RV2tIJ3p7fzeiVkQdAtbjOig4lnSy
 5kq1GnntilCSEkU0xLi9i6ev2OkE6AAiVj/m4rzqPyxPMBE4z2M3CjtW9mQdKf2dds3Z
 MPZLGfSR5KUbk377hEIMHEk0N+2m8bzqcem2CpccRuJfgWNQVVzYAZdBq4l98AD9jfZt
 Gspon5EpvHGIbI/Z2tXlYCsM4T/P/YS6uy6pMNb+HG6WUShbQTUQtNnqLn1bangO8HxY
 y+6g==
X-Gm-Message-State: APuU4Z8EMKlx8coEm63ZRVLznOjtFjMajfkQ+d+NDpfSt7aTT24opqZK
 js5flhhAl9wcOCPt78BNF6nW6t9oJvJJ5FTOSLZtstAClEl5seMMwF+jnI4mwQ==
X-Gm-Gg: AZFdTZc2T1DKRkAGx6z3ByvJH0PfWb5wUkxefTBN7PeMRtPAijA1ZRGTdMfWK3ot8l0
 mKDFz+4UOjC2/3pLmUNbiZSC4XJJOd0GPfDPoUlNfH6e7Q4DKtwTAj17WVZTkPx92QOzivh/Pr8
 6VaOJqg3XbfuOGtPF9AzgvqToH7NXHyu4l2fnqFBUAS9hnTFdIpH2W1MbXhsHVR5uGWbKU4UbY3
 8ibdBrlvCacpCW3GKx+qt+zlw0IU/wDd8WcBDWzQkYbJ36QCor0XmZXGHf/YaZOY3HU3F6Poj+D
 Mjt46igcbKBrdcWWCexAMLDhnzSnpWew5ejeEQ/uJBtRYEcHrh9EG7EaG5VIMvoHkyhZw7QgQcy
 a2CaZeLPn6r58PZ+m/6PNU9FOEf0rkFY6JgDzeyEOJYuSOAcLzpVCI4O/1hKAegA0bgQK+2wd5e
 hJ7eZ7+wKY6f+dh0IM+twdaJBes3miLuECIchh1Kp9F1uXiEhbJ28CSPcPtGDGE22A3QhUbB+y3
 3PIsVCCPiRPAD/B4C9Gz7hzkTGmjXTjFKzKFc9oWhkksDfA8cQQoNdMc8N2QqqWeJFu8eWJGUic
 2EF3z3iXMTsvnUElO+WY4muV16COQ+L+6vTawagS7WyRubwvVu9Ahl6cOSsGu/Bs6GKYMs+k
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id
 5b1f17b1804b1-4bb88800013mr514794925e9.6.1795777552543; 
 Fri, 27 Nov 2026 03:05:52 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4b34e9c3ffesm30957126f8f.19.2026.11.27.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:05:52 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 27 Nov 2026 12:05:49 +0100
Message-ID: <20261127110550.16853-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] docs/website/news.html: fix the markup of
 the LTS entries
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The entries added by these two commits have the wrong markup:

  30e5a7f2f7 ("Update news.html and download.html for 2026.08.2")
  ec7e6b7d17 ("Update news.html and download.html for 2025.02.20")

They use the markup of the old website: glyphicon icons, which no
longer exist, and a panel without the card classes. On the page
they show with no box and an empty badge.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/news.html | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 6c52cb74a7..7ce2d8a22b 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -30,12 +30,12 @@
     </div>
   </li>
 
-  <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+  <li>
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 November 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.08.2 bugfix release is out, fixing a number of important /
@@ -50,11 +50,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.20 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 November 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.20 bugfix release is out, fixing a number of important /
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
