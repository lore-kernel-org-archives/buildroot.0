Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C9606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o/FrEgc5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fINK34T/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9B7407C7;
	Thu, 29 Oct 2026 14:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bp4qduSV8E4i; Thu, 29 Oct 2026 14:44:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD2D1407FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285075;
	b=LZcNcb/uimUkihCGLcGXcO6rE/bitmrSH51JLSSY3HCGDbOcjeEW4fiiweX/JgVNCzKO
	 MCG4riNE/Rjq/wODsU3O+qnmmY1GJ3642zubLmSkweZoq1cbu0Cbrwc/sJ0W1S93mrUi1
	 c5/yedztf5SekVY+4yBDXBCWVZz5P99FjLCAm/f/KKGXKQ+cndQskwuSB6ecdKLnCHsE3
	 wwHAlOUMKFA/3QqslwbqRT5MM1rfHHkwx/XKShTO3e+z1LQoE5EIOXNBsqM1F+lkY7OST
	 Yf0ODPcdtsFGe0VX3V46wfgkrSzPkhyjWoMXULg2Fp0MMDljFQVCkZLA2F45r2ukSLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zUftwmTx/5v7BQCGF1HyXN5LY+QXhfRfhjzCPa5iZ6M=;
	b=bp4ifcPnJKZBwvnJ0dqmBh7fN7Butm9Vhq7FWq91cZ833SNKBYiv8Sw2WJvQjkSe5qLx
	 mg9JAKSGKszmFNLkWrHRNsDZMERKBs+kvNdMidzIPZO83+slTmjzJOeIjClquNQzqCneJ
	 8QF7ij6MZUJs4g1apK+pMj3MwtKKRLBvNHCAmbQvxQfT24Ts0C44DxSzHMbS4freaDnh5
	 tr++O7mtlnvghwfww1dNOxG6Wojrmtl0A8gNtB0gorFHQGzp81Ajg9ptNmDaGdst+BUJj
	 YMucR6gC2cCqE/Ccm6BoHiQ6fZbIY3V3EbI+YknqT3HlIITc2YQWljaywjlNv0FRUMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fINK34T/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285075;
	bh=zUftwmTx/5v7BQCGF1HyXN5LY+QXhfRfhjzCPa5iZ6M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/FrEgc5nAJ/8ETJDAaAJH1i8EkMLPRt0Peky9sPemI8v3Lp6CmIPJSPV6adKiuJj
	 Eei2Whb5H2Zl1ypZv7+Xl6lrfMqhnIw3dQAV8DA9hrQs20E8PFduUa+txqijVdnKQu
	 GlA6dLzOHAB4Dj5lG2aSw8rA26jDFIdO+0jOUwtxyxP+JuInxDkeeuB5fvqCrOcYJX
	 sJu5n7DHSZwOZyapjNikUR6FJRefiu9jNUD32lumG5nrmfH4U0zFG57AahWwLiYY85
	 UnByqLreW4xwQiwyLrQm5GKVltSv+XCBx5t6nIMH5c+rnnH+mtKWZoZ1TvKXJtkUQP
	 0u36zgYOcoknA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2D1407FC;
	Thu, 29 Oct 2026 14:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B6F972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4842407C7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG5KJcVezkQl for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8155A407CF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285067;
 b=DaP24h6yISCgc9EvWNlGpFsU2K96bXQgDmxQ6VdWmASjyPjztigjpE4ulMWVNLklh8xY
 +D76EZeCAp4N4z02+E3uUwk3M9N3QxDIXEObWowgNBXgvFTvYgEGLRTRXNKaJOJxDy3Hg
 vpAy1IrL2VDFfv8zUpY0f8arRT3gnCuyCi5CtPFnEoj/ME2SbnD7KGWsUCJzXbcpiriyM
 alELBi7wNUb7rUQOfVx2qAUiVebWZJ3/QKgQ31JWrCSZxTu+ZsD20hXpp5l0QnChapVxg
 DyZczsYiJPGrBxt5SPJ7njoc0o5Hk5fpoD9YZfEBLxBBsX8TYyvs5OY09s5K4B6pGbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285067;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=G9gs7FEmZrr9O30Cn4sJTK79pkoAx7tqPDNeuLahV0M=;
 b=e2QkhhQVt4608c1mKEVh85ojXHwLOjyz48n/T1gAQmMzJIo1kxxeL1mIkt3H6J//kREp
 OlZytmHHHQFhSJxMWolHw8bXWlMcgEL6GSjDPRaBoIoH6bBqinVC7mM1tI/CI7G3UOalY
 hTVOPlfFeAtBtXSHlXLPzhdRboTtgPGXKdG5sxieCTx6mgbvB3ICfdD6rPnNAGCr97zwz
 dQSP5P+Ffjl7XIgKVMcdPkiq2AE6StfBzDBIuEvQ6uXmZgOwDo9cVEhV3lcVmAbB2+gio
 8enQH+Y34CoP8/dY2l8iZldSRa0uW0UJfZN4vRJdelSYB/TI1U97QE1eas7NNQEAyXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="fINK34T/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=fINK34T/
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8155A407CF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so1752350f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285065; x=1793889865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G9gs7FEmZrr9O30Cn4sJTK79pkoAx7tqPDNeuLahV0M=;
 b=fINK34T/FMDVCfF5e5PTJlaZkNSB+hRTiGc0URvOrPV/2TF3hO4iL4QqfrGN0SiyDE
 LWl/kW615E3gy2UyGTg7RfyzLDHtoc/ey9ZssYVHM+lUdak4YvTFG4gL2u9IUF1/6p22
 jHK/yF38YjXT2KGBn+Vbw7uvLAW0ITWuXVtBwSoaqIhP79EYWyUUnjsyIv1UVshaMVhb
 Okj+sMk/MB24wtm2K9RXVjqln/QFpxFIzLEEzjgF4qWmNlzH9Cyx389Ww2GkRohq4m1+
 /bcsIYic9+7DQ6gNbCaX4tE7Vj5fRTYOui0+uThBAW1HVFzjT3Pvby4ymk4A+w7A1w1w
 YAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285065; x=1793889865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G9gs7FEmZrr9O30Cn4sJTK79pkoAx7tqPDNeuLahV0M=;
 b=QXL4dsz+T6MhM8QJrXUIbye+OgucSca5u62C+seM0uEPt4dXdElIiSZNKSeX+DVgoR
 +9jjH4j3mUVJz1CAzGDmeERpm6jak0X8lL0ZEPXDQfby23mppzMJcNio6d1p6F+0snDz
 DnSEXbJacNgRs3LpITw/7z/FK2794I2btmF+NkPnMwpqdPR/TRWI9g9dmEfHyeIwDILQ
 7CczHHiP1WNPdmgGpH9s1AMDHQEC4oswoUKMHoY8zHDF8BsZ+bLzNm6l9Ke4LLWegveT
 B5qsC/FxsuLbMvg/sF2Q3qAQ016eerxNAMqNifGKgYLxqyX/L/oCdMGNue1KV1FC5zj+
 yvBQ==
