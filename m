Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4048C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 531E841B46;
	Sat, 16 Jul 2022 15:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 531E841B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgbgJXT23rhb; Sat, 16 Jul 2022 15:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A846241B62;
	Sat, 16 Jul 2022 15:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A846241B62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDAF1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07D8E8476F
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07D8E8476F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLYvVixd_vu2 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:34:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A5D584660
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A5D584660
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D512F838ED; Sat, 16 Jul 2022 15:21:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 17:34:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cd727c3afbe2947c92c360568bee8c877bd73ab
X-Git-Newrev: 008ab9474e96fc65bfc843970c282ccb3dd7019c
X-Patchwork-Hint: ignore
Message-Id: <20220716152135.D512F838ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.36.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=008ab9474e96fc65bfc843970c282ccb3dd7019c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixes a WebKitWebProcess leak, MPRIS/MediaSession
support, adds a missing ATSPI a11y interface, and security patches
for CVE-2022-22677 and CVE-2022-26710.

Release notes:

  https://webkitgtk.org/2022/07/05/webkitgtk2.36.4-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0006.html

One patch is now included in the packaged release, and another with a
build fix imported, which is actually a revert of a patch that made it
into the release but can cause linking issues when using LTO.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...re-when-cross-building-for-64-bit-ARM-htt.patch | 32 ------------
 ...e-r295034-WebKitTestRunner-shouldn-t-link.patch | 58 ++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash                   |  8 +--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 4 files changed, 63 insertions(+), 37 deletions(-)

diff --git a/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch b/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
deleted file mode 100644
index 7c9c8666ad..0000000000
--- a/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
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
diff --git a/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch b/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
new file mode 100644
index 0000000000..d1edd36660
--- /dev/null
+++ b/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
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
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 1176bbc7a1..7f67ef4a7a 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.3.tar.xz.sums
-md5  8ad4b1bfbbe3115ee163a8b2ba7b908f  webkitgtk-2.36.3.tar.xz
-sha1  59ee6ee820be360ad57391870fa158064091c525  webkitgtk-2.36.3.tar.xz
-sha256  732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1  webkitgtk-2.36.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.4.tar.xz.sums
+md5  bb5f96d54804e22fd52478665d1dac7a  webkitgtk-2.36.4.tar.xz
+sha1  c4f2d3c8581d1abe2a959e99f2846bea5d5ddf3c  webkitgtk-2.36.4.tar.xz
+sha256  b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8  webkitgtk-2.36.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 39b16a90e7..28cd593d01 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.3
+WEBKITGTK_VERSION = 2.36.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
