Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5004606A31E
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VPJ714dm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rk30T/DT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A428D4081E;
	Thu, 29 Oct 2026 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf6B7BFEGi2j; Thu, 29 Oct 2026 14:44:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A595407D6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285080;
	b=lgmwnPgthAFeBOa9n7ZWrLxWeaXej8BhKn7q4IWtLdV56hgjc0oz6EY0POidA2Vitr35
	 LlehVKtjCKR6ZageZa7cGpcURjY99m9tgadJ8Zbks4tU5i9eWDQDnYtWXJPYGtsYVEafT
	 HpDTHfxCTc/UjNKO77v+gXUFf/uyrugBRc0a71lRSm05BruwsS3s/frnEiR0DKkRcnD2z
	 vCL4O+VNWX89GMikpYydd8QfVwUCTiKyqsIt2l0ja6Wv05ORj9q1qSUSN8p/NUZS7U26P
	 XtfdyQmk+t1wa1+/JAADMehp/03VVx/FR1/flRbFlMCe/pPGthmsC4WMx4r94XydAKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=XYuYvJqdd/qd8KXM145DI9qP9WKgDsfHdMUbsRzFFNo=;
	b=oj02L2FUNdT0yJLNdm6GqfxgSJMoGeAPhSGwksrhsSu+d8VkcIQjF4Cv8xxjD6osVfys
	 ZAiWYRADdc4aUc6FTjFMroMUiLFUKBjHwqkmOKiodE6Jb30FT1g4tRU+u913fs0nxrcS8
	 JS821oMXQbEFf+5s1W0P/FguudKiCUQdvmRz9fd0ph4NYzUJAQDKyOta+MyaaJ+tRrbUs
	 6TH+thG1SM26y54Vy+IyhfQ2bzC6Crm5YWYF1YuqM8UM9lHvJ3Q4U9z75riroybSTz/40
	 SrmVXI+OiA2LplFltFXFXvGO6Oio7dNMzfobXlC4tU1Qx+TztwodNvSXiThaf8UoJYw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285080;
	bh=XYuYvJqdd/qd8KXM145DI9qP9WKgDsfHdMUbsRzFFNo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPJ714dmwBkFJ7m1emp3u1l1iUO8Go93UVFgSo8xjJyNayGd5QUaEyiopDZ9ts61P
	 ajk72Fyf9p8Cw2sObEEqF++TJuBRjhlGbxFUJSDQAjRRhdBzIN7UAPSFjJsg8g3lt0
	 3BA5MJoYaav+ZD7ZzA2R1UN7A0jPxY+TdenID8PvnBlvYj5CFUgnyUMM+bP6Z6h/L1
	 9zSCrzkxM98XjgHSeas0W23G2ZQ9zl196N2xd2Lkmj+I5CH8JX6PnzLvwPmxq4TETB
	 ZFN36twrPlAXpRYhV5eyPrfaoxPURT4NV6p+x7xKrbxR/93+1dRjBjzR3h5yxcWUHB
	 Yr3WreQOrrQ9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A595407D6;
	Thu, 29 Oct 2026 14:44:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F562FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A978180F80
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9jfXbgtwj1v for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C124780F4A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285069;
 b=Ult5jsOfSTtwwGT7MWMkudhbmWSpGeOekXARkWC+6S1BirxAmbrXT60QjpELqaPCm23Y
 ezS0CBv0RAkh/0Adbj51tyznmZRYKIooY2lgwSe4NLGWjatuUn+xpz2PLx9OUD9xot0N4
 880bXwpDHNP3ppYF/9TR9h0nW+rf4of22oM6wJOpN0P9gtdLr6KNwHxh0AHepsaKX4of6
 x3+GwzeCdPvSGgqlVDcjPqimpt7IWZEo0Mu709la8zxx/HnmXwdjZQKWd1fJb/s0FJOQD
 IK4AgFkxIaQKylhuQf/iL31iK4CMIIsObah9hXNBYvrTS9tw4Ke3gFFb1FLoMc52mqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285069;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=unbk4GbkqsJoW6e3FhC+WpK9MrqZWp3hvpDbhdqLGW8=;
 b=sHU5vvBymH+C3fhQ5mbf59NwxBv9dId9LrauVwciiYWDboFSh8L1jeauXx/d5z8zLlxG
 d8gZv7ZlZ313i8zywhLqvksS2qMDa6l695bi6XE8jPV9TN8+8rcb8ep4RFuFbHuhQJjTQ
 ZEW2zutzj+iUJrfgigM4AsUcp4MWyGur6yyBGueh5PBiwgJil/wAaELL3tYt5Fi/ORq74
 NsTxbRSRcANpn8+8LaBaTai5kzo/b1kTcShaj2RAyvkMvLtFlMIILBMTmYbBlmVfi501b
 pUNzfqlYO53xiXlPA1wMkB0DnlwHCjRqQOBoX/ODNzUyLGU8URQmvMpJ772hf0H/Lkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="rk30T/DT"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=rk30T/DT
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C124780F4A
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so1843075f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285066; x=1793889866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=unbk4GbkqsJoW6e3FhC+WpK9MrqZWp3hvpDbhdqLGW8=;
 b=rk30T/DTIyLVUXkoQwE0/QCaZAVsDBwAekZSnaROORwulMvnwjfVXeadXRbgI+v+p3
 V0gUXda4l6jjD4rXDAw+q2+EEDzMMZS3s8hRl3+CByexH1+We6XGawjyRpxGYYtp24JX
 CjBvt7Klmc5BVkEjGA4ggy2dL/c0PNQvttK9PrqbV/SbWexBANriVQVVZF5eT7Oi8kuq
 y22zenSuIIijcsyda9ZUzlHm/7EcyPn8vnEOvujDiFk26oxSXFR8WIKOgimR4PlOZyc2
 QgU7XgqeDiu9FZbU6f52MP6tswpu+AHaoMkSIbsZXVvwzs0ZYdb/fzArBeN5+9KWXbLr
 Pplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285066; x=1793889866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=unbk4GbkqsJoW6e3FhC+WpK9MrqZWp3hvpDbhdqLGW8=;
 b=LbJ+xsEGYjtQuZMsesqtYuPefaZ8mBMoAkqSVhjw5C9FdERGsYgdXnjB15yzwWkHyP
 tnbebm8gQdXsD5NKffDsRmaUwY3VnAg3j81py7pON9z03c9BhfPNGBvD7Y+wWtSVe05f
 ej4N1Q9lf982AhAlWaxi2kfymqzibZeevYFJfwTgrRG3x43ZS8MUdAYb15t0pNWl7DNt
 rT9cTUw7EI3kP6b3SA6LSlvu2zFY5rELlHBgWPwhWv4v7XjMrc+d2yWfuggWwYwdIs54
 3g3+vzWJGpCczUThsWDgeegR3qa2CmY43uAJJ4VDwHmNg1lwfdEZeCnKh1jqWKmVLMrU
 w1FA==
