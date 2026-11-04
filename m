Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955BA60D8782
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jYRQfTCf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 732A681539;
	Wed,  4 Nov 2026 19:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFN_v_a8hAUp; Wed,  4 Nov 2026 19:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 743818149C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821948;
	b=snSEg7juDLnfIspK4MnFbIAowIlEFRMen47srWmYEs54vUqMUjvMP2yLfirhGkbp6B6Y
	 2F2XzMOZwiPLydXR53s6MFShUvoXXn4xxeEkMOt27HpgjRMbo69pgtXru+D4od6rmFUnR
	 mSBpBKNwnn2fLpTcCSB+iEBQqyLBjGDJ3Ki0RVuPk1oL24Ifnf31rC4M6acTHDGkTLEfk
	 V7JFqEQK+8uFByfbgPhxtxqOahyrUWzu0qGqDK1MblohCS59P+WAWCIXfBumUxnipGoTu
	 REqcfcc7cmbRn7lmqQNudUaltttTRGCEajzbmzDsOcsD7MRYQjMUzR+5NbwjCl/6ihA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B5hrKNBvL+I5TdQCXyRtMdCNTmtWjnOeN/cbhDqVHjA=;
	b=a9MG1wu/84jsTqG9ChhNDGkRnTvknAesQhWW03RVJPAvrTeB0ASfG72HG+KqvR7Z9smC
	 kU4ApJ8d6nx0yNaJpO5s8eV8iSrEwGPIN82Qm6SFZtp6jijucnSDOKkNtoSSdA1FEmXWz
	 cGSvd2+Y7NGkZ1myQI55qhOTr6PCFG2SdEpIQxfiZ9KldTyTVr5a1uk9ormix8jnQXPxu
	 MJP4GmyGI1ERcKVXlKQ0VFJfsb3DiXKCB/oDLKCsa9WCNx27dYLZH1+c/vbG2ka2TZxxt
	 DG4oOGVFAY5FJ/CoV+4vUn4fWLJ67rAWJtZ0vggiHBdZZPAozc1r+3nri2dKoiXfz+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821948;
	bh=B5hrKNBvL+I5TdQCXyRtMdCNTmtWjnOeN/cbhDqVHjA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jYRQfTCfjgiwbjcltOoHvD4ECM/wCq/W3t/F94fJWGpSdnJZlXPXQ/9/C/pFgYmWC
	 r5b/vF1xJppIUMlrh4zE3FPdGDlkNYZTWQ3Z/di0olULLatJXFQBnRtzwl48YDFHk+
	 M/Uwn1RTX6W42g8npUtGdTbm0NqyL4ltjJ0A7/ZxhHbI9GrU4OWGVB/QipQvD+LK6+
	 bwvMRii6+y7lKkCSKy452d2pHbeZnDDm4x0gaUiv0wQ/gbgsGBKkbhKSRldl9evB9J
	 4bLx1xffLAP2plokReHl9N+XD9O7y5q9Q2gYKgQ+PT9rPeXvjCDB9rYF6SzJSwte2y
	 ChcD+aUGZegKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 743818149C;
	Wed,  4 Nov 2026 19:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD3A177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E0E40933
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRJVKFa6YxRM for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B6D3C40934
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D3C40934
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8C2B9DD96; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:46:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ba6700c471cc486718f67a4e258ac321b0d0a4f
X-Git-Newrev: 1f6587da68c2bb5fe424b44729743eb243ce3cf1
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.D8C2B9DD96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/support: lay out the commercial
 support logos in a grid
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f6587da68c2bb5fe424b44729743eb243ce3cf1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The commercial support logos were laid out with a <center> tag and
inline styles, giving unaligned logos of different sizes.

Use a Bootstrap grid instead, showing bigger logos on two centered
rows.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/css/main.css |  1 -
 docs/website/support.html | 44 ++++++++++++++++++++++++++++++--------------
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index ca11d11d45..3077c0de53 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -81,4 +81,3 @@ a {
 	filter: FlipH;
 	-ms-filter: "FlipH";
 }
-
diff --git a/docs/website/support.html b/docs/website/support.html
index 8d5f096bac..46af35dc1e 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -101,25 +101,41 @@
 	 support. Only companies heavily involved in Buildroot maintenance and
 	 community are listed here.</p>
 
-      <div class="row">
-	<div class="col-sm-12">
-	  <center>
-	    <a href="https://bootlin.com/engineering/">
-	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
+      <div class="row justify-content-center g-4 py-3">
+	<div class="col-6 col-md-4">
+	  <div class="ratio ratio-21x9">
+	    <a class="d-flex align-items-center justify-content-center p-3" href="https://bootlin.com/engineering/">
+	      <img class="mw-100 mh-100" src="images/bootlin-logo.png" alt="Bootlin"/>
 	    </a>
-	    <a href="https://mind.be/about-us/#anchor-open-source">
-	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
+	  </div>
+	</div>
+	<div class="col-6 col-md-4">
+	  <div class="ratio ratio-21x9">
+	    <a class="d-flex align-items-center justify-content-center p-3" href="https://mind.be/about-us/#anchor-open-source">
+	      <img class="mw-100 mh-100" src="images/mind-logo.png" alt="Mind"/>
 	    </a>
-	    <a href="https://www.smile.eu/en/offers/embedded-iot">
-	      <img src="images/smile-logo.png" style="max-width:200px; margin-right:40px;"/>
+	  </div>
+	</div>
+	<div class="col-6 col-md-4">
+	  <div class="ratio ratio-21x9">
+	    <a class="d-flex align-items-center justify-content-center p-3" href="https://www.smile.eu/en/offers/embedded-iot">
+	      <img class="mw-100 mh-100" src="images/smile-logo.png" alt="Smile"/>
 	    </a>
-	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
-	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
+	  </div>
+	</div>
+	<div class="col-6 col-md-4">
+	  <div class="ratio ratio-21x9">
+	    <a class="d-flex align-items-center justify-content-center p-3" href="https://www.amarulasolutions.com/services/integrated-system/">
+	      <img class="mw-100 mh-100" src="images/amarula-solutions-logo.png" alt="Amarula Solutions"/>
 	    </a>
-	    <a href="https://www.linkedin.com/company/benetti-engineering">
-	      <img src="images/benetti-engineering-logo.png" style="max-width:260px; margin-right:40px;"/>
+	  </div>
+	</div>
+	<div class="col-6 col-md-4">
+	  <div class="ratio ratio-21x9">
+	    <a class="d-flex align-items-center justify-content-center p-3" href="https://www.linkedin.com/company/benetti-engineering">
+	      <img class="mw-100 mh-100" src="images/benetti-engineering-logo.png" alt="Benetti Engineering"/>
 	    </a>
-	  </center>
+	  </div>
 	</div>
       </div>
     </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
