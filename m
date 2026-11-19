Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDD606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OhE1Hbdl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zIsiZxGN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666F640A08;
	Thu, 19 Nov 2026 08:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8CvyKA07znQ; Thu, 19 Nov 2026 08:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5C4C640A1D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795075742;
	b=IU/y/szW29oroHw0FEOf2veSr4gfR6XVzmWBk0/zKmSzfjnqGQEiSAzFo+fcYlbU0mvF
	 8QB6wm7GSXRMP1Slw3oMC7I8ysyoxV7oruinkYNw+7sJ1hO/F2nGba3mhXQHAVsFwYY5c
	 z2GF8RRP9ipI97k/1yFqdm6OOh+xYLW86JvX7Wo0pNNvKuuYWn/t3wuOT5OZLUcPm2csj
	 0tt0+KK1P/hxzz+fqek0aE8RWs53K1tPlIFiy8UUs0obVasZgmjfvZqVZIKo7zH22nNAe
	 3iPMkogc52XYVnn3mx19iHNOdgNz3NPEDGeBX9g7HB3nZ4V8QggFBUpsuFSLtevC0RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795075742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lWmHCfzIgCEhoOvCr7C5OPI4yGDEUCE9cVh/LFqGZdI=;
	b=MB2K9X1LG0cb10RwX6jHzo8rgYaZOgK2aNHDPve4aMM8EeWfiHIMulpTuqzu0hP8rwvI
	 HcnlkDXMaX6HIeM71tQjiWCn4LRrhsLZrU42Xtmn3AfYi2KZF4clgakY4SVB1nmqe1PCq
	 wDc3qvAD2K87TlsL/5zgVlQFCL/hiscViVtamP96rfh1EjipaSqVEZSel3D474fRuwkPA
	 uA+TRypC6jiEG8m/HqGUzZCUonkYzpWdxnTrUadx1ZTKnxpDnbinuy5w2V5TggQL2iM9R
	 iGy+xahMDPp7XegQJbeo/4Jfxp9yG6Pw38xBPwsuvyZjT57UbCtbWTR3fFkgRbJJQZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795075742;
	bh=lWmHCfzIgCEhoOvCr7C5OPI4yGDEUCE9cVh/LFqGZdI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OhE1Hbdl6W5xrItcQXGmFTS3AmSN2q2c3rAalEXpi62bTZlGWyHcbyFsLtO+8xHKc
	 AWXn+2mI2eZUZPSuA+gpPq4c54c8+/pdFybLSglhGZdOxTw1F5EawpN5VjiJEl8Q8f
	 BT2FUiS7v0k38R5zppzb5lc94zTXR6fknhkXcjEEF5Uu000Lm1ZZDBPLBBelkP5JXq
	 7hpVP8Fgd0WNiIktxLI9Ry2GbI58Bm4iOzgKJ6xewh6diUFwsEf6C1eUAphZXPMIQr
	 EREdTVuXJY3XeM7q3Eu6HcOPSJ6eSjuskFZP9n4oUC8KIUEXb3T6O9fwHa94QVEpgK
	 QKLksiBhRl4Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4C640A1D;
	Thu, 19 Nov 2026 08:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 103961C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA32240080
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvdRi59y3fPT for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 08:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A405A40072
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zIsiZxGN
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A405A40072
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:08:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c4395d31228so299653266b.1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795075737; x=1795680537; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=855mZPoZeg4pDUB5c0v1/OR65Ddt0vhbWLa0XTCjiJc=;
 b=zIsiZxGNi64A3nPaDtBTrBJ7Gj1sQ8A2p/PYkb21ZaQaS4p5Uc2gdU8nHEfOBUmwGJ
 0su0aMeyN3kDATeV0VfBAOltvhshCvQ/N00AyKvE0hUvgPadvwk8wGEQZhhgL1DzHXE1
 ddDNfKXSBdR3nIHcBOhRFRuHS1XytlnrPQMjx8szaIqbZ26TIjfSufFOwntWnMxC8UiV
 Z9qVHjtVEYZr+fCumWFLLoPSqegC8CVaXY2cYpUgzrhGvZE2pAWNV3kg967j8UYjjnbV
 e2Bbz5Jxsn/E0BwHMuWNr3AnotKaR5eCRE/Y7XRpvqJ2Cc8go10RvC+85Fy3HOO86UMn
 zHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795075737; x=1795680537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=855mZPoZeg4pDUB5c0v1/OR65Ddt0vhbWLa0XTCjiJc=;
 b=0wKipPqPsjgbI2f89u3/cnfdOcf13LR2oXd+m49wNm8roCnNPuFxGL1MHkG9T7daLA
 3aN03+2+S2WKVsVE05SiGc7yGtGacrHYnVULMU0fInSBHlI8cOj+7LmoUmwiwcaVTdKX
 HYvbYch5jcTVvukeBIqekb3Bp7yIif88J4wA3g0CqPe9NMuZBZFZi9Nw1XN5iTLa1fpk
 w3bBg2tsujxDwHB10YQ7hKY/2bjagUF06a3dZ5NgirJnzgebd0d6ukxYnbTdUybSEU4+
 ydnXnPRidlPn48VIxVDiKZAeIeBKZJwSeSHAUALw1hW+8Go7s3uRUWN2hLxkl6S+izfi
 YE6g==
