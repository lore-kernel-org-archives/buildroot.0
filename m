Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEE606A337
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=brbn0rEq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 778E4608F5;
	Thu, 22 Oct 2026 22:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpI4afulPLCI; Thu, 22 Oct 2026 22:30:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FBFE60883
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708254;
	b=rkmscUHzdUVUTvrHoUgubw+fNuaQQgIR7GZ23pkB/vef+Da6W3MV/8p6VJ9EJTgjGYPU
	 hFC2F0NgzmUX6cLoDEgfgyVXxiqKtvJZYbD26LM5zrA4OXsxyJO7YqjiHbwcozQjr1f8+
	 pmptgJ92BOght1yxmPsGmVxZu5ZhF7eLqm6KmQUwAmC0t50B/hAbNUhvI+QhxEXAmiFr/
	 LCchNyajK+CjErew/L5tmWoMXRnD/kcHkUCcv+n2BwdmdLLXSJy3Wu6nlySbhHPSh6n+0
	 OWhUoJ6xC9lWZbEt1GUMAsseoHaNtfVZbQIKd5/NWU6oL6kgQMTcmOj1zoqFqaX7OHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tQIH/zHIkHmc5xqWELN8yRUpgpdBasraYtuRt2BIUsQ=;
	b=sYFmeEsQoPOY8XvzgS069R69PN+BwhohWtMIG6cwlCv904cADUDtwWpfQqRX3mQ9E5eL
	 mof+lBVTUiAitjMd9rR3SHT5/e6oY8lz6WMpD82ba/HdJgI6i7+JhmUxzqa64AoQLKXZj
	 wd79MMgMQeOp762+bGo3IQhHEKBUl+bvPDmz6+mfEnv7CUbUZ8XTRE1Yd27XceryUSVYf
	 +JIuzbT7EAN4+YC4bm22lujc4MrrMz4OxEW7KPcyRRv/uLpENlyGFhyfwATVVN3cYx/zh
	 yBXyvc8vQ0eMPiwv3UlR1J2+Zc8lT6w0KsO5BY0oLxmOb1dCvQ059YPAYa5FCkquW5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708254;
	bh=tQIH/zHIkHmc5xqWELN8yRUpgpdBasraYtuRt2BIUsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=brbn0rEqP/pdyqd2NkrWSrgcSxPXGfLCoFUV3Dir3Mg5ZujJVIhIve6K1GPGQJGSL
	 GUN7Y16q8LIAKa0bvZD9n5dkQDLuzrqBOZW5MAPvIbfeu2yaqh7HJerXFaieD1sFA0
	 Q1eE/5Je658ZBI1Z2zMbRpFSa+3nr3yyu5GD2FAuX2KLzSu6pVlmd8DdGrzPakIiEu
	 Hf6a0fUJf+0//Y/ShRGNGl9h9mREIrivtgc+GdQMZ+bCPWVPVJ+rF9kiP/wi1Ucc3o
	 8RC4+C7UEW90okyhjB2lXqNsfqGTHz01kLQyMQG7ACdHrg+dgU8F6pjlxGP8mNNlBf
	 RqxvBNimBfNrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FBFE60883;
	Thu, 22 Oct 2026 22:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B4713C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100F1401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG216XIhoDJT for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 29D7C40111
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708249;
 b=jQzb9PvC9TZ4O1Ytftgqa+EVAmTtyqtYepw0/jf+CInQzOCk+7W4cJPdLqLchK0GPLBK
 Vo4bU144yLIN5uoWA/L0B5rZyoMyY01ve+hQ0ZfMRB2HZYQ4zl4Qz5BDWIckaXwLMOJqB
 61pL8SixgpLyDHJlesRF1d8tQmIrkiiewwf5Bgh23+SdpYLlFSLoVZmntQ0YKaKFX1ey/
 OVq+4J6HExshOjNjItoiuJLaINpEkpF3kQyxKMoFBWtLQB2R3uqBYy6LWVnDkBg/sLDCG
 hM9T4nvsCm5tyu9Ln4+qEC5lcNPpC9GUWp5/S9yrH0fVN04qg1MYSWd1YyXhkQy7IGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708249;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=779hvdWqG5Y7gzsA5UHkYdM2E3VhbfRE7R0hSVvfU+s=;
 b=g0/DXjWur3e86/wvDee1p2Fv6ECYg5l9chfZosHlWDKYICgbUGxxm6loHYiqVqFHzz5S
 LH0yG5eD2H3LCF+5GGphrNNRDnOSpEy8owwD6+W+SaHOUnqyelRzT6SCDKddPvujtnI2Z
 JH3qxxYIu/cK/NRFA1grZGayNAQNZ9BAmuBZIm3fiJdzTqOvaWHtHAy3BneDVgR+6B74s
 iVa/E9iDlIMdhactfLji9gq+aTfsdEeMZm8YS/nEWpaI/KHdJtJQkQ+fSERQ4IQGzgHPE
 FEW0hl1hUwimf419bfh7DMsyyehZiH7Pq7BTaHQFJMM1d3rQ5OD57n++jK8wuzij4EA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D7C40111
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8A5A9C608; Thu, 22 Oct 2026 22:29:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 00:30:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 390d60ac667ca9c8464f1770d68a93625f5d4c64
X-Git-Newrev: 93722ec4fabdc4678447371e2eb64ca8c8b10470
X-Patchwork-Hint: ignore
Message-Id: <20261022222924.D8A5A9C608@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: link against the new
 librdkafka package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93722ec4fabdc4678447371e2eb64ca8c8b10470
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

