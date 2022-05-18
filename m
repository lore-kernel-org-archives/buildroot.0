Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A05C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 369D661278;
	Wed, 18 May 2022 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dw3i_neRkm_0; Wed, 18 May 2022 21:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC00760ED5;
	Wed, 18 May 2022 21:22:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D63F51BF380
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5003842D2
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFMAjG1xFyJZ for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 21:22:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6F38429E
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:22:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1708559wme.4
 for <buildroot@buildroot.org>; Wed, 18 May 2022 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2xs1Yud3ZbFLv2hREiS5QV7z5s+PMxkTNQc6thS6ck=;
 b=eL5bD6lnPZ2K0jDS5MWs/qMLAbAa1qUhmhPDtw54ddmxPtGa0or/kUXiMJZHBUh5Av
 wc16uAYHmkD+1Q78x+aVtvPJy6ned3frFw9jpJH8WrdEVQjQUmH0ZWnyY0yd8nxFe/xh
 n537ma9/KyWKwB8ofRzM6GLEM4xwYwvnHo3QHbXqdywXvlIG9FKGiOmVB7JzmK1num6U
 +pJQj/6kBq48rgfIn4gYiQNYjysEpJToP0gzRntVBXm5p33xdrVcyG7B1iVoUT1zpOT6
 LxkcCNRa0gtkd7VbWnda1MMwHckq+UOCyYowc3oJPuaKibCMiGVdUldzoWvCEzVpQbR/
 YLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2xs1Yud3ZbFLv2hREiS5QV7z5s+PMxkTNQc6thS6ck=;
 b=fA3Y9x7kZlmQNsXsV+EzFgdUPVTkvNcdwoB6CAV0fo4zFTQRHIUg3ZOwnKBVKDI44I
 NoKrUzeg+sTVqjR5k2PE7bBF3Tg0LK9WMKXlnvFkZJgxSfDU7ZGUQL9xw1PBbIt8H70N
 zG1c2ky+gFTsb/wk6dtLj/4CWNMl1t3ytTlVIcNZHbLeYS1gaJvV87Iv9Y6fsEPBDKh+
 wGpeA14G8ah7ku4/a6QHWouatCgDGpkLl3pi4vgHZe6MCWaIXUyP9QErpDeaUyTfOhQb
 8AdS5hALeNn2n7xpxcXSBvH8gJzCsbV4YK1P8/dYfmaITZpOAl3LBGCJZc8f2mgyjQ4h
 rLUQ==
X-Gm-Message-State: AOAM531F4dDtGGITlnry68PS7D43fyAuuh7l3DIMrPsltvko1CC2c8Kj
 ZSvswiSHCtEvwrBEidQK5UlTQlUPmhs=
X-Google-Smtp-Source: ABdhPJynbPEmwDUrBrtpZWB4NatwIONSxHH9yCPZMkRQy/NsheND+J5/4ReYDYlX0LX48h27tHuXQA==
X-Received: by 2002:a05:600c:1d84:b0:397:2c72:8c44 with SMTP id
 p4-20020a05600c1d8400b003972c728c44mr1066916wms.50.1652908954105; 
 Wed, 18 May 2022 14:22:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfbb42000000b0020e68218048sm192912wrg.93.2022.05.18.14.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 14:22:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 23:20:15 +0200
Message-Id: <20220518212015.439865-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: security bump to version
 2.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-29338: Integer Overflow in OpenJPEG v2.4.0 allows remote
attackers to crash the application, causing a Denial of Service (DoS).
This occurs when the attacker uses the command line option "-ImgDir" on
a directory that contains 1048576 files.

Fix CVE-2022-1122: A flaw was found in the opj2_decompress program in
openjpeg2 2.4.0 in the way it handles an input directory with a large
number of files. When it fails to allocate a buffer to store the
filenames of the input directory, it calls free() on an uninitialized
pointer, leading to a segmentation fault and a denial of service.

Drop patches (already in version)

https://github.com/uclouvain/openjpeg/blob/v2.5.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...append-flags-found-by-pkg-config-if-.patch | 72 -------------------
 ...-append-flags-found-by-pkg-config-if.patch | 49 -------------
 ...Lists.txt-Don-t-require-a-C-compiler.patch | 34 ---------
 ...IR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch | 37 ----------
 package/openjpeg/openjpeg.hash                |  2 +-
 package/openjpeg/openjpeg.mk                  |  2 +-
 6 files changed, 2 insertions(+), 194 deletions(-)
 delete mode 100644 package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
 delete mode 100644 package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
 delete mode 100644 package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
 delete mode 100644 package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch

