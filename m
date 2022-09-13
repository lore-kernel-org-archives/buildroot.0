Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E859C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7E1410DC;
	Tue, 13 Sep 2022 12:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7E1410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAi0YTSsr87N; Tue, 13 Sep 2022 12:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF7B41519;
	Tue, 13 Sep 2022 12:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCF7B41519
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4331BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FBE82BFD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FBE82BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThIbNQZLZdbP for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FE2482C4D
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE2482C4D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4D8B683757; Tue, 13 Sep 2022 12:36:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 14:15:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: afd83944f679ea1ef4a0216db421eafeedeacd4e
X-Git-Newrev: b4fc1823b63b279c0ab4529d02f4614234b99296
X-Patchwork-Hint: ignore
Message-Id: <20220913123609.4D8B683757@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/webkitgtk:
 security bump to version 2.36.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4fc1823b63b279c0ab4529d02f4614234b99296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, including the patch that can be now removed, and
security patches for CVE-2022-32792, CVE-2022-32816, and CVE-2022-2294.

Release notes:

  https://webkitgtk.org/2022/07/28/webkitgtk2.36.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 834aefa8daf9aa2c69f087cba02455e3c5b13f8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-r295034-WebKitTestRunner-shouldn-t-link.patch | 58 ----------------------
 package/webkitgtk/webkitgtk.hash                   |  8 +--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch b/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
deleted file mode 100644
index d1edd36660..0000000000
--- a/package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a780527a1b79538f1e1f5144e9b522d0927a2312 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 13 Jul 2022 00:53:48 +0300
-Subject: [PATCH] Revert "Merge r295034 - WebKitTestRunner shouldn't link
- object files of JavaScriptCore and WebCore"
-
-This reverts commit 7916fda00b347ff263fbfe72c065032d1d9b523c.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241002]
-
----
- Source/JavaScriptCore/CMakeLists.txt     | 12 +++++++++---
- Tools/WebKitTestRunner/CMakeLists.txt    |  1 -
- Tools/WebKitTestRunner/PlatformGTK.cmake |  4 ++++
- Tools/WebKitTestRunner/PlatformWin.cmake |  4 ++++
- 4 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
-index 95a1300ce1b3..238208eb1137 100644
---- a/Source/JavaScriptCore/CMakeLists.txt
-+++ b/Source/JavaScriptCore/CMakeLists.txt
-@@ -456,7 +456,7 @@ if (MSVC AND NOT ENABLE_C_LOOP)
-         COMMAND ${MASM_EXECUTABLE} ${LLINT_MASM_FLAGS} ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.asm
-         VERBATIM)
-     list(APPEND JavaScriptCore_SOURCES ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj)
--    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp)
-+    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp)
- else ()
-     # As there's poor toolchain support for using `.file` directives in
-     # inline asm (i.e. there's no way to avoid clashes with the `.file`
-@@ -465,7 +465,7 @@ else ()
-     # an object file. We only need to do this for LowLevelInterpreter.cpp
-     # and cmake doesn't allow us to introduce a compiler wrapper for a
-     # single source file, so we need to create a separate target for it.
--    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp
-+    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp
-         ${JavaScriptCore_DERIVED_SOURCES_DIR}/${LLIntOutput})
- endif ()
- 
-@@ -1496,7 +1496,13 @@ if (CMAKE_COMPILER_IS_GNUCXX AND GCC_OFFLINEASM_SOURCE_MAP)
-         COMPILE_OPTIONS "-fno-lto")
- endif ()
- 
--list(APPEND JavaScriptCore_PRIVATE_LIBRARIES LowLevelInterpreterLib)
-+# When building JavaScriptCore as an object library, we need to make sure the
-+# lowlevelinterpreter lib objects get propogated.
-+if (${JavaScriptCore_LIBRARY_TYPE} STREQUAL "OBJECT")
-+    list(APPEND JavaScriptCore_PRIVATE_LIBRARIES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
-+else ()
-+    list(APPEND JavaScriptCore_SOURCES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
-+endif ()
- 
- WEBKIT_COMPUTE_SOURCES(JavaScriptCore)
- list(APPEND JavaScriptCore_SOURCES
--- 
-2.37.1
-
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7f67ef4a7a..ae86c97c0a 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.4.tar.xz.sums
-md5  bb5f96d54804e22fd52478665d1dac7a  webkitgtk-2.36.4.tar.xz
-sha1  c4f2d3c8581d1abe2a959e99f2846bea5d5ddf3c  webkitgtk-2.36.4.tar.xz
-sha256  b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8  webkitgtk-2.36.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.5.tar.xz.sums
+md5  a876da9d8906468f4e1e3d08729cdeec  webkitgtk-2.36.5.tar.xz
+sha1  49ff8873500a2ce82bad8879095277bb4dfd21de  webkitgtk-2.36.5.tar.xz
+sha256  d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908  webkitgtk-2.36.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 28cd593d01..8949cb2b1c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.4
+WEBKITGTK_VERSION = 2.36.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
