Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB448606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jB35HSi/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJktAJcI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B99340718;
	Thu,  5 Nov 2026 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fP4wK2VgM2JU; Thu,  5 Nov 2026 10:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA80F40719
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793873837;
	b=jwWbjm1zWgvFxr4QeCGiDEgHpdfbSAH47D4VaZqcEwK6OSnFw981TSmP3HUTvRxIxU8Z
	 wcOpwXW9+kXDZD3CuZeIj+UUSr6jvNlt+v5j1UcqAvYqVq7jga7EG2ko3x+Sd2MNNRrWd
	 /003FF5l9LVJYK9oM2TneFlQeiAZ+yp/gRNyhtl6KnfKhECpbOan4MYfeFw1QjdjF56aV
	 XSTd1JfEkrXXP9gsM8c1hLqpx4tVvcwXovintFFR3rqIwLl/MsP3jD/TanlAUk7sXf5XJ
	 TtiiP09RG+46/SN1KOi3sC/RvgwPQ4UWy7xcpafkxh2Ck1jaZRvsXhGIlJ5rBn1SKXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793873837;
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
	b=nDyY41/spfigdQcqyyQlDWbFYstJJCWjVT0uS9aCb3o23Pp+IPYJaY4CavKUngJ62wZV
	 jxuL2e+x2Dqxp2wPN4YPhGtvcT0fKbA/j9cLNChTeIY+TE22XdR1TfmCCJz9knNodmOXt
	 ftzdjPXTMyZWtPuaCW8v+cOB83mSrQf2NOrmsFOHjTgSLmFpk80wgnN4eApUeBQKQv3CM
	 AXNvithVJ0zmFZO6YxK1wavTaZUD5+8oh1uZUen4vNLXIRt5WJLjSz7qAUQIWonx/3ecc
	 541g5GRQ+XgS2/JFqOo3nXyk8NO2pld/BOK33uI9WCoW52NmFojvraKqmU+IsStNzDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793873837;
	bh=TJWbx0pBWwyFTFqy4Z+VDYnz3711z1V0XmgPt/YddlQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jB35HSi/7Nn6uYDLzD7UkEleGt5Khoc6RJbb10VU6eFVYI9iagOL6kbN4jFYtKKI2
	 FOxBzdHdG7SbhtI9S8If2Bt5bxVc/Az7xBhJsaWoHLdDIkyqLIFDeWpvHxQcRdDSdC
	 OfxsdvqkqRhAwocPyS1l4VQKsN2JF5HK+cI57wtcyq+pMOo70VGKHwPBfyGllkJXVV
	 Z3gYxudq8u2CFtPva1wmJJjMbrCWi7KcXiEnZKL78Lan73kNAm0B62eYaeVKz6wt6c
	 PL9CwxPI0HugLF1Y/3GZUan/2LlYfKB6AjhICbLmJE1JHNEYh3bR9Dg6aDUWtR5ihL
	 bK4XRn26+o3YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA80F40719;
	Thu,  5 Nov 2026 10:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78FF052B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E97B81136
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM2x3ESHU2fz for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:17:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B721810F7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AJktAJcI
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B721810F7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so15076125e9.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793873829; x=1794478629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X7NuoWmfREbUKKWSxcKvA23Bf+nFeqnj39L30Fk0imI=;
 b=AJktAJcIqt5c8aL8KKy3VidfTit1OrabLcZcsrT3HRV78DgnPaiK0GluzC9jc01qsk
 kzP2OONVtBqLNrFJ/jcO8Ycb73BgsrlN204sfMI6ktCn6ByFP/vB+IRxXO+RrzOKdM0o
 0QkVZXpa3m6IUJ4bNilJvujzHa4QNJ9eCvcIXMUIKkQB/Thrbjh6KnPcuYsKL3F3kXox
 YerKKga8v7YLtRDlLQ/dVgF0mkXjBAIrhxe1drlyUY+6yJD3sKcCPl44BP2ClFI/1b5j
 ZRojddj2+YRBs8oZ/UR74XjpirgQOG/OiTf0ZDT1/83ARgu7oFs8QFk1H+/MmCNnOyEe
 1gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793873829; x=1794478629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X7NuoWmfREbUKKWSxcKvA23Bf+nFeqnj39L30Fk0imI=;
 b=GbUh6cXvGq/F2YrNWhtm60RTgTR4hDfYUc11OEQKoCEnbJtpg5yZFKGxo6OhymwhTq
 GKG6JhZDSBb5jYohOLmjU353WRitPDqr5oge0PLtVJoxOn37ZmFycZRXFzRJGbszYfiN
 FmYrVhKvgQrKgrza63OrB1LJbHQLZyEjhQnQzQ8R84WbLW6HkcTAB6BTfkkyyc33h45o
 9W7n/HDSbA3Tpyj1ZnpK3GFQd/9eaApNs41OWRMPuCHG0ytsE7bUAZZulCudsCRtHWjm
 K0i09DqVg2f4c//qCmDD9xG6D5zfli01JVGCmcOoqL/fRiPwhR+Eo285DQVSwjRUwRhL
 y8pQ==
X-Gm-Message-State: APuU4Z8tmXrxrLWqsx6gjkvC1rAr91oJ/fpfBz3gSWoy1zZwvBukcVrY
 AGFy3DmzjkKFezFgajf+wIcNXF2snbIU4y8vYLqmPTUB0sV+Zggvq9tk2uYW/A==
X-Gm-Gg: AYBFou2emYx9Xs41Ywdvxv4I/DowsM3eHlAr/DGvTfPgJ/8P52Q3Cx2FbgeG2rty8eP
 g8J2XLRmVn8WF98+X7ds0UtMftCe1PTVJi02cWfvMNQdRXaMRClvh/jpfYxpwxFdIRzKOG00s+Y
 LCAEjlgHy9fMLLYqyzNLXE/6EFw0jkSVYC5X6oUYnkmLa7wd1o6CDT8nOePVICQqL2gM5fWYp6Q
 tYcusGbEX37xx6awLyFpNiOIrC65oje8AR+rLyCm+fHiXgibAwVduFNPzT2YfGRISgrv/0zJrgU
 uiRxbDRqi3PbpTn1EjHCVmR8qK3QRztItfHBu7183JtGVbvf6qwaQd2mYdEvpmiw2+lTpKsbxPZ
 JQJu/MksIjnEJcQX/e5o+AwCbHYSXIqvXSJA53zEF1TRSpkLHs3CFY/z5x8js7nbpqHXoPWwXjL
 Lf+ciqyTPGwXVScURiw4pWCCikyVX/tBxq1o2h8tTvz9X8NqJnUn4b7hvzuVPeHPMyiWCzKlwiE
 9yyKfRrlFaDhhWaHdV49KKTThqHpe+v2SnMJabcu5QjIsj2xznxGdz2CEfGlN69FSZK04QDH7Jm
 LpiAHdMwJjwYyl55zIXiku6s3Gkg67gAUhtNLLs=
X-Received: by 2002:a05:600c:628d:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4ac17d16b99mr401192425e9.11.1793873828708; 
 Thu, 05 Nov 2026 02:17:08 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda207d8sm8631777f8f.52.2026.11.05.02.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:17:08 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:17:04 +0100
Message-Id: <20261105101704.1627207-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101704.1627207-1-angelo.compagnucci@gmail.com>
References: <20261105101704.1627207-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] website: add the showcase page to the
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
