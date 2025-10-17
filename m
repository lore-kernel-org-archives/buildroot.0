Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58220CCD1A4
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 13:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0405360F4D;
	Fri, 17 Oct 2025 13:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5l0vySy3gIm; Fri, 17 Oct 2025 13:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E7260F20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E7260F20;
	Fri, 17 Oct 2025 13:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA69D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8921581332
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSvJE-iZPd8g for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 13:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 508A88132E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508A88132E
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 508A88132E
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:10:41 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v9kE9-00B3O5-Sr; Fri, 17 Oct 2025 15:10:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id d1d2504d;
 Fri, 17 Oct 2025 13:10:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 16:10:34 +0300
Message-ID: <20251017131035.224739-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aHmoqkzK/lBOlLtaL8E6GGtBHwXa0+42Ej7D6HgwMEo=; b=G1uW5DCJCH75/bWfcRZX82Tjx5
 bT3k68M2UZc5A2jNhvFxKwPX7x4FlYS4/q462eRf8ZMaSeQWftQzYbUBSKJ4bRqB8bQ7DvGMgJdoH
 bbSc4Xphp0mmDuSigm7hsPxaYP2cPSJeBysdbJ0OWzNMt/T75O9NoKwC7rWE+sHVLbnw/oX/d3MiR
 z0l4ZvZQWY3yCTxptaCP0ZH8Bqc3bsBKmxdFpLkLNeIyKaF2JxyKXbjFbCRNTf16YHITFg2koHf5n
 7nyubM0iBj4OPSut7toNIrCrTWPj+eJs50qi+uQp6eaoeaVEP1jAJAWENZ8FtlBev1H5+7Aepjdw4
 P6vP98UQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=G1uW5DCJ
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.50.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This updates WPE WebKit to the 2.50 stable series.
WPE WebKit 2.50 highlights and 2.50.1 release notes:

- https://wpewebkit.org/release/wpewebkit-2.50.0.html

- https://wpewebkit.org/release/wpewebkit-2.50.1.html

Fixes the following security issues:

- From https://wpewebkit.org/security/WSA-2025-0007.html
  CVE-2025-43343

- From https://wpewebkit.org/security/WSA-2025-0006.html
  CVE-2025-43272, CVE-2025-43342, CVE-2025-43356, CVE-2025-43368

- From https://wpewebkit.org/security/WSA-2025-0005.html
  CVE-2025-31273, CVE-2025-31278, CVE-2025-43211, CVE-2025-43212,
  CVE-2025-43216, CVE-2025-43227, CVE-2025-43228, CVE-2025-43240,
  CVE-2025-43265, CVE-2025-6558

Two patches which fix build issues are included. Those have
been merged upstream, both in the "main" branch and in the
2.50.x release branch.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...001-Unreviewed-non-unified-build-fix.patch | 44 +++++++++
 ...d-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch | 44 ---------
 ...39-main-c78f2b76d86c-.-https-bugs.we.patch | 96 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                |  2 +-
 5 files changed, 145 insertions(+), 49 deletions(-)
 create mode 100644 package/wpewebkit/0001-Unreviewed-non-unified-build-fix.patch
 delete mode 100644 package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
 create mode 100644 package/wpewebkit/0002-Cherry-pick-301539-main-c78f2b76d86c-.-https-bugs.we.patch

