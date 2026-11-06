Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F59606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gfJ3bYE6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFijhHh7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1089D6089A;
	Fri,  6 Nov 2026 11:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoLzFEmXobR3; Fri,  6 Nov 2026 11:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 209BC607D0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793963776;
	b=Bug3D/vi0XOcDS8ZV/tPvpTs+HzOaygp8qdcxTiC5snZD5ewFyK9BdAiZivELIabQ6/f
	 51YrWcRXlvUyyeXXNGRWOZAYeuUKYCkvHzAlus8qrFwm0GS6I8jqAqJIStZztFHK8kM4Z
	 5Hj4kGXK8c8fhjMF+jyo8nga4vu06j0IlcQjaTo6o8iHimOzhFdcGk0XaGX1uMf/GMymA
	 DYOjEEpPKnSrMTT6E8JkOa6bzjfchOsqi1NZl/BPZUBBziFPernhNJjIstJ0w9fnzjz7m
	 slvrxYjl182dVVG4XsE+mOfyR3Lu1t/8vwviuDqjF94Zj0b7NaiubqV939S2GVjr1mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793963776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=urFLxCVZB3VgX5Tfif8agP+gsrmc3RdK6YF9SQXdKYg=;
	b=pfKx7byenAmyAyhGF4oDoj9hxUiD1lUjmUZ0kN45O0B9AKhzoiVycfmT66wrotnNTm2h
	 m7q38us9fxMZWntXx3q+lZIX3b0yFa67lIXson4JmYf67D7NkCbUqnQRxTYO/ujQzjZ4b
	 peHDjsGPC/2+E10xNm4S7xYuX1E6AoLaXQUv5l1ToZYFyAbk75f+dWDWU/8NeO21ZlR6i
	 nFTE1MX4XbFqyo2EIHtQQcl2GA8wmsaoj5AtitGyXar83T8cESzDzmzTLZdA6tt0gl40l
	 b2pRy7fhSCEeURuokTUEYDhFYlorLs1PaBjBZDGqwxeUijj7BkZhjus0BEpEx/XuVFA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793963776;
	bh=urFLxCVZB3VgX5Tfif8agP+gsrmc3RdK6YF9SQXdKYg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gfJ3bYE6pPX23KmJk89uo4UMYTFZtnBsuzafdm8DO+vvlpcyCt9FWf4dKzoLxyUXX
	 90JbJh5UGj2sZPRGtZVOLcz8XZa4Ue3Hu/6zxXMov7c7sONnG1aAFhCZLq7EhznmU5
	 cmORl4aG3Zz9ffXpJCIbm4+q1putDMrZ8+tMhQ9tthuGIfaT31DDVmTqHebxD+jdP7
	 /FR6D/jA1ZFivc2/w5t/Mt9iFJS0PPw3qAPpG7EREfls57QA4a8gqyMNkvMxvzh0rc
	 riPK7o09ZZR8/9TK2FqF4n1c/7TFbxJBGCO3gqZdXB1OvrCn/xGf8f1gj/UBKxWd0y
	 TAZeDVniNWnlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209BC607D0;
	Fri,  6 Nov 2026 11:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98600362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89DFB811D1
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fvUU0cBEFVS for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 11:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5801480E18
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=iFijhHh7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5801480E18
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso317024f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793963769; x=1794568569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Uhc5R1YmqhkByZavqaaBfQD7ZLTPqpVFUj6IX/K6Bzg=;
 b=iFijhHh7742iUBs7xrTL7Dtj93wiQX6HLTaLaLnmWxWS7LDBK3GXNKxj6VYNWE9ML1
 8QvtZ8mmhieS+jYsq35Lb546/pMNs4olTdOBBhSO7hiNvMlUK7AM8lQLwC60ZHbr9Y6A
 C4DsTkT9MEYCbl1ZSjwfbUDKnSAjfLTdnsh35541pouwkriDGZ11RIeh/SGCbxIZ8h+E
 FqvL1wQoVF6zyir+YGmkzIRNLYLu+uYSP9rqxTHy4TH1YjqgHz2aQoatsFeuTeII/O4j
 lceEXDEOkTsfo3dGJv+UWsDjAfVs9C6HLDZpCjQFdZTWxoLbBpWD0k/FlUIIdclxPZ46
 pHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793963769; x=1794568569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Uhc5R1YmqhkByZavqaaBfQD7ZLTPqpVFUj6IX/K6Bzg=;
 b=tFHTTmFvlLpM0qgzh9AWjtJGTfbmN4kJNTEgQmTPYpieh5priLR4wHA5HnRT7fzOBn
 Xgnka4DZ1/Q5zmHMeNHjyyYSA+WH90Qstmr21HNRxe6XK28DBIYjFkBiVa8TiEZKxsFf
 GKrCJ+Sy5au0OTT3BgTuqygDcvCNOmo9VUGAGQZyH6FilCF5lZprA4Uw1G7uSBh4nRzc
 QX+QRd3N17xJz2WamINHcJhQRi51XFQXdT2omsxklqL5875F+ODEfFJ8cMRqjR82x08Y
 0wnBwCLa/Ni+WaL8JG/jeYG/ANbD1/23iGwB6OJlWADgjOPHsbDO33telH5JH/rdcRky
 8Fsg==
