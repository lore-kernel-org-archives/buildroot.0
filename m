Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF53606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AY9pBdhJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM7WLOM0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59EED4087E;
	Thu,  5 Nov 2026 10:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CshVFfJwMFG; Thu,  5 Nov 2026 10:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44B3040869
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793874308;
	b=kGk2rwaianZ1SvG9kMQSMTVk/DlWBto8gop4Ly8prfOB/lYcQNNvhVDDW8lIwYr6qcG/
	 kPI6EusX7SaTRHOzYDRFOzW1Duj8xDBAGVnsEwDwMMyLmWPaRdLEBCelwEZmfU+mx+PDq
	 dPfRQ2wYQGOUyujtw5Veh+LmDUrL4ARUVN+xCEMR1yMrliUUfTrcMem9PqpGbsGfkurmZ
	 n9h7tq1yizfM+3TYKAJnZPwfngzPA2Y7W/TPbRHSfCfZwOUb3EWVnfILybbm+YK2imA8n
	 f8Lc+2U6w82A3xQIQnURIQ7Tk+u0TXVgGfDQr1F22dkIW62CBpcmDhLgIv/hJX9ECWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793874308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TJWbx0pBWwyFTFqy4Z+VDYnz3711z1V0XmgPt/YddlQ=;
	b=EC5p/dVUCGmQTtDDYUZ8XQRJfAg1nVHGhRWfCaCxDZOZLINkW5Ta+G6NMeLcm7Di8CTS
	 HKvMTEAMTYKVCm9FOWhn1kgGXDmriGJL1iK1I3H9wZpns3RzwRo6Ue/XGuIRReAnWouZv
	 PwDjNJyaYopOQtc1D49biaJnIlgjrF5KYwJg5GLKiqquFoILVzWHhO7PI7Eknrf5eHEq1
	 kZOmOv8fewobgtHmNJA5t1q3XrFGxXqV0aEXG1UO5w+1LbCGA1WnEPhP70LvJmNjcZZRx
	 7iCGooucxT0G1KhC6D2Wl9xt3uCK/bFARzw049Plzz1/kSe0eNn8CYZiJLVzyeMI3AQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM7WLOM0;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793874308;
	bh=TJWbx0pBWwyFTFqy4Z+VDYnz3711z1V0XmgPt/YddlQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AY9pBdhJWjvUIZbFIvYblShVzlXFNMaw5QWJ26zC0O4oEWjW0l6XVZPo5PL1NKId1
	 ChD6Pi0lG/tDWpnUSDl36kM7F7PSPZsnl1p1Px4xcGnc/zgdcoEkzhssqLfGWQgidI
	 MB7SphjszZkjlkwnNPkBUJX7+13gaKkL2yfoJouV6K13xgRDtWTB2Z6plYcwQS7bog
	 ek3amrOOI2mOCXMISUnADLiAl3w9ThlR3vSXlsYoAtSd1gfNK7E6QCn5tkDKcfTV1v
	 am3saC23oPA4yy0SxpGp+TCas9ehmTLHH6is3H45VF4Mwg0mN1hNCeYr2+GM7bYQ1n
	 7BjKUklP+3a4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B3040869;
	Thu,  5 Nov 2026 10:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F7F177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A2244084E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q21BqlMaXZ9I for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ECBFE4084F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=JM7WLOM0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECBFE4084F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so19713815e9.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793874303; x=1794479103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X7NuoWmfREbUKKWSxcKvA23Bf+nFeqnj39L30Fk0imI=;
 b=JM7WLOM0GJefl662UmhYV6qPkCuYdAkVloFYhlwNszXGky8NVAo3bCTiMuOkGyIvnr
 YtDkmW229NW6TXc/3i4mONjX4vUNeaKM/QOL5pzfJirYh8hP5Q1arBaPsABNMAl6IBD0
 SaqlPIDbMQL2Y8CCRJWqyqr89l4NNzIHe0Lf/DYJt7Dtq4+tro1YeGPF25f63oRZ/9a2
 d6s8IYzy5fIRBKgBt/t3MZ+McxgJibW4IsYNdpytaiFHe4glJ5n3lF8r8h0pMbwqlQ8Y
 yded4a5HbyjUgFA5gshp6mhrSgEulbFCr2lMveO7Oou/qcSlMeLVOgJROISE+xJkiIXp
 P1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793874303; x=1794479103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X7NuoWmfREbUKKWSxcKvA23Bf+nFeqnj39L30Fk0imI=;
 b=RjLQrx5HpE0840oX1mgybwkcD9qSv9CERJauGFmzLuFh70LHkqlyeo74Xl+h/AX+8s
 luf6GN5cKM5e3Mai0rwgYqGWV+HEFuxPDsOV2q++LyIeqzs6tisbzh/SuWdWtOMzZXJ7
 LX7wxH3fEAp6myGplc4DluuEREX1zsLCcmMlNt78koQmeIXF4g4AnVxmPTS5swFw+j1A
 xbB3LdDdes/HrTsigvVG/2MmBILJ+aM/g87C2tJF8/nLvw+g3Uyin2L28FkTmvawVHSb
 cC/WeLUWnUfhJxBvn8E1qIMKuS4dx8iqvuKnyivComdNofTzwWKiz/WpiiBofNAtbGj0
 4I5Q==
X-Gm-Message-State: APuU4Z+ABNWbzBxooXPwpOTS/FbTGWQ6kL1gRBbJ/ELWJsMLEK7HobDC
 j0cwKUcAtW3sAUmlDxROlUmrVWaF7b/rJXerFVmE9gi8tvuKW3AL6s4ZKn2tBA==
X-Gm-Gg: AYBFou3VJFyy6P8SVT/WezU3xvD4YIxzF5WZsh/Q8+RUkAe0bKt2NMftJ1CAnvWRBNY
 9tresR5FjBsPTW3DIXA6cGQeTqW+i/IdofQcQIgY01rHIascb39CyhsxPI5q2ijRb1qz997tLvl
 vNvtkG2shz6JrsV/IH3VU1TACQ0UAfnQxIJUyIMkEyjOlyCW4zt+noQZoZYWld5h65c67TKblDW
 7FHWt2B6Ua/ikKnViAK1TS7JL4wv8lkVWS9jyojMkT/yT6N5pTFHsPTbDmJWkxW8pkJgr1ew/UY
 p9PLHff/pzxiEp1EGyQkh5JPxY4BAqIi11q3sxnRvMIg6L6EdmX7pFZ/Py7zkrLVD5GU3HBItFd
 N/JymuIaMx8AbBye7eUylPswZpXE8TsbOa9HG+DDrkfKnEO+nF66u9ncQZEhJBxiBP8igDpLDD8
 TUgS8P73awBYO1mebLwWGflR5R4qb3oYzrYnIIkwS4LJlLsjyeSL/CcL3LHYkQVVpd+Ct5xzTI7
 mlG/BIiQHDgGBZtJ84iKJ6sPBG42Ugq/p+emTbMSAmE2+nhBwfECAMyj++TjfTCKwVyoPOywMGU
 0apq2P9raSb8wVcUzUVRFwtjuGdxos8R/ElwWsoN0CFpPlKf/perbg==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id
 5b1f17b1804b1-4ac17b2be08mr411075725e9.26.1793874302548; 
 Thu, 05 Nov 2026 02:25:02 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4104d600fsm115558385e9.0.2026.11.05.02.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:25:02 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:24:58 +0100
Message-Id: <20261105102458.1795886-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] website: add the showcase page to the
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
