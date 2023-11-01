Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A01C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25C26430E5;
	Wed,  1 Nov 2023 11:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C26430E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4t03dnCwVb5o; Wed,  1 Nov 2023 11:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB8B0430DE;
	Wed,  1 Nov 2023 11:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB8B0430DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC7C21BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B21674EC90
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21674EC90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zP1lucsuJtt3 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:49:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67374EC8B
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67374EC8B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 896998632B; Wed,  1 Nov 2023 11:49:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db3a730e8ce42b8f70f469eafe53e9e5981e57b7
X-Git-Newrev: 0c9dc366bf92caed532ac225fd0406e9c09ff42f
X-Patchwork-Hint: ignore
Message-Id: <20231101114927.896998632B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ace: bump to version 7.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c9dc366bf92caed532ac225fd0406e9c09ff42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- C++14 is mandatory since version 7.1.0

https://github.com/DOCGroup/ACE_TAO/blob/ACE%2BTAO-7_1_1/ACE/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 -
 ...-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch | 52 --------------------
 ...-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch | 56 ----------------------
 package/ace/Config.in                              |  6 +--
 package/ace/ace.hash                               |  6 +--
 package/ace/ace.mk                                 |  4 +-
 6 files changed, 8 insertions(+), 118 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 638d3b48a2..23c0811de6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -124,8 +124,6 @@ boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch Up
 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch Upstream
 package/4th/0001-avoid-regen-during-install.patch Upstream
-package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch Upstream
-package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch Upstream
 package/acl/0001-Build-with-old-GCC-versions.patch Upstream
 package/acpid/0001-dont-use-isfdtype.patch Upstream
 package/alchemy/0001-toolchains-remove-hash-style-management.patch Upstream
diff --git a/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
deleted file mode 100644
index ad82c10172..0000000000
--- a/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e06cadc3b95a577e6a8bbc94f93dd063710c73a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 Apr 2022 15:25:49 +0200
-Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl
-
-Fix the following build failure with libressl:
-
-/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
-  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
-      |       ^~~~~~~~~~~~
-      |       BIO_set_init
-
-Fixes:
- - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/DOCGroup/ACE_TAO/commit/e06cadc3b95a577e6a8bbc94f93dd063710c73a1]
----
- ACE/ace/SSL/SSL_Asynch_BIO.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
-index a657d8a14e6f7..64aa14c6ab9a7 100644
---- a/ace/SSL/SSL_Asynch_BIO.cpp
-+++ b/ace/SSL/SSL_Asynch_BIO.cpp
-@@ -41,7 +41,7 @@ extern "C"
- 
- #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
- static BIO_METHOD methods_ACE =
-   {
-     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
-@@ -68,14 +68,14 @@ static BIO_METHOD methods_ACE =
- #else
- static BIO_METHOD* methods_ACE;
- # define BIO_set_num(b, val)
--#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
-+#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
- 
- ACE_BEGIN_VERSIONED_NAMESPACE_DECL
- 
- BIO *
- ACE_SSL_make_BIO (void * ssl_asynch_stream)
- {
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-   BIO * const pBIO = BIO_new (&methods_ACE);
- #else
-   if (!methods_ACE)
diff --git a/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
deleted file mode 100644
index 4f9fde5579..0000000000
--- a/package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 82b139f921ddb549c1bd236030bbc86e314852b3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 Feb 2023 14:20:11 +0100
-Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl >=
- 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-/tmp/instance-17/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:45:19: error: variable 'BIO_METHOD methods_ACE' has initializer but incomplete type
-   45 | static BIO_METHOD methods_ACE =
-      |                   ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/7f40d6dde03134238151c248fbbd66e4713546cb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/DOCGroup/ACE_TAO/pull/2053]
----
- ACE/ace/SSL/SSL_Asynch_BIO.cpp | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
-index 0faa775fc0..5543598873 100644
---- a/ace/SSL/SSL_Asynch_BIO.cpp
-+++ b/ace/SSL/SSL_Asynch_BIO.cpp
-@@ -41,7 +41,8 @@ extern "C"
- 
- #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
- static BIO_METHOD methods_ACE =
-   {
-     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
-@@ -68,14 +69,15 @@ static BIO_METHOD methods_ACE =
- #else
- static BIO_METHOD* methods_ACE;
- # define BIO_set_num(b, val)
--#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
-+#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L) */
- 
- ACE_BEGIN_VERSIONED_NAMESPACE_DECL
- 
- BIO *
- ACE_SSL_make_BIO (void * ssl_asynch_stream)
- {
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
-   BIO * const pBIO = BIO_new (&methods_ACE);
- #else
-   if (!methods_ACE)
--- 
-2.39.0
-
diff --git a/package/ace/Config.in b/package/ace/Config.in
index 5000f2352f..cf3819284b 100644
--- a/package/ace/Config.in
+++ b/package/ace/Config.in
@@ -3,14 +3,14 @@ config BR2_PACKAGE_ACE
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  The ADAPTIVE Communication Environment (ACE(TM))
 	  An OO Network Programming Toolkit in C++.
 
 	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
 
-comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 4.8"
+comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/ace/ace.hash b/package/ace/ace.hash
index 2387927879..0c5ed12c97 100644
--- a/package/ace/ace.hash
+++ b/package/ace/ace.hash
@@ -1,6 +1,6 @@
-# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.0.6.tar.bz2.md5:
-md5  d1656851619aff15365270ccf2d56c6e  ACE-7.0.6.tar.bz2
+# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.1.1.tar.bz2.md5:
+md5  6c86ec6c7879703783b9749d5409a67f  ACE-7.1.1.tar.bz2
 
 # Locally Computed:
-sha256  4a0cd7da4851f769fddfcf33f663eba4afad824efeff9f59f134c4640ee80216  ACE-7.0.6.tar.bz2
+sha256  fe5fdeab1dddf4fdd99f73c59420886cf61ca2ce92adf2cc6b612b752986df62  ACE-7.1.1.tar.bz2
 sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 29555eea74..1f79508629 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACE_VERSION = 7.0.6
+ACE_VERSION = 7.1.1
 ACE_SOURCE = ACE-$(ACE_VERSION).tar.bz2
 ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
 ACE_LICENSE = DOC
@@ -17,7 +17,7 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBRARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
-ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++11
+ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++14
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
 ACE_CPPFLAGS += -O0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
