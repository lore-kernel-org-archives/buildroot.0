Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D78606A336
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J1AuKRYk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5PPPkG8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2532403E3;
	Thu,  5 Nov 2026 17:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtnLSUgTdc3a; Thu,  5 Nov 2026 17:51:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A8414403F5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793901068;
	b=G0SZTYTY5obM/uV9ipUElv1b4S90UHcQUVst60/NL6BZmi/7oW1LRVmHkYy2GAeUjyh6
	 IB9ZplY284ZqwyI30IX5K/JWQt4QHQMinzE/3NcmVb3XqnKrI3tPCA9eDe75B3zg3QlWP
	 vRwGcCwIcopDzwDyQzsrfbhHuRYL617FXNtztLulyhcv6yg28kHiyw8norF/cbX1zS7s3
	 qe+Y8X/RnuSIIjmN1JtPiSC1emq+8Qwq3Wy11Mez2IrTiVMzl2qfQBw061UzJ+CdtS4Se
	 wg9Kw04I4iFXlopTkhhN8Xgy5u1Q0PTMG4t/4Ar39H9gckyDCNVC80geX2S73c8vAag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793901068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5mTtad9XfycvaIaf9aEnuexDG0ca9DafxEJXCoIdWLs=;
	b=Dw1aRksx7Y3dgvDlu7nPiQUoRs3rW5itR5dIVyBsZtm64rajC4Z7wKzbMTAUGkUzHgrG
	 9ZBMmxxn9zJlFGy0TKgJlgaGMb7QaHZ21EjcZmJF2gWY97Fa+Zl+G8hfLOkKVct0yMHRX
	 1pHL5Z8qfEKra+FklpFTCN2dRu+/L4NXVuz4Yp1qfcIRAGdVm74jmWbvPh65o3b3kR/0x
	 pkDDpc4G3dgryZAg3IdFfSlUhFdLhvVFmXP0PPrQUccfZ/15pWXReLU2DRE1xZ2hS0DaF
	 AL5wUelmaO1TTrXHfJLZRtgsC330NqLd9DwAJkeYdM/o2DhfzgDNh6rCMPU/pPtG/yA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793901068;
	bh=5mTtad9XfycvaIaf9aEnuexDG0ca9DafxEJXCoIdWLs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1AuKRYk8wbZgMOROuTRkpSUPEEjle8+FpMTvKuRYCS1VDPrc5m07RNQzBq5+jxOn
	 ql7MwHsQPuIk0bmLHd/itwoVmvgmRvNpekSaZSGFTJW5kGkRiz42n9nySWXV5xoQWP
	 /nZ7Bdy2/73CrjxYtmKRqVek5Mx4uh378mZiR8WqiBWTnUVfwZv8rNkZ7PR/blTIav
	 iET0tI8fyGfgKNRAeQV2Q9hSMCBn5NEcayAEhzLBuO9qMHeoCKlGthahaAtqXHdDgd
	 m/eLmWHDbg9kkcTUcUD5/9/sBPEICaoARvVyKzrY/YprfbdsBxjeVJ9F7Olu/MORgS
	 rN0ZOjWK3bLCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8414403F5;
	Thu,  5 Nov 2026 17:51:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADA8637B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EFF640093
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD5QwnnCsxJW for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:51:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 764A240012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=r5PPPkG8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 764A240012
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso11046245e9.1
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793901063; x=1794505863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NIRV7+YBKT7Rfugxt0XTeRqpXMX3pw2n+Po1HkUobLc=;
 b=r5PPPkG88a48HtRQ7f5A3U9S1MieQbrihYa/g1WsL4froZ2TYTY/A15XiaVJY9Ar4o
 AR4ZnaINVgncwB4elt1Fp7MYXOczoGAAdrMgANTwIk6rEhY/UotIWtfszHWxIWgaHrS5
 qFh0w096nSUul/IlWKrkCmGTPG72i6ZcKM1hI8E6BJl2Zrun9FnW3iIzMWNSvFc0+rXO
 NwBxqYbcnIPG/dcKeqxhCEkmObZWJhSpSkUhVMgSbA/yJDZYgJ31qIpNAtlfccz66HD+
 DqQ3HbcNz+SOHm2qQ+sflQO0Vswh+QRzMaQWiYYDIflcDdjgxsUFVB5HIV6GxR5fBNPA
 SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793901063; x=1794505863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NIRV7+YBKT7Rfugxt0XTeRqpXMX3pw2n+Po1HkUobLc=;
 b=ThEz7m9/UR+707FEioGipgNZLKU65z5/tW2aXT6KSYGesJx8eNmBHiWiu9RGmYYcdx
 XqvJiPcxbVDv4P5xiI1Zo7r75QG8RI+mofM8Fqsy6NlAdUBtXiCD7udmx79zA8BuURsX
 azx1ifAxdy/Hn9OhlDbvIA8bzrJi6H8cCAIQaPzS75va0u7XSWQ7wIV1qtwDBdeQms7Z
 15pMvF0uITkQa8qgdbKyK2ccGqkFxt0HiZU32iK1ZhxyhqGbqFl2NQqX4GO6pVEl/l8I
 iYSUnzk+ltdWzvVCBSRv/b1pK9k+uIDbLqw1b0E9IzzlJbK16ll+U3sWPyvvrlyJU7vn
 JaOg==
