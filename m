Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9B9C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A723760F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A723760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC6E4023E;
	Tue, 17 Aug 2021 20:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rENjD7vuinfe; Tue, 17 Aug 2021 20:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF5B40246;
	Tue, 17 Aug 2021 20:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392A41BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BBE80D67
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s32Bl_1NYJ94 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:02:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE0A780D3A
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 20:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F8011814BC; Tue, 17 Aug 2021 22:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629230576; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=NHSGk/n4hHAUstEivx3Q+lcsg0yojMYPSrs2XTSQAWI=;
 b=YGsYYKKAqqgTGC1VWlGX5rkkuyyfPFDbqnwQFFW7tBw6JadbnLoBzsmsnz2J45e0xLZUlI
 t+I5qJRAMuMANgkBf6WYwVRHV/SjnPhocoSetv/Qp8YFNzmI8AUTT7icL0nZPMXBFh9kEJ
 Wzgu6tzgnlJ3Po4j7GEaTXZ93TRp13M=
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 22:01:39 +0200
Message-Id: <20210817200141.27827-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/boost: bump version to 1.77.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

* drop 0001-fenv.patch, issue [0] was marked fixed since boost 1.64 (commit [1])
* drop upstreamed patch 0002
* filesystem now depends on boost-atomic
* math broke the build without atomic ints, disable for now. reported at [2].

[0] https://svn.boost.org/trac/boost/ticket/11756
[1] https://github.com/boostorg/test/commit/cb2a1c2488dc77b9baf1b05781208a9639dfcd69
[2] https://github.com/boostorg/math/issues/673

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

compile-tested with these defconfigs:

BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FIBER=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_WAVE=y

BR2_nios2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_DATE_TIME=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y

BR2_sh=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_WAVE=y

BR2_microblazeel=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_WAVE=y

BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_FILESYSTEM=y
---
 package/boost/0001-fenv.patch                 | 37 ----------------
 ...2-src-event-cpp-fix-build-on-riscv32.patch | 42 -------------------
 package/boost/Config.in                       |  3 ++
 package/boost/boost.hash                      |  4 +-
 package/boost/boost.mk                        |  2 +-
 5 files changed, 6 insertions(+), 82 deletions(-)
 delete mode 100644 package/boost/0001-fenv.patch
 delete mode 100644 package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch

diff --git a/package/boost/0001-fenv.patch b/package/boost/0001-fenv.patch
deleted file mode 100644
index 9dc7848c93..0000000000
--- a/package/boost/0001-fenv.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Disable fenv.h in certain configurations
-
-The boost build system does not properly test whether fenv.h is
-available, and if it is, if it supports all the features used by
-Boost. This causes build failures with uClibc (reported upstream at
-https://svn.boost.org/trac/boost/ticket/11756) but also with glibc on
-specific architectures that don't have a full fenv implementation,
-such as NIOSII or Microblaze.
-
-To address this, we forcefully disable the use of fenv support in the
-affected configurations.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: add Microblaze/NIOSII exclusions.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/boost/config/platform/linux.hpp
-===================================================================
---- a/boost/config/platform/linux.hpp
-+++ b/boost/config/platform/linux.hpp
-@@ -48,6 +48,16 @@
- #endif
- 
- //
-+// uClibc has no support for fenv.h, and also a few architectures
-+// don't have fenv.h support at all (or incomplete support) even with
-+// glibc.
-+
-+//
-+#if defined(__UCLIBC__) || defined(__nios2__) || defined(__microblaze__)
-+#  define BOOST_NO_FENV_H
-+#endif
-+
-+//
- // If glibc is past version 2 then we definitely have
- // gettimeofday, earlier versions may or may not have it:
- //
diff --git a/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch b/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
deleted file mode 100644
index f1b84284ee..0000000000
--- a/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d2061419501bdd6761e9380ed5b91233f6c4e67e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 21 May 2021 21:30:04 +0200
-Subject: [PATCH] src/event.cpp: fix build on riscv32
-
-riscv32 fails to build because __NR_futex is not defined on this
-architecture:
-
-libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
-libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
-   38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
-      |                             ^~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/boostorg/log/commit/d2061419501bdd6761e9380ed5b91233f6c4e67e]
----
- src/event.cpp | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
-index 5485154d7..f576648c6 100644
---- a/libs/log/src/event.cpp
-+++ b/libs/log/src/event.cpp
-@@ -34,8 +34,13 @@
- // Some Android NDKs (Google NDK and older Crystax.NET NDK versions) don't define SYS_futex
- #if defined(SYS_futex)
- #define BOOST_LOG_SYS_FUTEX SYS_futex
--#else
-+#elif defined(__NR_futex)
- #define BOOST_LOG_SYS_FUTEX __NR_futex
-+// riscv32 defines a different system call instead of __NR_futex
-+#elif defined(__NR_futex_time64)
-+#define BOOST_LOG_SYS_FUTEX __NR_futex_time64
-+#else
-+#error "Unable to find a suitable futex"
- #endif
- 
- #if defined(FUTEX_WAIT_PRIVATE)
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9248c574f4..d9ce841a92 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -163,6 +163,8 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  The Boost Filesystem Library provides portable facilities to
@@ -252,6 +254,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
 	  Boost.Math includes several contributions in the domain of
 	  mathematics:
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index e6d44a76b6..96419506cd 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_74_0.html
-sha256  953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb  boost_1_75_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_77_0.html
+sha256  fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854  boost_1_77_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e72ddf897c..98ec30f98f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.75.0
+BOOST_VERSION = 1.77.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
