Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF3FC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C410D8400D;
	Sat,  6 Jan 2024 09:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C410D8400D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fac0Ycl7gRHT; Sat,  6 Jan 2024 09:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E585383FFC;
	Sat,  6 Jan 2024 09:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E585383FFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E92141BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC285405A7
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC285405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1cx_KSdiTT4 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:11:55 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EC6D40139
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC6D40139
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3367a304091so280278f8f.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 01:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704532312; x=1705137112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oANgi6HsVKFicMegq4xlwLmmed8+KTXsU1UvaDgmahw=;
 b=RSzimf1Hm4dHrjAtrMy3iMvXAoQNIgpC6GiEFhng5Ij2CLVOITHedLfbklkS3A1csR
 +cBubClXaMDyiw9oBKYppTAK1NV8Y8+fVcO2lseYy3j4fNjcJdaS93RK4qkV2rsivnAn
 4xufiJ+wlwvYNtw4fiFUzxJ9vX++g+nHDhifiK56UGwH7euwXwKHmxTVqL14osIYNcq+
 CdfB0ZXhbNH2KQW0Xy9ivBqRMQUf/SfwAJ/R2PC6OHZmfg9r+8hU7qPQKJPGxUWBoPSo
 XhjoK+IvRLkGisQaYyB92VUM9fnUMvsuNf1S/TdnRdz5uTiFwLd1jSNC9Zo0SjeNZfgD
 m7hA==
X-Gm-Message-State: AOJu0Yx1SS5fgmbelEL8YL25dJnCGhIzKwc52RiEnxQ10uuNEii1Kgln
 YR1BjymlmgkNJFWgKU5bUy/3B3kBbuE=
X-Google-Smtp-Source: AGHT+IFKS7DgmE9gHa/hTRLjjYmPOcmPrUAFU3X7hJsuxob0I6SXYBUt6ck0wjyhOULaQR1zcxQiQg==
X-Received: by 2002:adf:fed0:0:b0:337:39c7:2b4 with SMTP id
 q16-20020adffed0000000b0033739c702b4mr244728wrs.90.1704532311869; 
 Sat, 06 Jan 2024 01:11:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfefce000000b00336e69fbc32sm2956312wrp.102.2024.01.06.01.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 01:11:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 10:11:49 +0100
Message-ID: <20240106091149.57205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704532312; x=1705137112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oANgi6HsVKFicMegq4xlwLmmed8+KTXsU1UvaDgmahw=;
 b=AREyBEQJevv+1r5gZo+Rxg/CHm2Bsyc5u4rKZCtj0tRhcbM3pLnibapzaVwsEtDHPW
 2gbjjzRPvobECmwG5f0NpXEyOitGAK2hkBkRRbrllcCbM1+X3ckZUoPYET/JPDvoAmdU
 G+CHetXiDinaxb+yrIZC3OUNaq32aV2MJW1baEP3Xfe7aNnJXna3b0c03gYq5J0BRbw0
 ZHiPJaOffPoicX6G31H2qVjoc6gKNfCjz2aGaXEO39QQBgRKVMBdzevfBU+C7LpcR9iX
 0XJ9nOOuGmiaE7RJGGMCyiB7IiAeKd56yyUDU+Zls1LZpOMRUSUMX1Hwnk6fu0+oPPke
 POlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AREyBEQJ
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix uclibc build with
 libiconv (again)
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 wrongly removed patch
added by commit 1e8cce6f2b1936dbda9d63ddf4f41acf59a64113, advocating
that upstream applied a different "solution", this "solution" was
already tested on buildroot with commit
9525bc7e64e8f44c31ab9dfd3f516ecb35982429 and is utterly broken as stated
in:
https://github.com/libarchive/libarchive/pull/1825#issuecomment-1403537856
https://github.com/libarchive/libarchive/pull/1825#issuecomment-1437451472
https://github.com/libarchive/libarchive/issues/1819#issuecomment-1439962521
https://github.com/libarchive/libarchive/issues/1841#issuecomment-1426628554
https://github.com/libarchive/libarchive/pull/1813#issuecomment-1396373372

As a result, build failures are again raised by uclibc-ng with libiconv
on fwup/gvfs/...:

configure: error: Requires libarchive. Libarchive must be built with zlib support.

[...]

Run-time dependency libarchive found: NO (tried cmake)

../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency lookup for libarchive with method 'pkgconfig' failed: Could not generate cargs for libarchive:
Package iconv was not found in the pkg-config search path.
Perhaps you should add the directory containing `iconv.pc'
to the PKG_CONFIG_PATH environment variable
Package 'iconv', required by 'libarchive', not found

So revert the upstream "solution", put back previous patch and let's
hope that upstream improve their skills in pkg-config and static
building but they probably don't really care about it...

Fixes:
 - http://autobuild.buildroot.org/results/0f5058634ecc2ffae3993f6f4513d8ce75e6c02f
 - http://autobuild.buildroot.org/results/20fc291ef7e37ee8bd553976cbe841e53345680b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...iconv-to-the-.pc-file-if-needed-1825.patch | 31 +++++++++++++++++++
 ...o-not-add-iconv-for-Requires.private.patch | 27 ++++++++++++++++
 package/libarchive/libarchive.mk              |  4 +++
 3 files changed, 62 insertions(+)
 create mode 100644 package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
 create mode 100644 package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
new file mode 100644
index 0000000000..a4dd7dad5c
--- /dev/null
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -0,0 +1,31 @@
+From 3879afd473a256173cc626e16293f3fe8875f2d6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 09:53:23 +0100
+Subject: [PATCH] Revert "Only add "iconv" to the .pc file if needed (#1825)"
+
+This reverts commit 1f35c466aaa9444335a1b854b0b7223b0d2346c2.
+
+Upstream: no dedicated PR for this revert but there is already plenty of PRs/issues to fix iconv build ...
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 93f7af94..204a4e69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -434,9 +434,7 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    if test -n "$LIBICONV"; then
+-      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+-    fi
++    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
+-- 
+2.43.0
+
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
new file mode 100644
index 0000000000..338dad46e0
--- /dev/null
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -0,0 +1,27 @@
+From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 14 Dec 2022 09:04:39 +0100
+Subject: [PATCH] autotools: do not add iconv for Requires.private
+
+There is no pkgconfig file for iconv, thus things break with this
+change. Let's drop iconv from Requires.private.
+
+Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
+Upstream: https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99bff20d1..f245d0c55 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -378,7 +378,6 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 7e364e3902..ca16559ad8 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -11,6 +11,10 @@ LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
+# We're patching configure.ac
+LIBARCHIVE_AUTORECONF = YES
+# needed for autoreconf
+LIBARCHIVE_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
