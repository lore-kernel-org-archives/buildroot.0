Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08167C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539AF84114;
	Wed, 29 Mar 2023 20:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 539AF84114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L32UPAKsddbl; Wed, 29 Mar 2023 20:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81824840D5;
	Wed, 29 Mar 2023 20:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81824840D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 640061BF335
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DBC2840D5
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 20:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBC2840D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfxZQWUnjgJ2 for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 20:57:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BFAE840AD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BFAE840AD
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 20:57:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6Udt-1poWjV0iML-006v09 for <buildroot@buildroot.org>; Wed, 29 Mar 2023
 22:57:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 22:56:59 +0200
Message-Id: <20230329205659.6801-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:eOkgY0Su4baPQSr1xKJmLTQUMFAJSai0hpKz3uYtSoMu/jHo313
 69ChP6j/Oy10/SadUAooA/VMIgbgQKHA1Q5BW2asBHpLOL/2Jda9cfxhqhrmKIp9cr7N82b
 aZ/47ZLQYfmycqV2ay5hpnVU5sz9Cog0a0xhajMjHZ0veTU+UjxCJXurD7FkjmnRF2hXR1V
 CYycPvSZPLW72Jw6xFxtg==
UI-OutboundReport: notjunk:1;M01:P0:vWNGbVvlNoQ=;gkQigu6YjiWbOZyFv7Os8lW8eol
 5AnAJVT1ekI55X4h8ycSgRKX+0jUoJZhD1+31nahD7eQdBGIISw1VSHPfxMmb7Ak2inTiJe9c
 WaKK7tz++dAANVaouIp53dHx8AztAY7FRZFS+NBEF25CRJAvnpzArgtdFBqx2xygYIXx27Xwl
 f0WgyiUhKzXNWdTMmeerfg+FhsSNhn82BC/oWLnp8p/yg18AOpglyoliwfA0+dvF/Xa9OEGDX
 7wvVUgU5IoQmaJEUqjASY6TnxF/e9G6R6z8fQC1EAE/HoWSz4RTo/ygCfup/RUuVcn2kKkNef
 yUClFd7tO3t1fbgiUKVuFN4ssLpwldKAmm7B74tnTXjEP8n3MTcmcLuqth3QRcyaCd4OBOgto
 7BIri/D9/6f0mRa6xjJrKLNNpa0jfCGBRfS89yUQ5bgFVd9qH0vchpxHHIqM+lMQd6RUqwkyc
 j/LPyirrGOKUJjZJdcbToNBxWm4TmDNg+kGqhhJBJ5qSZH3szl/Y1fexzs8aOGRpRMXz78b7B
 tFB5gLX9bzZSl0StYG7P9/4EsEtnHWeGRXcqVghsFMrn1eXxQtxH7rS4LP1GkumTfa/FF15Iy
 dybGW4Fv1ZzC/Q6t3iWP/ym9JBtgqjD31muXZez4isPUAMXObCzlhuqogoQwVcUUp3TKA4Mmt
 asUeylzi9a0OfgLuU7tLUBZ51qOI8xnmv2rKt6t9PeunEoKNPFzFQvlBxjBA3nvFRIph23Aol
 nkWi/jcjk6YnOn1BsJWpyyAA8fCK25z3rv0JIi4U47AKmXVIMJoYeOO8+IGIznMT145h5fW7L
 P/YKXbAH5ONmVkcqC4wC5tn5+OPvUdiRhzipI5+K6choZ4r285kDfitlfTFFPmx++ZS7HNGK3
 E2PdwMYZFECiPv8B4G2idTjxYKlynWQPUT4R/P2+fFs0iYH85UaA6qZZtdnkA23hY4S2IRKDD
 cUYEoMPs9FwWdWqD3PCNFXtqvpA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680123420; i=ps.report@gmx.net;
 bh=VdYEXPRnwJQLys7z15LomyUTxYrsTrpoClIOzdFtvEU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Smn7Vb9S+pclg51TRadUBzn1SM3zvIvYcBCjV3u77Fg1rZPJTBDWcelk+ps4s40uc
 HQ+omNWDlmVXF6hfPGUytzDSVdHr9D8kF44ZLb/6G+iNcusO7L1fXIjF2PjhYGgivG
 91Faec4dejHREFwnqp/z8VGUqXyoAZ8XmPdX+vR2HLuRlM5SytmfT2ScFxFQ8nmbCc
 zhkKJ6ZiAzni3wyRdnRqSUK54LikWFg9NeB2OQiCOdkQi9+Iv0NIjcaZHmPx4eLRJi
 EZWWstHg/etHYxoZ63KkS0d3xvhBMGE8qYjq2oLseFy/heQR/HIUgMccKAt5hCt6nw
 INTgYxQx0ctCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Smn7Vb9S
