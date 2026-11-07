Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A7606A331
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GMh7e5BB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhJ7ekVE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EF460658;
	Sat,  7 Nov 2026 15:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-GD3ln7R2Iv; Sat,  7 Nov 2026 15:26:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 48BE66065A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794065190;
	b=MtSMZtjJ5hINZZR1eSQlaD2ixbSRbHMn9Uo5qDCW8DeWcVsIurJ8/ysjpFEL0pKkWVsf
	 s34mYFHfx9zh+XDHvOBVHTmVRj34Wch+XaF1u63q0FPdzPj+SL5uejVCEQ+OteGUqnqO2
	 RfS6cIT/ZI1ElPzbTAtYILIRxXMa68eoJQmhrC4J2JrzrHjzD4Wps+NReBI164c3CiqRq
	 rb0+E9B2TQWSYF1nfQbdN9gQVhDWi4qn54t8QMKLqZEuxhgb6F1btc6rT55qqSALw9GD6
	 Z/OQPlDs9/hLMWRs5zdEX51FCnsFCUsZ52Nd8dheeK2Dbr65PIcXfe6xKSvWeCJNjSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794065190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nDzZZBliCx4KhYf07zm4LG8FqsrRhe8kEYNfs7qsxfs=;
	b=szwKVLFoHinVxkHTxCXCtr9szRAMY5o3xBVkaetj+iqRNP3Cn2J1eFL/gQYEDyHGcc22
	 nHpFAp/vGO9b5EtrzKy+vUak135l4WMhHDPiLHyMW+d05Ec3gX+NT4VK3g3BWU2aRwtVI
	 loO8BkQJblP3DcqxsIn98I3NYWjRqpaep8UJK0lcIT6BnLYqCeVFWdbFkfD4UuRC0YdL/
	 tt2XM/vdl/yXIrOKz8XC0kxRyBNdTIn8QXpDQ1GOL/NQcK30W2kHR2KqBvVSh9Sa5dcTl
	 TATJT+5EM/9Lu4OqgFzuM9uJebF5cLs2ddMTXeJXBjNg9/cYqCEjyhZcVFdfvE57Ing==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794065190;
	bh=nDzZZBliCx4KhYf07zm4LG8FqsrRhe8kEYNfs7qsxfs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMh7e5BBoqvi1WpY1yea4yytzEm3kw8lcE96brm1bZ+uKZf6yPtb6mD7JZuZtYf1W
	 X93i0ecOPPvjqo9eKerXuGAc9BQvPRd+hyXDQNH8eEaeaNWzqhkNI9UnxBxuXjl4OG
	 1NtvYlQ5s3aulWOGcNmiI/lZf6b5jrH5rdsZhM+k/CKdfrY1SyweUqx4aQEPcWTLei
	 MP2m+vBOd1ofzm/F7hOJHehSEgagb1JUs16GMyIXSsrwbZCQbXEh7lTtHM7jLoXU/E
	 tG6ChqkePxC8IAnbCalyNU6KvWnUF3VYqOHaF4EGy1tZY+ZGJdFLwaaAwS+iIAkRXS
	 uIxt4QZo2b1/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BE66065A;
	Sat,  7 Nov 2026 15:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F15AE211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2B324009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIUhWSdVR9kO for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 83E3040050
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=HhJ7ekVE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E3040050
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso5019395e9.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 07:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794065184; x=1794669984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=okJe1jRe/AJTgw8L6ozmowMK865vftZdPAIy2PlEGZg=;
 b=HhJ7ekVEZT15rHkXaI6lqDD0H5gyNACy8qR13A/7NjaZKXwMiyZf4/mKXwe7pCEuYf
 tOFIMzp1dD16Sz7NhFIUNyeiDL09SJi5jSSYyFzy1EUWWrWkDVFGvb47foWB1tyuPKWb
 EyHM8Fd02TxCMeRVGbTlWynNqcfC+sz0HvWmNooMUZfQWUNl48vfcaQbC+3Q/CG/iJZF
 3/YXLr1AlRyCLeOWqwElI43XR8IY6UtVLKprbge9OV0pyyqnyyfrpLziALdmozZLRRMR
 ux6LknzVs3MjDuUGUhV2YyV7tMftCiG5pvOVgK5UByqbA4dv1HhZZfx4vm6IPbNxlyjW
 9tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794065184; x=1794669984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=okJe1jRe/AJTgw8L6ozmowMK865vftZdPAIy2PlEGZg=;
 b=bR7msUJDcjfxYntOcxPIxMY8uVjpsbxXVdcZo9G4hmr7kXWUpQRBL4pg7u4VQzej19
 oetaJ4yTSyDcqlvaDY40qGaRaebeTGVjZxHtNKxsXQ8c99nOy1I4pSC4gRsxsUa4z8mL
 e4pzH2xjH+sHfcmMheBOwu0vKhkTbv75fiDU3o0R7FU6V0fMymorpBtPpJ++sEHNOQyN
 BGiT7WzTbff7tJ0QGJHL8xkaUSaiOMTpUPapfVaF9e1nMGPMWzYqOb3xzOHZ4GOHrPYK
 XtWGIoruqJV43T31kFPKCatmQf7DQQUhInTV+y3/CSKB1PGqFItwnNBJOVEQ0EqnsKfT
 aDsQ==
