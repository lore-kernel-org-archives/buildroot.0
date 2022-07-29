Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C8C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 05:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C382F83F09;
	Fri, 29 Jul 2022 05:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C382F83F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK6nnYpoacwI; Fri, 29 Jul 2022 05:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD7A83EFF;
	Fri, 29 Jul 2022 05:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD7A83EFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 200451BF34A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 05:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0536760ADF
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 05:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0536760ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwDY_SrLbcte for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 05:28:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0999607BC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0999607BC
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 05:28:21 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oHIXr-00AbW5-Dv; Fri, 29 Jul 2022 07:28:19 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0b78b880;
 Fri, 29 Jul 2022 05:28:09 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 08:28:09 +0300
Message-Id: <20220729052809.793581-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uwS9nVKMQUOBONWJMNM7x5VOfI6BeTlvJ0B1VMsdtbQ=; b=B2kixneUMuAvT2+6L5HnGy6+x+
 Wqwf6OUUl1mRAlIs/4Cq9BloQ9ulRakLiU3Bsswp2FlAjJGWjOYIaTaHBDU+nIFPcrnz45Du7K2IK
 wTKPQuW7VR0yR9bV+M04uy00cv1+aqr93QIqIjV5i7c0YJVD8jvncTLwxCmvuRcnszqyUdCQ0Bm//
 /5LTqiRMb5sT25AF6sDatHlwGLxpJO+iLJcFaYd0T7GNMy0SnEjxWA3flZsq91kN4ltFZXvzOVTL1
 8BM8V013uwk5v+T2Bspxdyu5S7Ih2QmpVgPlwvdxvex8D345r7tTkD5F2/TAdhaqYcK0f/PEAybfI
 SDO1sw7Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=B2kixneU
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.36.5
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

Bugfix release, including the patch that can be now removed, and
security patches for CVE-2022-32792, CVE-2022-32816, and CVE-2022-2294.

Release notes:

  https://webkitgtk.org/2022/07/28/webkitgtk2.36.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 -------------------
 package/webkitgtk/webkitgtk.hash              |  8 +--
 package/webkitgtk/webkitgtk.mk                |  2 +-
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch

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
index cbe36720da..0dbb72f970 100644
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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
