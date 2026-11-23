Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D8606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QgLnHXi2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gP4w3Mg4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD6904068B;
	Mon, 23 Nov 2026 18:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X4cI1j7dJXF; Mon, 23 Nov 2026 18:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C476F406C5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795457542;
	b=aEtrzXoM1t6v6jfcWRtxF48GxcFpAUSp5UUBwUYvEXDGoyI4DFvH1bBMxnAgGLlvUUMo
	 a1j5S7yXTUcZLTb4Zpahs8eINlEe+PJek30KhSOZSNw1ooaNOftp9CnAQKe5LM0NbSY80
	 gMtmMv1CS4p610iK+T+anbNvp5m5Cl7KGFdwL5Khk17UiAks9AUtfkBoBU2JtAAWUgtgJ
	 Jh+Z7Iy1VHgTJVGogLwaX8yteZj/OuPzqZFGXMLdZSP95DD1DO7L9LnB6fiGjD4bqgvEY
	 35WA59Zc2QJunBIo1oCY8100mx49KW+bPZu56IEIoV/0jS9CWgZmbl1LnS/qKfNKCBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795457542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=e6i0+u49aMNUKiLx3YJeUFGqkemD6trQmd0JMWoTwSg=;
	b=aWi1QBAN2TRP8OpaOtQc61HlkfRTJLWRWHqw/6zgwbV2Qk+5xpVTs7bKqR0CmlL3rHLk
	 Bomzt2kLcoLPq0+ZCBmkmlmNrAz+p2nOdzjI5CTCkSNRXgYC5blbX2PduS3/rIqLtSCbr
	 pAhaHNF9+Up1IZyhgQPUmPd5NE1IlSIiDTChlCDsLVuXEoXMmlPLY4hFAK6Iul+vv+yOO
	 rYekVq+4lI1XREVoIdZuUK9pAJjjySsqOR00gnZ6+1FVy8IX3u8qmPUsiAuzIYgbKtGJy
	 9qeZUCRF6qKgFlQuGQBbPq9rHuvARH8UwfJugjfN/qjrFDl3DwA63QaMmmip68JmiRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795457542;
	bh=e6i0+u49aMNUKiLx3YJeUFGqkemD6trQmd0JMWoTwSg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QgLnHXi2w2SuINBuIsy0G81SX+HVG7PX1ZgsalqJ1L9U4dZP6M+UwyCMsNrs0J4Dm
	 U6us0sBuHFj4xHwv2Ztr6/w8KLIOqhoERQ9eRJulixHN6aA0LB2F/l6hZNI4z1yZcT
	 QsR/G6hXQrvxmkJ7nNgnDw6EHqgWNO4VIHZFxMd8rD1BPdLJPfxHfVkAChEhUXhpd4
	 TuVMib0S2ch/RINHYc588ILTjxcLGpfFIeJACLJLmpS5ITca1jv43qpaEkjdcUuSPq
	 lUWy7XmNNr67lfu24WRrfwJUvrf1tCZgLpz9iMSwmBhW89NCRnaeJyG1zl56aV3+Sw
	 +5CAph1rkZbCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C476F406C5;
	Mon, 23 Nov 2026 18:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 809F215D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DAB740229
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNtDc8QzUQMD for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:12:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6173640093
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=gP4w3Mg4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6173640093
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:12:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so2788277f8f.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795457538; x=1796062338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n7S8UCJiyZqUKdb3KJzm2/KqwIqVmfCN1+TXbvGVVf8=;
 b=gP4w3Mg4k/aIdJ1obURMFizQclbOoQ3ramVtgoW0X74bduQKQ2QBzFIebdiQCe+lmG
 bW71oJwfk1k5XrKvXXtN0reDsX1s/POLrU8wy8MY4vL48uVi0seXzsto/YkQkvgSoQSb
 C8fJr8hvoVMZH0bwBAfegSP+Ro1nWf7Dj3eDkMtXfnl8gUG/7dNb5sC0kfO5HFIYMWCk
 0fO52lIX8Fy1zktg68DQLrm463zXhcv5WYUlPuF9icV2lhhJ0tE9r7aOKfvWf9EU137S
 Z8T3IwqtClMACZIH7RSu3UT9w2/7GbOd+au5s7xCbsZ2lykYuU4de8ymWadYRENUVOKt
 7YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795457538; x=1796062338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=n7S8UCJiyZqUKdb3KJzm2/KqwIqVmfCN1+TXbvGVVf8=;
 b=yONz0h6E9yr5E5lYbUuEGyh3kykrTelGVBOjxnaTahejm3nUquSfkspYxygGJyHAmr
 6l/ymVathjf/+uwjibo71UeeuaIPDX7pNJrS0IvUiDf8/P7I5TWn5qWuRpakJ0J0et/f
 HBYhpEvcc614PePi5cSdoy4ZCuoXH6SnWq4+G+WZEkfgC7TmLo29n+IuZfaC2r7CDIkh
 cLjpTo8CLjqRUJMcv+WJ1tQWZ7uLISDtoUZb5n5RaTxNVtrR3QkDpuLEz6W06INgG2ZL
 0XZAYz0yJ29tnIxtC3DyuWQLkjrH5o7Li4O2d/1K+ZNfKGnLzE4kN+H+SnFdpoFDD9mo
 T4Xw==
