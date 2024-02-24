Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94854C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 22:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3292A400F1;
	Sat, 24 Feb 2024 22:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 779-idQuYZUT; Sat, 24 Feb 2024 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12EA404C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B12EA404C3;
	Sat, 24 Feb 2024 22:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B62FA1BF681
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A26C9404C3
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 22:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqhL4mdqPiLC for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 22:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3AC6400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3AC6400F1
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3AC6400F1
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 22:06:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d0a7f2424so1137060f8f.0
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 14:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708812399; x=1709417199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DzVJvuYVHvd3JnjD1Tt+VoVoPZfjQDl0Q1lkmjNuYk=;
 b=kRmg8WaKNIGWy7VmtS9Ul84h293Pim/fLA8ozBv9Ln7RDv6cHwAMdf5PQo223khtcZ
 F5PXPn1/dGo/Z5MMt/vsZeny3MGmBZ/9zqit7rczc9gisftX2rmgCu8YRwZfuh4Ipb2X
 f01Mh21vVM6xrH4h44pjne1SbkJ5WpdEMEw/iLV7fQSlMugsdITW0/pPWmnnHJEuE9z5
 aY2SFNCMusfdIv92Auu5u7Qu4GitwfbsXmqygjtvKypqrPo6QcewPH+sjMpjkxONQPGK
 2JOETNoKLnrTK4Zpf8ARlJO0psIeG6bPqEs+p24qpRQJXIhybXb6S2+dQh2aTJJHWAtL
 IXMQ==
X-Gm-Message-State: AOJu0Yx9546y/CKw4aGy/SmJt6tP4oKQErSwZNchpjBgB8ZLct0XmC/H
 mx6pwCgV9/rYJCPQ0IdBLFfG88A7izaSyiyrTelfQPCgxd/HVRPtlWCqKiRP
X-Google-Smtp-Source: AGHT+IH7YGHHq0D8r8lMZKfd0DdWR3FvqoVtqAtbndGs2plyC5MZ0vgyNB0xMquUfMfOAPVhcctVBA==
X-Received: by 2002:a5d:414c:0:b0:33d:873a:616 with SMTP id
 c12-20020a5d414c000000b0033d873a0616mr2162495wrq.64.1708812398875; 
 Sat, 24 Feb 2024 14:06:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d59c6000000b0033b47ee01f1sm3377906wry.49.2024.02.24.14.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 14:06:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 23:06:36 +0100
Message-ID: <20240224220636.742198-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708812399; x=1709417199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4DzVJvuYVHvd3JnjD1Tt+VoVoPZfjQDl0Q1lkmjNuYk=;
 b=lGq1REELBb0MRF371Wd9Ziq3D1eINWsCyDHC/EI2zmCGS/ksjYcWx5JCxZ60kCa8Nd
 ADVU67D8OXC6EkIjD555Q5R1lxvwenUMmNg4v987tlGCfh2fgtJoXJ+pd/02GPF3GqVw
 w30AaE+4lTlFPcY3YhxqClCa8cg5T5D7wj2SyJEdFPGhu3dkmR8eh0dyU+t5Gcs5Pd+k
 A1W9I//2+73AKcsu9VMoESpOFKlXq4EpioDmG+/S8Y+bK1iIXbTGcF7IsQ7MwSCGp6Ke
 ID5r+TgTW/ITI/g5lOOorcXcTKjorEUJZUFIM98PlUnS9qztlo0KjhA9eP/TeGxi3J1R
 tyXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lGq1REEL
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix libpsl static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with libpsl raised since bump to
version 8.6.0 in commit 5cee6b6be6524e443012d130e09b0e6983b0ff90:

configure:28830: /home/autobuild/autobuild/instance-6/output-1/host/bin/aarch64_be-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -g0 -static -Werror-implicit-function-declaration -Wno-system-headers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -I/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include  -static -L/home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib  -L/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/lib conftest.c -lpsl  -lmbedtls -lmbedx509 -lmbedcrypto -lz  -latomic >&5
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/aarch64_be-buildroot-linux-musl/11.4.0/../../../../aarch64_be-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib/libpsl.a(psl.c.o): in function `is_public_suffix':
psl.c:(.text+0x2a8): undefined reference to `idn2_lookup_u8'

[...]

checking for library containing psl_builtin... no
configure: error: libpsl was not found

Fixes: 5cee6b6be6524e443012d130e09b0e6983b0ff90
 - http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-find-libpsl-with-pkg-config.patch | 109 ++++++++++++++++++
 package/libcurl/libcurl.mk                    |   2 +
 2 files changed, 111 insertions(+)
 create mode 100644 package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch

