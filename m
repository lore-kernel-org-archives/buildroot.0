Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56318606E2FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GnGlPfJq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1749B6078E;
	Wed,  4 Nov 2026 21:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6i88wkh360u4; Wed,  4 Nov 2026 21:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 071E1607BE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826401;
	b=QtelcnWPZ5iesTh9GywK7ofIaLtT15AFiZiSoec/O0t7GOZzGU3Uk8Kg6YyU4xC4aSAG
	 tpE3Dj2r0hT5/ieI8smguSje49zLxFM3fFcWwrKV0hcdAFNAY1cZox0mpx/EjPveXauov
	 UzA3KgchzxYYJL5SsPZDxeYKCNOlPyHVkEBd0+KnXvxK6O+h7Rg5pMzoS/K70HLZ/byw8
	 zS7SZguypE7zxARtSjqGVnnnP+upDEsdfrKfp30QHGrzDgmE9FJfJW/90kr8N25PCd48B
	 Ry6c98oY67Iu9FL2iC5VMezJvxYmeVFUIHNZplvZ2YpbBJnPI8Ai2CK+FMauKypcJfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7WoFyEt2dGzXX0AshK6/IYrpXiTFQi4zs+Cy793eBzM=;
	b=i6/HAB48mGB06joKJjQItEBYLYeqHtfK42wB2Bs/4TpJgbqr5vwtswPmi78EkNLeNUBg
	 JA2lCX0FxNRW6KSSSVD3kqeuUIxQ7vhOrfIxsDRFQ66fDMX1W+5GXc2Sjtks1EqqBTmj1
	 CBlhNk2lskpwPPhxQwNXR9qzU2uk2Y5QtOQ7J5gsbNn3aKINKZlretMeLatxc1BdAwa7h
	 PAlgIP9voLxDlzxRyOuAei9T6a/NeHdNVz2ELKt8KbvhzU62CnOB+VmPaQwCgbUoP45G1
	 tNdnN3e5Z3Gvl4IrV4POuT2yTZKvSPSOaA8QAvI6ioIN603s65h1r+2KNso2Mdo6ZbQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826401;
	bh=7WoFyEt2dGzXX0AshK6/IYrpXiTFQi4zs+Cy793eBzM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GnGlPfJqzx6nl23nSL+60/tPWYtH+Tl9bnrEHtP1B9D1T8WwrhsPZvfzDV6MTnJ/B
	 EZfbqtpZupi5fnd7qFSk/Bn7dBBUbVGF1FyLhbe2MCT+7XhPs47jYXQYpDVODn1NBH
	 /KUke2qMeYLsDwee5T3U6lKVEKvP9X919YnfT6cmZv7oTen5xV5n5CxB4zr6SGAeWz
	 csrZlTUBkPGg2pdU3emX+MWHT5s4r7DUiD9nygjAA5W9MQ7cFwPTvWNgWkPKTxx22c
	 EfTJ0h9ElSaqZUvrvPFXS9zl6v8GCglp0GuYYkviyOtSyuxP9xxudBPCNneQvNWoya
	 jfnKe0lxTj/Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071E1607BE;
	Wed,  4 Nov 2026 21:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F847178C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910D7408AD
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Kp-X3oQ8oQ0 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CDCF408A1
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDCF408A1
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B47FD9DE7B; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:04:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dfbe4f682e6088d21bd23ae2f5ee74db09bef3a
X-Git-Newrev: 351676fe42ed138b57c3f457594c4bb5c8b19fb5
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.B47FD9DE7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: rework the navigation bar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/351676fe42ed138b57c3f457594c4bb5c8b19fb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
