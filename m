Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE7BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A02660E73
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A02660E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E28826B7;
	Sat,  4 Sep 2021 18:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vT_LfbjwPi5b; Sat,  4 Sep 2021 18:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7B682AF5;
	Sat,  4 Sep 2021 18:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C64D41BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847CD40229
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNcXEBDw5qjw for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6FC94027C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A7488834A; Sat,  4 Sep 2021 18:23:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 23:37:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9ed05a03fbbdca6d5c0e638479b5cdd49e65ff5
X-Git-Newrev: d39d8f7cee9b4634e6f490020204f63fae419e8e
X-Patchwork-Hint: ignore
Message-Id: <20210904182355.8A7488834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: bump version to 1.77.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d39d8f7cee9b4634e6f490020204f63fae419e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* drop 0001-fenv.patch, issue [0] was marked fixed since boost 1.64 (commit [1])
* drop upstreamed patch 0002
* filesystem now depends on boost-atomic
* math broke the build without always lockfree atomic ints, disable for now. reported at [2].

[0] https://svn.boost.org/trac/boost/ticket/11756
[1] https://github.com/boostorg/test/commit/cb2a1c2488dc77b9baf1b05781208a9639dfcd69
[2] https://github.com/boostorg/math/issues/673

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Arnout: improve propagation of reverse dependencies:
 - also update comment of cc-tool;
 - add boost-filesystem to reason of gnuradio, libcpprestsdk, uhd;
 - move dependency to arch-deps of mongodb]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bitcoin/Config.in                          |  2 +-
 package/boost/0001-fenv.patch                      | 37 -------------------
 .../0002-src-event-cpp-fix-build-on-riscv32.patch  | 42 ----------------------
 package/boost/Config.in                            |  3 ++
 package/boost/boost.hash                           |  4 +--
 package/boost/boost.mk                             |  2 +-
 package/botan/Config.in                            |  4 +--
 package/cc-tool/Config.in                          |  2 ++
 package/gnuradio/Config.in                         |  2 +-
 package/i2pd/Config.in                             |  3 ++
 package/libcpprestsdk/Config.in                    |  2 +-
 package/mongodb/Config.in                          |  1 +
 package/osm2pgsql/Config.in                        |  2 ++
 package/pulseview/Config.in                        |  2 ++
 package/supertux/Config.in                         |  2 ++
 package/uhd/Config.in                              |  2 +-
 16 files changed, 24 insertions(+), 88 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 7ce4f80656..a344811d6b 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
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
diff --git a/package/botan/Config.in b/package/botan/Config.in
index 341fa7c622..635fe1836d 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -18,8 +18,8 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
-	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index 2661592d7f..fa5674b36d 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CC_TOOL
 	bool "cc-tool"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_WCHAR # boost-filesystem
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
@@ -18,6 +19,7 @@ config BR2_PACKAGE_CC_TOOL
 	  https://github.com/dashesy/cc-tool/
 
 comment "cc-tool needs a toolchain w/ C++, threads, wchar, gcc >= 4.9 "
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 738088802e..183b49fe9b 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index 5b9ac33e28..c1ba08ef75 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_I2PD
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
@@ -28,10 +29,12 @@ config BR2_PACKAGE_I2PD
 comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
 
 comment "i2pd needs exception_ptr"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index 97f00e3383..e533b30393 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_BOOST
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 493c592413..1ea4282573 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	# ARM needs LDREX/STREX, so ARMv6+
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	default y if BR2_aarch64 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 1f1200cf46..70d59e6c6f 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_WCHAR # boost, fmt, libosmium
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -22,5 +23,6 @@ config BR2_PACKAGE_OSM2PGSQL
 	  https://osm2pgsql.org
 
 comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b8d94332a3..e7a73e3765 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PULSEVIEW
 	# libsigrok->libglib2:
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libsigrok->libzip
@@ -32,6 +33,7 @@ config BR2_PACKAGE_PULSEVIEW
 comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index 5cacdd658e..285f19694b 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_USE_WCHAR # Boost
@@ -36,6 +37,7 @@ comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 6, NPTL, dynamic l
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index f61bbf0e8f..0d68fda171 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_UHD
 	bool "uhd"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