By this, we can drop 0001-lib-librdkafka-only-require-a-C-compiler.patch.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-lib-librdkafka-only-require-a-C-compiler.patch | 118 ---------------------
 package/fluent-bit/Config.in                       |   2 +-
 package/fluent-bit/fluent-bit.mk                   |   5 +-
 3 files changed, 4 insertions(+), 121 deletions(-)

diff --git a/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
deleted file mode 100644
index 660ed7bed4..0000000000
--- a/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 7329316bdcc72aceb6bbbdf8711f5bf8894c2a15 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Tue, 25 Jul 2023 09:10:41 +0200
-Subject: [PATCH] lib: librdkafka: only require a C compiler
-
-Upstream: https://github.com/confluentinc/librdkafka/pull/4366
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- lib/librdkafka-2.10.1/CMakeLists.txt          | 22 +++++++++++--
- lib/librdkafka-2.10.1/examples/CMakeLists.txt | 31 ++++++++++++-------
- 2 files changed, 39 insertions(+), 14 deletions(-)
-
-diff --git a/lib/librdkafka-2.10.1/CMakeLists.txt b/lib/librdkafka-2.10.1/CMakeLists.txt
-index f3d05bad7..8ef47053a 100644
---- a/lib/librdkafka-2.10.1/CMakeLists.txt
-+++ b/lib/librdkafka-2.10.1/CMakeLists.txt
-@@ -3,7 +3,16 @@ cmake_minimum_required(VERSION 3.5)
- include("packaging/cmake/parseversion.cmake")
- parseversion("src/rdkafka.h")
- 
--project(RdKafka VERSION ${RDKAFKA_VERSION})
-+project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
-+
-+# Check for CXX support
-+include(CheckLanguage)
-+check_language(CXX)
-+if(CMAKE_CXX_COMPILER)
-+  enable_language(CXX)
-+else()
-+  message(STATUS "C++ compiler not found, skipping C++ support")
-+endif()
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
- 
-@@ -181,7 +190,11 @@ endif()
- 
- option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
- option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
--option(RDKAFKA_BUILD_TESTS "Build tests" ON)
-+
-+if(CMAKE_CXX_COMPILER)
-+    option(RDKAFKA_BUILD_TESTS "Build tests" ON)
-+endif()
-+
- if(WIN32)
-     option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
- endif(WIN32)
-@@ -279,7 +292,10 @@ install(
- )
- 
- add_subdirectory(src)
--add_subdirectory(src-cpp)
-+
-+if(CMAKE_CXX_COMPILER)
-+  add_subdirectory(src-cpp)
-+endif()
- 
- if(RDKAFKA_BUILD_EXAMPLES)
-   add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.10.1/examples/CMakeLists.txt b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-index 91851d2cb..6874195ce 100644
---- a/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-@@ -5,8 +5,10 @@ endif(WIN32)
- add_executable(producer producer.c ${win32_sources})
- target_link_libraries(producer PUBLIC rdkafka)
- 
--add_executable(producer_cpp producer.cpp ${win32_sources})
--target_link_libraries(producer_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(producer_cpp producer.cpp ${win32_sources})
-+    target_link_libraries(producer_cpp PUBLIC rdkafka++)
-+endif()
- 
- add_executable(consumer consumer.c ${win32_sources})
- target_link_libraries(consumer PUBLIC rdkafka)
-@@ -14,14 +16,20 @@ target_link_libraries(consumer PUBLIC rdkafka)
- add_executable(rdkafka_performance rdkafka_performance.c ${win32_sources})
- target_link_libraries(rdkafka_performance PUBLIC rdkafka)
- 
--add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
--target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
-+    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
-+endif()
- 
--add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
--target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
-+    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
-+endif()
- 
--add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
--target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
-+    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
-+endif()
- 
- add_executable(misc misc.c ${win32_sources})
- target_link_libraries(misc PUBLIC rdkafka)
-@@ -73,7 +81,8 @@ if(NOT WIN32)
-     add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
-     target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
- 
--    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
--    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
--
-+    if(CMAKE_CXX_COMPILER)
-+        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
-+        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
-+    endif()
- endif(NOT WIN32)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 2af6279744..f8494064ac 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
+	select BR2_PACKAGE_LIBRDKAFKA
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_MSGPACK_C
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index f571896797..a3a44b8dbe 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -10,8 +10,8 @@ FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml msgpack-c \
-	nghttp2 openssl sqlite zstd
+FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex librdkafka libyaml \
+	msgpack-c nghttp2 openssl sqlite zstd
 
 FLUENT_BIT_CMAKE_BACKEND = ninja
 
@@ -22,6 +22,7 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_KAFKA=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_MSGPACK=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_SQLITE=Yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
