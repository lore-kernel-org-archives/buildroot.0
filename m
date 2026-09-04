Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C842C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED54F60C01;
	Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srmsZEV2x82K; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BF70A60609
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595949;
	b=kQOKytfBj6WELWLID0lQmllwALvtppMBPL4KwvvFwYtcf7pRa0Rhxb4gznEdfB9aPeWR
	 On6ZtG9ey38QLiYBcLBvvwfhembXlTNe6QKs5NRBjVp2mPHtVaGfvmJEsab2iDxUskyEs
	 DWYWC8pBg4i+gjqiJvnP+rrYsgUBpvxLlAEACC2cm5Y4WhU68mgtYcJJIc/FL3hauov+U
	 ZbbLJeF3hG9piufzgdwg7ZlQQarRf/xrU7b3NFG1IpvzCfGsn65QDV5+GQt/qgvZj7DeQ
	 thhglyma11o+puGOHF2g702FS/9CEkNS1+rTQSfeRgWKsJ1tD28BcDRbCIQQ+OVag4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1E1wxgu/agzEmANMeuN39tdi3nMIi0vGdN7OLTvEgsY=;
	b=q2IG9igMKKCvJzp+tnpkw8bdWCM7+boA2Plsq81pcDc9wnRHJs7MmMWB1qo56ach2GYB
	 eBrR9aM5qq6OhL3V8/T+Yp8iEy7BoQqXS6mZ3a8Bzg962qU5GZDiCsjLBmyBeRaiB4+0T
	 TxvwBLhxPln1x1oUiZbCTm0quyC3lxHu8W6iuTHWJj99Ut+gshr1TtyPRxq+8wx+mnYzY
	 22ypF2hhtitnZQ3t6++sWaWvyLoUmm91QmWRRZjfENCLaXJNN3orfu4BO+4j6yx+EptCE
	 2+l4JLljFrxBnMh5hlCs5VAVAWLxo5bOyH0XYdVCF4EgB27szCUY4roMym3X1OPH0Mw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595949;
	bh=1E1wxgu/agzEmANMeuN39tdi3nMIi0vGdN7OLTvEgsY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SPjvBoMc8frE/Id3dkYd+y447ScTbV3ApGiH5ZXO7i7WGlbK/HB+7d2303m4YrmhW
	 r/5gNQOfNcPTQJblyAQxOf6EeuqijWAeoz0i3vnKIDn3MgtbfA30yGac/swlegOVDI
	 VLRCDrXEzy/AGzQ16QIEj05wTy53APajR9J6dmJuO/u2Lbg04d11QiFrfnFbtaGCVn
	 MZmUm2PTZ+bu+bTfQjr9qS1BdUiYKlhdItysXdDEeP431GjYrlHhX4jhFFIhd1RzOb
	 +5ja9beZ4TgbZu6v0SUnMCIxNLjt4bp2iVgT0jqvoVKWDpMbDJRxLloDAfbPKE99BL
	 gGYDR9webdrXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF70A60609;
	Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BECDA970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A45B581183
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kTwWogMqaoQ for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 822CF81176
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595947;
 b=sU8QrHkiiSaq1+Ca28em6WIjIZzVrtjHXnJVHkCd4N4vYznGSfQ5DuvJW2x34c/gqShV
 AztDY86/DZrFRdNQOq7ItTpwoHVefUB+W1kQHYRdaQLKPqegbBs0yFVe0HMrr3vHZQStB
 b9N1DrsGj/CYRMfytPTJQhggshiCZj/fN7tcYJHLUd4MbydA8h/mSpvg7UKE3x27IyyxE
 UMTp0JMKI1M2pwWMkQr7VvyxIinPsAjnKb5TUNS/eGg68wFJ7ue5DSv88v9HhPfaL2g2t
 uNivnjCzivDXAAzzg/tzb5XnvmiSC6peKPjMmzIX9B7vwmztdVMNcehYwBqQ35pWM/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595947;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nlKFnftCMiIxM7PfGVUY70OOrmKCvKWeXEmA+CNnqgY=;
 b=buEwi4hKlad51rk4VOj2/1AUsjg+d6hKJvswcVROS+F5mL8Igbr4NViMkW3VSqo1eJxr
 hR3jOYzHBLjftIBGeQD//SygKzspdlfIG4+HEaNrlqhxLRfFwg+wsqc1ce7JkKOP4imjx
 zNsI/1nqwf9lQfdEuzW6UiRLszdhbLoGybdy8cOtCmne88iy1pDLJ7qad9NeN1Nx8IBsS
 3nOPq9aRB4rjemVnjHFvt2v+SwEycff4eZvLcwYhFDn1YWnqIVRR9BoctKfdlObwIDYwW
 eJo5v+CviqBdkXYaqEbN1Kuu1uSnlfDwpANQgJ6UA1kxOIKjjxTmI6QFDZCFse3XbAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YI0SqEZY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YI0SqEZY
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822CF81176
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso18591735e9.3
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595945; x=1789200745; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nlKFnftCMiIxM7PfGVUY70OOrmKCvKWeXEmA+CNnqgY=;
 b=YI0SqEZYSc5TOc/84PPxY/szgvLYkwdkDGMMEVZncC9oz+qP4Ky1mKl7jiC8zL6bcZ
 mwmaebzibvQRVLO7QCPXiPxkz7HRxEUfgrGOhhMRQs6pj8AMsiJLJjjQgdnbZ1blLfzd
 BJ9a5WGYY0lL2CjeN17HIKoIw0DferCbwpdGFd7BChjSWG6vwYaTiqVi7pxckHtEvPHc
 u37VoBJHvqXj17onfChYRXyrcKAlOPF5mDYC84O0x4Bhb5bgMZJUPvEj/kcR5F67itHN
 wCZ1+6XgCBVYhvjvWq4frF13SDXRmnOZdeySRBZb0IhqXj4IAjMm274k7+xoX5GoKtRD
 /CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595945; x=1789200745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nlKFnftCMiIxM7PfGVUY70OOrmKCvKWeXEmA+CNnqgY=;
 b=Byim68cNyjw5I0RIhFd7GRjMjbb/6HcJ8gh6B6EDkGXK7quDhLGs0bL2lsafiDe+HN
 H+pwHYsC70M1sIsE4HIrdonEe1zilD1v+wFAKKkFGOXWgoGFY1W2/qcOBAkzVqPjtwlg
 s3SbS+stnK7uz/DR+GEJKMgI7y9yhT6i/djXO2jp7xQMN8OMaNk9g62ARrPaUjyj0RnF
 Pfx+K+rNKlCJZv5NewV4POsKQ2xttD2TKTbRNQ1Fq77+Jr2EnsbCk7u821iSVLjyWLzu
 r2Ut6iizCxjB3/0fBqvNOxzlunxbjjgR9btbm1sv3UIHFk0vohzHYCRP1d3Tgt81wbdp
 QOwA==
