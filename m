Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E2C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 19:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0ABE428C4;
	Fri, 28 Apr 2023 19:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0ABE428C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jy-n8068vDlu; Fri, 28 Apr 2023 19:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4A5428C7;
	Fri, 28 Apr 2023 19:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4A5428C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EAD61BF577
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 259116FF29
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259116FF29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3x_DvnVfT3oC for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 19:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695836167D
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 695836167D
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 19:14:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f109b1808so28538366b.1
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682709283; x=1685301283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s5kv33ofr5VkLIM+aNq2qDkRRtIR1zBFArGRW4anz48=;
 b=X1DjY4XefqTI0vuHQpoJg4mI7i+l04HaKeSf2+flVNYc3xsOcTTTxxZ/5bSPTR3cR+
 dSsPaepplSDG7qgFAy8vcXWai+H9nqhR8OsL4EuFSduvGlnWWXUml6tPdQPnxKtZjatl
 8n3I75sreNISI1ChhG8PS6PSe4radi6uRK7begmZoaH760+zi/p/ncR5i8vBb+XWFPFC
 0g1n9LYgauOMwnNZHEJE7x08LbdIc9F0LtS4SyOttfnVRMMo+CgtIsstJIrpeb2obmUl
 6GmFyIrFJOFiLZHuBOAi6ysgS3Duyr8sWUf0ielluCHBwO5/4sBL8X6KnuXhNRAcdoKn
 lh8A==
X-Gm-Message-State: AC+VfDwtlOw9FttsVeMwRABozfWAemhTca08IuJetgf+szGw7pYQ9OeJ
 aprSmdbzK3dalyxceUwYBHRmd0eL6vP7Ywe2aoEekA==
X-Google-Smtp-Source: ACHHUZ6hnilNw13Mfxh6Z3ovdGwNuiesw/kRWFxzvx2NlNfkhqjj48fBrNkg9LC9wT68vZKB8ffsjA==
X-Received: by 2002:a17:907:2681:b0:94a:682f:7744 with SMTP id
 bn1-20020a170907268100b0094a682f7744mr6318801ejc.16.1682709282798; 
 Fri, 28 Apr 2023 12:14:42 -0700 (PDT)
Received: from wintermute.. (77.109.114.132.adsl.dyn.edpnet.net.
 [77.109.114.132]) by smtp.gmail.com with ESMTPSA id
 q26-20020a170906941a00b0094f01aa9567sm11510307ejx.20.2023.04.28.12.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 12:14:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 21:14:12 +0200
Message-Id: <20230428191412.1350780-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1682709283; x=1685301283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s5kv33ofr5VkLIM+aNq2qDkRRtIR1zBFArGRW4anz48=;
 b=FcDxHhGHSlOGzyfqodNBB2QoOXcFeZVyFr0FkAhfjPLrSpYVHuUWQK70TRJImPW1Xj
 bGi5eGC8IwxNyc6L6nuoDcYTumUtMxT+AfO1aGLcGimP7G2FuSNSUouiu5/SkRov6IzJ
 wJeZmD6X4p+l/Xyo5yR0ZhANxWuMrrC2ph4YFiaX8kG+RikTvcCTGLcjbvWgrfoogn+k
 t1TvVs9XOFgoa9oZcnLqCO91SAvmdsNabAtgtuAZh1nAMyFFi0ZO1M0ME2863kNFYphu
 O9DN3S0mND34KNXvUIeFX1ekMgkzcspI/SY/QrUk+BL4xc9Hhr7Y2sCu/KOgdZcBqakh
 bD3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FcDxHhGH
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity - bump version to
 3.0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop 0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch, handling of libmaxminddb
  was fixed upstream in d2b700d
- Drop 0004-build-pcre.m4-fix-build-without-pcre.patch, handling of PCRE was
  fixed upstream in 791964a

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 ...Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 ------------------
 ...build-pcre.m4-fix-build-without-pcre.patch | 29 -------------------
 package/libmodsecurity/libmodsecurity.hash    |  4 +--
 package/libmodsecurity/libmodsecurity.mk      |  4 +--
 4 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
 delete mode 100644 package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch

diff --git a/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch b/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
deleted file mode 100644
index 9608e3d935..0000000000
--- a/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6737dc133cb4811a000c02b4e0a92b72f0b220ee Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Jul 2021 19:12:51 +0200
-Subject: [PATCH] Revert "Fix maxminddb link on FreeBSD"
-
-This reverts commit 785958f9b5089b918c7d054cbcc2fe4a3c7b3788.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- build/libmaxmind.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/libmaxmind.m4 b/build/libmaxmind.m4
-index 656fc250..02820b5a 100644
---- a/build/libmaxmind.m4
-+++ b/build/libmaxmind.m4
-@@ -10,7 +10,7 @@ dnl  MAXMIND_VERSION
- AC_DEFUN([PROG_MAXMIND], [
- 
- # Possible names for the maxmind library/package (pkg-config)
--MAXMIND_POSSIBLE_LIB_NAMES="maxminddb maxmind"
-+MAXMIND_POSSIBLE_LIB_NAMES="libmaxminddb maxminddb maxmind"
- 
- # Possible extensions for the library
- MAXMIND_POSSIBLE_EXTENSIONS="so la sl dll dylib"
--- 
-2.30.2
-
diff --git a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
deleted file mode 100644
index 5a5baeacee..0000000000
--- a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From af96f4fe916adc7dc6d649a07c10b45c978d31a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 27 Jul 2022 14:17:20 +0200
-Subject: [PATCH] build/pcre.m4: fix build without pcre
-
-Don't raise an error if pcre is disabled now that pcre2 is supported
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent (no feedback on
-https://github.com/SpiderLabs/ModSecurity/pull/2596)]
----
- build/pcre.m4 | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/build/pcre.m4 b/build/pcre.m4
-index f6c9ae18..3e40f5c9 100644
---- a/build/pcre.m4
-+++ b/build/pcre.m4
-@@ -99,7 +99,6 @@ AC_SUBST(PCRE_LD_PATH)
- 
- if test -z "${PCRE_VERSION}"; then
-     AC_MSG_NOTICE([*** pcre library not found.])
--    ifelse([$2], , AC_MSG_ERROR([pcre library is required]), $2)
- else
-     AC_MSG_NOTICE([using pcre v${PCRE_VERSION}])
-     ifelse([$1], , , $1) 
--- 
-2.35.1
-
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 7ba0ef7f18..c79ae1cf45 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.8/modsecurity-v3.0.8.tar.gz.sha256
-sha256  e241c89b3cd7e58a863d0d0d6b9b8ba4d33ffb0f51171044c258c62e3e7956c7  modsecurity-v3.0.8.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.9/modsecurity-v3.0.9.tar.gz.sha256
+sha256  a5111ecd23e332a1d7c9652dbdb18517a96b21573315cb887a8e86761b95d3d8  modsecurity-v3.0.9.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index e83fda895f..335f3a41e5 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.8
+LIBMODSECURITY_VERSION = 3.0.9
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,7 +12,7 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching build/libmaxmind.m4 and build/pcre.m4
+# We're patching configure.ac
 LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre2
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