diff --git a/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch b/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
deleted file mode 100644
index bce790a478..0000000000
--- a/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 38f50c7d9ad3ba06b64583045665203afb53cbd9 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 6 Nov 2016 16:29:08 +0100
-Subject: [PATCH] thirdparty: tiff: append flags found by pkg-config if
- available
-
-This change allows to get all required CFLAGS/LDFLAGS in case of static only
-build.
-
-This build issue [1] was triggered by the Buildroot farms.
-
-[1] http://autobuild.buildroot.net/results/d0d/d0d22727311d6300e0e400728126170407bfd699/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- thirdparty/CMakeLists.txt | 23 +++++++++++++++++++++--
- 1 file changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
-index cb24b43b58e2..cd6a5e1391b0 100644
---- a/thirdparty/CMakeLists.txt
-+++ b/thirdparty/CMakeLists.txt
-@@ -1,5 +1,9 @@
- # 3rd party libs
- 
-+if(NOT BUILD_THIRDPARTY)
-+  include(FindPkgConfig)
-+endif(NOT BUILD_THIRDPARTY)
-+
- #------------
- # Try to find lib Z
- if(BUILD_THIRDPARTY)
-@@ -36,6 +40,9 @@ if(BUILD_THIRDPARTY)
- else(BUILD_THIRDPARTY)
-   if(ZLIB_FOUND)
-     find_package(PNG)
-+    # Static only build:
-+    #   it is not necessary to invoke pkg_check_module on libpng, because libpng
-+    #   only depends on zlib, which is already checked.
-     if(PNG_FOUND)
-       message(STATUS "Your system seems to have a PNG lib available, we will use it")
-       set(OPJ_HAVE_PNG_H 1 PARENT_SCOPE)
-@@ -66,12 +73,24 @@ if(BUILD_THIRDPARTY)
-   set(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
- else(BUILD_THIRDPARTY)
-   find_package(TIFF)
-+  # Static only build:
-+  #   it is necessary to invoke pkg_check_module on libtiff since it may have
-+  #   several other dependencies not declared by its cmake module, but they are
-+  #   in the its pkgconfig module.
-+  if(PKG_CONFIG_FOUND)
-+    foreach(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)
-+      pkg_check_modules(PC_TIFF QUIET ${pc_tiff_module})
-+      if(PC_TIFF_FOUND)
-+        break()
-+      endif(PC_TIFF_FOUND)
-+    endforeach()
-+  endif(PKG_CONFIG_FOUND)
-   if(TIFF_FOUND)
-     message(STATUS "Your system seems to have a TIFF lib available, we will use it")
-     set(OPJ_HAVE_TIFF_H 1 PARENT_SCOPE)
-     set(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
--    set(TIFF_LIBNAME ${TIFF_LIBRARIES} PARENT_SCOPE)
--    set(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} PARENT_SCOPE)
-+    set(TIFF_LIBNAME ${TIFF_LIBRARIES} ${PC_TIFF_STATIC_LIBRARIES} PARENT_SCOPE)
-+    set(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} ${PC_TIFF_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
-   else(TIFF_FOUND) # not found
-     set(OPJ_HAVE_TIFF_H 0 PARENT_SCOPE)
-     set(OPJ_HAVE_LIBTIFF 0 PARENT_SCOPE)
--- 
-2.10.2
-
diff --git a/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch b/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
deleted file mode 100644
index 5697b82de2..0000000000
--- a/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 226daa77ea5a35da306f9af2548f3e2c9e79f577 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 11 Nov 2016 23:35:13 +0100
-Subject: [PATCH] thirdparty: lcms2: append flags found by pkg-config if
- available
-
-This change allows to get all required CFLAGS/LDFLAGS in case of static only
-build.
-
-Fixes a buildroot build failure (see [1], [2] and [3]).
-
-[1] http://autobuild.buildroot.net/results/5ce/5cee20afd8bef5268832cddcb3a5270746be7a57
-[2] http://lists.busybox.net/pipermail/buildroot/2016-November/177187.html
-[3] http://lists.busybox.net/pipermail/buildroot/2016-November/177188.html
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- thirdparty/CMakeLists.txt | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
-index cd6a5e1391b0..a3a8494d89b1 100644
---- a/thirdparty/CMakeLists.txt
-+++ b/thirdparty/CMakeLists.txt
-@@ -113,12 +113,19 @@ if( BUILD_THIRDPARTY)
-   set(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
- else(BUILD_THIRDPARTY)
-   find_package(LCMS2)
-+  # Static only build:
-+  #   it is necessary to invoke pkg_check_module on lcms2 since it may have
-+  #   several other dependencies not declared by its cmake module, but they are
-+  #   in the its pkgconfig module.
-+  if(PKG_CONFIG_FOUND)
-+    pkg_check_modules(PC_LCMS2 QUIET lcms2)
-+  endif(PKG_CONFIG_FOUND)
-   if(LCMS2_FOUND)
-     message(STATUS "Your system seems to have a LCMS2 lib available, we will use it")
-     set(OPJ_HAVE_LCMS2_H 1 PARENT_SCOPE)
-     set(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
--    set(LCMS_LIBNAME ${LCMS2_LIBRARIES} PARENT_SCOPE)
--    set(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} PARENT_SCOPE)
-+    set(LCMS_LIBNAME ${LCMS2_LIBRARIES} ${PC_LCMS2_STATIC_LIBRARIES} PARENT_SCOPE)
-+    set(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} ${PC_LCMS2_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
-   else(LCMS2_FOUND) # not found lcms2
-     # try to find LCMS
-     find_package(LCMS)
--- 
-2.10.2
-
diff --git a/package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch b/package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
deleted file mode 100644
index 13cceef195..0000000000
--- a/package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 786ddcd1475adc6193c59d53e0d8ed2c502f2b00 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 23 Sep 2017 18:49:31 +0200
-Subject: [PATCH] CMakeLists.txt: Don't require a C++ compiler
-
-By default, CMake assumes that the project is using both C and C++.  By
-explicitly passing 'C' as argument of the project() macro, we tell CMake
-that only C is used, which prevents CMake from erroring out if a C++
-compiler doesn't exist.
-
-Submitted upstream:
-https://github.com/uclouvain/openjpeg/pull/1027
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ec42bc99..d80eb48b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -24,7 +24,7 @@ endif()
- #string(TOLOWER ${OPENJPEG_NAMESPACE} OPENJPEG_LIBRARY_NAME)
- set(OPENJPEG_LIBRARY_NAME openjp2)
- 
--project(${OPENJPEG_NAMESPACE})
-+project(${OPENJPEG_NAMESPACE} C)
- 
- # Do full dependency headers.
- include_regular_expression("^.*$")
--- 
-2.11.0
-
diff --git a/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch b/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch
deleted file mode 100644
index b85556a679..0000000000
--- a/package/openjpeg/0004-Revert-Use-INC_DIR-for-OPENJPEG_INCLUDE_DIRS-fixes-u.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 14f4c27e7c91f745a1dda9991b5deea3cbef2072 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 7 Jan 2021 14:09:50 +0100
-Subject: [PATCH] Revert "Use INC_DIR for OPENJPEG_INCLUDE_DIRS (fixes
- uclouvain#1174)"
-
-This reverts commit 65586374d639cfc0104419992f9022174b412594 which
-breaks cross-compilation of poppler under buildroot (because of
-DESTDIR usage).
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/uclouvain/openjpeg/pull/1321]
----
- cmake/OpenJPEGConfig.cmake.in | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
-index 8a726697..2925108a 100644
---- a/cmake/OpenJPEGConfig.cmake.in
-+++ b/cmake/OpenJPEGConfig.cmake.in
-@@ -27,8 +27,12 @@ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
-   # This is an install tree
-   include(${SELF_DIR}/OpenJPEGTargets.cmake)
- 
-+  # We find a relative path from the PKG directory to header files.
-+  set(PKG_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_PACKAGE_DIR@")
-   set(INC_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_INCLUDE_DIR@")
--  get_filename_component(OPENJPEG_INCLUDE_DIRS "${INC_DIR}" ABSOLUTE)
-+  file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")
-+
-+  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_INC_RPATH}" ABSOLUTE)
- 
- else()
-   if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
--- 
-2.29.2
-
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 8798245256..cfa0e01b7d 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8702ba68b442657f11aaeb2b338443ca8d5fb95b0d845757968a7be31ef7f16d  openjpeg-2.4.0.tar.gz
+sha256  0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a  openjpeg-2.5.0.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index b5d433df32..600ac1e155 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.4.0
+OPENJPEG_VERSION = 2.5.0
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
