Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AB9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50FBA40373;
	Thu, 30 Dec 2021 23:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZu06d_cNbv1; Thu, 30 Dec 2021 23:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 284D840438;
	Thu, 30 Dec 2021 23:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC4231BF35B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACFD404A6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-TiykSquJpj for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AE5C40495
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 23:40:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t26so53106367wrb.4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u85rhX67Pjhut+Wt1p6XpbP2lHe7a29VXBp+S3PA7/s=;
 b=GXzHFMVNJpflz9ODOgtktNKrRggOhDNbbjvOEiV1y2xkWmI3mIDWjaGz3z0La1irxZ
 AvyKuWiuI7dOUnWNlaBtUCxs83WFLq2txEvI0IMpaWsse/6/HC2MEP6Bmjtll+0eNO5b
 aZ21RFBN1XbnxFCU7i2v43OOWKbsz1WTGlZA8/eox0tDGFIblnF8RvXwyCtsk/W+Zk0e
 iitTzVQbXzluk08t6/SK65yPfZW1FR6DSL3OmOiW5Ys21NkE+g9aq+l2MBzAg7L9046o
 Sxo/KLB9TWkkGWOjoSiwkIKVSmlf2emSunaNEKYMvmwIroRSp419uzehmiIBMN2B9GGU
 wbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u85rhX67Pjhut+Wt1p6XpbP2lHe7a29VXBp+S3PA7/s=;
 b=Y2niMUcD6ri7y0cjL4ncVLlFWDJdgKiUrvO+JvOjsHNHRSifdgEEbyAoBEyaZLzME/
 DmrLvSACxraLE22ZFXQDPV8O1j1w3LpXb/p+KqrCVhpNBZbQphR6KhPl2CdCNxhskwGT
 YcQ/q9CLPOogNI5DGBpA3r22Xf5H4y9+sUqGHYMGCqTmpRiyU2wqUBA9pRPv+vvV6kq2
 xoFpUR1ye6PCvCJ9SbudPnS0fPU8oSN7juPA9kXuEH2RsV/GezesT0Q8dA66ZtWtAWeR
 xX7fslCPuyD+rO+ePaYSsnuQIf42b+CaELdkm3TvEAs/BJMbFHYjUg01IW2rdWwjnO8q
 qrEg==
X-Gm-Message-State: AOAM5303ZESuxVGA0OkjgRvfsN85Bs1G98rCXBohdJL2WKCA+T0i+bXu
 83nMi1jSg41z+GU3Pee0/MaL2ki5Yqk=
X-Google-Smtp-Source: ABdhPJxAllJusfrxgRSvAhzcwsXL82eJbNWWNlboF8lEUWJQAYR+4UuYc3xE7kbgiTvNAmLt7chKww==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr26530751wri.155.1640907621754; 
 Thu, 30 Dec 2021 15:40:21 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id bg19sm3645662wmb.47.2021.12.30.15.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:40:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 00:39:20 +0100
Message-Id: <20211230233920.3207191-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libzip: bump to version 1.8.0
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Add zstd optional dependency

https://libzip.org/news/release-1.8.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Add-FindGnuTLS-cmake-from-3-17-3.patch | 103 ------------------
 .../0002-Include-limits.h-for-INT_MAX.patch   |  27 -----
 package/libzip/libzip.hash                    |   2 +-
 package/libzip/libzip.mk                      |   9 +-
 4 files changed, 9 insertions(+), 132 deletions(-)
 delete mode 100644 package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
 delete mode 100644 package/libzip/0002-Include-limits.h-for-INT_MAX.patch

