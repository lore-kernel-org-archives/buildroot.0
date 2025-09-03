Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70799CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 13:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F03040702;
	Wed,  3 Sep 2025 13:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdbTMR_DAa4i; Wed,  3 Sep 2025 13:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 276CA41FB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276CA41FB0;
	Wed,  3 Sep 2025 13:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 902C32BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E19417F0
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZ77pzbRiDXm for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 13:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A958340702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A958340702
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A958340702
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:38:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D8091814B9; Wed,  3 Sep 2025 15:38:41 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 15:37:52 +0200
Message-ID: <20250903133754.1781943-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1756906721; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=6i1myBV/w3lFnAwnk+P1rKsppgAwXV+ZxdLBJH/cNyc=;
 b=tJSY9c7AsXVz8f3e93ctjFjnnpB3kU6XAZJyhSDK/1RgNTSsPSRDBbNRP/QsRty60XaOpD
 EGNjLsoZ92WOWZ9XaaiDMFor5H85kE8jHUJx1hVv5bCMDt0O9a+3FZg+KogDJDdQhJ7XYi
 tNz3JgMxRC+SBxMFmcN1XdMJqPQxnKk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=tJSY9c7A
Subject: [Buildroot] [PATCH] package/boost: remove dependencies on
 Boost.System
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Boost.System is a header only library since Boost 1.69.0 [0].

A Stub Library remained for backward compatibility. This
mainly affects CMake Packages that use FindPackage and
explicitly list 'system'.

For Boost internal modules this is not the case so remove this
dependency.

Buildroot packages should select BR2_PACKAGE_BOOST_SYSTEM explicitly
if needed and not rely on a proxy dependency from other boost packages.

[0] https://github.com/boostorg/system/blob/develop/doc/system/changes.adoc#changes-in-boost-169

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/boost/Config.in         | 13 -------------
 package/libcpprestsdk/Config.in |  1 +
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index c7c90aa9ab..5d4e530a6f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_BOOST_ATOMIC
 
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Useful time utilities. C++11.
 
@@ -62,7 +61,6 @@ config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Contract programming for C++.
 
@@ -77,7 +75,6 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
@@ -117,7 +114,6 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  C++11 userland threads library.
 
@@ -134,7 +130,6 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  The Boost Filesystem Library provides portable facilities to
 	  query and manipulate paths, files, and directories.
@@ -184,7 +179,6 @@ config BR2_PACKAGE_BOOST_LOCALE
 	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
 		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -209,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
@@ -279,7 +272,6 @@ config BR2_PACKAGE_BOOST_PYTHON
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  A complete system for random number generation.
 
@@ -312,7 +304,6 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_TIMER
 	help
 	  Support for simple program testing, full unit testing, and for
@@ -323,7 +314,6 @@ config BR2_PACKAGE_BOOST_THREAD
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
@@ -333,7 +323,6 @@ comment "boost-thread needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Event timer, progress timer, and progress display classes.
 
@@ -341,7 +330,6 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
@@ -371,7 +359,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..7688021ed0 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