diff --git a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
new file mode 100644
index 0000000000..46df1e36a2
--- /dev/null
+++ b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
@@ -0,0 +1,109 @@
+From 9b3f67e267d1fa8d7867655d133bdbf8830a0ab3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Feb 2024 20:59:25 +0100
+Subject: [PATCH] configure.ac: find libpsl with pkg-config
+
+Find libpsl with pkg-config to avoid static build failures.
+
+Ref: http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Closes #12947
+
+Upstream: https://github.com/curl/curl/commit/9b3f67e267d1fa8d7867655d133bdbf8830a0ab3
+---
+ configure.ac | 79 ++++++++++++++++++++++++++++++++++++++++++++--------
+ docs/TODO    |  7 -----
+ 2 files changed, 67 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cd0e2d07d8d164..09d5364f4de575 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2075,19 +2075,74 @@ dnl **********************************************************************
+ dnl Check for libpsl
+ dnl **********************************************************************
+ 
+-AC_ARG_WITH(libpsl,
+-           AS_HELP_STRING([--without-libpsl],
+-           [disable support for libpsl]),
+-           with_libpsl=$withval,
+-           with_libpsl=yes)
+-curl_psl_msg="no      (libpsl disabled)"
+-if test $with_libpsl != "no"; then
+-  AC_SEARCH_LIBS(psl_builtin, psl,
+-    [curl_psl_msg="enabled";
+-     AC_DEFINE([USE_LIBPSL], [1], [PSL support enabled])
+-     ],
+-    [AC_MSG_ERROR([libpsl was not found]) ]
++dnl Default to compiler & linker defaults for LIBPSL files & libraries.
++OPT_LIBPSL=off
++AC_ARG_WITH(libpsl,dnl
++AS_HELP_STRING([--with-libpsl=PATH],[Where to look for libpsl, PATH points to the LIBPSL installation; when possible, set the PKG_CONFIG_PATH environment variable instead of using this option])
++AS_HELP_STRING([--without-libpsl], [disable LIBPSL]),
++  OPT_LIBPSL=$withval)
++
++if test X"$OPT_LIBPSL" != Xno; then
++  dnl backup the pre-libpsl variables
++  CLEANLDFLAGS="$LDFLAGS"
++  CLEANCPPFLAGS="$CPPFLAGS"
++  CLEANLIBS="$LIBS"
++
++  case "$OPT_LIBPSL" in
++  yes)
++    dnl --with-libpsl (without path) used
++    CURL_CHECK_PKGCONFIG(libpsl)
++
++    if test "$PKGCONFIG" != "no" ; then
++      LIB_PSL=`$PKGCONFIG --libs-only-l libpsl`
++      LD_PSL=`$PKGCONFIG --libs-only-L libpsl`
++      CPP_PSL=`$PKGCONFIG --cflags-only-I libpsl`
++    else
++      dnl no libpsl pkg-config found
++      LIB_PSL="-lpsl"
++    fi
++
++    ;;
++  off)
++    dnl no --with-libpsl option given, just check default places
++    LIB_PSL="-lpsl"
++    ;;
++  *)
++    dnl use the given --with-libpsl spot
++    LIB_PSL="-lpsl"
++    PREFIX_PSL=$OPT_LIBPSL
++    ;;
++  esac
++
++  dnl if given with a prefix, we set -L and -I based on that
++  if test -n "$PREFIX_PSL"; then
++    LD_PSL=-L${PREFIX_PSL}/lib$libsuff
++    CPP_PSL=-I${PREFIX_PSL}/include
++  fi
++
++  LDFLAGS="$LDFLAGS $LD_PSL"
++  CPPFLAGS="$CPPFLAGS $CPP_PSL"
++  LIBS="$LIB_PSL $LIBS"
++
++  AC_CHECK_LIB(psl, psl_builtin,
++    [
++     AC_CHECK_HEADERS(libpsl.h,
++        curl_psl_msg="enabled"
++        LIBPSL_ENABLED=1
++        AC_DEFINE(USE_LIBPSL, 1, [if libpsl is in use])
++        AC_SUBST(USE_LIBPSL, [1])
++     )
++    ],
++      dnl not found, revert back to clean variables
++      LDFLAGS=$CLEANLDFLAGS
++      CPPFLAGS=$CLEANCPPFLAGS
++      LIBS=$CLEANLIBS
+   )
++
++  if test X"$OPT_LIBPSL" != Xoff &&
++     test "$LIBPSL_ENABLED" != "1"; then
++    AC_MSG_ERROR([libpsl libs and/or directories were not found where specified!])
++  fi
+ fi
+ AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" = "enabled"])
+ 
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9dafe90c82..4281cfabb1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,6 +14,8 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
+# 0001-configure.ac-find-libpsl-with-pkg-config.patch
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
