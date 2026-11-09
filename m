Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4914606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hlTt8W/n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQrsdHId
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 723CB80D77;
	Mon,  9 Nov 2026 09:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DP9tf76Tl4Xx; Mon,  9 Nov 2026 09:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F35180D02
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794218242;
	b=JzTAs9ccRQYICYxuAZdZc2bKefmkfUnPEw9RR9C0w8sopbVChldBVfbh4rT+t+QvtAu/
	 jrHsvWsWluWGYTy8YPEvKOSB1ocluqxWC2kT6JCp531p57W6M6po2ngcOq6YR0fNYJJFz
	 J7jgkupE5kj8Br3Tv4Hl+cXgkJzIy/FXJ2ybi/CIxDBI+ERSK4JjzoyfBpggu0aKmJsXj
	 FYeTe4xpEct3NnZZPKJ7STWehw9BZPcxIOR27hPcJspkYdED91j6a8tvggAwjmuJo1DP5
	 i7NKMl+veT43HjmkXozEXJE0JCcbHW84hwXSWBM+AQDHH8UFRI4lyveraqwEMx+FdFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794218242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aMI//O1z7DdTXU9UIKWNCc1VFK4a9bMpeSac3HXsaYk=;
	b=ZDcf1McojLpHB/4UwKLxdlU2GmC2oTRKt7td4tvU51s1N3+A5jUeIVu6pNn79JQt5CWy
	 Eqh8WSFLuO87Nb8DyYbhBOzBAaJHeHWlaSrdWrXGMUdMowbo6LStGPwfPg35L6EAD+Yvm
	 +KPCI8DI2u6hSrdSPvJpnnc8pZ9K9lmPTb9QNHt/H48WZti2C52A1iDXYlYwNwHOs8mxE
	 YWcA93tQ+lSr7p27Un1XThRIrBIVc2RFgPO6NmLcmN7lSHuTPiZ54rVrpFOB2BUzytwCF
	 fnhaNXPFDp/fQPdrVeZj4HGN9OJ5nNlCmSFlZdLByZ5EXfrJDjhLvTGtJ4Z2urizBQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794218242;
	bh=aMI//O1z7DdTXU9UIKWNCc1VFK4a9bMpeSac3HXsaYk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlTt8W/n3jbc5beDf04ROobdTbuQXDAz5IxrzsmTGV7NjZF6QSAtoXk12H+VKdd22
	 ve53SF0cLzdt/kHxMmyuFbzFCqmBBAmNsyb3erF4thC5k7K6GgG/QpYukooY54F3IP
	 Ds1+XUDaIwh2aPvxJEGLo0Zl0xWWgS+9ByKLqRBjMn8lp8D/b1E7Z3UmGpbTKE8ML3
	 JR7zDQxDmqDEvE2pBf+A3szGv6vbnPC5kf7qIe9EoKLWBNeAPdals3yVr2/R7Hb6qs
	 /sQ9kcoc3CtoDQrty6PzqRDRhWVSoAgl0S9GA2Xf3uCGwgJ2HLq9S7PM4aUO3MC+5O
	 5yVpCJTMJawXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F35180D02;
	Mon,  9 Nov 2026 09:57:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A989D1
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBACE6064C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRgqBdN4vGJG for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 09:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A4E38605E9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=YQrsdHId
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4E38605E9
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:57:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so7181375e9.2
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 01:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794218237; x=1794823037; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YjAl7NCAO9+G9Vh5Q/KTV8LfQDGz90tKZeDmWyx7xiY=;
 b=YQrsdHIdiKzM4hZwB1yAyMUC//LIgv93WZkaazSLlCX6fHMJSOD02Y2llR2aUhsw4P
 r3MBdAV84QLW4fHET/nwWK3yCfE3ipdi66ejn1+hzdDaUNPrLtkYUnMlEE8vRLDgJvE2
 sopRfBK3F/3ycs62e3QclTwLACvdkFrbVCnkmbQV8G358DaHv4++tANXra+DCR5Sur7T
 doUcDqTd10T+q9FnxHt+89p6M7CSipPJfLmQyrDaQF/OWWyAwoE1Qao8yBr66npIvhM7
 JzADhUvyv9v+2CODxOfWiE2LqGQhLHIscGxpLdntGwYseSJ9rhKcTje0C01x/Z5/zcJ5
 aNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794218237; x=1794823037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YjAl7NCAO9+G9Vh5Q/KTV8LfQDGz90tKZeDmWyx7xiY=;
 b=EbtNrGvmoYueGc/BsX0RJUS/7Phjq/pdRikglVz3NBw0qQPW8L8nUv13JgCBTlIKx9
 kAf5Hgt8/YkfVT6oHgvA3Ax/eJD94DKH4rDQYRKa/0zTt1baYIB+hRBFYo9PkuK27A/R
 jm4N/jFLnRA6P+mTwQxj1JfJRVYHjVO4hT7Op7DePySvs00dULWZfCeqwPMF/5d1+iH8
 NA2IlmQGxKngKhTgIDTz+mJ4i+uBejNPLqWmjKeeFooyF39dTGZ+zyQIyPYavYkMY/Qn
 oL1dPC1bt2ivSOubp4aeLJKxZZfxdFAmqpAM9o+F6TiSn4gMlImiFL+ylghvltkv46lF
 FC3w==
