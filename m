Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDB606D4D5
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DcJxYc9y
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CC8408AD;
	Wed,  4 Nov 2026 21:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-ASci6OlG3M; Wed,  4 Nov 2026 21:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 48509408A5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826397;
	b=I9nGPW8OrEciyB1WQcLnUuE9gi1gfu1oSq0XbU3Pfl8n2xxgXUTiVgPV3EzFOH1rKgit
	 FG/bZ3fJG+VZ27qMIoISTcOURWJc5q8KX4mAUwM+4fqN7ZXRjZ4NL9DSe0BDz/7cYcaMc
	 BcflXblgjiCOEu5udPgTPWlN0RC/zVagNKU6+GQCcBUrHp0XzRSntdmIh2DMhTx/lmgzx
	 OEvKRw+4EL09y4BOOD9CgTeLWrOA48d0fm3wRMiYwH5XrSIKXJGIqQw0ItL9ZUkKpTdgc
	 7xVy4s0J1saYkLjM07Fg4/h1UPvfeaOXgVcKYVkBG8S5O60XYlVF6JpfzYGtbqZnYRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Chh+P5QmH1lsm2TeXw0qhhtgRmvpnKP/JGlffb2CUBU=;
	b=n4E/03oHsKGJVKjtdel+pwFO1DMauF/Nrw4eNDDgoEQMMlWPUfg/oBYdM8NXb6aHHyVn
	 ywt/uXCGhf19i+vWWpN2bqMzS6q+JwG8w5Zg6I6oz43oolEc9exgcDRPr5f8932fOoPuQ
	 D8+jQy3Q5hIy+94r/vcWBEqRDE3p+2KdJG/4m/0fVO/dZCfPR1Khv0lGB/Xsf7e2KI09v
	 /+2kb5eiW9F+ASAbR6lxq+U1upgeMCNpOH5dAOVRX2DM7/K5iyiWVA/NLABWXMOl43X0Q
	 XpFuOEJRRQ0rSpQ2C84KJO01pXw7Uo17xXlrcMH6Ww3vIVGaJh1D59OKp6CnDYqdZ2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826397;
	bh=Chh+P5QmH1lsm2TeXw0qhhtgRmvpnKP/JGlffb2CUBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DcJxYc9yWJgLwnd7iBhKjMrL3WiiIWaPmg+i4EF6/0oN6bp2cJLknNvdo6EsD3ZMl
	 s6w1CF/Y8iD7zOYyz71WviEP8x+fRi/9+7Nuzz5KuujeoRFRpcOW2WNLW36sj3rx3U
	 yAeeCUyzG0loz5EFjyPs8Epu9TN5tqNdvbpp4EmVv5sa+az2ZCURAw5a1Wfk/86zQt
	 JMXbapepQ8gcHuvXQQSLu7PQrpHLDxk2A8cGLlmILv4prT8puOWkRPs1YnAOxKnoYQ
	 i7fwiJNhVTqaiCG2Z0H+SvJHuqaCWdM0zPnvCM92NnUnDP4UwKjsTXklFscxmajIJ5
	 JRNdCTtiAHvkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48509408A5;
	Wed,  4 Nov 2026 21:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79AE3177E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F4A040217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqhH8qKXkh33 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A717A4013C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A717A4013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5099DE85; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:05:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 351676fe42ed138b57c3f457594c4bb5c8b19fb5
X-Git-Newrev: 2729263c6ebb53fc47ccc26cfebb8d0bd97ad10c
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.BF5099DE85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/index: align the hero on the grid
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2729263c6ebb53fc47ccc26cfebb8d0bd97ad10c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The logo of the hero is centered in the left half of the row, with a
fixed maximum width, while the title and the buttons fill the right
half: the hero looks shifted to the right with respect to the rest of
the page.

Lay it out on the grid instead: the logo fills a 4 columns wide column,
followed by an empty column and by the title and the buttons in the
remaining 7 columns. On phones, the logo stays centered above the
title.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/index.html | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index c1a5d90483..712d22d98c 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -4,11 +4,11 @@
   <div class="container">
 <div class="row justify-content-center">
 <div class="col-xxl-10">
-    <div class="row align-items-center">
-      <div class="col-md-6">
-	<img class="img-fluid mx-auto d-block" src="images/logo.png" alt="" style="max-width:300px">
-      </div><!-- /col-lg-6 -->
-      <div class="col-md-6">
+    <div class="row align-items-center justify-content-center gy-4">
+      <div class="col-8 col-sm-6 col-md-4">
+	<img class="img-fluid w-100" src="images/logo.png" alt="">
+      </div><!-- /col-md-4 -->
+      <div class="col-md-7 offset-md-1">
 	<h1 class="display-3 fw-bold text-white">Buildroot<br>
 	  <small class="d-block mt-2 fs-2 fw-normal text-white-50">Making Embedded Linux Easy</small></h1>
 	<div class="row g-3 mt-1">
@@ -19,7 +19,7 @@
 	    <a class="btn btn-secondary btn-lg w-100" href="/download.html"><span class="bi bi-cloud-download-fill"></span>&nbsp; Download</a>
 	  </div>
 	</div>
-      </div><!-- /col-lg-6 -->
+      </div><!-- /col-md-7 -->
     </div><!-- /row -->
   </div>
 </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
