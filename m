Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2314606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mykcM1jm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms3fvvoX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C716071F;
	Sat, 31 Oct 2026 17:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S6qC9wp0_IH; Sat, 31 Oct 2026 17:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A30576067E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467224;
	b=aHwtTgqA82dyuovgYoo4iom/oNyl2HGoldO83fjuxJBTxQwB4H4p7KlmLxF5ubBOqHsB
	 GNuuVkKM64sxNrtgVWHlXSrTDkU4w6C7ySjpK7FKRamXJ0gt+1Y0eh41zbcopaigecJIT
	 bRAPkfCY9+Xsc56OXdzXkL0HIxkldUcnRm1zhhvyF4rw6gY3bo/28MEEXLh/4pfg9ttDK
	 4ErLh9Xpq5KxKTUojqL71ACds+EoJ2sN9QGfDEyFzrZwjriiZhcOaGP2nmStRyj9QQ7wv
	 gcMydGyo3vvJuvh1MW4u8ogxVOaiQVZ4giv4CoLRlaeNiK5Ibg22k4Rch4Pn0Sx2ZbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5T1x9SInyu5DydX3W1VCPh3VhNxNl47VjNM1x7cSJo8=;
	b=JN8U8wgf7SKfkR4R2CYvf+V8TzSqcnvGYUtXLmsAQixOVk5Am0AVBfn9WBQanzLA/RY5
	 c0w6E0E3nfbVzFQevDUm+aBqhrUNNqLk/xe2X7vehqUaVHEu7xOlVu7X/9xx7nzNVWEDp
	 68FKF0e++fFmF80fwhw+rNTudkb4mZ/KzDlJXalvyaRa29QsNcNbXTKMfZ9Dog3EQWRow
	 6wloywZwfF13NPVpsD8DyajbzSiyOQytt923KCf9llpbSUS62Yn3rZNRGB+EclEAbRxfd
	 FgnRwvt6BS6uy4qauELGsRxbQDlDWEtwsLQ70q5+xwpIwpTHds2Ze+KtMqlWf0ojZcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467224;
	bh=5T1x9SInyu5DydX3W1VCPh3VhNxNl47VjNM1x7cSJo8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mykcM1jmFVGY6jH4vn0JGHyJthvMdy7mtzJ6SEYifC0eCEXd3+bjrDupugFya3wP0
	 eraaRYYSM6+zC79OGk9Z//zbgZGAC0BXyrCisUqG56H0FqocZ7uE736J0ycfeoKo7P
	 QRycyUdaS1TjDdmZVnu6VrH1HYdRdzcv+rpmWiwPWq54epf+yvJDjpX2eqrdQz5c6k
	 yl9Jr8mbmg9X78MxEnQq8T6hcmnJWD/aJcc6sjSJoGoHmu8QzTecFZUuh8FYVvFnLX
	 i2+Z/ndOfVN5MPYZ3kPx/KzukoqiNWEOhSTxZeEyS7allKPpOaoca4NLWTDJTMx4y2
	 Lc82mgUpJbh/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30576067E;
	Sat, 31 Oct 2026 17:20:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F67C411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70E574035C
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5VIPLrS58g7 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6273940355
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467222;
 b=dPK8X1MmOLGjMxaqAXsRnbKYbT4HKof3/lblAfNhyH3+fZ/3qoyBrxHXWsh/nUjTB/Ow
 YwVIsvLd/UHl2XNBhFL7chEblxDQTavnW9wYb2UNq7sALzvE6/IOFSqT8b1VQWBPX9XZM
 UgjKG1Tsw1jBhRY5cEIRpn1lL6Lx31SHN1nhTzM057DY3LnSEuK0mWoxBi/FqlwHDIGzb
 0gShvkhmj6DRY1tm5AlH0BMGOmJ0ZkjWoVmcvtZd5qFpkIGfLd8ipZCE3heAU07I7/bwl
 2zZcndVydHFHN6yj6Kluy2XVRvxjt0KmW0Onb9HkqIjY1As3bk3T7CnB5eh0zV8cMlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467222;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=84vGfgbjuTsSpL4rhaCka5/s6kq7VAfTl2n9jUrTNaA=;
 b=NdM5/Oiy637o+pPQ/phheMlT1ZmE/vuMOeDdsQGVNQUgkPlzy7Oe71eX6wNbU8DqScff
 BEjnUPMMJoUAhqMxeLeTmK9hKpDFk+jS8+ln3NUpZpxaToBnIJD5hs7xdtK0+XREewAiM
 yNHG9fApjYxLasOkm/Yce+ChbXbwf3QueeqXA2uhlrjM91lAQhXJZKjt/ZIayB6BvbNqS
 CARWVwJCWAR3rRy17ByMpgiuVDeeBXWAcOSyhneisWFjumCN8VJUtRGKXC4/LvbQINEg2
 KKzLcZzlmObtuCtBlayquqdB9O87e9ZJy0whShp9rXaBR/AD/3Nj/x5P4jrTBWGotow==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ms3fvvoX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ms3fvvoX
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6273940355
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:21 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-823b938464fso1436656a34.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467221; x=1794072021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=84vGfgbjuTsSpL4rhaCka5/s6kq7VAfTl2n9jUrTNaA=;
 b=ms3fvvoX96bXB/4w+Jhiy019Z+4GJ4Ij/LlApSs4xRBQjkyf7C3W9jFPFSDYn6vJax
 Sru2t4M1QAYBpg44tO6uIXzRgDVcjV4GZERKQkQF4w77GQG+XLSPs9p5eYMHmrG+7H90
 dRDODSlhMc3jDoGQQ1uLwnYr1LScGCBz3udDGE6454MhTC4PzJHxVtncDMT7gVVSYcqk
 9WmgtJ5MOPdc6bpM4djW2QS6Z7TlomCnGebasKLkRcqeeFH7EwOlU1Vtfp3Hzqm+v/Wj
 2rzjKi+Y/brfFLLw+1FVKINkMIFmQRHZZedRgufq1IyjFez+NUyW7M+iOS1SPnptGlOG
 xjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467221; x=1794072021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=84vGfgbjuTsSpL4rhaCka5/s6kq7VAfTl2n9jUrTNaA=;
 b=x6ojDlcXqrn3/0JDAbb6L8sJcf8wimptcFHRskEh7sxNAVW5IFab5D2dCrhOC3kQlE
 dmY7hqLglWFnR09OwkzI3zGM+W920Ctifobt4Fpz8S+8fFeLIvMSnlZ08v4HS0gDnv1s
 QXaQHcP0eFABOPlaCqgvDWNT4WsARtc142UMz6YbG0FKO+gIQb2f2C1XP6e2xHiQIVVt
 yGPGUKSqmTzd76h7XrSZlcfXEy0pUPpY7g+rQrsDTZGngIb5OMFSd+B+fIw/mk1dhb3p
 vfHeo2KiqN+ehwB021VinbVqERcG7Bqccy4BY4YeCs7jBHwJ1DtUn036QuEqeY+KVdMT
 p98w==