X-Gm-Message-State: AFq9FYLnB+45ew68g5QviAwHOkR4YD/R+5Liuq96SztXtSx2VaV6Qd/O
 g7diYVlzjMXrgnAaUPCSKMFO/AiRqtcFfEOViWxfSsjGcVJ5VX5mz0sBKFHbJw==
X-Gm-Gg: AYBFou3HSaCLNttYSNaWWlafVabxlkJQreeCLXaflQoqkpZo49b/nVi40rpNq1tXKh2
 qPjlBDYn0Yn5m0PfczsVsPbzisjXDJ+eoP8c1q8Zavm9ShIlFtXoAPpJsF8639uN4CaPTOAyMup
 3q0KKatM7Am3HcrHk+9oiInTaUeSfZK5T5L2zDV4yMlF4Z3LoebqK9FRzFrCRuQm1889Zl17HwI
 dLJHTEQiNMou90sBG6Tb6isM8mjTmlABLKmFDWn4dB1he+bUwwVI8a/UfsgdA4Xe2eDemQsV+wi
 XNAFrpocVvjtNX1l6UNiaiFmbWuG8q87Ne764PoxxsNMNkg8uYvb6yuIqsn6lKWLQcBsYE3U1zU
 LiSLCrVaVSFbpTOcPGrLG0CUp63l45Hfs1tFywSo7GLmPNvMYTNlgksTSovtC+w+ca+59pNRn64
 8epF0u1i50KNoCtBiK8TOEFGcad35mehX609O5oMXIsAMsYEg1Z5tUlwFH7/apZEGV8AeTArT27
 ZqdyzpNhPuoe8KlbfaZ3tIE9pqLLGd6XG1LqROibOVVsQiWyqpGedegNH152pXwtZOJeOr2ql+F
 KEDFXl9V/wc2AVeOoCPx/kaWs/Rdd9FTPhlKWw+19S6SNvL6BdmV2A==
X-Received: by 2002:a05:6000:4007:b0:48d:f1b3:c02e with SMTP id
 ffacd0b85a97d-48e5d2f1f5fmr13841933f8f.25.1793285066006; 
 Thu, 29 Oct 2026 07:44:26 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:25 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:44:00 +0100
Message-Id: <20261029144400.2972217-9-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] website/docs: make the PDF and ASCII manual
 icons clickable
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

Only the HTML manual icon links to the manual, while the PDF and ASCII
ones are plain images. Make them link to the stable version of the
manual too, as the HTML one does.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
