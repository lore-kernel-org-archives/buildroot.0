Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED2CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0AB60BCD;
	Tue,  4 Jan 2022 18:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6-5Wwzc8ew7; Tue,  4 Jan 2022 18:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A21660E32;
	Tue,  4 Jan 2022 18:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0773B1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90D3827C5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWvAFq501W-p for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7416182784
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C4D2B8324B; Tue,  4 Jan 2022 18:28:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 19:10:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0197eb3a7121712d5ae1c8c5c3e180961fce1cdb
X-Git-Newrev: df0b0fe6919c0d0f3750f439a3cfa765232bd569
X-Patchwork-Hint: ignore
Message-Id: <20220104182811.C4D2B8324B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: bump to version
 5.212.0-alpha4
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
Content-Type: multipart/mixed; boundary="===============5363029889085009828=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5363029889085009828==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=df0b0fe6919c0d0f3750f439a3cfa765232bd569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to latest release in new active upstream:
https://github.com/qtwebkit/qtwebkit

Migrate python2 build to python3.

Drop patches that are upstream/no longer needed.

Adapt/add patches to fix build issues.

Rework build system to use cmake instead of qmake(which does not
currently support cross compilation).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ated-compile-failures-from-capital-bool-d.patch | 147 +++++++++++++++++++++
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  36 -----
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  44 ------
 ...tion-with-Python-3.9-avoid-passing-encodi.patch |  33 +++++
 .../0003-Detect-32-bits-armv8-a-architecture.patch |  48 -------
 ...nerate-the-header-directly-to-fix-build-.patch} |  22 +--
 .../0004-Fix-installation-of-class-headers.patch   |  49 -------
 ...lid-g_object-declarations-to-fix-build-wi.patch |  31 +++++
 .../0005-Fix-ICU-related-compile-failures.patch    |  67 ----------
 ...emove-legacy-reference-to-qtConfig-mircli.patch |  34 -----
 ...enerate-the-header-directly-to-fix-build-.patch |  31 -----
 ...ated-compile-failures-from-capital-bool-d.patch |  99 --------------
 package/qt5/qt5webkit/Config.in                    |  14 ++
 package/qt5/qt5webkit/qt5webkit.hash               |   4 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  37 ++----
 15 files changed, 250 insertions(+), 446 deletions(-)