X-Gm-Message-State: AFq9FYKUW68V9R7tBjALchvnrZyi5xi/rg6Ds5C0AHWRX9YxZzdL03bT
 13EOkEhNB4ldbiLvafjsboMMPqI35/pduL3987xIt/ztswbiipBqCQL4P3eQPg==
X-Gm-Gg: AYBFou0TlRJEORj2RL66ybRLC2hGupYcZ4cv14Ule3lEDAfVzCQ5JSwkziycpqOQFB7
 QUl8wLIHK1QRGriHETYLf5hMVvPr5fO5T4+y0gfh6kYcNA7ELAOJAy+iZ03KDddJa3Zo0mtAs1v
 PANMZfMIcObGwIRqJdBWAYGHftSujC82RbiUVqyDQeNMZSvnydxlog9S+nYGKySmrQ2Js40ra4I
 J4BQIRT0lD1jHayo8sAlUdxMJS4h41w1AiH0JVoVAZtGb9ahAsGbh1oeEjf/yDT27ing3/ZTvi1
 3iAJ/QYFV/bHZ793/sX2nfxxAlPULTb3YrBjrjQ0EaVBy7xevo2vZtktr0zhK1jiOhjvGOddN67
 JSlsDnsuWVsW/ZHfqeP2GFDIoBG/PbMwU7g/HL5S/+WmX3T51eEZrY9OhSJPqo2hII8u2i3AM65
 sJWM0d2TPbkWtz68sWJYyXhxYuyqhVSRyVGqY/X/tHHsjGKhiOtZ1CkoGMDHqNRtF7AgQybX7gG
 pPjQULf/W63VPn8xdg4/TQlo2K5tf8K1mLWoulZrAXXx2CKPaTcAe529V8oiEhs9/3d4wsCSP8D
 rpYyOInvMjSUmNmY+Q+VeylWmI/f1WHFQOXr3DDDHACLuf/GF2uKsQ==
X-Received: by 2002:a5d:6d22:0:b0:48e:4f1e:5e24 with SMTP id
 ffacd0b85a97d-48e5d59097cmr10129032f8f.14.1793285064901; 
 Thu, 29 Oct 2026 07:44:24 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:24 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:59 +0100
Message-Id: <20261029144400.2972217-8-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/9] website/support: lay out the commercial
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The commercial support logos were laid out with a <center> tag and
inline styles, giving unaligned logos of different sizes.

Use a Bootstrap grid instead, showing bigger logos on two centered
rows.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/css/main.css |  1 -
 docs/website/support.html | 44 ++++++++++++++++++++++++++-------------
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