diff --git a/package/wpewebkit/0001-Unreviewed-non-unified-build-fix.patch b/package/wpewebkit/0001-Unreviewed-non-unified-build-fix.patch
new file mode 100644
index 0000000000..0be7a37f67
--- /dev/null
+++ b/package/wpewebkit/0001-Unreviewed-non-unified-build-fix.patch
@@ -0,0 +1,44 @@
+From 18434b4f402064dc68344f3d57fd79dcac972949 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 14 Oct 2025 22:57:15 +0300
+Subject: [PATCH] Unreviewed non-unified build fix
+
+* Source/WebCore/loader/ImageLoader.cpp: Add missing include.
+* Source/WebKit/WebProcess/WebPage/WebPage.cpp: Ditto.
+
+Canonical link: https://commits.webkit.org/298234.198@webkitglib/2.50
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/WebKit/WebKit/commit/18434b4f402064dc68344f3d57fd79dcac972949
+---
+ Source/WebCore/loader/ImageLoader.cpp        | 1 +
+ Source/WebKit/WebProcess/WebPage/WebPage.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Source/WebCore/loader/ImageLoader.cpp b/Source/WebCore/loader/ImageLoader.cpp
+index 504a8db9d5fc..0f987b0abea2 100644
+--- a/Source/WebCore/loader/ImageLoader.cpp
++++ b/Source/WebCore/loader/ImageLoader.cpp
+@@ -29,6 +29,7 @@
+ #include "CachedResourceRequest.h"
+ #include "Chrome.h"
+ #include "ChromeClient.h"
++#include "ContainerNodeInlines.h"
+ #include "CookieJar.h"
+ #include "CrossOriginAccessControl.h"
+ #include "Document.h"
+diff --git a/Source/WebKit/WebProcess/WebPage/WebPage.cpp b/Source/WebKit/WebProcess/WebPage/WebPage.cpp
+index bf2d3f7eccb5..54ab23ec581c 100644
+--- a/Source/WebKit/WebProcess/WebPage/WebPage.cpp
++++ b/Source/WebKit/WebProcess/WebPage/WebPage.cpp
+@@ -189,6 +189,7 @@
+ #include <WebCore/Chrome.h>
+ #include <WebCore/CommonVM.h>
+ #include <WebCore/ContactsRequestData.h>
++#include <WebCore/ContainerNodeInlines.h>
+ #include <WebCore/ContextMenuController.h>
+ #include <WebCore/CrossOriginEmbedderPolicy.h>
+ #include <WebCore/CrossOriginOpenerPolicy.h>
+-- 
+2.51.0
+
diff --git a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch b/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
deleted file mode 100644
index 8432543e07..0000000000
--- a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 94acd1ce0ff2860b19f22ab2d386d7711c9699b7 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 8 Jul 2025 21:46:44 +0300
-Subject: [PATCH] [WPE] Fix the build with USE_SKIA_OPENTYPE_SVG=ON and
- USE_SYSPROF_CAPTURE=OFF
-
-Unreviewed build fix.
-
-When backporting 287859@main the #include for the needed Skia header
-slipped inside an USE(SYSPROF_CAPTURE) guard. This moves the guards
-and #include statements to their correct places.
-
-* Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp:
-
-Canonical link: https://commits.webkit.org/290945.273@webkitglib/2.48
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/WebKit/WebKit/commit/943d05f0c9b03c053a456c90c2a8817c1f679711
----
- Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-index a06e33fd04f8..5fb245ce0b66 100644
---- a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-+++ b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
-@@ -43,11 +43,12 @@
- #include <skia/core/SkGraphics.h>
- #endif
- 
--#if USE(SYSPROF_CAPTURE)
--#include <wtf/SystemTracing.h>
- #if USE(SKIA_OPENTYPE_SVG)
- #include <skia/modules/svg/SkSVGOpenTypeSVGDecoder.h>
- #endif
-+
-+#if USE(SYSPROF_CAPTURE)
-+#include <wtf/SystemTracing.h>
- #endif
- 
- namespace WebKit {
--- 
-2.50.1
-
diff --git a/package/wpewebkit/0002-Cherry-pick-301539-main-c78f2b76d86c-.-https-bugs.we.patch b/package/wpewebkit/0002-Cherry-pick-301539-main-c78f2b76d86c-.-https-bugs.we.patch
new file mode 100644
index 0000000000..cef38fa7c8
--- /dev/null
+++ b/package/wpewebkit/0002-Cherry-pick-301539-main-c78f2b76d86c-.-https-bugs.we.patch
@@ -0,0 +1,96 @@
+From 225d432b0d6203dfdf6c993eaf5479a656986ef5 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 15 Oct 2025 02:20:10 -0700
+Subject: [PATCH] Cherry-pick 301539@main (c78f2b76d86c).
+ https://bugs.webkit.org/show_bug.cgi?id=300701
+
+    [libpas] Build fails with libc implementations that lack execinfo.h
+    https://bugs.webkit.org/show_bug.cgi?id=300701
+
+    Reviewed by Yusuke Suzuki and Michael Catanzaro.
+
+    Change guards to use backtrace() and execinfo.h on Linux only when using
+    glibc as the C library. The PlayStation and Windows cases no longer need
+    to be matched, as they are neither Linux nor Darwin, both of which are now
+    explicitly listed. The Android check is kept as it was.
+
+    * Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:
+    * Source/bmalloc/libpas/src/test/PGMTests.cpp:
+    (addPGMTests):
+
+    Canonical link: https://commits.webkit.org/301539@main
+
+Canonical link: https://commits.webkit.org/298234.199@webkitglib/2.50
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/WebKit/WebKit/commit/225d432b0d6203dfdf6c993eaf5479a656986ef5
+---
+ .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
+ Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+index 28b5fdd8720c..8fbf4e67521c 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
++++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+@@ -47,8 +47,8 @@
+ #include <unistd.h>
+ #endif
+ 
+-/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. */
+-#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ >= 33) && !PAS_OS(WINDOWS)
++/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. Linux only with GLibc and not uCLibc/Musl. */
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+ #else
+ size_t backtrace(void** buffer, size_t size)
+diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+index 0432f46ba3b0..dfbf957a3421 100644
+--- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
++++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+@@ -43,9 +43,9 @@
+ #include "pas_report_crash.h"
+ #include "pas_root.h"
+ 
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ using namespace std;
+ 
+@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations()
+     pas_heap_lock_unlock();
+ }
+ 
+-/* Backtrace API is currently not supported on PlayStation. */
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ void testPGMMetadataDoubleFreeBehavior()
+ {
+     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
+@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
+         CHECK(!dealloc_metadata);
+     }
+ }
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ } // anonymous namespace
+ 
+@@ -598,9 +597,9 @@ void addPGMTests()
+     ADD_TEST(testPGMMetadataVectorManagement());
+     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
+     ADD_TEST(testPGMMetadataVectorManagementRehash());
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
+     ADD_TEST(testPGMBmallocAllocationBacktrace());
+     ADD_TEST(testPGMAllocMetadataOnly());
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ }
+-- 
+2.51.0
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 332fd9deaa..5a0c6e3ce5 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.48.3.tar.xz.sums
-md5  2d3b7fa3c62886546f918fcc289cabbe  wpewebkit-2.48.3.tar.xz
-sha1  8a90b9ff8809c99c306defc1a08e50a31a09c590  wpewebkit-2.48.3.tar.xz
-sha256  807571f07e87823b8fb79564692c9b1ef81ee62edbf51345a15bd0e7e1f2e07b  wpewebkit-2.48.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.50.1.tar.xz.sums
+md5  574a56386680d9732b40a05b1f4adef1  wpewebkit-2.50.1.tar.xz
+sha1  da0083ea88619bdce502fa58f036b87646bd0579  wpewebkit-2.50.1.tar.xz
+sha256  305437a4ba869e4106c1d4a8cb2a7be3f43b75d9d026e9b97c6f6debc04a673b  wpewebkit-2.50.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 796e271ecb..a6ea738132 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-WPEWEBKIT_VERSION = 2.48.3
+WPEWEBKIT_VERSION = 2.50.1
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
