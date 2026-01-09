Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1AD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B41C583C80;
	Tue, 13 Jan 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MITjumwMiAxs; Tue, 13 Jan 2026 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8578D83C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333037;
	bh=yEK1vB5YMf3mmX7uhgMO3Tj6RC8qncgTRM9ecJ9XHu8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qoa59ZbKQgNJf0516oroP4SfPYGJhREknc9dkV81C4slr0Wk33VRgRJBQADF+rL6J
	 UROgdM52ALSeSDhCsVTTiDQt6oWy4BvNGZZIo8YG9ur8lyYO+dFvaOB2C7i1pqU6BW
	 XFRhDznF/Z5TRfvB0/5DEDMBNiVwikF9W0at5O8fuT59HUiAZFTEyhMZHLoOI7wu6y
	 5Fl0Raot4pIr/78nhQuTK2OZ84AL7jXU6Q/iMZjzV7HcIyXUtQBCnxeNXOGzBivSNf
	 d8qKID/BhoLZBkbyuobPK337L11wr+pFKFTIx9C4mq/sybF222ILXA9K4mrFH54KbG
	 fmHSV7A1mnwoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8578D83C47;
	Tue, 13 Jan 2026 19:37:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 660C51C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7421402F4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv6Qr9-3gF66 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD044043B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD044043B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69F5786184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:01:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1de40783e078d032a0dcbfc39e3e76b0f224a2d3
X-Git-Newrev: 5f9c2ff313a34d995d422a770535650718bacc98
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.69F5786184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/boost: remove
 dependencies on Boost.System
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f9c2ff313a34d995d422a770535650718bacc98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit fbb5c740589bd3a969a8de56d6e816706405606a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