X-Gm-Message-State: AFuF++nvu8n7v/lqY2CPP3wVRvEzown3ggIlGacIBBPEEoWP8zF10lcN
 Jsc3FiMSy5CAsdhJ0zp1kdwwiOb37sDusl7Sx8SHzERr721lHklq8kNK3XOGTg==
X-Gm-Gg: AYBFou0MtX9PlKCy531tTwneAUMNiLfR6UgBgVGK360kjtJOBAW70D6k6pwPdJuo1tP
 FYv9UNIUV6uUy6MBmfEbl8e3aKsdVdE4jv3z3rlbfXzL9jcVl3PHHTiyej1DCtpgJmR0PcJd07x
 NW/BOwhXA6a36avsqgxMhnEfaOM0+jnIbpijH3jr07bi8WEsokcnK9os+fzWGD4xPSoswD9rQHo
 B8I5vkXMonSp+pNa/V+46XSuAqw3otIz6/gSQN/5x+g+3ZFuUkPvYYR5g/WSs2H3GX9yWzBc0pm
 vyf6R6Mn0oHLJomzBWeIfzCMGHC7g7OM7bRB3WIRT0Ll8sBkLbd4/YUQy5fiaXz1nPkIDpI8uOH
 R9n1/3AW2l54SjjUMGpILZyvID0/9KTPRyAEnbPwJqgjiQgCvvRhFoPxCDJuyGs+s8An+jSwEUs
 KGW/PYx1gSTdhB4bAu1muh3azKj8imnQh2RUOZmYJ4gBo1v9/3u14c8QLL/qUbJbDaE9K4JM+Ym
 6PWg8t2adpTxzExKdY=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id
 5b1f17b1804b1-49cf825c119mr224029745e9.16.1788595944675; 
 Sat, 05 Sep 2026 01:12:24 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:24 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:09 +0200
Message-ID: <20260904185921.587878-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/12] package/lsqlite3: bump to version 0.9.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lsqlite3/Config.in     | 2 +-
 package/lsqlite3/lsqlite3.hash | 2 +-
 package/lsqlite3/lsqlite3.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index 932657e58..6e84d1ef8 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LSQLITE3
 	help
 	  A binding for Lua to the SQLite3 database library.
 
-	  http://lua.sqlite.org/
+	  https://lua.sqlite.org/
diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 48ae2fce8..e16deab39 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256  fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
+sha256  29889cd8366849128d02e6080178af91b776b01ffb22564b9508a0a4e4888af1  lsqlite3-0.9.7-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index bbf6a1db1..ca0d0e745 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.5-1
-LSQLITE3_SUBDIR = lsqlite3_fsl09y
+LSQLITE3_VERSION = 0.9.7-1
+LSQLITE3_SUBDIR = lsqlite3_v097
 LSQLITE3_LICENSE = MIT
 LSQLITE3_DEPENDENCIES = sqlite
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
