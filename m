Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C987606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=al2N2HoY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqXnzbCv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8855440780;
	Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3w2z408ZZqSM; Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 25D2D407C5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285067;
	b=SEv9Qfm2W6BPHiYK7betWOiJCkv3/8NhMC6hdpRP+Exn0eePWnAtbpq7IS+K4a+mBkJV
	 bXL99ArROB2arliLV7AmZOe2G/n3kAmK8Ahzagl7RMWuvV6MaBTzuVz2a84K5hn/yce5u
	 aPBbmeZhaYrzS7RTP56/nRlEMUOBEx/ardCHWOif3dDi3ELBPSk7zuAvTrL5tvgb0apcd
	 VJQn6lBj0dqs5dkLoqtxqMDtC9S6RpY01/PzDlpA8fc2eubB9g6IiCodPHJoz1e43cVNy
	 2oyLo8R33+euSBQTEhqRW3zwzDjkc0i4WwEs+F+uUnmObW+QEs2+XqGjP8vZ0v/VDkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+RrXoVgeZcWF1EP1+gMXEUa1gdTxHUi40xNlHpjk6Dk=;
	b=rmOcDnliqa5Q0VfZC9pdePJP5Rg/K3U8HYidYqVNcIAHv6ua4BMMjIchMar0EfjiX4Tn
	 cF1iT27mwgrOGm67IzUBGD3dUTavskVcuqDEEyQJSwFBhryGlJtIT9HdwyyT2gkMEm+th
	 MinGROWH4iwtYo8K4LUV+SE4PIjDx4EgnIU+mAz60D8DDk8BnM2McTwlDZpfnhZZ3sF09
	 /mZwKChnphs3+eOZj0O4mx1yj1yasT3SfMNZZRD2lWKGejMadh0vFGlXjbQF1VuZBfCTu
	 DWJF+zxb/2ttInKxeRezGj/005IpA0uan+raSY4Cd8MYe6ffqNGrcP1VTkhRrFezlqg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285067;
	bh=+RrXoVgeZcWF1EP1+gMXEUa1gdTxHUi40xNlHpjk6Dk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=al2N2HoY4fBhFZ1neguaVO2xCJ4Kj1SdoKkMjFuskubbvSLBQ5swAcEzQA3vQDeic
	 hY61TBqDY7vBeJpaktZim58KzlEY6+RDuXFL6iEnq0IhITBvbwVsM3j75umDJXqnMJ
	 RrhimpCw9bLUcgqkyy8t+JWJbaaPCfQHr+FOwraAb2rwPdzXBA7O3U7723Ok5WvWUb
	 SzHeAfpnK8KFhb8WF7+z1KIIW/HSYX5EIL3X/85JYbeOGW5yO0FfQndX5MS2V+SIpO
	 8HQ9zrQai8MLwJRio49lAYMqf47dhu8hbiDkGo0LY3ACB2mEUm+WL/gCJy1cAdRRWl
	 IliCkyuKjBnaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D2D407C5;
	Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D09A362
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F4680F7B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFZ4uu1B-xHD for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E4B1780F4A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285062;
 b=QGP3uenwcAlARg6L9X7N1BOaGQF1OBKhpQfOHPO0SBeBrriPeBpA08vP1NRLWRuXm8Yx
 j5loN8uhzX+AGJWA/lkm+02h8g7Gm1z8H783Hixzr9am+rfult+AGEbp+xPZbniVP1gLq
 sJLf3FlXfFqFhcX52CzfVQaZGhhrbFW2ETBD0dIByTZWzG0MNCiYK7bQbwpsS0mGyUIoe
 966aO6PHBkYeQgoI1QU8scCGBynzV/O8KIeaxkbCwHIgszX58ZBOlAFlGTWwt1Nl6zPTE
 /DSJC3qv1ecBE224U8Zw1hxaZjSPBO/0+Ysuc50ZxGfyY/r0JcM94teYjiX4BYZyd8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285062;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WZU0WNiU2gz9mC/ObnwNYqOU9eqr3eC1FalCzLugvsM=;
 b=Z+cmQKTuZegrxIf00fvclsWNgb3Fkj5wx/jbvVarsAYQK6M+uENAYU2UCHQV7DzKy/zg
 FGAQ+iD0ElA7ds1RtMh0bRYb039Ibte9Yuxav7Vjg+Au7jU5nSv6EE0bhbRqgJuXz/OSJ
 118+TVgjrefLECu5LVz8Jl2AFQaG+owBwarMsD4gKTL1GYAI/JHzvBrM9Yv7mNoSCR5+b
 cjXEa6hNMg0JYLb13ANYkwaxIYule3aV/Jp5+/YFcYChuxm2zmn8AFAjKyRHIR/MUMN7S
 xmVsPZ1Muvzsud3jSlnUSVxJlYbGr6IwvEYsXuPs1S9+ax2JbvaXOgKbeFVm38ZFYqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=eqXnzbCv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eqXnzbCv
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4B1780F4A
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1752683f8f.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285060; x=1793889860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WZU0WNiU2gz9mC/ObnwNYqOU9eqr3eC1FalCzLugvsM=;
 b=eqXnzbCvh4+OTLc8OBNnPxwcBQWAHpe0bw1MZ5Ody9q11A+IrykyQWooK4X8MbcLjy
 HCi6UWIxXry/oY2CEEZCsxY1nKnd/iAQ5310KDXiLGaSPDN12Q2yHpj+qfh9m0dP7k8m
 s2j5gIhCyxdnkKYUYgiH4JAa/pmQ4DQ1kevaiqJvkmww2fcFVDZXQ5+TU9zi1B0pQ067
 LW9RSgvGKgUfAtdagXN6Q/TCFOYvFNc1OL2+D9k3bSCe/hFjIfUBZW1SsN9jmdduSII6
 ToUzRLtZQAk1AexoiPe9Tsn4OlPFk2MauGJJNgqhRjzi4yjTWANf/ocs2+D2ETqgWcAA
 2h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285060; x=1793889860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WZU0WNiU2gz9mC/ObnwNYqOU9eqr3eC1FalCzLugvsM=;
 b=02g9se2Df6VF6s8UAUPbLfhs1z3X51/mhsonKKUTV9/Lst4vg+bTApzNZJYLfU/9mz
 Wd7zHCntRabRydfx/DebqtATa/8FlZuNZtJGsuRNcccpN0Ar4D8GrPll8iPtRXI+fbhd
 Ieewk1t/Al0p9lucXN5K38lzLBhu9PJsgkOxMVme3OH4EPRTlfci3xLUCyoWoNdN7/hy
 1SNjFl5etYPnoNMy2MI18PrP4Rw1EQCBMZbSHeGwlrC4nKatUq0AnrFsmZwTPJ/ei0Ds
 cUwfYmoHTbErofAEm/ubGpKWror9R0s+vCiernTQpku6tI3/uw/vbp94eKmSI416mOkh
 UPJA==