X-Gm-Message-State: APuU4Z9U5OfuSpuYWVf1B/6lg1GerpoTKzSMfA5pBUlawmm2CnyvqaZ/
 c4NseBofp5z2zqjtR2XBk2qLVU5GvfeI7IIbkOK+VuNfHhNqjISJppLk4WgWqn4l
X-Gm-Gg: AZFdTZdoY0i2FFd6vYg2ez7m6z1krgwluIKwwA1uZ3/QiYe1IDqqhO2md2sQv8u8aBA
 tic3xRzSCN6gLXN7Mq+/VU1I/xdw09+ussL4dgvFGzNNUwgwr/P1B+FU+kiGRY2v9Z1Y6bSJp4v
 YKvzmBcznbFCH86eLzh4AVsFbTcteceUyexdxTfhpifqJeB/wJdIUU5ii9Xrz5GEQQ+pez2dTzD
 O951iZAu36giu1DYjIhlyZP5DBXcGyhMYYeX79Kb1nhcLNR7L/02E4dP6RlyWJF1KDyi7wvAR2y
 WJiGalwZUWrqmeEZlc7X7WLXTEcOK7RyE9KA1k2OaovTaQVw1z1PigBV37Z7ZQqATKylkLY4cR2
 oKGS/udBgWhVygMW/D6674MOoZ9WZAVEqoDQuroxjPUMh1+k2xObbXRu7gAWQbkB1EEvYkcUzmI
 JdbL3cZ84SUwQtYgCHe8EBD+A0M+qSjS2p7TGsCr7klgmT69Tc/7hEeK+pE8fmdce4uBAUuKe5F
 hSOqLl3sIDAXJyjp6qVcQlH8mA3OsKlsG4kz4H3P9rX78gwt4FrZjU63wuSET7KpAaj0C90imE4
 AYfk854cfO34EBvsJeyA2BNZ27Po35ig6vTUamXZ9b9OlezaIB4=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id
 5b1f17b1804b1-4bb887c2ca3mr267807025e9.4.1795457538025; 
 Mon, 23 Nov 2026 10:12:18 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853368d3sm374558435e9.1.2026.11.23.10.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 10:12:17 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 19:12:15 +0100
Message-ID: <20261123181215.2805909-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
References: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/capnproto: update ucontext handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

musl workaround for getcontext/setcontext is not needed since commit
eaeba56aa2d21f1d264c7e361731808e3f072d9d

Moreover, select libucontext if possible to get full ucontext support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - only select libucontext when the toolchain has no ucontext, with
    the same condition as libdex [Arnout Vandecappelle]
  - rebase on master

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20240306145531.1413586-1-fontaine.fabrice@gmail.com/

 package/c-capnproto/Config.in  | 6 ++++--
 package/capnproto/Config.in    | 8 ++++++--
 package/capnproto/capnproto.mk | 5 ++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index c472128c3f..abe2a602ba 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_C_CAPNPROTO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # capnproto
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # capnproto
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # capnproto
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT # capnproto
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # capnproto
 	select BR2_PACKAGE_CAPNPROTO
 	help
 	  A C plugin for Cap'n Proto. Generates the code generator
@@ -24,4 +25,5 @@ comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, u
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC || \
 		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_TOOLCHAIN_HAS_UCONTEXT
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index 943ba9de29..4654b5ad77 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -7,7 +7,10 @@ config BR2_PACKAGE_CAPNPROTO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS && !BR2_TOOLCHAIN_HAS_UCONTEXT
 	help
 	  Cap'n Proto is an insanely fast data interchange format
 	  and capability-based RPC system. Think JSON, except
@@ -25,4 +28,5 @@ comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, uco
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC || \
 		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_TOOLCHAIN_HAS_UCONTEXT
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index f51e037532..d5be2a3d6c 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -33,9 +33,8 @@ else
 CAPNPROTO_CONF_OPTS += --without-openssl
 endif
 
-# musl doesn't support getcontext/setcontext
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+CAPNPROTO_DEPENDENCIES += libucontext
 endif
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
