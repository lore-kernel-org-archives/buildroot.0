Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0158DC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A80D4020B;
	Sat,  6 Jan 2024 18:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A80D4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KMwrYl-MYcO; Sat,  6 Jan 2024 18:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE34E4023B;
	Sat,  6 Jan 2024 18:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE34E4023B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4AB1BF3B9
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 18:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F383A83F72
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 18:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F383A83F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WTzg-yL2UMN for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 18:36:33 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD44083F71
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 18:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD44083F71
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso6540295e9.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 10:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704566191; x=1705170991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WtPDGhGmQhZnxNaiOGtS9RwxBhXJiQOem398E+WiZb8=;
 b=ES3szjZxzYXHTlc6IMyp0Gf2OkTmzBB/k7R02insWOR5My3dCQSRC2S7kFsqdy42O7
 Yjh+/haojkSnX9koO0UF1GL1KzqFIaa+3tt2Ra7MKXF3LHtOw6OBsSoeNGaXibCsdNP9
 WD8Y0EY4akzSnIOFXnm0tS3eWBuK14iRFKvMR+Xzpx9Fwr4kKhMQ4Tmga+E4QzGbIaQS
 C6UYmaZW/DFkhrKFW7j7Oa3UqR0qF0kA3TXsgXOtlS5KcTTogDF/KyFR+hYTZaMCOsmd
 edLBDxLPTSHS9Ot2kX9IYGaydqsxHFT0boL+qMU6mvCGgtZuo4A7/HdZ7VEEiFa0gxL6
 UehQ==
X-Gm-Message-State: AOJu0YzDxoa8LigglEs+jWv2R9WMqXggpJdCoIhs1ORHTYeSxCgfhz0I
 oSxACvD34Ac2VEfNHGbcrO+Qc+FB0UM=
X-Google-Smtp-Source: AGHT+IH80+RQW3NILQCtUppeU/Z3QMnbgxXNvKiAyJPQ/3FJs5agwv3zy81REQqTrEaeXe5tGC1v3w==
X-Received: by 2002:a05:600c:3baa:b0:40d:888c:4f45 with SMTP id
 n42-20020a05600c3baa00b0040d888c4f45mr664432wms.33.1704566190799; 
 Sat, 06 Jan 2024 10:36:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040d6d755c90sm5393040wmq.42.2024.01.06.10.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 10:36:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 19:36:08 +0100
Message-ID: <20240106183608.3179343-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704566191; x=1705170991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WtPDGhGmQhZnxNaiOGtS9RwxBhXJiQOem398E+WiZb8=;
 b=Uvc+iwhmM0/2q9708xjTmTvFfvJ6URZ2i5BIdkWTKu0gPUjcPhvR1QQXmpZV9KPn81
 E5h0WhWmSjMsoeZCzmjr9n9eUOvFwjQvMjjAT0tZVZ1rw/VKdY3e2fLMICNvPBJIimBV
 8Xe3/k1qSpJQ0OGzCsvezWy6XimB++7CusN8OTenEOyC7Xegm3QlOPBoYpixq9U5mrav
 3+rnjoEfhPEQM5XDFy6i589XuH0sfP0HeddSg0onpS+2SeDx+qfcAbT35OaP1YO+yym/
 HJMa+HN3Yl5Jb/FTTQFqyMzTQU5usAaFgBsWXBGTHBeDDEdYGdaST1YjHVfqXK7n47zT
 TTrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Uvc+iwhm
Subject: [Buildroot] [PATCH 1/1] package/webrtc-audio-processing: bump to
 version 1.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (not needed anymore)
- Switch to meson-package
- libabseil-cpp is a mandatory dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 package/gstreamer1/gst1-plugins-bad/Config.in |  9 ++-
 ...detection-of-cxxabi.h-and-execinfo.h.patch | 63 -------------------
 package/webrtc-audio-processing/Config.in     | 10 ++-
 .../webrtc-audio-processing.hash              |  2 +-
 .../webrtc-audio-processing.mk                | 12 +---
 6 files changed, 17 insertions(+), 80 deletions(-)
 delete mode 100644 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b5a56ddc55..659939e4e3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1405,7 +1405,6 @@ package/wampcc/0001-Add-RISC-V-endian-detection.patch Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch Upstream
 package/watchdogd/S01watchdogd Indent NotExecutable