diff --git a/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
new file mode 100644
index 0000000000..11d0b7b248
--- /dev/null
+++ b/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
@@ -0,0 +1,147 @@
+From bf936a2bc8120f693f1effd3d9b130cddc6c4185 Mon Sep 17 00:00:00 2001
+From: Henri Roosen <henri.roosen@ginzinger.com>
+Date: Thu, 18 Mar 2021 11:53:57 +0100
+Subject: [PATCH] Fix ICU related compile failures from capital bool defines
+
+See ICU-21267
+
+Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
+ Source/WebCore/platform/text/icu/UTextProvider.h   |  8 ++++----
+ .../platform/text/icu/UTextProviderLatin1.cpp      | 14 +++++++-------
+ .../platform/text/icu/UTextProviderUTF16.cpp       |  4 ++--
+ 4 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
+index dd6ff0675bb1..e0f4bd718828 100644
+--- a/Source/WebCore/platform/text/TextCodecICU.cpp
++++ b/Source/WebCore/platform/text/TextCodecICU.cpp
+@@ -308,7 +308,7 @@ void TextCodecICU::createICUConverter() const
+     m_converterICU = ucnv_open(m_canonicalConverterName, &err);
+     ASSERT(U_SUCCESS(err));
+     if (m_converterICU)
+-        ucnv_setFallback(m_converterICU, TRUE);
++        ucnv_setFallback(m_converterICU, true);
+ }
+ 
+ int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& err)
+diff --git a/Source/WebCore/platform/text/icu/UTextProvider.h b/Source/WebCore/platform/text/icu/UTextProvider.h
+index c254fc4c7ce2..6d1e1cbc5eb2 100644
+--- a/Source/WebCore/platform/text/icu/UTextProvider.h
++++ b/Source/WebCore/platform/text/icu/UTextProvider.h
+@@ -80,12 +80,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
+             ASSERT(offset < std::numeric_limits<int32_t>::max());
+             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible = TRUE;
++            isAccessible = true;
+             return true;
+         }
+         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
+             text->chunkOffset = text->chunkLength;
+-            isAccessible = FALSE;
++            isAccessible = false;
+             return true;
+         }
+     } else {
+@@ -94,12 +94,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
+             ASSERT(offset < std::numeric_limits<int32_t>::max());
+             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible = TRUE;
++            isAccessible = true;
+             return true;
+         }
+         if (nativeIndex <= 0 && !text->chunkNativeStart) {
+             text->chunkOffset = 0;
+-            isAccessible = FALSE;
++            isAccessible = false;
+             return true;
+         }
+     }
+diff --git a/Source/WebCore/platform/text/icu/UTextProviderLatin1.cpp b/Source/WebCore/platform/text/icu/UTextProviderLatin1.cpp
+index cd6852c71e55..6a864b1c1567 100644
+--- a/Source/WebCore/platform/text/icu/UTextProviderLatin1.cpp
++++ b/Source/WebCore/platform/text/icu/UTextProviderLatin1.cpp
+@@ -100,23 +100,23 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
+         if (index < uText->chunkNativeLimit && index >= uText->chunkNativeStart) {
+             // Already inside the buffer. Set the new offset.
+             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
+-            return TRUE;
++            return true;
+         }
+         if (index >= length && uText->chunkNativeLimit == length) {
+             // Off the end of the buffer, but we can't get it.
+             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
+-            return FALSE;
++            return false;
+         }
+     } else {
+         if (index <= uText->chunkNativeLimit && index > uText->chunkNativeStart) {
+             // Already inside the buffer. Set the new offset.
+             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
+-            return TRUE;
++            return true;
+         }
+         if (!index && !uText->chunkNativeStart) {
+             // Already at the beginning; can't go any farther.
+             uText->chunkOffset = 0;
+-            return FALSE;
++            return false;
+         }
+     }
+     
+@@ -144,7 +144,7 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
+ 
+     uText->nativeIndexingLimit = uText->chunkLength;
+ 
+-    return TRUE;
++    return true;
+ }
+ 
+ static int32_t uTextLatin1Extract(UText* uText, int64_t start, int64_t limit, UChar* dest, int32_t destCapacity, UErrorCode* status)
+@@ -336,7 +336,7 @@ static int64_t uTextLatin1ContextAwareNativeLength(UText* text)
+ static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength = uTextLatin1ContextAwareNativeLength(text);
+     UBool isAccessible;
+     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
+@@ -356,7 +356,7 @@ static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBo
+         ASSERT(newContext == UTextProviderContext::PriorContext);
+         textLatin1ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+ 
+ static int32_t uTextLatin1ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
+diff --git a/Source/WebCore/platform/text/icu/UTextProviderUTF16.cpp b/Source/WebCore/platform/text/icu/UTextProviderUTF16.cpp
+index 7aaac48c8151..9ae0d367f1f6 100644
+--- a/Source/WebCore/platform/text/icu/UTextProviderUTF16.cpp
++++ b/Source/WebCore/platform/text/icu/UTextProviderUTF16.cpp
+@@ -125,7 +125,7 @@ static inline int64_t uTextUTF16ContextAwareNativeLength(UText* text)
+ static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength = uTextUTF16ContextAwareNativeLength(text);
+     UBool isAccessible;
+     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
+@@ -145,7 +145,7 @@ static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBoo
+         ASSERT(newContext == UTextProviderContext::PriorContext);
+         textUTF16ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+ 
+ static int32_t uTextUTF16ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
deleted file mode 100644
index 669c7e6aa2..0000000000
--- a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <trevor.woerner@linaro.org>
-Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
-
-Building qtwebkit causes a QA issue such that QtWebPluginProcess and
-QtWebProcess contain bad RPATHs which point into the build location. This fix
-adds a patch to not include the rpath.prf which causes this problem.
-
-Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index fd66af6..ef754c3 100644
---- a/Tools/qmake/mkspecs/features/unix/default_post.prf
-+++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -61,7 +61,6 @@ linux-*g++* {
-     }
- }
- 
--contains(TEMPLATE, app): CONFIG += rpath
- 
- CONFIG(debug, debug|release)|force_debug_info {
-     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
deleted file mode 100644
index a2597a54bb..0000000000
--- a/package/qt5/qt5webkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6c36f0ff8c1f5852c33d2b23714f9f187cc6ff26 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jun 2015 19:55:05 -0700
-Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
-
-It was excluding musl with current checks, so lets make it such that it
-considers only glibc when using backtrace API
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Source/WTF/wtf/Assertions.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
-index 1b2091f..ba03a28 100644
---- a/Source/WTF/wtf/Assertions.cpp
-+++ b/Source/WTF/wtf/Assertions.cpp
-@@ -61,7 +61,7 @@
- #include <windows.h>
- #endif
- 
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined (__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
- #include <cxxabi.h>
- #include <dlfcn.h>
- #include <execinfo.h>
-@@ -245,7 +245,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
- 
- void WTFGetBacktrace(void** stack, int* size)
- {
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
-     *size = backtrace(stack, *size);
- #elif OS(WINDOWS) && !OS(WINCE)
-     // The CaptureStackBackTrace function is available in XP, but it is not defined
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/0002-Fix-compilation-with-Python-3.9-avoid-passing-encodi.patch b/package/qt5/qt5webkit/0002-Fix-compilation-with-Python-3.9-avoid-passing-encodi.patch
new file mode 100644
index 0000000000..d167a44bf3
--- /dev/null
+++ b/package/qt5/qt5webkit/0002-Fix-compilation-with-Python-3.9-avoid-passing-encodi.patch
@@ -0,0 +1,33 @@
+From 78360c01c796b6260bf828bc9c8a0ef73c5132fd Mon Sep 17 00:00:00 2001
+From: Konstantin Tokarev <annulen@yandex.ru>
+Date: Wed, 3 Jun 2020 15:01:42 +0300
+Subject: [PATCH] Fix compilation with Python 3.9: avoid passing encoding to
+ json.load()
+
+In Python 2.7 UTF-8 is assumed by default, while in Python 3 this argument
+is not supported.
+
+Change-Id: Ic459d60a6b20bc1838d8771bc36ac41614fe61a9
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+78360c01c796b6260bf828bc9c8a0ef73c5132fd]
+---
+ Source/JavaScriptCore/generate-bytecode-files | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/generate-bytecode-files b/Source/JavaScriptCore/generate-bytecode-files
+index c5dab429c7b0..af3431275ecf 100644
+--- a/Source/JavaScriptCore/generate-bytecode-files
++++ b/Source/JavaScriptCore/generate-bytecode-files
+@@ -163,7 +163,7 @@ if __name__ == "__main__":
+         initBytecodesFile = openOrExit(initASMFileName, "w")
+ 
+     try:
+-        bytecodeSections = json.load(bytecodeFile, encoding = "utf-8")
++        bytecodeSections = json.load(bytecodeFile)
+     except:
+         print("Unexpected error parsing {0}: {1}".format(bytecodeJSONFile, sys.exc_info()))
+ 
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webkit/0003-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/0003-Detect-32-bits-armv8-a-architecture.patch
deleted file mode 100644
index 9c2205dd94..0000000000
--- a/package/qt5/qt5webkit/0003-Detect-32-bits-armv8-a-architecture.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 068bf2d2d91382ea0d8ec24a142a30ea429704db Mon Sep 17 00:00:00 2001
-From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
-Date: Tue, 15 Aug 2017 18:28:49 -0400
-Subject: [PATCH] Detect 32-bits armv8-a architecture
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-Adds WTF platform support for the 32-bits armv8-a architectures.
-
-Theses toolchains define __ARM_ARCH_8A__ (for ARM architecture version)
-and __arm__ (for 32-bits word-size; __aarch64__ for 64-bits).
-
-This commit catches this new architecture (armv8a) within a #ifdef/#endif
-inside the if statement dedicated for 32-bits ARM detection.
-
-Fixes:
-
-	In file included from ./config.h:30:0,
-	                 from ...
-	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
-	 #    error "Not supported ARM architecture"
-	      ^~~~~
-
-Upstream-Status: Backport [with adaptations]
-Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
----
- Source/WTF/wtf/Platform.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 562840cf7..9cf656845 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -243,6 +243,10 @@
-     || defined(__ARM_ARCH_7S__)
- #define WTF_ARM_ARCH_VERSION 7
- 
-+#elif defined(__ARM_ARCH_8__) \
-+    || defined(__ARM_ARCH_8A__)
-+#define WTF_ARM_ARCH_VERSION 8
-+
- /* MSVC sets _M_ARM */
- #elif defined(_M_ARM)
- #define WTF_ARM_ARCH_VERSION _M_ARM
--- 
-2.16.1
-
diff --git a/package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch b/package/qt5/qt5webkit/0003-Let-Bison-generate-the-header-directly-to-fix-build-.patch
similarity index 60%
rename from package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch
rename to package/qt5/qt5webkit/0003-Let-Bison-generate-the-header-directly-to-fix-build-.patch
index 7bb81b1259..1591b8a82c 100644
--- a/package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch
+++ b/package/qt5/qt5webkit/0003-Let-Bison-generate-the-header-directly-to-fix-build-.patch
@@ -1,4 +1,4 @@
-From 894a5448ee8ce0f134845c877b4c0a2a660e4ab3 Mon Sep 17 00:00:00 2001
+From d92b11fea65364fefa700249bd3340e0cd4c5b31 Mon Sep 17 00:00:00 2001
 From: Dmitry Shachnev <mitya57@gmail.com>
 Date: Tue, 4 Aug 2020 21:04:06 +0300
 Subject: [PATCH] Let Bison generate the header directly, to fix build with
@@ -9,24 +9,25 @@ by default, instead of duplicating it. So we should not delete it.
 
 Remove the code to add #ifdef guards to the header, since Bison adds
 them itself since version 2.6.3.
-
-[Original patch taken from
-https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-qt/qtwebkit/files/qtwebkit-5.212.0_pre20200309-bison-3.7.patch?id=69e618c88a9134f754264efc11aa0b1fdc028b88
-ported to qtwebkit-opensource-src-5.9.1]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+d92b11fea65364fefa700249bd3340e0cd4c5b31]
 ---
  Source/WebCore/css/makegrammar.pl | 21 +--------------------
  1 file changed, 1 insertion(+), 20 deletions(-)
 
 diff --git a/Source/WebCore/css/makegrammar.pl b/Source/WebCore/css/makegrammar.pl
-index 4e0452ed..9ef32963 100644
+index 5d63b08102eb..9435701c7061 100644
 --- a/Source/WebCore/css/makegrammar.pl
 +++ b/Source/WebCore/css/makegrammar.pl
-@@ -73,23 +73,4 @@ if ($suffix eq ".y.in") {
+@@ -73,25 +73,6 @@ if ($suffix eq ".y.in") {
  }
  
  my $fileBase = File::Spec->join($outputDir, $filename);
--system("$bison -d -p $symbolsPrefix $grammarFilePath -o $fileBase.cpp");
+-my @bisonCommand = ($bison, "-d", "-p", $symbolsPrefix, $grammarFilePath, "-o", "$fileBase.cpp");
++my @bisonCommand = ($bison, "--defines=$fileBase.h", "-p", $symbolsPrefix, $grammarFilePath, "-o", "$fileBase.cpp");
+ push @bisonCommand, "--no-lines" if $^O eq "MSWin32"; # Work around bug in bison >= 3.0 on Windows where it puts backslashes into #line directives.
+ system(@bisonCommand) == 0 or die;
 -
 -open HEADER, ">$fileBase.h" or die;
 -print HEADER << "EOF";
@@ -46,7 +47,6 @@ index 4e0452ed..9ef32963 100644
 -unlink("$fileBase.cpp.h");
 -unlink("$fileBase.hpp");
 -
-+system("$bison --defines=$fileBase.h -p $symbolsPrefix $grammarFilePath -o $fileBase.cpp");
 -- 
-2.28.0
+2.25.1
 
diff --git a/package/qt5/qt5webkit/0004-Fix-installation-of-class-headers.patch b/package/qt5/qt5webkit/0004-Fix-installation-of-class-headers.patch
deleted file mode 100644
index 92aab57111..0000000000
--- a/package/qt5/qt5webkit/0004-Fix-installation-of-class-headers.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7d763d441fd4fa78553a818ee75ac477eb6dbcbe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
-Date: Sun, 2 Feb 2020 10:48:50 +0100
-Subject: [PATCH] Fix installation of class headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since Qt 5.11 (see commit [1]), the key word HEADER_CLASSES has been
-removed. It has been replaced by a new variable GENERATED_HEADER_FILES.
-
-The class headers were not generated, this commit moves them directly to
-HEADER_FILES.
-
-[1]: https://github.com/qt/qtbase/commit/9c4c136bc9f29bab1cc9684dfced55a92a8bbe96
-
-Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
-[Converted to git formated patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/QtWebKit/headers.pri        | 3 +--
- include/QtWebKitWidgets/headers.pri | 3 +--
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/include/QtWebKit/headers.pri b/include/QtWebKit/headers.pri
-index 6775f3a6..3a5c14cd 100644
---- a/include/QtWebKit/headers.pri
-+++ b/include/QtWebKit/headers.pri
-@@ -1,5 +1,4 @@
--SYNCQT.HEADER_FILES = WebKit/qt/Api/qwebdatabase.h WebKit/qt/Api/qwebelement.h WebKit/qt/Api/qwebhistory.h WebKit/qt/Api/qwebhistoryinterface.h WebKit/qt/Api/qwebkitglobal.h WebKit/qt/Api/qwebkitplatformplugin.h WebKit/qt/Api/qwebpluginfactory.h WebKit/qt/Api/qwebsecurityorigin.h WebKit/qt/Api/qwebsettings.h ../include/QtWebKit/qtwebkitversion.h ../include/QtWebKit/QtWebKit 
--SYNCQT.HEADER_CLASSES = ../include/QtWebKit/QWebDatabase ../include/QtWebKit/QWebElement ../include/QtWebKit/QWebElementCollection ../include/QtWebKit/QWebHistoryItem ../include/QtWebKit/QWebHistory ../include/QtWebKit/QWebHistoryInterface ../include/QtWebKit/QWebSelectData ../include/QtWebKit/QWebSelectMethod ../include/QtWebKit/QWebNotificationData ../include/QtWebKit/QWebNotificationPresenter ../include/QtWebKit/QWebHapticFeedbackPlayer ../include/QtWebKit/QWebTouchModifier ../include/QtWebKit/QWebFullScreenVideoHandler ../include/QtWebKit/QWebSpellChecker ../include/QtWebKit/QWebKitPlatformPlugin ../include/QtWebKit/QWebPluginFactory ../include/QtWebKit/QWebSecurityOrigin ../include/QtWebKit/QWebSettings ../include/QtWebKit/QtWebKitVersion 
-+SYNCQT.HEADER_FILES = WebKit/qt/Api/qwebdatabase.h WebKit/qt/Api/qwebelement.h WebKit/qt/Api/qwebhistory.h WebKit/qt/Api/qwebhistoryinterface.h WebKit/qt/Api/qwebkitglobal.h WebKit/qt/Api/qwebkitplatformplugin.h WebKit/qt/Api/qwebpluginfactory.h WebKit/qt/Api/qwebsecurityorigin.h WebKit/qt/Api/qwebsettings.h ../include/QtWebKit/qtwebkitversion.h ../include/QtWebKit/QtWebKit ../include/QtWebKit/QWebDatabase ../include/QtWebKit/QWebElement ../include/QtWebKit/QWebElementCollection ../include/QtWebKit/QWebHistoryItem ../include/QtWebKit/QWebHistory ../include/QtWebKit/QWebHistoryInterface ../include/QtWebKit/QWebSelectData ../include/QtWebKit/QWebSelectMethod ../include/QtWebKit/QWebNotificationData ../include/QtWebKit/QWebNotificationPresenter ../include/QtWebKit/QWebHapticFeedbackPlayer ../include/QtWebKit/QWebTouchModifier ../include/QtWebKit/QWebFullScreenVideoHandler ../include/QtWebKit/QWebSpellChecker ../include/QtWebKit/QWebKitPlatformPlugin ../include/QtWebKit/QWebPluginFacto
 ry ../include/QtWebKit/QWebSecurityOrigin ../include/QtWebKit/QWebSettings ../include/QtWebKit/QtWebKitVersion 
- SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/Api/qhttpheader_p.h WebKit/qt/Api/qwebdatabase_p.h WebKit/qt/Api/qwebelement_p.h WebKit/qt/Api/qwebhistory_p.h WebKit/qt/Api/qwebplugindatabase_p.h WebKit/qt/Api/qwebscriptworld.h WebKit/qt/Api/qwebscriptworld_p.h WebKit/qt/Api/qwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qquicknetworkreply_p.h WebKit2/UIProcess/API/qt/qquicknetworkrequest_p.h WebKit2/UIProcess/API/qt/qquickurlschemedelegate_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p_p.h WebKit2/UIProcess/API/qt/qquickwebview_p.h WebKit2/UIProcess/API/qt/qquickwebview_p_p.h WebKit2/UIProcess/API/qt/qtwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qwebchannelwebkittransport_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p_p.h WebKit2/UIProcess/API/qt/qwebiconimageprovider_p.h WebKit2/UIProcess/API/qt/qwebkittest_p.h WebKit2/UIProcess/API/qt/qwebloadrequest_p.h WebKit2/UIProcess/API/qt/qwebnavigationhis
 tory_p.h WebKit2/UIProcess/API/qt/qwebnavigationhistory_p_p.h WebKit2/UIProcess/API/qt/qwebnavigationrequest_p.h WebKit2/UIProcess/API/qt/qwebpermissionrequest_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p_p.h WebKit2/UIProcess/API/qt/tests/bytearraytestdata.h WebKit2/UIProcess/API/qt/tests/testwindow.h WebKit2/UIProcess/API/qt/tests/util.h 
- SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
- SYNCQT.QPA_HEADER_FILES = 
-diff --git a/include/QtWebKitWidgets/headers.pri b/include/QtWebKitWidgets/headers.pri
-index 9d386e29..2b8b095c 100644
---- a/include/QtWebKitWidgets/headers.pri
-+++ b/include/QtWebKitWidgets/headers.pri
-@@ -1,5 +1,4 @@
--SYNCQT.HEADER_FILES = WebKit/qt/WidgetApi/qgraphicswebview.h WebKit/qt/WidgetApi/qwebframe.h WebKit/qt/WidgetApi/qwebinspector.h WebKit/qt/WidgetApi/qwebpage.h WebKit/qt/WidgetApi/qwebview.h ../include/QtWebKitWidgets/qtwebkitwidgetsversion.h ../include/QtWebKitWidgets/QtWebKitWidgets 
--SYNCQT.HEADER_CLASSES = ../include/QtWebKitWidgets/QGraphicsWebView ../include/QtWebKitWidgets/QWebHitTestResult ../include/QtWebKitWidgets/QWebFrame ../include/QtWebKitWidgets/QWebInspector ../include/QtWebKitWidgets/QWebPage ../include/QtWebKitWidgets/QWebView ../include/QtWebKitWidgets/QtWebKitWidgetsVersion 
-+SYNCQT.HEADER_FILES = WebKit/qt/WidgetApi/qgraphicswebview.h WebKit/qt/WidgetApi/qwebframe.h WebKit/qt/WidgetApi/qwebinspector.h WebKit/qt/WidgetApi/qwebpage.h WebKit/qt/WidgetApi/qwebview.h ../include/QtWebKitWidgets/qtwebkitwidgetsversion.h ../include/QtWebKitWidgets/QtWebKitWidgets ../include/QtWebKitWidgets/QGraphicsWebView ../include/QtWebKitWidgets/QWebHitTestResult ../include/QtWebKitWidgets/QWebFrame ../include/QtWebKitWidgets/QWebInspector ../include/QtWebKitWidgets/QWebPage ../include/QtWebKitWidgets/QWebView ../include/QtWebKitWidgets/QtWebKitWidgetsVersion 
- SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/WidgetApi/qwebframe_p.h WebKit/qt/WidgetApi/qwebinspector_p.h WebKit/qt/WidgetApi/qwebpage_p.h WebKit/qt/WidgetApi/qwebviewaccessible_p.h 
- SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
- SYNCQT.QPA_HEADER_FILES = 
--- 
-2.25.0
-
diff --git a/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
new file mode 100644
index 0000000000..48605e4fe4
--- /dev/null
+++ b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
@@ -0,0 +1,31 @@
+From 5b698ba3faffd4e198a45be9fe74f53307395e4b Mon Sep 17 00:00:00 2001
+From: Fabian Vogt <fvogt@suse.de>
+Date: Wed, 7 Apr 2021 13:38:09 +0200
+Subject: [PATCH] Remove invalid g_object declarations to fix build with glib
+ >= 2.68
+
+g_object_ref_sink is defined as a macro meanwhile and so the build fails.
+Just remove the declarations, glib.h is included anyway.
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Retrieved from: https://github.com/qtwebkit/qtwebkit/pull/1058]
+---
+ Source/WTF/wtf/glib/GRefPtr.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Source/WTF/wtf/glib/GRefPtr.h b/Source/WTF/wtf/glib/GRefPtr.h
+index 06133d82cb35..d9a1d2f145f5 100644
+--- a/Source/WTF/wtf/glib/GRefPtr.h
++++ b/Source/WTF/wtf/glib/GRefPtr.h
+@@ -29,9 +29,6 @@
+ #include <algorithm>
+ #include <glib.h>
+ 
+-extern "C" void g_object_unref(gpointer);
+-extern "C" gpointer g_object_ref_sink(gpointer);
+-
+ namespace WTF {
+ 
+ enum GRefPtrAdoptType { GRefPtrAdopt };
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webkit/0005-Fix-ICU-related-compile-failures.patch b/package/qt5/qt5webkit/0005-Fix-ICU-related-compile-failures.patch
deleted file mode 100644
index 1a99eb7f84..0000000000
--- a/package/qt5/qt5webkit/0005-Fix-ICU-related-compile-failures.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 38e3436db7222ac403a405db7e0fd1d472f1704a Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 2 Feb 2020 10:51:00 +0100
-Subject: [PATCH] Fix ICU related compile failures.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The ICU macro U16_NEXT() needs a trailing semicolon.
-
-Fixes:
-
-  platform/graphics/SegmentedFontData.cpp:65:9: error: expected ‘;’ before ‘if’
-  dom/Document.cpp:3850:5: error: expected ‘;’ before ‘if’
-  dom/Document.cpp:3855:9: error: expected ‘;’ before ‘if’
-  dom/Document.cpp:3918:9: error: expected ‘;’ before ‘if’
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Source/WebCore/dom/Document.cpp                        | 6 +++---
- Source/WebCore/platform/graphics/SegmentedFontData.cpp | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
-index af63b141..26f7312b 100644
---- a/Source/WebCore/dom/Document.cpp
-+++ b/Source/WebCore/dom/Document.cpp
-@@ -3846,12 +3846,12 @@ static bool isValidNameNonASCII(const UChar* characters, unsigned length)
-     unsigned i = 0;
- 
-     UChar32 c;
--    U16_NEXT(characters, i, length, c)
-+    U16_NEXT(characters, i, length, c);
-     if (!isValidNameStart(c))
-         return false;
- 
-     while (i < length) {
--        U16_NEXT(characters, i, length, c)
-+        U16_NEXT(characters, i, length, c);
-         if (!isValidNamePart(c))
-             return false;
-     }
-@@ -3914,7 +3914,7 @@ bool Document::parseQualifiedName(const String& qualifiedName, String& prefix, S
-     const UChar* s = qualifiedName.characters();
-     for (unsigned i = 0; i < length;) {
-         UChar32 c;
--        U16_NEXT(s, i, length, c)
-+        U16_NEXT(s, i, length, c);
-         if (c == ':') {
-             if (sawColon) {
-                 ec = NAMESPACE_ERR;
-diff --git a/Source/WebCore/platform/graphics/SegmentedFontData.cpp b/Source/WebCore/platform/graphics/SegmentedFontData.cpp
-index efb20a8c..99b3e86c 100644
---- a/Source/WebCore/platform/graphics/SegmentedFontData.cpp
-+++ b/Source/WebCore/platform/graphics/SegmentedFontData.cpp
-@@ -61,7 +61,7 @@ bool SegmentedFontData::containsCharacters(const UChar* characters, int length)
- {
-     UChar32 c;
-     for (int i = 0; i < length; ) {
--        U16_NEXT(characters, i, length, c)
-+        U16_NEXT(characters, i, length, c);
-         if (!containsCharacter(c))
-             return false;
-     }
--- 
-2.25.0
-
diff --git a/package/qt5/qt5webkit/0006-configure-remove-legacy-reference-to-qtConfig-mircli.patch b/package/qt5/qt5webkit/0006-configure-remove-legacy-reference-to-qtConfig-mircli.patch
deleted file mode 100644
index d9b94697da..0000000000
--- a/package/qt5/qt5webkit/0006-configure-remove-legacy-reference-to-qtConfig-mircli.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c408484e3a442ecf99d3cc61402f20c45c894b7c Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 3 Feb 2020 21:19:57 +0100
-Subject: [PATCH] configure: remove legacy reference to qtConfig(mirclient)
-
-The optio mirclient is removed since Qt-5.14.x (see [1])
-Fixes:
-
-  Project ERROR: Could not find feature mirclient.
-
-[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=8c73ddd8e3fb43cc22fa111b855ab1f9f5b83405
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Tools/qmake/mkspecs/features/configure.prf | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Tools/qmake/mkspecs/features/configure.prf b/Tools/qmake/mkspecs/features/configure.prf
-index 23d99040..783f6752 100644
---- a/Tools/qmake/mkspecs/features/configure.prf
-+++ b/Tools/qmake/mkspecs/features/configure.prf
-@@ -130,9 +130,6 @@ defineTest(finalizeConfigure) {
-         addReasonForSkippingBuild("Build not supported on Android.")
-     }
-     QT_FOR_CONFIG += gui-private
--    production_build:qtConfig(mirclient) {
--        addReasonForSkippingBuild("Build not supported on Ubuntu Touch.")
--    }
-     !gnu_thin_archives:!win32-msvc2013:!mingw:qtConfig(static) {
-         addReasonForSkippingBuild("QtWebKit cannot be built as a static library on this platform. Check your configuration in qtbase/config.summary.")
-     }
--- 
-2.25.0
-
diff --git a/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch b/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch
deleted file mode 100644
index 9deb2d8c63..0000000000
--- a/package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8959e226fac7f73b9a40e202610bd5e12334561b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 15 Sep 2020 19:11:18 +0200
-Subject: [PATCH] let bison generate the header directly, to fix build with
- bison 3.7
-
-Do the same as the patch taken from [1] for the bison call in
-Source/WebCore/DerivedSources.pri to fix file generation
-for bison 3.7.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Source/WebCore/DerivedSources.pri | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/DerivedSources.pri b/Source/WebCore/DerivedSources.pri
-index 57a6b0f7..e9f52614 100644
---- a/Source/WebCore/DerivedSources.pri
-+++ b/Source/WebCore/DerivedSources.pri
-@@ -987,7 +987,7 @@ GENERATORS += pluginsresources
- # GENERATOR 11: XPATH grammar
- xpathbison.output = ${QMAKE_FILE_BASE}.cpp
- xpathbison.input = XPATHBISON
--xpathbison.commands = bison -d -p xpathyy ${QMAKE_FILE_NAME} -o ${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.tab.c && $(MOVE) ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.tab.c ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.cpp && $(MOVE) ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.tab.h ${QMAKE_FUNC_FILE_OUT_PATH}$${QMAKE_DIR_SEP}${QMAKE_FILE_BASE}.h
-+xpathbison.commands = bison --defines=${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.h -p xpathyy ${QMAKE_FILE_NAME} -o ${QMAKE_FUNC_FILE_OUT_PATH}/${QMAKE_FILE_BASE}.cpp
- xpathbison.depends = ${QMAKE_FILE_NAME}
- GENERATORS += xpathbison
- 
--- 
-2.28.0
-
diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
deleted file mode 100644
index 7d941a5683..0000000000
--- a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 37ee268d9d07a8dad02c1d8db3bf96e0b30df10b Mon Sep 17 00:00:00 2001
-From: Henri Roosen <henri.roosen@ginzinger.com>
-Date: Thu, 18 Mar 2021 11:53:57 +0100
-Subject: [PATCH] Fix ICU related compile failures from capital bool defines
-
-See ICU-21267
-
-Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
----
- .../platform/text/TextBreakIteratorICU.cpp       | 16 ++++++++--------
- Source/WebCore/platform/text/TextCodecICU.cpp    |  2 +-
- 2 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
-index b4046ac9..832890a2 100644
---- a/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
-+++ b/Source/WebCore/platform/text/TextBreakIteratorICU.cpp
-@@ -214,12 +214,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
-             text->chunkOffset = text->chunkLength;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     } else {
-@@ -228,12 +228,12 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex <= 0 && !text->chunkNativeStart) {
-             text->chunkOffset = 0;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     }
-@@ -243,7 +243,7 @@ static inline bool textInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
- static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = textNativeLength(text);
-     UBool isAccessible;
-     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -263,7 +263,7 @@ static UBool textLatin1Access(UText* text, int64_t nativeIndex, UBool forward)
-         ASSERT(newContext == PriorContext);
-         textLatin1SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static const struct UTextFuncs textLatin1Funcs = {
-@@ -364,7 +364,7 @@ static void textUTF16SwitchToPriorContext(UText* text, int64_t nativeIndex, int6
- static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = textNativeLength(text);
-     UBool isAccessible;
-     if (textInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -384,7 +384,7 @@ static UBool textUTF16Access(UText* text, int64_t nativeIndex, UBool forward)
-         ASSERT(newContext == PriorContext);
-         textUTF16SwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static const struct UTextFuncs textUTF16Funcs = {
-diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
-index 86d4ea17..da152edd 100644
---- a/Source/WebCore/platform/text/TextCodecICU.cpp
-+++ b/Source/WebCore/platform/text/TextCodecICU.cpp
-@@ -269,7 +269,7 @@ void TextCodecICU::createICUConverter() const
-     m_converterICU = ucnv_open(m_canonicalConverterName, &err);
-     ASSERT(U_SUCCESS(err));
-     if (m_converterICU)
--        ucnv_setFallback(m_converterICU, TRUE);
-+        ucnv_setFallback(m_converterICU, true);
- }
- 
- int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& err)
--- 
-2.20.1
-
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 82e38dff52..b7beb2b252 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -9,10 +9,24 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
 	depends on !BR2_MIPS_SOFT_FLOAT
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LEVELDB
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5LOCATION
+	select BR2_PACKAGE_QT5SENSORS
+	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WOFF2
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	help
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 312d58272a..d7c8bd6c8a 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
-# hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
-sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
+# Locally calculated
+sha256  9ca126da9273664dd23a3ccd0c9bebceb7bb534bddd743db31caf6a5a6d4a9e6  qtwebkit-5.212.0-alpha4.tar.xz
 
 # Hashes for license files:
 sha256  7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  Source/WebCore/LICENSE-LGPL-2
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index dd99661be0..3af1918a46 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-QT5WEBKIT_VERSION = 5.9.1
-QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
-QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
+QT5WEBKIT_VERSION = 5.212.0-alpha4
+QT5WEBKIT_SITE = https://github.com/qtwebkit/qtwebkit/releases/download/qtwebkit-$(QT5WEBKIT_VERSION)
+QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
-	host-bison host-flex host-gperf host-python host-ruby \
-	leveldb sqlite
+	host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
+	gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
+	qt5sensors qt5webchannel sqlite webp woff2
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
@@ -20,30 +21,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
-QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
+QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
 endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
-# QtWebkit's build system uses python, but only supports python2. We work
-# around this by forcing python2 early in the PATH, via a python->python2
-# symlink.
-QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
-QT5WEBKIT_MAKE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
-define QT5WEBKIT_PYTHON2_SYMLINK
-	mkdir -p $(@D)/host-bin
-	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
-endef
-QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
+QT5WEBKIT_CONF_OPTS += \
+	-DPORT=Qt \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DUSE_LIBHYPHEN=OFF
 
-QT5WEBKIT_CONF_OPTS = WEBKIT_CONFIG+=use_system_leveldb
-
-define QT5WEBKIT_INSTALL_TARGET_EXTRAS
-	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-endef
-
-QT5WEBKIT_POST_INSTALL_TARGET_HOOKS += QT5WEBKIT_INSTALL_TARGET_EXTRAS
-
-$(eval $(qmake-package))
+$(eval $(cmake-package))


--===============5363029889085009828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5363029889085009828==--

