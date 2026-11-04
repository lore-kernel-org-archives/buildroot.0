Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF41606D4C1
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YJ78uY3v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sa2KmdfN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9A460815;
	Wed,  4 Nov 2026 21:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2A26P829VVdo; Wed,  4 Nov 2026 21:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB4E26078E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826032;
	b=bKcmBbaSr5qjtklIzgSNwMa30lYKFoGRGAod0m9N2c+C5Uzj2gSBGUFMxtpvuBHwjywC
	 boeWpmsnxfmaWaDZQn2qX1JMvwCnmwBJHQO8BZqvIRQaW6XMsuSV9GLCm61qcIreK89Ym
	 Kf8qdXcKY9CqOny7f4EoDRYSGG4MMqSJOv5J8j+jjs9/7PeLBJSM1DyJhA6Vu6Usi3T2S
	 yU4CKiV3bi4CM3gfTEAZSX+qr5JZul7JnYQVKbdtK7iXarrFokk+cLWsno54jNcp9MerI
	 Qfd7GOR5rpeHk/L9Ik8BUr9VZo+WkQDA2cZzfCVafDn/SBJcviYzsiRcrSeYbOlyBTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/xPrEKCoAN04+dg6s/xspCeayemCV0gYQ7lHu/yTSkw=;
	b=B1zz3qtmPPo9V2dQAk0NI2++dAo5q8KXBRGTpTSFTaTGWwTmgR6+V/LqTADUCPMUanHB
	 6aPlfQgdTre5LJTWMgoxO/Sft4FcFQwsrI1+COCw41fKCN302fn03HnCE/MztBoLOCTal
	 44wSqL5xpn9hLPn93b8DFiO0VnJtu/P9l9GIsQgaF/kWWLXveXi/OI9lE3bpeS2QfKoIY
	 GOE/XnqHq3nLgoWst+A8K6Y30ud11bZYYzL1gmQ623ON7mv3PudD+dLCb29VLEOMNKIOV
	 GCmOjqd32wJaSSp2D9Hg4jqSwE+9MmlTcZ2njGWmZSpcKVHf8pcCyhjCOCkd3hAcWNA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826032;
	bh=/xPrEKCoAN04+dg6s/xspCeayemCV0gYQ7lHu/yTSkw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJ78uY3vUM5a3JsEhDKbdmYHcm9+5NIt4zkFrkEnTyCoSJTqZ+3lQKqgG5Kg4wUvG
	 l4k4KU/mWnrgPoilSloD5nrLHF+kNvr8ED5WNIJN/vNoa+FsA6n7PjqS4WspJoLLWd
	 GPF7L9FQqb2MzXPc8JtuObU7Q9ADwxwQQSf/FXvfb3FQalBGrzWKXNmXBms+6d0EWw
	 MVlCB52sw/YsLafJjmKTMpqvsgD/z8Kn4ItRpdi6SeglubEurCNvu2plc6hGuXi27l
	 Ks4z4nsO0F3IQwljoRCor3fibXzp2qhxBwP1HSDqmkKiTt95kHMP18PZ3P3pLTz8K0
	 3d8MABEmMjC8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB4E26078E;
	Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C01D31F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC144013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fujwljgWXia0 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6CF4E4008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Sa2KmdfN
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF4E4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so1097255f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826026; x=1794430826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZiRiTXiZrIVmr5BS3MMvHkyrNipQT3vtlXh1WGSmE+0=;
 b=Sa2KmdfNZp3rdnq8Dp9SqBAMcUgJCXOOhBmuibKXeecqk1nmdQ1a+WWFeyFP3q7THE
 ErPG527bpM/x7rbs/XK5dh1phc9/oGZmL7psqFi6Ic17/T6/9QEYBRpEMPVqq8FUogbC
 hPt4TQ0lXGdrqHrv/5j8O6/2Bo+HWk0OdhkPDa8uhRTkZT6lR7UOCPXqxEyLmPix/rbD
 oPx8gmf/VzIPvnCxjshpJOdJo3aJdT2nvWpIBrsl3E4FQDcfbw1MyBSV1u3JVuUIaXqf
 DHpnmyfPIsMIfTO2saIL/B44vMRYYWdQOK+jumKdjZr8iT8j2wbPBV94g1adgZlb6YUZ
 XX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826026; x=1794430826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZiRiTXiZrIVmr5BS3MMvHkyrNipQT3vtlXh1WGSmE+0=;
 b=k9QZI+6wKjZ7NjjZoV/m1nGTPjLZcDqJLY/+/ibk+uU+0iQY+fErZXapac9JCdLVF+
 fru6JjKJfCIPdsnslCMlqSgoqPjBTURtXmh3t4OyRW+AjKhbzU1MC6+DZ5twAvZgGQ8b
 kBw+a0ObDAkBN5BclmynI/2Jf67UhVEW6Nt58v7eGFcBFu7D6o5jTM+Y6b9G8OA5L7AJ
 fJLMunApXB3MOSN5/ybcmiMr8NcD1Bg69qSWi+Yakq/kDfltKv3N1w5YEpfh/Rl6ym4v
 VfUZukumoX4RNvguCbv87BvEplL2HMBBt3gJF6l28XCWz/FazJHs2vJL2cqDX3+rzw2A
 hl3g==
X-Gm-Message-State: APuU4Z9rkIwdV0IxiQ4W1HK2IgxXaZpm1xGlP9vk9YmUpxFQbwB7cB8R
 AX4GzkrCa4ElAMiwVQ7VOQ096OMRI9Xt1wrrImCR9UNbyR9XFu/AFlsCWFpWLw==