X-Gm-Message-State: APuU4Z9aysjKBXsZziRp9t0LGroRhUqaYWPnRZsr9Nn78HKCNSl9mOXc
 r4eKC4xbdDwlCSqYwNhz6DzM0m+WA5SvGzFdAYq8MF6IZ3MTbWMB6jKO43uT+g==
X-Gm-Gg: AYBFou1OfAatkePrlOHOdtIfHBb9eUFqDhkYCYz9mn0bNuOwZer+lK1F3W/V4ledUoU
 jNC3QbKCUkykI62uG29WMo1ZzlWI6li/B4/qi1Ptf7b0+iSdULVRbLaooR513Kq79G5MSFNft+2
 JclDw6DUZF6OjwAw/PO8pjSZlnT++EimOMYTv4NoZgm9HIhkqCLd2i9G2Rf9Kc2C97UAd4pRfXC
 sSqnoBrMWjb1ZNBlTiIF8p+6/jqkQu/wmSpb3gxtKYP+MX1ySTlFLcYor7Hgkm+xA0SLaFef6Ti
 FLlamg0ciUdb2MxPP6RcUWccBRNKOrBjGhUPLT0aVPbycLWBDUGmFQnqIxarxc3qs3YEJ2gU0Ea
 I3KYZm1P8LZx/WYqHG+uaU+cqSmJuBG5nUDaJiGjvughPlfeaYM0FyxA4RqWQKJ7AdJLJh9qaVx
 q8UZwdzMwNQexvbMTwuusoZnHdm0B9LO6PfYIo8E0TV//eRR2mFi96aSmnNNbNydfmx7VLqzDWh
 wnRJmlAQNip8SqrO6CpxbsUO5/hznft5emPiECgbFty+8QTWQeY9w2JcIOBQ+gPQ+9tClEX91PN
 goxhJ3AtS36dmt1PD3s8XgszSrBTodT/eKwHRn+JwAyaWFep0//eRg==
X-Received: by 2002:a05:6000:1a8f:b0:48d:f9dd:e3de with SMTP id
 ffacd0b85a97d-4928a4857b3mr4858235f8f.45.1793963768593; 
 Fri, 06 Nov 2026 03:16:08 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7232832sm3080195f8f.25.2026.11.06.03.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 03:16:08 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:16:04 +0100
Message-Id: <20261106111604.1500074-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
References: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
 <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/3] website: add the showcase page to the
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
Changes v3 -> v4:
  - none

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