X-Gm-Message-State: APuU4Z9F08EpVQN5ONV/RLuPWIsM4a3bzcskDB8vp4R+1Mj/z00Gczfb
 jPAh+iVZ/z/5waQ0Q+XbvEDHOWUF36kUxPIIJyFFYCz2+uiyDy3/AcSxaQcx8Q==
X-Gm-Gg: AYBFou3/gyLdyBvd4owlmT49feGyFIHE4/aXFHn2QAxZc8kn6sCQ6wh0T8aEzB1Ck9L
 Mx/q02KvC6a9vs5f68yiPAczEk9xtRwMZmfl/4xjVOVw2m7VYXLbHgvHb44uT7sJkVo6I39TBTe
 BDsN68cIfh29csdino6rm8Xxcdh8tx1aBEOFmBUD0AWFSB384hg3yf0KI0ApjCCQDz/EiW5q2uL
 66Ef3CmyOobGPuu4jB7tYFjHN/geYtO5bHRSCE4JPMONrOKmGDlJeAOz0yJfFPvtEzU0Ba501JA
 /e8K5Hp8XEXfFgjZwbY2wUrqATDLpsG3hKJ6RZiAATukzy1oILZV7Phs/2X/RXD7sdlebs/fBeR
 UyCAfs2rktKstzohpIoqXRbdgZqRtot6dutowHqbolkCJVOgwNEshVvA8WIKDF8gNRAacWedBbb
 hexE+h8VtiqVAXzDbF+IY456C5afOgTxMh3ThfCLn+SlzokprBtx91hMDNQH6lZzPj8RkmVRdSA
 1R3Jf3yDGauGfH5N21HhLQ4d+pAgWNplcSDWi3gh7Hr6nJH6vN/VqxvpZflH919QC+atCKViJ4A
 eCB3ib0Hdu+JGlm231sPE4O0d0KpGNgr5/nEhw9M1jQwsgJ9raha6g==
X-Received: by 2002:a05:600c:46c8:b0:4a2:1a:a120 with SMTP id
 5b1f17b1804b1-4ac16acfde1mr454306325e9.6.1793901062782; 
 Thu, 05 Nov 2026 09:51:02 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4134ff2a3sm124325235e9.2.2026.11.05.09.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 09:51:02 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 18:50:58 +0100
Message-Id: <20261105175058.3132718-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
 <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] website: add the showcase page to the
 navigation bar
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

The menu has no room left for a ninth entry at its current size: below
1400px the labels wrap under their icons, and the Association link
touches the Download button.

Move the menu font size from the fs-5 class to main.css, so that it
can shrink to 1rem between 1200px and 1400px and to 1.1rem above,
keeping 1.25rem in the collapsed menu. Add a margin before the
Download button.

Bump the main.css version, since the file changed.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - none

 docs/website/css/main.css |  8 ++++++++
 docs/website/header.html  | 20 +++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 0cc7bbc262..c984dbb154 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -21,12 +21,20 @@ a {
 .navbar .nav-link {
 	padding-top: 10px;
 	padding-bottom: 10px;
+	font-size: 1.25rem;
 }
 
 @media (min-width: 1200px) {
 	.navbar .nav-link {
 		padding-top: 22px;
 		padding-bottom: 22px;
+		font-size: 1rem;
+	}
+}
+
+@media (min-width: 1400px) {
+	.navbar .nav-link {
+		font-size: 1.1rem;
 	}
 }
 
diff --git a/docs/website/header.html b/docs/website/header.html
index 406d4d545b..13759ee651 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -19,7 +19,7 @@
 
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.8/materia/bootstrap.min.css" integrity="sha512-lR3pptsOFflVTuIszkLNcibNkPReN2dEA/t1U1++B3/wPEZL4pysMdYsQfaMefLI/X2fjvk5AeaHVBcFoVO2mA==" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous">
-	<link href="css/main.css?v=2" rel="stylesheet">
+	<link href="css/main.css?v=3" rel="stylesheet">
 </head>
 
 <body class="bg-body-tertiary">
@@ -32,21 +32,23 @@
 		</button>
 		<div class="collapse navbar-collapse" id="navbar-main">
 			<ul class="navbar-nav flex-grow-1 justify-content-xl-between pb-1 pb-xl-0">
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/news.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/news.html">
 					<span class="bi bi-star-fill"></span> News</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/docs.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/docs.html">
 					<span class="bi bi-book-fill"></span> Documentation</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/support.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/showcase.html">
+					<span class="bi bi-trophy-fill"></span> Showcase</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/support.html">
 					<span class="bi bi-question-circle-fill"></span> Support</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/contribute.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/contribute.html">
 					<span class="bi bi-share-fill"></span> Contribute</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/lts.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/lts.html">
 					<span class="bi bi-send-fill"></span> LTS</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/sponsors.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/sponsors.html">
 					<span class="bi bi-currency-dollar"></span> Sponsors</a></li>
-				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/association.html">
+				<li class="nav-item"><a class="nav-link fw-light px-2 px-xl-1" href="/association.html">
 					<span class="bi bi-arrows-angle-contract"></span> Association</a></li>
-				<li class="nav-item align-self-xl-center"><a class="btn btn-success my-2 my-xl-0" href="/download.html">
+				<li class="nav-item align-self-xl-center ms-xl-3"><a class="btn btn-success my-2 my-xl-0" href="/download.html">
 					<span class="bi bi-cloud-download-fill"></span> Download</a></li>
 			</ul>
 		</div><!--/.navbar-collapse -->
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
