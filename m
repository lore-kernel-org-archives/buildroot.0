Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C944BC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AB584155;
	Wed, 13 Jul 2022 12:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51AB584155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtL3L5mkgGPp; Wed, 13 Jul 2022 12:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BD384127;
	Wed, 13 Jul 2022 12:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BD384127
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2ED21BF470
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE4260A7B
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 12:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE4260A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JYuNdTelPhJ for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 12:39:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3FC60590
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D3FC60590
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 12:39:37 +0000 (UTC)
Received: from 91-153-34-62.elisa-laajakaista.fi ([91.153.34.62] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oBbeN-00F0Jb-0I; Wed, 13 Jul 2022 14:39:31 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 77ae0fbf;
 Wed, 13 Jul 2022 12:39:20 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 15:39:20 +0300
Message-Id: <20220713123920.892044-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qb2F801O/jRv/33Xf4qejS1euM7zSD47ALwpPr5ILKc=; b=icc2/Ps0zzYBCb6O/JQliLyNlY
 qvrCukd98EDnMgk8PiAnC9FZjoUU9jRoE3Iv5xRyhk1NtG2gQDXCpAejyWKI5p8Mdd2Cb0OKv1OWR
 jII8+Q8CW27+6FGwSHA1sF1mM4YYs4eZExl194ia9QolaYOrMkymDcColCtZkP+MdH4U4t8KgMUKS
 kgHF0wSYT7My4IYjM434PgdS7iG5hhxlMFWnqOkIA5vYvSKAPjl+j1sVawWQ5CvUJH733f/kYd5xG
 UkxxbLqq5irSQOl1O0dfxX3MX86WP886kkD8/ScRRzRZSo6mOsV/C+X0AU6LCsHPN8IZA7GkgM2LS
 0Dixdwbw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=icc2/Ps0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.36.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, fixes a WPEWebProcess leak, MPRIS/MediaSession support,
adds a missing ATSPI a11y interface, and security patches for
CVE-2022-22677 and CVE-2022-26710.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.4.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0006.html

One patch is not included in the packaged release, and another with a
build fix imported, which is actually a revert of a patch that made it
into the release but can cause linking issues when using LTO.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...en-cross-building-for-64-bit-ARM-htt.patch | 32 ----------
 ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  8 +--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 4 files changed, 63 insertions(+), 37 deletions(-)
 delete mode 100644 package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
 create mode 100644 package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch

diff --git a/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch b/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
deleted file mode 100644
index 7c9c8666ad..0000000000
--- a/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b0c63502f004db68b485354967bb1c56c071f4eb Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 31 May 2022 00:48:21 +0300
-Subject: [PATCH] Build failure when cross-building for 64-bit ARM
- https://bugs.webkit.org/show_bug.cgi?id=241109
-
-Unreviewed build fix.
-
-* Source/WebCore/bindings/js/JSDOMMapLike.cpp: Add missing
-  JavaScriptCore/HashMapImplInlines.h header inclusion.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream status: https://github.com/WebKit/WebKit/pull/1165
----
- Source/WebCore/bindings/js/JSDOMMapLike.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WebCore/bindings/js/JSDOMMapLike.cpp b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
-index e132c39fa54..2cb4b1b59a3 100644
---- a/Source/WebCore/bindings/js/JSDOMMapLike.cpp
-+++ b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
-@@ -28,6 +28,7 @@
- 
- #include "WebCoreJSClientData.h"
- #include <JavaScriptCore/CatchScope.h>
-+#include <JavaScriptCore/HashMapImplInlines.h>
- #include <JavaScriptCore/JSMap.h>
- #include <JavaScriptCore/VMTrapsInlines.h>
- 
--- 
-2.36.1
-
diff --git a/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch b/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
new file mode 100644
index 0000000000..d1edd36660
--- /dev/null
+++ b/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
@@ -0,0 +1,58 @@
+From a780527a1b79538f1e1f5144e9b522d0927a2312 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 13 Jul 2022 00:53:48 +0300
+Subject: [PATCH] Revert "Merge r295034 - WebKitTestRunner shouldn't link
+ object files of JavaScriptCore and WebCore"
+
+This reverts commit 7916fda00b347ff263fbfe72c065032d1d9b523c.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241002]
+
+---
+ Source/JavaScriptCore/CMakeLists.txt     | 12 +++++++++---
+ Tools/WebKitTestRunner/CMakeLists.txt    |  1 -
+ Tools/WebKitTestRunner/PlatformGTK.cmake |  4 ++++
+ Tools/WebKitTestRunner/PlatformWin.cmake |  4 ++++
+ 4 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index 95a1300ce1b3..238208eb1137 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -456,7 +456,7 @@ if (MSVC AND NOT ENABLE_C_LOOP)
+         COMMAND ${MASM_EXECUTABLE} ${LLINT_MASM_FLAGS} ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.asm
+         VERBATIM)
+     list(APPEND JavaScriptCore_SOURCES ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj)
+-    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp)
++    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp)
+ else ()
+     # As there's poor toolchain support for using `.file` directives in
+     # inline asm (i.e. there's no way to avoid clashes with the `.file`
+@@ -465,7 +465,7 @@ else ()
+     # an object file. We only need to do this for LowLevelInterpreter.cpp
+     # and cmake doesn't allow us to introduce a compiler wrapper for a
+     # single source file, so we need to create a separate target for it.
+-    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp
++    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp
+         ${JavaScriptCore_DERIVED_SOURCES_DIR}/${LLIntOutput})
+ endif ()
+ 
+@@ -1496,7 +1496,13 @@ if (CMAKE_COMPILER_IS_GNUCXX AND GCC_OFFLINEASM_SOURCE_MAP)
+         COMPILE_OPTIONS "-fno-lto")
+ endif ()
+ 
+-list(APPEND JavaScriptCore_PRIVATE_LIBRARIES LowLevelInterpreterLib)
++# When building JavaScriptCore as an object library, we need to make sure the
++# lowlevelinterpreter lib objects get propogated.
++if (${JavaScriptCore_LIBRARY_TYPE} STREQUAL "OBJECT")
++    list(APPEND JavaScriptCore_PRIVATE_LIBRARIES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
++else ()
++    list(APPEND JavaScriptCore_SOURCES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
++endif ()
+ 
+ WEBKIT_COMPUTE_SOURCES(JavaScriptCore)
+ list(APPEND JavaScriptCore_SOURCES
+-- 
+2.37.1
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 253b4756d0..2a8205d40c 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.3.tar.xz.sums
-md5  8bc53f86a3489da31fdbb581e1b87f7a  wpewebkit-2.36.3.tar.xz
-sha1  44a3d99ae48481917ddc478c5f91e6a4faa21ff5  wpewebkit-2.36.3.tar.xz
-sha256  66275debca7497daff3a7826734cd56262a807adb76c5dccdf257c89968c2fc8  wpewebkit-2.36.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.4.tar.xz.sums
+md5  ba8e5f5444fd50f53906a7376b25bb26  wpewebkit-2.36.4.tar.xz
+sha1  91259642da6fe55446c3352eeeafdaa188fc14bd  wpewebkit-2.36.4.tar.xz
+sha256  307a3bedf5d4299a861f773f631c39a44c3e6276c3af37f7cbefaed2c8d7c021  wpewebkit-2.36.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index abd09829a5..ca6833bcd1 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.3
+WPEWEBKIT_VERSION = 2.36.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