Subject: [Buildroot] [PATCH v1] package/valgrind: bump version to 3.20.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove 0003-coregrind-fix-compilation-for-uclibc.patch
  (from upstream [1]) and drop AUTORECONF

For details see [2].

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3
[2] https://www.valgrind.org/docs/manual/dist.news.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...coregrind-fix-compilation-for-uclibc.patch | 65 -------------------
 package/valgrind/valgrind.hash                |  4 +-
 package/valgrind/valgrind.mk                  |  4 +-
 3 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch

diff --git a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
deleted file mode 100644
index ff8dc974d8..0000000000
--- a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9c9fd9ae24b45f915f0759d32f662835c26d37c3 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Fri, 8 Apr 2022 12:36:33 +0200
-Subject: [PATCH] coregrind: fix compilation for uclibc
-
-It fixes a known iusse whose details are described at [1] and more
-generally it guarantees that Valgrind is properly compiled for ulibc.
-
-[1] https://www.mail-archive.com/valgrind-users@lists.sourceforge.net/msg05295.html
-
-Suggested-by Michael Trimarchi <michael@amarulasolutions.com>
-Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- configure.ac                        | 2 ++
- coregrind/m_debuginfo/minilzo-inl.c | 4 ++++
- coregrind/vg_preloaded.c            | 4 ++++
- 3 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 6f51dfd9f8fb..c627a9c17a4a 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -1204,6 +1204,8 @@ AC_SUBST(DEFAULT_SUPP)
- AC_CHECK_HEADER([features.h])
- 
- if test x$ac_cv_header_features_h = xyes; then
-+  AC_DEFINE([HAVE_HEADER_FEATURES_H], 1,
-+          [Define to 1 if you have the `features.h' header.])
-   rm -f conftest.$ac_ext
-   cat <<_ACEOF >conftest.$ac_ext
- #include <features.h>
-diff --git a/coregrind/m_debuginfo/minilzo-inl.c b/coregrind/m_debuginfo/minilzo-inl.c
-index 153d008fd44f..b45ec92eaa85 100644
---- a/coregrind/m_debuginfo/minilzo-inl.c
-+++ b/coregrind/m_debuginfo/minilzo-inl.c
-@@ -1875,6 +1875,10 @@ extern "C" {
- 
- #endif
- 
-+#ifdef HAVE_HEADER_FEATURES_H
-+#include <features.h>
-+#endif
-+
- #undef LZO_HAVE_CONFIG_H
- #include "minilzo.h"
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 5e2098390847..3809811aede7 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -45,6 +45,10 @@
- #include "pub_core_debuginfo.h"  // Needed for pub_core_redir.h
- #include "pub_core_redir.h"      // For VG_NOTIFY_ON_LOAD
- 
-+#ifdef HAVE_HEADER_FEATURES_H
-+#include <features.h>
-+#endif
-+
- #if defined(VGO_linux) || defined(VGO_solaris) || defined(VGO_freebsd)
- 
- /* ---------------------------------------------------------------------
--- 
-2.32.0
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 8487c07e42..83717f26f3 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  4687a4990585a038c52f842448ef4e63  valgrind-3.19.0.tar.bz2
+md5  e3ca8e03c6c527e80e7da5135a1b6beb  valgrind-3.20.0.tar.bz2
 # locally computed
-sha256  dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02  valgrind-3.19.0.tar.bz2
+sha256  8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6  valgrind-3.20.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 17b131c3ec..98beb7ffef 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.19.0
+VALGRIND_VERSION = 3.20.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
@@ -14,8 +14,6 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
-# 0003-coregrind-fix-compilation-for-uclibc.patch
-VALGRIND_AUTORECONF=YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