X-Gm-Message-State: APuU4Z+UsBpLMwH7e2GhpD4keKk7onKDblyTTUZ2kS6Y2l/JFFXxUY9g
 LrwAfl4c/I719TiXhh2UhXa1QWTRIZy462lc9ivxQVXXrAdQ8u/nFCjr3Ip7
X-Gm-Gg: AYBFou3fcXllw/YHJ0Spw/B85dGzGEuYW9sUgxMozKGX8KiWeWHaMw1w8VEMVyz4vDz
 a2Q8pbVRxmwuHI0PGEvoenZDbXEPWHG58LmX0wyZZgQQIzs7YoD+im3/xZdq4PrNvBT4k6z7/IP
 nrCOvVW/ST5Wc12tGngnuctkvoGxYB/vqZjAQmk0t7B8S+eCP14I0SnZCmdGl+WOzF0ShkXHOb5
 e4oSBbxx1nda+9DW+xr7L71o/S8ebMecTc2DgnxbProkMcAhWdDJvYRXsR+wOub2U5UjALHbGQs
 uSRq/WcCSOG/VT7kfIKO4GthEybAQgk+1k/VVDXTWuMQCGYCtHw8bB/iTGl/LFtYWffIOZamYPE
 wu58c98lbUfTw2Dx7ihKOkPK/IJUlCYtQmkZmhX2VD3q0PpgEW53jr3NuVU1rLnv1+gzHvxHQ6q
 99Yc1WO5QSXpg9wYL06Gt99BLb0px5spREG/KuS+qBG+Snnu25uUsnOCINY5h6MhIAK51MWEKIG
 TN+Iax96CEGPVOo1aQxIN1geOEkYsIEBBOc1eUDeb/I5ZtfZ9Cyz21exJRI7pDHnIT1G9Cc/jKy
 /8jqSExObQULsk4eOdwhvA3kk+Bu+kOWr60Hh7+LHreXs8kmdTLOeoWA8mdJuOpWjnXMIa0d8w=
 =
X-Received: by 2002:a05:600c:6209:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4b9633cf792mr60081785e9.16.1794218236812; 
 Mon, 09 Nov 2026 01:57:16 -0800 (PST)
Received: from devhost1 (77-236-0-65.static.play.pl. [77.236.0.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90f1117fasm146039495e9.13.2026.11.09.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 01:57:16 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: shirokovalexs@gmail.com,
	thomas.petazzoni@bootlin.com
Date: Mon,  9 Nov 2026 10:57:12 +0100
Message-ID: <20261109095712.2253246-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aq6zA108SfaEFytJ@windsurf>
References: <aq6zA108SfaEFytJ@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [v2, 1/1] package/nnn: bump to version 5.3
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://github.com/jarun/nnn/blob/v5.3/CHANGELOG

Since version 5.2, nnn uses __atomic_fetch_or(). Add a dependency on
BR2_TOOLCHAIN_HAS_ATOMIC and link against libatomic when available.

LICENSE hash changed due to a copyright year bump (2025 -> 2026).

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/nnn/Config.in |  2 ++
 package/nnn/nnn.hash  |  4 ++--
 package/nnn/nnn.mk    | 12 +++++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/nnn/Config.in b/package/nnn/Config.in
index 555ab864d9..9742b24a61 100644
--- a/package/nnn/Config.in
+++ b/package/nnn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NNN
 	bool "nnn"
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # __atomic_fetch_or()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Building nnn without widechar/UTF support is theoretically
 	# possible, but in practice it leads to unstable builds.
@@ -18,4 +19,5 @@ config BR2_PACKAGE_NNN
 
 comment "nnn needs a toolchain with wchar, threads"
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # __atomic_fetch_or()
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nnn/nnn.hash b/package/nnn/nnn.hash
index 670a591afb..11041e8b9d 100644
--- a/package/nnn/nnn.hash
+++ b/package/nnn/nnn.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3  nnn-5.1.tar.gz
-sha256  829f485dc4f2f51c2471b36a99e22f15ff214966e16b72cd79768b2338b4132b  LICENSE
+sha256  79ee69f3ced7c0778d207df76b4d4d680636975ccda002eeb19d0917fcba3d36  nnn-5.3.tar.gz
+sha256  209238e9eff3997a4e43176dadf7e41e71f07784d1a6c8d89380777976f5e2dc  LICENSE
diff --git a/package/nnn/nnn.mk b/package/nnn/nnn.mk
index acbd0ce314..933433240f 100644
--- a/package/nnn/nnn.mk
+++ b/package/nnn/nnn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NNN_VERSION = 5.1
+NNN_VERSION = 5.3
 NNN_LICENSE = BSD-2-Clause
 NNN_LICENSE_FILES = LICENSE
 NNN_SITE = $(call github,jarun,nnn,v$(NNN_VERSION))
@@ -15,12 +15,18 @@ NNN_MAKE_FLAGS = \
 	CFLAGS_OPTIMIZATION= \
 	PREFIX=/usr
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NNN_LDLIBS = -latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 NNN_DEPENDENCIES += musl-fts
-# Must be passed in env so it can be appended to by the Makefile
-NNN_MAKE_ENV += LDLIBS="-lfts"
+NNN_LDLIBS += -lfts
 endif
 
+# Must be passed in env so it can be appended to by the Makefile
+NNN_MAKE_ENV += LDLIBS="$(NNN_LDLIBS)"
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NNN_DEPENDENCIES += readline
 NNN_MAKE_FLAGS += O_NORL=0
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
