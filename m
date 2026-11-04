Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64F1606D4D5
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NeASTmYt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FB0408A1;
	Wed,  4 Nov 2026 21:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8foT15Wb1VfU; Wed,  4 Nov 2026 21:06:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 549F2408C3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826402;
	b=ienJEdnHkBU8P6DFE/5ULXBgxdDnzot/4/Ntqrb9PW7lMIqFO0fMsq38mj02uW1zoQwB
	 3Lqmb3C+k9s4MCBG+7D6IezWbUyqvQCito91NVvC3HNk5W/iOCRcyaHkzpq7kZ5xRuatv
	 eGONtCac+3h6UVT4q5F1RbDEHcdudHkfec16tJLm/lqkcd4TPW71cs7+ZoULgaYTp/a+G
	 VvEzhd/xlP88ZKyrSFE6loOHB75uBt4tFC07ZweAQscxYm8+M8RJZ8rxF0v60WAnWvLcc
	 KgEPb14MEt5RED/0GSrAtZ0YH86SLGglmbi0Wh5c1hiSCcdlzEq0PP5xO+6sgqfCdJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ggtcq+nY+zagvJRNcnn9Rn0jlZShr1dI/08EP7Bo9xk=;
	b=mxpNT7f+zmwBNpUpc/oszmu2O9hml12DQsRaAkF9TtDNbeoNUAYFiJzDcPNqe+p7mXaA
	 7pfgvHyAt64IqMoA3wA2nl0soiscs7YrXN6vvW1Kl1ZVzIVf4dxcVmDt6Ua+FdhR/55IO
	 aYUSaFq8nIlGKYa8tiQ8cgo6LntZo6BStWJJyot3NINz9iVb3pyZH8HskiTeHDjHmtxGU
	 0Kv7sac1QLMcG9ZxE+T8Jhi1dyb11r4plYZx0+ScNsRfh6eBe+iEBjGfO8+8R7ZIv29WE
	 +TzUGhHuq0vmccHhn/7pUO8OT/V8Ls2Clv3/yFVCVoSotSoDODPy5Ak1wtgZhyRxa3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826402;
	bh=Ggtcq+nY+zagvJRNcnn9Rn0jlZShr1dI/08EP7Bo9xk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NeASTmYttvWRepJArcpXw4WCk9zrnnDo2qIs8rMcvht8KVgVWKeFR4sfNTarogU3G
	 OZ0260ljkZwHlRT2/rkHzpybjNmU8DIZvNU4Jds6J+cEj7v+1BrvGshACWR/+f+hsB
	 sqdV+SlzqNQgm+tfQNBQB7LNyE+LtlZzPr12tuMy56D2QF7PhvLpLkEJnmnhOmdz/Y
	 V/mOm9kO3HtNUzZrmBFxDeh1DUL7+Dp7+EiisSfgpasw3rFBqI2+eBJawpeowCCxYD
	 kDYpabgKohnfc6IKvxEYFOKf68aqmrZV+21duzTFGa4RX70PseIvyyxgm8cznC8NO+
	 Iu6NCM70yMAEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549F2408C3;
	Wed,  4 Nov 2026 21:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9224A1789
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78B526078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iky9ddTo7IWG for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B50B6607BE
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50B6607BE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE3EE9DE69; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:05:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2729263c6ebb53fc47ccc26cfebb8d0bd97ad10c
X-Git-Newrev: 3e8018f8b22ca6f27126e97606ec8ca667d42d1a
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.CE3EE9DE69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: version the CSS and JS URLs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e8018f8b22ca6f27126e97606ec8ca667d42d1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The web server sends no caching headers, so browsers decide on their
own how long to keep main.css and buildroot.js. Browsers which cached
buildroot.js before commit 445fb0d067 ("website: fix the recent
activity in buildroot.js") keep running the old script, which needs
the x2js library that is not loaded anymore: both the recent commits
and the recent discussions stay empty until a forced reload.

Add a version to the URLs of both files, so that browsers fetch the new
ones. The version has to be bumped each time one of them changes.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/footer.html | 2 +-
 docs/website/header.html | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index ee0a6d0c20..323c6944e8 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,7 +1,7 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
-	<script type="text/javascript" src="js/buildroot.js"></script>
+	<script type="text/javascript" src="js/buildroot.js?v=2"></script>
 
 	<div style="text-align: center">
 		<a href="https://www.bestpractices.dev/projects/12245">
diff --git a/docs/website/header.html b/docs/website/header.html
index b64d091a01..406d4d545b 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -19,7 +19,7 @@
 
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.8/materia/bootstrap.min.css" integrity="sha512-lR3pptsOFflVTuIszkLNcibNkPReN2dEA/t1U1++B3/wPEZL4pysMdYsQfaMefLI/X2fjvk5AeaHVBcFoVO2mA==" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous">
-	<link href="css/main.css" rel="stylesheet">
+	<link href="css/main.css?v=2" rel="stylesheet">
 </head>
 
 <body class="bg-body-tertiary">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