X-Gm-Gg: AYBFou13oPAJ6syc3iFF1c1K3F4n5qgbxJqYUooMuJ0B13PFEROKZnzNzx5RbfQiomk
 YwBVcjAmGybaHA9U/fISTp3QaW8JeslT00KIOM5yeqWs9kqDqmNsHVIaj2KaIBpXtmCOMHpTdjl
 fA7eA5+CPkmjrKAupK07XmN3quJIUYp3/1Q23SKAhHv/4arBIZKBstsg3ujCshUmKWekm1A99wq
 tFSYMZSDPhvjw6rBXK2mgTVKVPWVCdDuh2voKG71q9AjJY4xkFToSP4KpBivouIVaoHcWkT0KK4
 7uM0PRCK9r87AD3aELu4cHWgiMeqtH9gueCIRdc65K/3dWSCuyZn+wy4kDkSbJwB1KOt7PNoTHU
 aJRlH/uQsIYhxET6L7ywDTZvcwxz/qXdabowBlnCMW+Xn7P71UB96t4N5O/otrqZglyweTImzqj
 t1os12onkau4el6xdouEcZN+m12M3vml18nFRZ1X6/ipgCAyO6YzmNgYudLBKTLbrGqu1vyMove
 iv188Sw6sSiiJypwoFkg15baJo+p68GLTui9LDezlzjGNyd9PXJruMWxFlNAhpmOzWZDEMc1Ls/
 js4ZpGH9Kuh7eCUmj5cFjqx0/6RtjA+CG0c44TP398vHTAEMyV8w+Phb9PB3YfytST/MgNwN8hE
 =
X-Received: by 2002:a05:6000:1603:b0:48d:f36e:ccc0 with SMTP id
 ffacd0b85a97d-48e6e262c42mr26951472f8f.0.1793826025585; 
 Wed, 04 Nov 2026 13:00:25 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:25 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:13 +0100
Message-Id: <20261104210019.3509258-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/8] website: rework the navigation bar
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

On desktop, the navigation bar is too thin: the Download button barely
fits in it. Its content also has the same width as the page content,
and the brand and the menu items are small.

Rework it with the Bootstrap utilities:
- use a container-xxl with a larger horizontal padding, so that the bar
  is wider than the page content
- make the brand (fs-2) and the menu items (fs-5) bigger, and add some
  space after the brand
- spread the menu items over the whole bar with flex, so that the
  spacing between them follows the width of the screen and the bar
  never wraps on two lines
- raise the height of the bar so that the Download button has 12px
  above and below it, and add the same space below it in the collapsed
  menu

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/css/main.css |  4 ++--
 docs/website/header.html  | 26 +++++++++++---------------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 3077c0de53..0cc7bbc262 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -25,8 +25,8 @@ a {
 
 @media (min-width: 1200px) {
 	.navbar .nav-link {
-		padding-top: 20px;
-		padding-bottom: 20px;
+		padding-top: 22px;
+		padding-bottom: 22px;
 	}
 }
 
diff --git a/docs/website/header.html b/docs/website/header.html
index 366bc8f525..b64d091a01 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -25,34 +25,30 @@
 <body class="bg-body-tertiary">
 	<!-- Fixed navbar -->
 	<nav class="navbar navbar-expand-xl bg-primary sticky-top py-0" data-bs-theme="dark">
-		<div class="container">
-		<div class="row flex-grow-1 justify-content-center g-0">
-		<div class="col-xxl-10 d-flex flex-wrap align-items-center justify-content-between">
-		<a class="navbar-brand py-2" href="/"><b>Buildroot</b></a>
+		<div class="container-xxl px-sm-4">
+		<a class="navbar-brand fs-2 me-xl-5 py-2" href="/"><b>Buildroot</b></a>
 		<button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-main" aria-controls="navbar-main" aria-expanded="false" aria-label="Toggle navigation">
 			<span class="navbar-toggler-icon"></span>
 		</button>
 		<div class="collapse navbar-collapse" id="navbar-main">
-			<ul class="navbar-nav ms-auto">
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/news.html">
+			<ul class="navbar-nav flex-grow-1 justify-content-xl-between pb-1 pb-xl-0">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/news.html">
 					<span class="bi bi-star-fill"></span> News</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/docs.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/docs.html">
 					<span class="bi bi-book-fill"></span> Documentation</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/support.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/support.html">
 					<span class="bi bi-question-circle-fill"></span> Support</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/contribute.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/contribute.html">
 					<span class="bi bi-share-fill"></span> Contribute</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/lts.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/lts.html">
 					<span class="bi bi-send-fill"></span> LTS</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/sponsors.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/sponsors.html">
 					<span class="bi bi-currency-dollar"></span> Sponsors</a></li>
-				<li class="nav-item"><a class="nav-link fw-light px-2" href="/association.html">
+				<li class="nav-item"><a class="nav-link fs-5 fw-light px-2 px-xl-1" href="/association.html">
 					<span class="bi bi-arrows-angle-contract"></span> Association</a></li>
-				<li class="nav-item align-self-xl-center"><a class="btn btn-success ms-xl-3 my-2 my-xl-0" href="/download.html">
+				<li class="nav-item align-self-xl-center"><a class="btn btn-success my-2 my-xl-0" href="/download.html">
 					<span class="bi bi-cloud-download-fill"></span> Download</a></li>
 			</ul>
 		</div><!--/.navbar-collapse -->
 		</div>
-		</div>
-		</div>
 	</nav>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
