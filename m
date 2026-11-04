Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1D606C466
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XHsQE3EM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF3D81423;
	Wed,  4 Nov 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFewYP5cuhDl; Wed,  4 Nov 2026 19:52:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BAEBA813ED
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821943;
	b=oi/PvXQPC3mOU87kDHRA1O7t4j9NWxXzMDp8nOOtApvtoEg81bT7zrE/vy2SaBAeCRW1
	 cX4tZm+tk0DCNfE6/HEiFiQa/X+aWooJSaYkpiop1pY9EXESywExQfE2+padyDPTn5P5N
	 uUcjEzNNrgHXtQxkoe3XVPg6QX6YrgZ4W9/cYnI/J3p47YOlFo66k6DYBu9WcBYD8Fni4
	 MFAXbQxBtR1cHg1q6/jiIN4gX1M3QEEogGIndd3Urs0C4+EOHwQ4oXr6NDkqvyiO+TdYe
	 zfGIEaasw0X34vXIuHyaeAFhKUdFNEeXs89/Tv24mk5G+IIdYtn8x+m5dtGoLaYNp1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BKJ4nUSstL4DQmzYPV6EGIzbmKdG/vNcmug9sgjPxWg=;
	b=jh/7ev+oVoXL9DXu5z53ahxyB+ExZtmltIE/49T57UKfdoXHyFWTZc3pB2AA+CG5XMEy
	 jDwmG5laHM7HHoDDeMfOQPL2uJhXJQOd+5pHKNpUd0XCEwU9vnJwkp4xYgMG+QG62DDuJ
	 eKrABirQQlgQO4XTLYVBD8uC6IlYsBRlk1ifDEgH82F6sd+ovH1GMLRl5O6r5gEnnONGd
	 9Ynk7p7hoUNi+7q9oH6SpCECCvro6sI7KoxSZc4Igs5Z3okjbBu3+iWQoQ9rBoMPg3SWS
	 XpFLKJE5CfG8S/cLKP0yAXiwIFeo8jl7bHfXakjkcB2BCw0pt1eSDiZME/IgEFAjqiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821943;
	bh=BKJ4nUSstL4DQmzYPV6EGIzbmKdG/vNcmug9sgjPxWg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XHsQE3EM3VyAtw1QzhXvdm2z64xGIA1JhQYh8cmo7JxqGmMjSc6GE+wZoGrHxF8h+
	 256O0lF910eEE3j618toW7/5v2/8P9ZCYSpPMi0OkwA+NXAyMcuKdd2vhv8Zc9iiwv
	 930FzRE8KiuZ3ktQXDJlKXBb64SdAuI72geby4aCblsIU0p7heovDDlye5JOpVJEOs
	 Rk3z0+zi/Kz1sAvzeP1der9EZ9YwCQo0uknhP6sV+AjTA1+BtMFVtkdnVpDsRS1HJg
	 QyFk6pSrXFx4o5OxQ34dinET3j+oWEbXX36dDoci/nBpFaw1oOOLVEWo02XSYnEeE3
	 4rbNhDzR+Zx0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEBA813ED;
	Wed,  4 Nov 2026 19:52:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D147177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D6B4813EC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZAKlJtKpWYF for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7706813C9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7706813C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E513E9DD98; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:46:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f6587da68c2bb5fe424b44729743eb243ce3cf1
X-Git-Newrev: 442a4f86e80ea0b428e8c0bd3584833c8ca2c612
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.E513E9DD98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/docs: make the PDF and ASCII
 manual icons clickable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/442a4f86e80ea0b428e8c0bd3584833c8ca2c612
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Only the HTML manual icon links to the manual, while the PDF and ASCII
ones are plain images. Make them link to the stable version of the
manual too, as the HTML one does.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/docs.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 036fe10b74..38f1996c4a 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -35,10 +35,10 @@
 	  <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<a href="/downloads/manual/manual.pdf"><img src="images/pdf-icon.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<img src="images/pdf-icon.png" width="180" alt="">
+		<a href="/downloads/manual/manual.pdf"><img src="images/pdf-icon.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
@@ -54,10 +54,10 @@
 	  <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<img src="images/text.png" width="180" alt="">
+		<a href="/downloads/manual/manual.text"><img src="images/text.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<img src="images/text.png" width="180" alt="">
+		<a href="/downloads/manual/manual.text"><img src="images/text.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