-package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch Upstream
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch Upstream
 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch Upstream
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d2ef450d74..d2c60ec9ce 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -675,17 +675,20 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	bool "webrtcdsp"
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	bool "wpe"
diff --git a/package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch b/package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
deleted file mode 100644
index a0332db8e7..0000000000
--- a/package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From b7a166acaddc4c78afa2b653e25114d9114699f3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 6 Aug 2016 11:24:50 +0200
-Subject: [PATCH] Proper detection of cxxabi.h and execinfo.h
-
-The current code in webrtc/base/checks.cc assumes that if __GLIBCXX__ is
-defined and __UCLIBC__ is not defined, then both cxxabi.h and execinfo.h
-will be available.
-
-Unfortunately, this is not correct with the musl C library:
-
- - It defines __GLIBCXX__
- - It does not define __UCLIBC__ (it's not uClibc after all!)
- - But it also doesn't provide execinfo.h
-
-Therefore, in order to make things work properly, we switch to proper
-autoconf checks for cxxabi.h and execinfo.h, and only use the backtrace
-functionality if both are provided.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac          | 2 ++
- webrtc/base/checks.cc | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index acbb3e2..ff4c752 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,6 +45,8 @@ AC_SUBST(GNUSTL_CFLAGS)
- # Borrowed from gst-plugins-bad
- AC_CHECK_HEADER(MobileCoreServices/MobileCoreServices.h, HAVE_IOS="yes", HAVE_IOS="no", [-])
- 
-+AC_CHECK_HEADERS([cxxabi.h execinfo.h])
-+
- # Based on gst-plugins-bad configure.ac and defines in
- # <chromium source>/build/config/BUILDCONFIG.gn and
- # webrtc/BUILD.gn
-diff --git a/webrtc/base/checks.cc b/webrtc/base/checks.cc
-index 49a31f2..05d23a6 100644
---- a/webrtc/base/checks.cc
-+++ b/webrtc/base/checks.cc
-@@ -16,7 +16,7 @@
- #include <cstdio>
- #include <cstdlib>
- 
--#if defined(__GLIBCXX__) && !defined(__UCLIBC__)
-+#if defined(HAVE_CXX_ABI_H) && defined(HAVE_EXECINFO_H)
- #include <cxxabi.h>
- #include <execinfo.h>
- #endif
-@@ -55,7 +55,7 @@ void PrintError(const char* format, ...) {
- // to get usable symbols on Linux. This is copied from V8. Chromium has a more
- // advanced stace trace system; also more difficult to copy.
- void DumpBacktrace() {
--#if defined(__GLIBCXX__) && !defined(__UCLIBC__)
-+#if defined(HAVE_CXX_ABI_H) && defined(HAVE_EXECINFO_H)
-   void* trace[100];
-   int size = backtrace(trace, sizeof(trace) / sizeof(*trace));
-   char** symbols = backtrace_symbols(trace, size);
--- 
-2.7.4
-
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 64138269b5..cb3b21367b 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -5,17 +5,21 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_STATIC_LIBS # libabseil-cpp
+	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  AudioProcessing library based on Google's implementation of
 	  WebRTC.
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, gcc >= 4.8"
+comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.hash b/package/webrtc-audio-processing/webrtc-audio-processing.hash
index 18b8ea6410..eb2229360c 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.hash
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf  webrtc-audio-processing-0.3.1.tar.xz
+sha256  2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0838ad6ec2e86f1b9  webrtc-audio-processing-1.3.tar.xz
 sha256  9b79539028e216e813e152d45f5c1ed5fdd0554426ad50270fb03134e7082dac  COPYING
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index ff84a802d1..8aa5ee46b8 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-WEBRTC_AUDIO_PROCESSING_VERSION = 0.3.1
+WEBRTC_AUDIO_PROCESSING_VERSION = 1.3
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3-Clause
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
-WEBRTC_AUDIO_PROCESSING_DEPENDENCIES = host-pkgconf
-# 0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
-WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES
+WEBRTC_AUDIO_PROCESSING_DEPENDENCIES = host-pkgconf libabseil-cpp
 
-ifeq ($(BR2_SOFT_FLOAT),y)
-WEBRTC_AUDIO_PROCESSING_CONF_OPTS += --with-ns-mode=fixed
-endif
-
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