X-Gm-Message-State: AFq9FYI0/d8BdJggVDeL9dyws7k5ilsL6cyaWP+6pO1j9OO6qXguaTUo
 Sku9jS0hhl1OmOPAQbLsfPlMfEMfoa6nSV1xNoj/azqwkTOnk3wgWS/fme3eAQ==
X-Gm-Gg: AYBFou28yP8wZHoevMNTjzdrwGpcbhL8QIY5TLgK2V3M+hMsSfSi47ysWqnQpa00Ucx
 nUvYdMKk1REOE+EG/wMN2HpN3jiUvu43F+UYM5JZrS2z+vInUjdYCQkRTTawsk/HzU50PfPzVCg
 cV23SRkAz0tYnHMfa1UEyDXhMsNHTeC6qg2n+IOgloysoRf6N3WYBDGVrPTC93j6dRL+3KT4F+f
 HALvcwMZQE3YwhgrL7EsXSMLdUvSrU26sxi2noJ7wov4FycEgRQFkXViSTMBJH8IQgToW+2c2ke
 JPml2wIrw/liKe9eJepBN/gaKUTcx9AnRpzaokDcHbAU8Hi4cRlTh7QN8BA3H71GdZTxW+Z20ig
 Lh5tREjMapD39XBbSUf5OCpsC2nQ26+gHKT7/6GRP/UR96pAEpstx5jzjzNGW/EB/0xxez+VZjy
 QY9cHpVDewGC/ln8wbfjE2GzpYWgoaSGFM3Z55T0ZxX/7KF0fLvpLiXQUi9xD7lZCKimAe2X6m1
 KsHvaOXOtEpfMpsN6hewD34VdQlx1cia89KSXQsDHTmVx3dBDKqZyaqcMjhRXmPr26p/VBiATZ2
 DS/yayFpLVTvxAITYf7EgMDd+8ezEiMW2wySmSFNBj+iDRM1poT5KQ==
X-Received: by 2002:a05:6000:606:b0:48e:349c:af4a with SMTP id
 ffacd0b85a97d-48e5d312bb7mr11957690f8f.50.1793285059536; 
 Thu, 29 Oct 2026 07:44:19 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:19 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:54 +0100
Message-Id: <20261029144400.2972217-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/9] website: fix HTML markup errors
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- news: the title of the "New logo" entry was written as a broken
  "<new Logo/h4>" tag, so the entry was displayed without a title
- news: add the missing paragraph tags in the 2010.08-rc2 entry
- download: close the "Downloads" header cell with </th>
- sponsors: add the missing closing tags for the row and container

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 2 +-
 docs/website/news.html     | 6 +++---
 docs/website/sponsors.html | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 3089b1ad03..c51d58444e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -14,7 +14,7 @@
           <th>End of Life</th>
           <th>Latest release</th>
           <th>Latest release date</th>
-          <th colspan="2">Downloads</td>
+          <th colspan="2">Downloads</th>
         </tr>
 <!--
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 9ce4ff5427..b1c948e097 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9658,7 +9658,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2010.08_rc2/CHANGES">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
@@ -9666,7 +9666,7 @@
 	  the <a href="support.html">mailing list</a>
 	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
 
-	This is very much expected to be the final release candidate,
+	<p>This is very much expected to be the final release candidate,
 	so give it a good test and expect a final 2010.08 release
 	before September unless critical issues are found.</p>
       </div>
@@ -10165,7 +10165,7 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title"><new Logo/h4>
+	<h4 class="timeline-title">New logo</h4>
 	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
       </div>
       <div class="timeline-body">
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 5e27166b77..5d203fac92 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -521,5 +521,7 @@
     </div>
   </div>
 </div>
+</div>
+</div>
 
 <!--#include file="footer.html" -->
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