X-Gm-Message-State: APuU4Z++KFm28IBbQfDl+Yd8/miKUct894tD0q1tU7Mq+k5dVR5DVZfj
 ML3krhknVjUasH4h/UnQOwsUJ4wf6qiG+QBjj4Z0ZGY6fiAEdwyoxefQEibSEg==
X-Gm-Gg: AYBFou3S+v88mqekRhzSNU/HRyUAahi2BELWse4VYWMP0+wjAm9MLCEmjFZjGo8thDg
 fNzR7PjECT2QP0kyxrBWCpJAwQkl5iHIErEpTH8n7c/3jCS9HCYpHbUQmugnivtt+P2FHBFBtkL
 qP+KQOqgnKmptOYMnwauNYJGmkYQPOQrWUX0H1YBqe0iFBgaorlGsOKl0rU/uiQoGV6SYPi+d8l
 ncdd6ipsIvS3BmvWZTmc2YHmJcNDXE8Ih6XBJeGYhTx2pJaGpaPgNsEidRYLtL4C5F1frt95DNi
 LhpXSX+Hs92cnMkW/zaCux7N3/+tT8aW+ATIIVeta1Abt/b7Cz6PfrktyeTAQvnPo7qNUTu1OVF
 spWGHhQSWdpEWTd3nI7Y/9dLXug4F/uNs2yzRQ4lj66HBWa9hN/D25QGCJSMVFzUA/CLPeKEprs
 7WE2FYeEnnwWTZEsEn6CMAzrvhR1IH4lgMGu7Xt8rr4hLh0U+vQaHeL5hhv/tho1w4cFRzS7fgY
 6qkixZ6qHgr9u3ZDiyOxXQMcyLpcq3jWRg+mt+Y9bMwoeIFoMQUieKUU658rVMe+PRijpFx+ZgB
 otO3dzAAIqyYyWsVq3wK/IwhdeYyxR7F1L3JmCWgQC3GRUnYvxW6
X-Received: by 2002:a05:600c:310f:b0:4a4:7a8d:c736 with SMTP id
 5b1f17b1804b1-4b6de78917cmr96617975e9.9.1794065184109; 
 Sat, 07 Nov 2026 07:26:24 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e2e9ad7esm78715795e9.1.2026.11.07.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 07:26:23 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  7 Nov 2026 16:26:18 +0100
Message-ID: <20261107152618.39702-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107152618.39702-1-angelo.compagnucci@gmail.com>
References: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
 <20261107152618.39702-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/3] website: add the showcase page to the
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Changes v4 -> v5:
  - none

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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
