Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA55606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ffW3kDHB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6CC36065F;
	Thu, 22 Oct 2026 22:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKKgJWP8K1IO; Thu, 22 Oct 2026 22:30:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A619A60883
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708252;
	b=lKHpjH6gAe1D24fuV6iVcgQYvTt2y3D8IhS+D1wO4PVqLVqU4G0eD/gA0dAS1T0UbSpC
	 0UwDWBWakKuCWA8N0yRQpPQd43MhvpyzHbpxakYEI9K8+cMfLY7UWV1cgQ99xroQ5w81l
	 lo34jfuIIyIsxzwv7rrEBSyxAqCNEZlmMO8I8pKR3crJ0tzb5akcgk13xwW7yMP8jMwYu
	 8AMK+b/RuB4oNGOk8g1RTHJ0iheuxD068V1MlC0fh5jKw+kA4gdqeipyRwlSx295zK6Yy
	 f7c9iwit9WhNTacmiw2a6c+p0bR48d+w0QcEzCwHPgttORWR97cZ6ndWjHJRh+Db+0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mNT2j6i4MFgiJ1tN1+UFfHVywiNiXjizmAr5PPq5bZA=;
	b=EvkQVje544Yxn2dykibllQzAcSY6wOFzvVCchFQpSowyo6k8HrJmGkYDM5tsFLPdVk4F
	 IwkJrKmVIuAjhh3ep/dDyryfyxdnIvXWqEzBlbffxzPpqz6ALiAhUnOm24pdBkndBQcFt
	 4QCmZxHpPlOHP+eSVNxKdWuXi0AtN5dZryKGUQJ2ShLJgWOvwOTqSDrV15dUFix0nkh/Y
	 OJvGkXXZsPJs+QPWIkNPFgIe+VozUyKa+sYs5cjW0X9iJ+8tFkJWwSL4i/FCDMeKGV4sM
	 cwHJ5FlZcM2FOXLY6OF8f22d9WEzN+O32B0xfNP5jH+Ya+h/kib4yVbc8zi6/JmouQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708252;
	bh=mNT2j6i4MFgiJ1tN1+UFfHVywiNiXjizmAr5PPq5bZA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ffW3kDHB9HJeX5UWAsBwGvhknyaTGVx/BG/Yz3fxSDIT6emtenTMkGptQCFcWwdPC
	 FsUEumJ+ANDqVeZNRsgz4Dbh1MrutCaLWRw+0waChi3pZr+Pbh44qAOUgM9erac1/C
	 RaX6ZMNC78GANVqLsjjXlRzws9gC4KJZHKWoge6baH9uawvQMgvCXVTA9peA48b42W
	 Y30bmPbEvT4aufTVpjAVtXvRtqnyu3KeuDRisgr/b4XYNhp42KrdRWrqwGayy2hRX3
	 rLw/KlbL0J7cxscp4LXbAzFXlBDTnqPYhv8q//hYk+w7I0Wa77SIamAf+1mMX6Fa4n
	 ta65MdsOKuaLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A619A60883;
	Thu, 22 Oct 2026 22:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ADB095C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CE7940959
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKdLeW19-WmO for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 01E8640955
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708249;
 b=oMuyJeLAbVDrB9UzIM4bLGDOS4Opouns/0OjnY6c+5Gaxk/lgoM8+FYNOX/sEbzzxb2w
 VHe83AA8ryIANDkoDSNOSajJnCRN/XaP5+eZIfcTSmPW18jWlhBF7oD5AMjkLzMmuuPuG
 /o2o9xsSu3FSj6aEZbJkQWUYpATtkFGgA1MdPPYA4DZi263jUu6YgA+ahvWWPBWX4n2iy
 wMbonTfBeBKIHzBT/gMyvxr4MnEKT3WpL78axEXSt5y9hYLg5xTPrPDz2+FCoTj7Y5WIH
 f1Q6MJQ8PWAp7qoNQmDKVfs4HKzIwra0mdN08aY31r7NFMc9HvLS/kN50axsjF0Belw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708249;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1TvjFxfhwriEPaHCEblHrU0G+QCB8g/YPZ73o5+lc6s=;
 b=H0RNaMU9SjjkTPAAqTtQ/o2DkzjZrMPTlRosfEPX+hToX/5lVBT/mnvBqQ2M/lRnrMSu
 VxHzXRqQouziP+Pj5fBA1dJvjnhahd/2/MIfYxlJVAmcP0b8OKDQRqOSir5/2ij4+MgX4
 U5Hm+jWn3rJJHW/jwfMURs7pCmNhPKkxkvE64qshFlCr8OBn7O+//3UGvRXq9d31dQieu
 rxxSUGWfOuEY1OWZLRF6SGW3FvgRMvNiH5/Pm1HG6IKsOu7wbziRdqDTo2ZK8tzkWppvd
 MJRr7NFg8YguKk5jvZS8rTGPjIaW+RJsWOStp5thac+3j9D9znEVLQnha9/mSqfD3ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01E8640955
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDE769C607; Thu, 22 Oct 2026 22:29:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 00:30:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fe27d55f1ea340584ccbb9654fa2b2ae711d901
X-Git-Newrev: 390d60ac667ca9c8464f1770d68a93625f5d4c64
X-Patchwork-Hint: ignore
Message-Id: <20261022222924.BDE769C607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librdkafka: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/390d60ac667ca9c8464f1770d68a93625f5d4c64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Will be a dependency of fluent-bit.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 ...s.txt-allow-compilation-without-C-support.patch | 127 +++++++++++++++++++++
 ..._conf.c-fix-curl-curl.h-include-when-WITH.patch |  32 ++++++
 package/librdkafka/Config.in                       |  15 +++
 package/librdkafka/librdkafka.hash                 |   4 +
 package/librdkafka/librdkafka.mk                   |  51 +++++++++
 7 files changed, 231 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f87003097..38c45e65c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3245,6 +3245,7 @@ F:	package/fcgiwrap/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
