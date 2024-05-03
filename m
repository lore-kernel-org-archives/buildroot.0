Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3BDC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 19:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1BE607B9;
	Fri,  3 May 2024 19:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF5VpBYxY4tZ; Fri,  3 May 2024 19:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A69C60824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A69C60824;
	Fri,  3 May 2024 19:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE5CC1BF41B
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C659A83BC4
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wScd2pA17OKd for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 19:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CC7A83BC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC7A83BC0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CC7A83BC0
 for <buildroot@buildroot.org>; Fri,  3 May 2024 19:53:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso829105e9.2
 for <buildroot@buildroot.org>; Fri, 03 May 2024 12:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714765987; x=1715370787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbcentWWq543elPtFZtJ1asxK1+kiC0lpYxsFHOSmEg=;
 b=UBkCF0M7EO+RP+P5jvmAKk8dZ+358T3jJa6e0mrc9mKoJ5VOtZ7aF2lzal7tfIZ5DB
 bFKzLSXqceD5RqgDDUDDuX/2Ek6wO/qqn0V0Nq/fdjucjla1XzK+/YA7TtRvPPe8xB1k
 0uw/7INDNyIqYgG9zCWyjw6NzLCuX3BonbAEQ/GdjCnAjtGyNSYF5e+PQrEANt9EEKnx
 V3kZZO4N5vneboR4jUu+f6ZQochDekBfZnn7UOgTwuoBIXT88wI3uVMs64Sah+7zYAXp
 yFdl85Vd3pUQVYHyFNxg8wvaX3yRr6cUF/gBpLLBBOZ/tf/9iS+tvMTmX81XSOUi/zmR
 kqeQ==
X-Gm-Message-State: AOJu0YxVucPuOSMZEiY1enDvbHeF4XuMbqUi95qXv+FnOnCcsoNwDWYg
 wZDxVSAHAsJZFxOQv8B/OOtHlzPaSBuxGufmugN2RlxNSlIrmHO30aWS/A==
X-Google-Smtp-Source: AGHT+IH3pUFLnGn1xCgRkqBvWx2LQXCdfs0G14RuiQ39mQOgFTtpmm2t0MyU9nxiNATypsTM/f+UYA==
X-Received: by 2002:a7b:cd9a:0:b0:41c:14a4:7b34 with SMTP id
 y26-20020a7bcd9a000000b0041c14a47b34mr2562548wmj.27.1714765986457; 
 Fri, 03 May 2024 12:53:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 jq22-20020a05600c55d600b0041c9238d907sm6894762wmb.1.2024.05.03.12.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 12:53:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 21:53:04 +0200
Message-ID: <20240503195304.1277312-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714765987; x=1715370787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AbcentWWq543elPtFZtJ1asxK1+kiC0lpYxsFHOSmEg=;
 b=VBL8GhRh2MR76T+Rf+7LDD376TY7C1AdadoryWK1HK0uasR+5s4MVqD0djsxQ9/OEc
 a+a5lHhMbmIA0Zne11r7u6Xm+sFdfr4+IU6LBX0QRm4vnCxUWF8+0OWnaXirBxqBKRJq
 BhvUSkWHOTF2klomZcgAnCU8T33iG59bxkllmhbOLvxBJdutCZsDbPdRSb7kK2WV60OG
 jlpfvMT0BHhEWTq2x/lBWf0aLXXm9tInPqyYRyykmmXzXGiCIA+YgOKWZ/S5yoGe4YpL
 klbr48VwSwGzeiQXWF3dccHXUWkKVDz8NbYQ5Gc53wqTza9gGS0Mgosm9h/PKm3zc5JG
 uKaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VBL8GhRh
Subject: [Buildroot] [PATCH 1/1] package/zziplib: bump to version 0.13.74
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- docs/copying.htm renamed to docs/copying.htm.md with
  https://github.com/gdraheim/zziplib/commit/b8138ba56ecb9d5d27c22d85fae37bdd594d2edb

https://github.com/gdraheim/zziplib/blob/v0.13.74/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 75 -------------------
 ...reate-symlinks-only-if-target-is-mis.patch | 72 ------------------
 package/zziplib/zziplib.hash                  |  4 +-
 package/zziplib/zziplib.mk                    |  4 +-
 5 files changed, 4 insertions(+), 152 deletions(-)
 delete mode 100644 package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
 delete mode 100644 package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d809f3396b..9332d72ac4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1697,7 +1697,6 @@ package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch lib_pat
 package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch lib_patch.Upstream
 package/zip/0008-fix-musl-static-build.patch lib_patch.Upstream
 package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch lib_patch.Upstream
-package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch lib_patch.Upstream
 support/dependencies/check-host-asciidoc.sh Shellcheck
 support/dependencies/check-host-cmake.sh Shellcheck
 support/dependencies/check-host-gzip.sh Shellcheck
diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
deleted file mode 100644
index 780d990ab7..0000000000
--- a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
-From: Guido Draheim <guidod@gmx.de>
-Date: Sat, 22 May 2021 15:13:28 +0200
-Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
-
-[Andreas: Extract link creation for versioned libraries from commit
-0e8d35f92efb680c81f6ec1fca9f11d173dce389.]
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
----
- zzip/CMakeLists.txt | 57 +++++++++++++++++++++++++++++++++++----------
- 1 file changed, 45 insertions(+), 12 deletions(-)
-
-diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
-index a966d5f..ccd08b6 100644
---- a/zzip/CMakeLists.txt
-+++ b/zzip/CMakeLists.txt
-@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
- option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
- endif()
- 
-+if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
-+option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
-+else()
-+option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
-+endif()
-+
- # used in zzip/_config.h
- set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
- set(ZZIP_VERSION "${PROJECT_VERSION}")
-@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
-   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
- endif(ZZIP_LIBTOOL)
- 
-+if(ZZIP_LIBLATEST)
-+  if(BUILD_SHARED_LIBS)
-+    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
-+    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
-+  else()
-+    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
-+    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
-+  endif()
-+    get_target_property(libname libzzip OUTPUT_NAME)
-+    get_target_property(librelease libzzip RELEASE_POSTFIX)
-+    add_custom_target(libzzip_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    if(ZZIPFSEEKO)
-+    get_target_property(libname libzzipfseeko OUTPUT_NAME)
-+    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
-+    add_custom_target(libzzipfseeko_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    endif(ZZIPFSEEKO)
-+    if(ZZIPMMAPPED)
-+    get_target_property(libname libzzipmmapped OUTPUT_NAME)
-+    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
-+    add_custom_target(libzzipmmaped_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    endif(ZZIPMMAPPED)
-+endif(ZZIP_LIBLATEST)
-+
-+
- ## messages ##############################################
- 
- message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
diff --git a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
deleted file mode 100644
index c8ccd48dba..0000000000
--- a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 5977725ecea038f32a86938703ca1ed2b080b31c Mon Sep 17 00:00:00 2001
-From: Andreas Ziegler <br015@umbiko.net>
-Date: Fri, 29 Jul 2022 12:32:27 +0200
-Subject: [PATCH] ZZIP_LIBLATEST: create symlinks only if target is missing
-
-zzip/CMakeList.txt uses custom build targets to create symlinks to the
-(normally versioned) build results from unversioned file names. These
-targets are executed unconditionally, every time a build is started,
-regardless of the existence of the symlink.
-
-Debug builds, however, generate unversioned libraries. The build targets
-therefore overwrite existing files with recursive links.
-
-Create custom targets depending on the target file plus custom build
-commands containing the symlink creation, thereby ensuring that symlinks
-are only created if the link target is missing.
-
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
-Upstream: https://github.com/gdraheim/zziplib/pull/138
----
- zzip/CMakeLists.txt | 18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
-index 4fa6b9c..dd1e56a 100644
---- a/zzip/CMakeLists.txt
-+++ b/zzip/CMakeLists.txt
-@@ -350,8 +350,12 @@ if(ZZIP_LIBLATEST)
-   endif()
-     get_target_property(libname libzzip OUTPUT_NAME)
-     get_target_property(librelease libzzip RELEASE_POSTFIX)
-+    set(libzzip_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzip_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${libzzip_target}
-+        )
-     add_custom_target(libzzip_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
-+        DEPENDS ${libzzip_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
-@@ -359,8 +363,12 @@ if(ZZIP_LIBLATEST)
-     if(ZZIPFSEEKO)
-     get_target_property(libname libzzipfseeko OUTPUT_NAME)
-     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
-+    set(libzzipfseeko_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzipfseeko_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${libzzipfseeko_target}
-+        )
-     add_custom_target(libzzipfseeko_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
-+        DEPENDS ${libzzipfseeko_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
-@@ -369,8 +377,12 @@ if(ZZIP_LIBLATEST)
-     if(ZZIPMMAPPED)
-     get_target_property(libname libzzipmmapped OUTPUT_NAME)
-     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
-+    set(libzzipmmapped_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzipmmapped_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${libzzipmmapped_target}
-+        )
-     add_custom_target(libzzipmmaped_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
-+        DEPENDS ${libzzipmmapped_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
--- 
-2.34.1
-
diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index b6a75ae0cb..3bff51f07f 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  93ef44bf1f1ea24fc66080426a469df82fa631d13ca3b2e4abaeab89538518dc  zziplib-0.13.72.tar.gz
+sha256  319093aa98d39453f3ea2486a86d8a2fab2d5632f6633a2665318723a908eecf  zziplib-0.13.74.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
-sha256  1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
+sha256  9418aca218090f0bebfa91298c8145c7342de095eced3d72ea241c178df59368  docs/copying.htm.md
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6cb9dedce8..0ef53436d2 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.72
+ZZIPLIB_VERSION = 0.13.74
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
-ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
+ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
 ZZIPLIB_CPE_ID_VALID = YES
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