X-Gm-Message-State: AFq9FYInm41fqL/SI62gxv/VrlubPEEhH+GKiWILgHuq5HEd/D+0LxMa
 y70PrvqNio6hWl/FwvxoAgtknslfJDthjiymormwGlIUmyftPHLFBTmR7cayNw==
X-Gm-Gg: AYBFou3tBH/z9sSKN6rpw+MWdD2x4LENrdd7/Fs780NMmCSIg/6CQ7XAsz48jzvD/U7
 e/YkiRL84XoawhETiXzz/ZvlXKqKltIWcOLQZXv09WOGgmxDYS5oF3tPmg/+LwijGbQmy/pwbPw
 upIolko4Ytu+VNeSPclaxClgq/JwXVx219LskSD1RnEh7d6ypfjisMhn55z2mdZ80cduaBrcjou
 pg3SUgnaF4ZY5oBsgtTDczCuH4oNtL+4rq7kSyNzLB5o3/tF0SiehPIh3LpM6fYUCHek6nVvFOk
 tUqefSfuLNIlQFMuWqgEx5a89uEe9Xutv4fHfzbXeZQpQBoQU4wI6tw/5NJ9VQ0ntKnbAwvHSDL
 40U0pOEswvbChoyeNFznR+6WnfxnkhijNoxfx3YRfoQ3ud6ijWdNEGzFwnZfKtAHehVQr5qVz6J
 o2lRRTcn3pXzsokydOl9jh36DGo54iqFgxO8LlWIXkfH/BZlIgdLRTQNUESOYKHeryRJQ0J/bPL
 EbvwhdvjNw8VnV59FOwDSIKW4mxCgaukIaDHv7knJ3WigpIe1Xa3mSKfaGz69N9eFc27fo7Lgfb
 ea+HsrhIrbQ0d9AObSV0nY0nA7uzl74eYhGQGxuKLffgP3YPyZwMcwZCtpHR1YSVu8QHRgJJ2lW
 0n6rcFmRjYEygP0OYsCLQm8fVzbj3dKLWcZYCeILGxUwaDC3YQt6iyRfoTnKsAYhTJ2tWcRKnEd
 AKIuui5I4MRsWlf+784izljJ0fuYVGp2BdWqLJUcu8JbSQ7zytt3NaMynsg/L5FWuBjEwcYQDqD
 2OZWubc9XrXyQ0vwV/X4HE=
X-Received: by 2002:a05:6830:4113:b0:845:8d86:9f8d with SMTP id
 46e09a7af769-85d3640ceb0mr4553586a34.8.1793467220907; 
 Sat, 31 Oct 2026 10:20:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:30 -0600
Message-ID: <20261031172019.2683287-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 0d1ed1532d..23d9a832b6 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  cc09f6909df2d4c8c1db9af8572f47fe  cachetools-7.2.4.tar.gz
-sha256  e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5  cachetools-7.2.4.tar.gz
+md5  37a3116e73ac0870c9e58bea5bc0aae9  cachetools-7.2.7.tar.gz
+sha256  e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e  cachetools-7.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 9d1e337d61..6f75963bc3 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.4
+PYTHON_CACHETOOLS_VERSION = 7.2.7
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/3a/5d/15ea0494ebcb9062c7ca79bf026cbba380a50538ae73753fb40bdffa79e2
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/40/3a/bce69b9ecf4658dcd3599abe5122a9031386f8f94bd85c6525fca9109db7
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
