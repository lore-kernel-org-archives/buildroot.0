Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55249C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE2B83139;
	Sat,  4 Dec 2021 22:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDtvbnxAx6Rz; Sat,  4 Dec 2021 22:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D79831A9;
	Sat,  4 Dec 2021 22:01:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAD811BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9BD9401AF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09GCPzlYPnIu for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B498A400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:01:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 81F7E935A3; Sat,  4 Dec 2021 21:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:00:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe0e1020a3ec1c00fd1c8615bace962c720e0e46
X-Git-Newrev: 2db0ec06924d7f337755b9b920f5dd4c28f95e7f
X-Patchwork-Hint: ignore
Message-Id: <20211204215626.81F7E935A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/azmq: bump to version
 1.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2db0ec06924d7f337755b9b920f5dd4c28f95e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch and use AZMQ_NO_TESTS which is available since
  https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
- boost log (and so NPTL) is not a dependency since
  https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
- boost regex is not a dependency since
  https://github.com/zeromq/azmq/commit/209ccdc318bee195c92eaf86ed2fcc4acf08be1e
- Update indentation in hash file (two spaces)

https://github.com/zeromq/azmq/releases/tag/v1.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Conditionally-disable-test-and-doc-builds.patch | 43 ----------------------
 package/azmq/Config.in                             |  8 ++--
 package/azmq/azmq.hash                             |  5 +--
 package/azmq/azmq.mk                               |  4 +-
 4 files changed, 8 insertions(+), 52 deletions(-)

diff --git a/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch b/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
deleted file mode 100644
index 98975d27ed..0000000000
--- a/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d960f93fb52e373f76cfedbee5f4fb0c5276856a Mon Sep 17 00:00:00 2001
-From: RJ Ascani <rj.ascani@gmail.com>
-Date: Thu, 20 Jul 2017 15:53:40 -0700
-Subject: [PATCH] Conditionally disable test and doc builds
-
-Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b5b9cc..97006a4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -49,7 +49,9 @@ include_directories(${Boost_INCLUDE_DIRS}
-                     ${ZeroMQ_INCLUDE_DIRS}
-                     ${PROJECT_SOURCE_DIR})
-
--enable_testing()
-+if (BUILD_TESTING)
-+    enable_testing()
-+endif()
-
- macro(add_catch_test name)
-     if (TEST_REPORT_FORMAT)
-@@ -59,8 +61,12 @@ macro(add_catch_test name)
-     endif()
- endmacro()
-
--add_subdirectory(test)
--add_subdirectory(doc)
-+if (BUILD_TESTING)
-+    add_subdirectory(test)
-+endif()
-+if (BUILD_DOC)
-+    add_subdirectory(doc)
-+endif()
-
- install(DIRECTORY ${PROJECT_SOURCE_DIR}/azmq
-         DESTINATION include)
---
-2.13.3
-
diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 37131a260a..7bdd07ebf8 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_AZMQ
 	bool "azmq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, zeromq
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
@@ -11,9 +11,7 @@ config BR2_PACKAGE_AZMQ
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
@@ -21,10 +19,10 @@ config BR2_PACKAGE_AZMQ
 
 	  https://github.com/zeromq/azmq
 
-comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
+comment "azmq needs a toolchain w/ C++11, wchar and threads"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 comment "azmq needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index f5d24e79ce..6caf53582a 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-# https://github.com/zeromq/azmq/archive/v1.0.2.tar.gz
-sha256 25fa8b07756cffae95e25a55c7ea42efe02e8cd797552201aa771dd69cfc8fbf  azmq-1.0.2.tar.gz
-sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
+sha256  80cfb951c5614b8c2e55a59ea2e5723a18ebed08da80e5420e525d6bf273771a  azmq-1.0.3.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 918c6e1a36..a72b155664 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZMQ_VERSION = 1.0.2
+AZMQ_VERSION = 1.0.3
 AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
@@ -15,4 +15,6 @@ AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
 AZMQ_INSTALL_STAGING = YES
 AZMQ_INSTALL_TARGET = NO
 
+AZMQ_CONF_OPTS = -DAZMQ_NO_TESTS=ON
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
