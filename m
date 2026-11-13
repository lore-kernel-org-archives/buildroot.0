Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4B606A883
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DC/lPn+8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A21D40E59;
	Fri, 13 Nov 2026 11:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVcKrDDDpfS9; Fri, 13 Nov 2026 11:47:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF41740E2D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794570458;
	b=ilc08FII0MdcYkIN3LWMWuBITFNGjVPcn2QMnpQ+I9tlHmwfeirBz8yfHaU7KnoX7jLO
	 CXDtlcFFqPvL9otD56ptssD5udxtSxt9mxKlPTdLM7+POYQQZc4Sd4/1Lb3YpPOZFW5Ps
	 BXq1kYJlvfcLxapr6VAfm3bIBbBu63p0XFDrNo4CrFqev8BoAqHikeAmMYzu1SCCRDjKH
	 mTu3oRuM+IjniZX6JPPgsO2q8BO5xh1bHFWmIuJ957gKog9Ku+fppjsOLW3FhU+HrDiVw
	 q95sPVLHFhiSdH3LHA6IyfF46eVodcmDhUTxAQVdhB+F8I7buGhx+B8GaelSwlTihoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794570458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HGxYlcNxMh8trcRElGvby9qzbsmKmbYM0g1UVNJ/db4=;
	b=b9H+X3qzFfTtw2SfaOB82iFjcF0qkVrqzF07GNU+s80lgSNYeBxrdXuywkbTRukhMfuu
	 Ibcbq9mbC8KlYpdG+HrjcrgTCO8Ak4hGDOhLZaBuokFZHnmcd73drUDQebxh2AaV7tttO
	 oOurGQ1CjMzJYCfLEcS5WHXOJnvRA5GLzE8Fs98RfsHUgYT5WebjF/DMkmKbCKhwAR1ZP
	 1/r2EVTEPukgbXL5zTMTPn2MYtUfl0KmffMKkKlu7N0j0R2fsuWiKZP4bFTCjdr+UxHaa
	 vR3LP9qIEoKCTwBq/7Jsyeqdy2/p/HRmFRvMbUamb3S/3P/ACU0Y+eYKWu7/Hd75yag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794570458;
	bh=HGxYlcNxMh8trcRElGvby9qzbsmKmbYM0g1UVNJ/db4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=DC/lPn+8HUq65eyOE+6dOQZEO74eTek2fuPbRvokp1mS3oGAG2Xl0Aali8jJEOGLI
	 K4ToPM1J0VdmutYxy3pIQLDJwNZPkQsHHcUkRAyxD9t5lx/ru+yGbjWGuyhIa4kNtD
	 gAZ00r+UlXTY19TpSw1SwsY37ZscO+FMcBPxdvtYSM8mJJL1hhxjMHkyPqp4cIt/aa
	 MrVfAkWk2uQN4Fgy6XQEOPRAseGwoMrHk7xndcfB0i6n6muEVy/g/i16SGXFmV9gfh
	 uNNskPMBWxvXMreBXgufQivfQG9qQQFtHMAqkfpiQT1pRiPB4TC3i9lj9fIb+dyvHL
	 +3OUHyVK2NrGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF41740E2D;
	Fri, 13 Nov 2026 11:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7890828C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 11:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A7388148D
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 11:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B9uZ2W3fLDM for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 11:47:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 487B6812C8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 487B6812C8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 11:47:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c505b2e1cb9so151260766b.2
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 03:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794570453; x=1795175253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E+LzxW7UywigKLu8BPnbGhPdY60S9mIYf5mvB4VqW7c=;
 b=byJq1t7Q3xasse35hBuxJBrQ5mKXivvhjGggOk5xTXj1XuKG2Y0ztcwfCqbkEaADBv
 8NQsTEIELVQkZax4Bvhnou+lDdhJ1sB4RmuPAoc+eem/KNysjgxYTApoEwl308spRN0v
 PgkxrqWOpwoxvjlvh0sPTU8GLadTuErO45ubG1S1cd8erIF6OdFz4YEIgipaPQHgKa/S
 Ur5mResQCCr7q/MWpgnSD+Ei4dKmwnUqJ5AGnPRqjynUOqUwHfAryNgW+DOFWwQkCGcF
 Zff4ZFwyG06aUP3PQHzL8Hfg5NSEKzmW8kvxBUmHC8o0jW0XwPpDxiiq2tXnXRsEy/8q
 6I3g==
