Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944BFA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D258406AF;
	Fri,  2 Jan 2026 17:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfbaCCF3vpZQ; Fri,  2 Jan 2026 17:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5761A406D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374696;
	bh=VnmLMTef3GUtLzj7Tf5k/cEtfad7dBEnm6YjisWi7SU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QVltevAY17EyuOljXcfGwK3O24ruCNCJMEG1HUgdElBzqw6x6WvL1R4wMlx95jWNi
	 PpB4yyOoMingT4Noz6Q8VuluV0Cs1mAiEvjb1CkK30eU3sxVwNmltqzShcHNU9iGl2
	 ynYH1BNPURfQw6pmmlMS/pWBf/W5q05a+FHNQ3pxNPb+pZREQsK7H7XPUPnyprsyYe
	 wtQp6i9YtCtIGnw/ftj2PXRlfAVvUoCDhxH5IxUYuRtHDVDL0F327rNgf4vMAQQVxT
	 2Jiaf8iY04TQqXzQIXxo0vCvmdkzhldzxG4OrzA0dnmZHvqcEuGRVi+MFyvxqizzf/
	 0ZXXPHEQj1UTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5761A406D0;
	Fri,  2 Jan 2026 17:24:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 294B2351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B43B60B08
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hxa2GPKa6wdl for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B54460AD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B54460AD4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4484E8803D; Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:24:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c659e0383d8f66b9bf89b5a30de89476ef48d5bc
X-Git-Newrev: fbb5c740589bd3a969a8de56d6e816706405606a
X-Patchwork-Hint: ignore
Message-Id: <20260102172453.4484E8803D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: remove dependencies on
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbb5c740589bd3a969a8de56d6e816706405606a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index c7c90aa9ab..a9ab4836b5 100644
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
 
@@ -306,13 +298,14 @@ comment "boost-stacktrace needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
 	help
-	  Operating system support, including the diagnostics support
-	  that will be part of the C++0x standard library.
+	  Extensible Error Reporting.
+
+	  This library is now header only. Building a stub library
+	  is still supported for backward compatibility.
 
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_TIMER
 	help
 	  Support for simple program testing, full unit testing, and for
@@ -323,7 +316,6 @@ config BR2_PACKAGE_BOOST_THREAD
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
@@ -333,7 +325,6 @@ comment "boost-thread needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Event timer, progress timer, and progress display classes.
 
@@ -341,7 +332,6 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
@@ -371,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