+F:	package/librdkafka/
 F:	package/libsoup3/
 F:	package/yq/
 
diff --git a/package/Config.in b/package/Config.in
index 28e948e3a0..d3bef2d5f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2541,6 +2541,7 @@ endif
 	source "package/leafnode2/Config.in"
 	source "package/lft/Config.in"
 	source "package/lftp/Config.in"
+	source "package/librdkafka/Config.in"
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
 	source "package/links/Config.in"
diff --git a/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
new file mode 100644
index 0000000000..9615aef408
--- /dev/null
+++ b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
@@ -0,0 +1,127 @@
+From 4584734fc039e06dea71c94045283f3108c7fae8 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Feb 2026 20:41:10 +0100
+Subject: [PATCH] CMakeLists.txt: allow compilation without C++ support
+
+$ CXX=/bin/false cmake . && make
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5311
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CMakeLists.txt          | 25 ++++++++++++++++++++-----
+ examples/CMakeLists.txt | 30 ++++++++++++++++++++----------
+ 2 files changed, 40 insertions(+), 15 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f3d05bad..7676f897 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,15 @@ cmake_minimum_required(VERSION 3.5)
+ include("packaging/cmake/parseversion.cmake")
+ parseversion("src/rdkafka.h")
+ 
+-project(RdKafka VERSION ${RDKAFKA_VERSION})
++project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
++
++include(CheckLanguage)
++check_language(CXX)
++if(CMAKE_CXX_COMPILER)
++  enable_language(CXX)
++else()
++  message(STATUS "C++ compiler not found, skipping C++ support")
++endif()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
+ 
+@@ -181,7 +189,7 @@ endif()
+ 
+ option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
+ option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
+-option(RDKAFKA_BUILD_TESTS "Build tests" ON)
++option(RDKAFKA_BUILD_TESTS "Build tests" CMAKE_CXX_COMPILER)
+ if(WIN32)
+     option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
+ endif(WIN32)
+@@ -279,13 +287,20 @@ install(
+ )
+ 
+ add_subdirectory(src)
+-add_subdirectory(src-cpp)
++
++if(CMAKE_CXX_COMPILER)
++  add_subdirectory(src-cpp)
++endif()
+ 
+ if(RDKAFKA_BUILD_EXAMPLES)
+   add_subdirectory(examples)
+ endif()
+ 
+ if(RDKAFKA_BUILD_TESTS)
+-  enable_testing()
+-  add_subdirectory(tests)
++  if(CMAKE_CXX_COMPILER)
++    enable_testing()
++    add_subdirectory(tests)
++  else()
++    message(FATAL_ERROR "Building tests needs C++ suport")
++  endif()
+ endif()
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 91851d2c..28ce6e79 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -5,8 +5,10 @@ endif(WIN32)
+ add_executable(producer producer.c ${win32_sources})
+ target_link_libraries(producer PUBLIC rdkafka)
+ 
+-add_executable(producer_cpp producer.cpp ${win32_sources})
+-target_link_libraries(producer_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(producer_cpp producer.cpp ${win32_sources})
++    target_link_libraries(producer_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+ add_executable(consumer consumer.c ${win32_sources})
+ target_link_libraries(consumer PUBLIC rdkafka)
+@@ -14,14 +16,20 @@ target_link_libraries(consumer PUBLIC rdkafka)
+ add_executable(rdkafka_performance rdkafka_performance.c ${win32_sources})
+ target_link_libraries(rdkafka_performance PUBLIC rdkafka)
+ 
+-add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+-add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+-add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
+-target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
++    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+ add_executable(misc misc.c ${win32_sources})
+ target_link_libraries(misc PUBLIC rdkafka)
+@@ -73,7 +81,9 @@ if(NOT WIN32)
+     add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
+     target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
+ 
+-    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
+-    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    if(CMAKE_CXX_COMPILER)
++        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
++        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    endif(CMAKE_CXX_COMPILER)
+ 
+ endif(NOT WIN32)
+-- 
+2.43.0
+
diff --git a/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch b/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
new file mode 100644
index 0000000000..dec80d538c
--- /dev/null
+++ b/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
@@ -0,0 +1,32 @@
+From 5061a5b33dce11ada740e2a34137dce6934b731a Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Feb 2026 18:37:16 +0100
+Subject: [PATCH] src/rdkafka_conf.c: fix curl/curl.h include when
+ WITH_CURL=OFF
+
+Change #ifdef to #if for WITH_OAUTHBEARER_OIDC preprocessor check.
+When using CMake's cmakedefine01, the macro is always defined (as 0 or 1),
+so #ifdef always evaluates to true. Using #if correctly checks the value.
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5309
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/rdkafka_conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rdkafka_conf.c b/src/rdkafka_conf.c
+index 0e346e74..f8f0d0ca 100644
+--- a/src/rdkafka_conf.c
++++ b/src/rdkafka_conf.c
+@@ -56,7 +56,7 @@
+ #include <windows.h>
+ #endif
+ 
+-#ifdef WITH_OAUTHBEARER_OIDC
++#if WITH_OAUTHBEARER_OIDC
+ #include <curl/curl.h>
+ #endif
+ 
+-- 
+2.43.0
+
diff --git a/package/librdkafka/Config.in b/package/librdkafka/Config.in
new file mode 100644
index 0000000000..76c001bc9e
--- /dev/null
+++ b/package/librdkafka/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBRDKAFKA
+	bool "librdkafka"
+	depends on !BR2_m68k_cf # assembler "out of range" error
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LZ4
+	help
+	  librdkafka is a C library implementation of the
+	  Apache Kafka protocol, providing Producer, Consumer
+	  and Admin clients.
+
+	  https://github.com/confluentinc/librdkafka
+
+comment "librdkafka needs a toolchain w/ threads"
+	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librdkafka/librdkafka.hash b/package/librdkafka/librdkafka.hash
new file mode 100644
index 0000000000..f745e55b81
--- /dev/null
+++ b/package/librdkafka/librdkafka.hash
@@ -0,0 +1,4 @@
+# From https://github.com/confluentinc/librdkafka/releases/tag/v2.13.2
+sha256  14972092e4115f6e99f798a7cb420cbf6daa0c73502b3c52ae42fb5b418eea8f  librdkafka-2.13.2.tar.gz
+# Locally computed
+sha256  b9e4616bb9dd0c9ce3fa52e81c7bfc596e60b8855a1df5dce5fa50732b1ccdec  LICENSES.txt
diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
new file mode 100644
index 0000000000..0cbab11d49
--- /dev/null
+++ b/package/librdkafka/librdkafka.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# librdkafka
+#
+################################################################################
+
+LIBRDKAFKA_VERSION = 2.13.2
+LIBRDKAFKA_SITE = $(call github,confluentinc,librdkafka,v$(LIBRDKAFKA_VERSION))
+LIBRDKAFKA_LICENSE = BSD-2-Clause
+LIBRDKAFKA_LICENSE_FILES = LICENSES.txt
+LIBRDKAFKA_INSTALL_STAGING = YES
+LIBRDKAFKA_DEPENDENCIES = lz4
+LIBRDKAFKA_CONF_OPTS = \
+	-DRDKAFKA_BUILD_EXAMPLES=OFF \
+	-DRDKAFKA_BUILD_TESTS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBRDKAFKA_CONF_OPTS += -DRDKAFKA_BUILD_STATIC=ON
+else
+LIBRDKAFKA_CONF_OPTS += -DRDKAFKA_BUILD_STATIC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZLIB=ON
+LIBRDKAFKA_DEPENDENCIES += zlib
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZLIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_CURL=ON
+LIBRDKAFKA_DEPENDENCIES += libcurl
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=ON
+LIBRDKAFKA_DEPENDENCIES += zstd
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=ON
+LIBRDKAFKA_DEPENDENCIES += openssl
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