X-Gm-Message-State: APuU4Z95ibZu9yOV3JBEONvuMcbw4QAhi2oJI2J1V/dStQCsgnBh+5Th
 bJv40sKrYC0JA4NrwNnScmMPULqe55ODzLorMHXH2CAaC6Ibw5/resyASc3XPg==
X-Gm-Gg: AYBFou3V8crKngT6gqnsAVBySc67ZjnK0VzKSSqmQ0PNHiEefqjP2ny7OJsXnkJUJch
 RnQIsJFKornIZFyW4+GpHcdCKqUNvvgSVxwwWlTT64xa6UxL5C5CfXRaHbyTx0uhmVcxIGycffL
 22a2jgF3A++jQIcVfv4mqKx/TSPy1zwZuc7RZyBrsrdaWaPs62CXcF6iafA53PabY+lCHwx8++i
 sUsf/gnbarFLyCMK5+Dw0o1HeOhZAO93Sldxu6PFdi+77KNzQrnrAkUqpGSbqgjjerAjNnaHJ5v
 Pkmcx89cMh0cSzFrxX7u9K3csLlETASaf4vF3TWAQ6wXe/RPjxWiG52WPtLh6fuHwHQu52ljUCB
 Ypfs66C1QQOYpFafsoK1Oz6Lcn3Ci2zsm4fN90k+BMYK7xrhY4G1/VTUTMCm+RGcMT2pHL/9nfT
 JD6vQMNEZ0Ec5BSXST6naAdDCYtUuG9XTR89yxop/A+lPe9MhXhPWMZ9x0/kNnxvkf2GtExpR/i
 jVYEZeRNbUIvepCSjCeQaqdFwYdYSMcZFU+BLYWj3qNVVFr7QtcVSexUc6+ip8r1u/PO1cB2uy8
 7utTPOFEQDpqbEBG5UWAW8fXNDXQV4ujSI6wX3TCd80uy2+j8Iy+fx8ge58soDgkpFvE3RJv7fK
 HVSuneF0u
X-Received: by 2002:a17:907:6092:b0:c3f:55e6:83e6 with SMTP id
 a640c23a62f3a-c50963288famr181387266b.15.1794570452315; 
 Fri, 13 Nov 2026 03:47:32 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b245edsm82539666b.15.2026.11.13.03.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 03:47:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Nov 2026 12:47:31 +0100
Message-Id: <20261113114731.394941-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/go: cgo linking needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Go 1.21, runtime/cgo implements x_cgo_getstackbound() by calling
pthread_getattr_np() whenever __GLIBC__ is defined. uClibc-ng defines
__GLIBC__ for compatibility, but its linuxthreads implementation does
not provide pthread_getattr_np() (its prototype is under #if 0 in
pthread.h), so building any package with cgo enabled fails:

  # runtime/cgo
  pthread_unix.c: In function 'x_cgo_getstackbound':
  pthread_unix.c:96:9: error: implicit declaration of function 'pthread_getattr_np'; did you mean 'pthread_attr_init'? [-Werror=implicit-function-declaration]

Make BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS depend on
BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_TOOLCHAIN_HAS_THREADS,
so that packages requiring cgo are not available with linuxthreads,
and the other Go packages are built with CGO_ENABLED=0.

This issue has been present since commit 06b2e496a0c4 ("package/go:
bump to version 1.21.0"), as Go 1.21 introduced the call to
pthread_getattr_np() in runtime/cgo/gcc_stack_unix.c (now
pthread_unix.c). It therefore affects 2023.11 and later, including all
currently maintained branches.

Fixes:
https://autobuild.buildroot.org/results/e3a343ecfe4e2bed68f9de73b37e38f4087e8620

Fixes: 06b2e496a0c47b1fef55b0daccac1e62b41d7aac ("package/go: bump to version 1.21.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/go/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 47c7e5d075..9b9f7774fe 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -33,8 +33,9 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_mips64 && !BR2_mips64el
 	# go uses dlfcn.h + cgo for its plugin module
 	depends on !BR2_STATIC_LIBS
-	# cgo supports uses threads
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# cgo supports uses threads, and needs pthread_getattr_np(),
+	# which is not available with uClibc linuxthreads
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