X-Gm-Message-State: APuU4Z/0OfGTf+s7EFsMz8kuCloPx5rn4Uvj//+WlNhUdQIokBO1EISr
 Yk79RsXgvNU2xlny2c8peZSH/dF1Re9nUTNcpMau+OHRkZSnAwMl3GPaAf6nqw==
X-Gm-Gg: AYBFou0v+bUGyTvfwlWZ0a8ReismfU9IFc4oBZ45tfS37+oOfcE1LPD3EkOxy2W8aT/
 2oFsP8BWUvgSOKKmZ9KItiexutkuH+GPSyCOlNEWCkx68oF+xX4KBg1CxSgcka9+oR0Obri+vkd
 9/iRfTz2Mr6bb7+yzNdWlmFUY4U0Sf1sTCsKMezF0LR9REa/OL7WhfSX82BrXXa71Cx4L2cmvIj
 J80uc5VHCSxY49DecBQpT7lkZAK2TP511jbrFzHHNaX1esgryIE2j+helXwBUEIf/v0mW9WCQwP
 CtWHEiZTxuCi2VtJfyucfyoeVjkMhGwLPdPuh+n+rlvLAz/9Jk+hD1NHWguW9RXw6aNVRSPXEyB
 6rnZhF+oIv/Zl2vwu6YH+g0gYqlUTvDHnrfG7ySOoOBrR3qzgBWc/wuQRRijj5FR0vQmOzUJigS
 L7TjfTcGNTNTUWRjVZDzy5A7ORC4DYsefzHLa5W4Xl9tS0f1LHZYvyEhB/jEyuckZ1y2m+FLP/j
 3Fhod33cam7T9McD6oy3r6WVjyhwaIQf/+ExjOxRaAJkdAQMfIZXN4hM6s3V5an4vvkG/K8+VWm
 T8xONPpuk61l5XtOQFprg5nLMaBR/oGNJTGYVrLPiCR8dmuDUhtPCDp2MnAHP/x7msgEQdwlrXw
 Z/eL+7to5
X-Received: by 2002:a17:907:7b9f:b0:c40:560a:462 with SMTP id
 a640c23a62f3a-c510e4e4e1dmr539239066b.32.1795075737005; 
 Thu, 19 Nov 2026 00:08:57 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c51233c4d5dsm85478766b.15.2026.11.19.00.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 00:08:56 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 09:08:56 +0100
Message-Id: <20261119080856.2471644-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/optee-client: needs glibc or musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 4.8.0 [1], tee-supplicant uses renameat2(), which
uClibc-ng doesn't provide (glibc has it since 2.28, musl since 1.2.6):

  tee_supp_fs.c:491:25: error: 'RENAME_NOREPLACE' undeclared (first use in this function)
  tee_supp_fs.c:493:13: error: implicit declaration of function 'renameat2'; did you mean 'renameat'? [-Wimplicit-function-declaration]

This was reported upstream [2], where the maintainer proposed adding
a dependency to the package, and the issue was later closed as stale.
So make optee-client unavailable with uClibc-ng, and propagate the
dependency to optee-examples and optee-test, which select it.

This issue has been present since commit 6b7b895d10a8 ("{boot/optee-os,
package/optee-*}: bump version to 4.9.0"), which brought optee-client
from 4.6.0 to 4.9.0. It therefore affects 2026.02 and later, including
the 2026.02.x LTS branch.

[1] https://github.com/OP-TEE/optee_client/commit/e3148e3019f4eb0eeadac5ddceffc4d425b3570d
[2] https://github.com/OP-TEE/optee_client/issues/418

Fixes:
https://autobuild.buildroot.org/results/a1776b9fb064aea72e37965e9c04d44ab1743b2c

Fixes: 6b7b895d10a8156e96f17742c6b05eb6fd47ca40 ("{boot/optee-os, package/optee-*}: bump version to 4.9.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/optee-client/Config.in   | 6 ++++--
 package/optee-examples/Config.in | 6 ++++--
 package/optee-test/Config.in     | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 04849ffce4..fd9193b67b 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPTEE_CLIENT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # renameat2()
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
@@ -94,7 +95,8 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEEACL
 
 endif
 
-comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
+comment "optee-client needs a glibc or musl toolchain w/ threads, headers >= 4.3"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 || \
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index fca9aca07c..9a32263e74 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
 	depends on BR2_USE_MMU # optee-client
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -21,11 +22,12 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 
 	  https://github.com/linaro-swg/optee_examples
 
-comment "optee-examples needs a toolchain w/ threads, dynamic library, headers >= 4.3"
+comment "optee-examples needs a glibc or musl toolchain w/ threads, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 || \
+		BR2_TOOLCHAIN_USES_UCLIBC
 
 if BR2_PACKAGE_OPTEE_EXAMPLES
 
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 8631d12cef..05ff86287a 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
 	depends on BR2_USE_MMU # optee-client
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -26,11 +27,12 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ threads, C++, dynamic library, headers >= 4.3"
+comment "optee-test needs a glibc or musl toolchain w/ threads, C++, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 || \
+		BR2_TOOLCHAIN_USES_UCLIBC
 
 if BR2_PACKAGE_OPTEE_TEST
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