diff --git a/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch b/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
deleted file mode 100644
index 30bc201048..0000000000
--- a/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 73f6f8ebff678a0847e6b197b574082cc285b528 Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <tk@giga.or.at>
-Date: Sat, 25 Jul 2020 12:03:29 +0200
-Subject: [PATCH] Add FindGnuTLS.cmake from 3.17.3.
-
-Addresses #199
-
-[Retrieved from:
-https://github.com/nih-at/libzip/commit/73f6f8ebff678a0847e6b197b574082cc285b528]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cmake-compat/FindGnuTLS.cmake | 82 +++++++++++++++++++++++++++++++++++
- 1 file changed, 82 insertions(+)
- create mode 100644 cmake-compat/FindGnuTLS.cmake
-
-diff --git a/cmake-compat/FindGnuTLS.cmake b/cmake-compat/FindGnuTLS.cmake
-new file mode 100644
-index 00000000..819f0001
---- /dev/null
-+++ b/cmake-compat/FindGnuTLS.cmake
-@@ -0,0 +1,82 @@
-+# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
-+# file Copyright.txt or https://cmake.org/licensing for details.
-+
-+#[=======================================================================[.rst:
-+FindGnuTLS
-+----------
-+
-+Find the GNU Transport Layer Security library (gnutls)
-+
-+IMPORTED Targets
-+^^^^^^^^^^^^^^^^
-+
-+This module defines :prop_tgt:`IMPORTED` target ``GnuTLS::GnuTLS``, if
-+gnutls has been found.
-+
-+Result Variables
-+^^^^^^^^^^^^^^^^
-+
-+``GNUTLS_FOUND``
-+  System has gnutls
-+``GNUTLS_INCLUDE_DIR``
-+  The gnutls include directory
-+``GNUTLS_LIBRARIES``
-+  The libraries needed to use gnutls
-+``GNUTLS_DEFINITIONS``
-+  Compiler switches required for using gnutls
-+``GNUTLS_VERSION``
-+  version of gnutls.
-+#]=======================================================================]
-+
-+# Note that this doesn't try to find the gnutls-extra package.
-+
-+
-+if (GNUTLS_INCLUDE_DIR AND GNUTLS_LIBRARY)
-+  # in cache already
-+  set(gnutls_FIND_QUIETLY TRUE)
-+endif ()
-+
-+if (NOT WIN32)
-+  # try using pkg-config to get the directories and then use these values
-+  # in the find_path() and find_library() calls
-+  # also fills in GNUTLS_DEFINITIONS, although that isn't normally useful
-+  find_package(PkgConfig QUIET)
-+  PKG_CHECK_MODULES(PC_GNUTLS QUIET gnutls)
-+  set(GNUTLS_DEFINITIONS ${PC_GNUTLS_CFLAGS_OTHER})
-+  set(GNUTLS_VERSION ${PC_GNUTLS_VERSION})
-+  # keep for backward compatibility
-+  set(GNUTLS_VERSION_STRING ${PC_GNUTLS_VERSION})
-+endif ()
-+
-+find_path(GNUTLS_INCLUDE_DIR gnutls/gnutls.h
-+  HINTS
-+    ${PC_GNUTLS_INCLUDEDIR}
-+    ${PC_GNUTLS_INCLUDE_DIRS}
-+  )
-+
-+find_library(GNUTLS_LIBRARY NAMES gnutls libgnutls
-+  HINTS
-+    ${PC_GNUTLS_LIBDIR}
-+    ${PC_GNUTLS_LIBRARY_DIRS}
-+  )
-+
-+mark_as_advanced(GNUTLS_INCLUDE_DIR GNUTLS_LIBRARY)
-+
-+include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
-+FIND_PACKAGE_HANDLE_STANDARD_ARGS(GnuTLS
-+                                  REQUIRED_VARS GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR
-+                                  VERSION_VAR GNUTLS_VERSION_STRING)
-+
-+if(GNUTLS_FOUND)
-+  set(GNUTLS_LIBRARIES    ${GNUTLS_LIBRARY})
-+  set(GNUTLS_INCLUDE_DIRS ${GNUTLS_INCLUDE_DIR})
-+
-+  if(NOT TARGET GnuTLS::GnuTLS)
-+    add_library(GnuTLS::GnuTLS UNKNOWN IMPORTED)
-+    set_target_properties(GnuTLS::GnuTLS PROPERTIES
-+      INTERFACE_INCLUDE_DIRECTORIES "${GNUTLS_INCLUDE_DIRS}"
-+      INTERFACE_COMPILE_DEFINITIONS "${GNUTLS_DEFINITIONS}"
-+      IMPORTED_LINK_INTERFACE_LANGUAGES "C"
-+      IMPORTED_LOCATION "${GNUTLS_LIBRARIES}")
-+  endif()
-+endif()
diff --git a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
deleted file mode 100644
index c488f05289..0000000000
--- a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From fd89e242d16128dedef08f47d99ae56aa19b0591 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=98rjan=20Malde?= <red@foxi.me>
-Date: Wed, 15 Jul 2020 12:16:16 +0200
-Subject: [PATCH] Include limits.h for INT_MAX
-
-[Retrieved from:
-https://github.com/nih-at/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591]
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
----
- lib/zip_crypto_openssl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/zip_crypto_openssl.c b/lib/zip_crypto_openssl.c
-index 1cb00479..60f92758 100644
---- a/lib/zip_crypto_openssl.c
-+++ b/lib/zip_crypto_openssl.c
-@@ -38,6 +38,7 @@
- #include "zip_crypto.h"
- 
- #include <openssl/rand.h>
-+#include <limits.h>
- 
- #if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
- #define USE_OPENSSL_1_0_API
--- 
-2.28.0
-
diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index a298b9aba9..5afdfd7cb8 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a60473ffdb7b4260c08bfa19c2ccea0438edac11193c3afbbb1f17fbcf6c6132  libzip-1.7.3.tar.xz
+sha256  f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e  libzip-1.8.0.tar.xz
 sha256  deae392de70503672793ee784d603bfa8069dcd5974a325dfbf91160f3a147d6  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 4a028f970a..6bc5c5c193 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.7.3
+LIBZIP_VERSION = 1.8.0
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
@@ -54,5 +54,12 @@ else
 LIBZIP_CONF_OPTS += -DENABLE_LZMA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBZIP_DEPENDENCIES += zstd
+LIBZIP_CONF_OPTS += -DENABLE_ZSTD=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_ZSTD=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
