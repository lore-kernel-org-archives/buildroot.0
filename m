Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED148C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81E4A40448;
	Sun,  9 Jan 2022 11:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwgGWgJSr0oy; Sun,  9 Jan 2022 11:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6108E40497;
	Sun,  9 Jan 2022 11:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 227841BF3AF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E95D81947
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TaYtH-ZTOSh for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:48:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5036381934
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:48:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l4so6968254wmq.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0uPrkV0FrM88FteTYVpxI7bep68PaHBTKf5I6B7qEw=;
 b=kony3UdbqqNLJEOPY7P6qZjFX+Fy24fLN4AP7YUikoRbQHA3jFIojAtU0YzD8l7pi/
 cG2zFYaIbAwc62mESdTqfNH1f1myAIN3NnuzKBSJUCzpy53IItJKmKR8GP3+Sp/s9qIx
 75OaX4zkn5KB19FVqov1fFCZ/pdQvnUYHhqtEQf7MVwGYGc2JmLwusvfhUDyFTkyw65f
 7wkUkGkat3PAiBLAyoPQoaec95iJ/F1bftejfwFbOjKftvLJ2dbmxc1Wf18TOdnWVnE0
 Two+AxR8SRKVxJNetrhsBgfyOVd39rHAT+815GmlPLMVD+z3BZ/GpMA5mrXt5H+fXnTt
 IJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0uPrkV0FrM88FteTYVpxI7bep68PaHBTKf5I6B7qEw=;
 b=ftAhmdidPuvDTdS8SzHcqt+9YaU4tHQgl/YjPI1RvB+J/SFH+r2ueUd0Npv+hVL1IO
 WSb/hHztTSDNeB9Xkb5A8+Gyzw72tu0iJuLyphH8rk8c0OK3V9bCjw8YNHfJzyD6NgQ3
 kNk9j+1K9hfZmC84YNAoZa3k+T9m9j9c40WRk2YKdH12bqYwM32v3LLQL2RNG0yHy5Rl
 Iy3Aqu5ZCx28jBb94u3Vv+Vm6psdbFjaviGFqdtmCNaEYSto2irMvK+lr7wUEoW8qAbm
 oSlfQPg9oAnjq3hB55a+AtFDjN+tiJAdMsDOgo3ngOLOg1uSLHjh+rWxCrIbecBa9G0S
 gosQ==
X-Gm-Message-State: AOAM532SOvnUktcB/CB88LKkQky6LiSpar1kXc9Dro5yk0dokUOldKyg
 T3pf922bRM7pUcKGf2KIL7SrDf3DpCY=
X-Google-Smtp-Source: ABdhPJxx0MfrZnspHypLdtJCkAhUv8QXrljSz+v1SeCpjCSzOqEEmhlSk90B2CVsBjdS5PFcrdSHyg==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr95568wmg.153.1641728909226;
 Sun, 09 Jan 2022 03:48:29 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id b13sm4024854wrh.32.2022.01.09.03.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:48:28 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:47:57 +0100
Message-Id: <20220109114757.785223-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.0.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Updated language training data version to 4.1.0
- Removed current patch as not required anymore
- Added patch to fix uclibc failures
- Supported C++ version has moved from C++11 to C++17

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...-if-platform-supports-feenableexcept.patch | 42 +++++++++++++++++++
 ...-Fix-timeval-structure-build-failure.patch | 27 ------------
 package/tesseract-ocr/Config.in               |  6 +--
 package/tesseract-ocr/tesseract-ocr.hash      |  2 +-
 package/tesseract-ocr/tesseract-ocr.mk        |  4 +-
 5 files changed, 48 insertions(+), 33 deletions(-)
 create mode 100644 package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
 delete mode 100644 package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch

diff --git a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
new file mode 100644
index 0000000000..5280f01aba
--- /dev/null
+++ b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
@@ -0,0 +1,42 @@
+From 52484af83a58664c3cc91b8af07aeeea271f67ef Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Sun, 9 Jan 2022 10:58:36 +0100
+Subject: [PATCH] Check if platform supports feenableexcept
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ configure.ac      | 4 ++++
+ src/tesseract.cpp | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9177d64..80cd735 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -188,6 +188,10 @@ case "${host_cpu}" in
+ 
+ esac
+
++# check whether feenableexcept is supported. some C libraries (e.g. uclibc) don't.
++AC_CHECK_FUNC(feenableexcept, [feenableexcept=true], [feenableexcept=false])
++AM_CONDITIONAL([HAVE_FEENABLEEXCEPT], $feenableexcept)
++
+ AX_CHECK_COMPILE_FLAG([-fopenmp-simd], [openmp_simd=true], [openmp_simd=false], [$WERROR])
+ AM_CONDITIONAL([OPENMP_SIMD], $openmp_simd)
+ 
+diff --git a/src/tesseract.cpp b/src/tesseract.cpp
+index 933116e..9154db8 100644
+--- a/src/tesseract.cpp
++++ b/src/tesseract.cpp
+@@ -629,7 +629,7 @@ static void PreloadRenderers(tesseract::TessBaseAPI &api,
+  **********************************************************************/
+ 
+ int main(int argc, char **argv) {
+-#if defined(__USE_GNU)
++#if defined(__USE_GNU) && defined(HAVE_FEENABLEEXCEPT)
+   // Raise SIGFPE.
+ #  if defined(__clang__)
+   // clang creates code which causes some FP exceptions, so don't enable those.
+-- 
+2.32.0
+
diff --git a/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch b/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
deleted file mode 100644
index 0b0bb1a899..0000000000
--- a/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ea1e1ddfc0af9966a0c613a93087bc3e0a5979a7 Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Fri, 19 Jul 2019 18:52:03 +0200
-Subject: [PATCH] Fix timeval structure build failure
-
-timeval structure definition requires <sys/time.h> to be included
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- src/ccutil/ocrclass.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ccutil/ocrclass.h b/src/ccutil/ocrclass.h
-index d39a6dd..2a01118 100644
---- a/src/ccutil/ocrclass.h
-+++ b/src/ccutil/ocrclass.h
-@@ -28,6 +28,7 @@
- 
- #include <chrono>
- #include <ctime>
-+#include <sys/time.h>
- #ifdef _WIN32
- #include <winsock2.h> // for timeval
- #endif
--- 
-2.7.4
-
diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
index 3afaca771a..4d9b78733e 100644
--- a/package/tesseract-ocr/Config.in
+++ b/package/tesseract-ocr/Config.in
@@ -1,13 +1,13 @@
-comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar"
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 menuconfig BR2_PACKAGE_TESSERACT_OCR
 	bool "tesseract-ocr"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 808ea174ef..9e526423d3 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  2a66ff0d8595bff8f04032165e6c936389b1e5727c3ce5a27b3e059d218db1cb  tesseract-ocr-4.1.1.tar.gz
+sha256  b5b0e561650ed67feb1e9de38d4746121d302ae4c876c95b99b8b6f9f89d5c58  tesseract-ocr-5.0.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index fc083c27f6..7e23e64136 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 4.1.1
-TESSERACT_OCR_DATA_VERSION = 4.0.0
+TESSERACT_OCR_VERSION = 5.0.1
+TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
