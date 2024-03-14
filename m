Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB7C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF9641511;
	Thu, 14 Mar 2024 18:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjmGhkpWxOmw; Thu, 14 Mar 2024 18:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EB041560
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EB041560;
	Thu, 14 Mar 2024 18:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 213981BF422
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF5C40995
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXSDjaiGPSLq for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820F740849
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 820F740849
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A8318833C; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 19:32:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7eb1dcbb65682b2e800b6523688102ffb4d4821
X-Git-Newrev: 9246579f01d768c038fe5891f77937c977dbb76d
X-Patchwork-Hint: ignore
Message-Id: <20240314184919.6A8318833C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/znc: bump version to 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9246579f01d768c038fe5891f77937c977dbb76d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed all patches, they are included in this release.

Bumped gcc dependency to >= 8 according to changelog:
https://wiki.znc.in/ChangeLog/1.9.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 -
 .../znc/0001-LibreSSL-3.5-opaqued-structures.patch | 27 ---------
 package/znc/0002-Fix-build-with-libressl.patch     | 68 ----------------------
 ...-and-DH_get0_key-have-existed-since-Libre.patch | 30 ----------
 ...support-SWIG-4.1.0-drop-support-for-4.0.1.patch | 53 -----------------
 package/znc/Config.in                              |  6 +-
 package/znc/znc.hash                               |  2 +-
 package/znc/znc.mk                                 |  2 +-
 8 files changed, 5 insertions(+), 186 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f413e5a497..0a99309682 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1429,9 +1429,6 @@ package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch Upstrea
 package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch Upstream
 package/zip/0008-fix-musl-static-build.patch Upstream
 package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch Upstream
-package/znc/0001-LibreSSL-3.5-opaqued-structures.patch Upstream
-package/znc/0002-Fix-build-with-libressl.patch Upstream
-package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch Upstream
 package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch Upstream
 support/dependencies/check-host-asciidoc.sh Shellcheck
 support/dependencies/check-host-cmake.sh Shellcheck
diff --git a/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch b/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch
deleted file mode 100644
index d0019e21a4..0000000000
--- a/package/znc/0001-LibreSSL-3.5-opaqued-structures.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 87f3dac8ba8dea5628b05416bdef454b4ef2d236 Mon Sep 17 00:00:00 2001
-From: Charlie Li <git@vishwin.info>
-Date: Mon, 14 Mar 2022 17:36:36 -0400
-Subject: [PATCH] LibreSSL 3.5 opaqued structures
-
-Downloaded from upstream commit
-https://github.com/znc/Csocket/commit/87f3dac8ba8dea5628b05416bdef454b4ef2d236
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(rebased for znc)
----
- Csocket.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Csocket.cc b/Csocket.cc
-index 46a3bfd..a30da14 100644
---- a/third_party/Csocket/Csocket.cc
-+++ b/third_party/Csocket/Csocket.cc
-@@ -61,7 +61,7 @@
- #  define OPENSSL_NO_TLS1_1            /* 1.0.1-pre~: openssl/openssl@637f374ad49d5f6d4f81d87d7cdd226428aa470c */
- #  define OPENSSL_NO_TLS1_2            /* 1.0.1-pre~: openssl/openssl@7409d7ad517650db332ae528915a570e4e0ab88b */
- # endif
--# ifndef LIBRESSL_VERSION_NUMBER /* forked from OpenSSL 1.0.1g, sets high version "with the idea of discouraging software from relying on magic numbers for detecting features"(!) */
-+# if !defined(LIBRESSL_VERSION_NUMBER) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x03050000fL)
- #  if OPENSSL_VERSION_NUMBER >= 0x10100000
- #   undef HAVE_ERR_REMOVE_THREAD_STATE /* 1.1.0-pre4: openssl/openssl@8509dcc9f319190c565ab6baad7c88d37a951d1c */
- #   undef OPENSSL_NO_SSL2              /* 1.1.0-pre4: openssl/openssl@e80381e1a3309f5d4a783bcaa508a90187a48882 */
diff --git a/package/znc/0002-Fix-build-with-libressl.patch b/package/znc/0002-Fix-build-with-libressl.patch
deleted file mode 100644
index b8d22445fb..0000000000
--- a/package/znc/0002-Fix-build-with-libressl.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From dcb5f3df82fcfec48aab356252067dc897fb98cf Mon Sep 17 00:00:00 2001
-From: Alexey Sokolov <alexey+znc@asokolov.org>
-Date: Sun, 14 Nov 2021 00:45:01 +0000
-Subject: [PATCH] Fix build with libressl
-
-It got another feature of openssl implemented, which broke this
-
-Downloaded from upstream commit
-https://github.com/znc/znc/commit/dcb5f3df82fcfec48aab356252067dc897fb98cf
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt                   | 14 ++++++++++++++
- include/znc/zncconfig.h.cmake.in |  1 +
- modules/schat.cpp                |  3 +--
- 3 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0913ff2691..1f77f5632b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -82,6 +82,20 @@ endmacro()
- tristate_option(OPENSSL "Support SSL")
- if(WANT_OPENSSL)
- 	find_package(OpenSSL ${TRISTATE_OPENSSL_REQUIRED})
-+
-+	if(OPENSSL_FOUND)
-+		# SSL_SESSION was made opaque in OpenSSL 1.1.0;
-+		# LibreSSL gained that function later too.
-+		# TODO: maybe remove this check at some point, and stop supporting old
-+		# libssl versions
-+		function(check_SSL_SESSION_get0_cipher)
-+			set(CMAKE_REQUIRED_LIBRARIES ${OPENSSL_LIBRARIES})
-+			set(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
-+			check_cxx_symbol_exists(SSL_SESSION_get0_cipher openssl/ssl.h
-+				HAVE_SSL_SESSION_get0_cipher)
-+		endfunction()
-+		check_SSL_SESSION_get0_cipher()
-+	endif()
- endif()
- set(HAVE_LIBSSL "${OPENSSL_FOUND}")
- 
-diff --git a/include/znc/zncconfig.h.cmake.in b/include/znc/zncconfig.h.cmake.in
-index 5426b828af..7b07b99aec 100644
---- a/include/znc/zncconfig.h.cmake.in
-+++ b/include/znc/zncconfig.h.cmake.in
-@@ -31,6 +31,7 @@
- #define HAVE_PTHREAD 1
- #cmakedefine HAVE_THREADED_DNS 1
- #cmakedefine HAVE_LIBSSL 1
-+#cmakedefine HAVE_SSL_SESSION_get0_cipher 1
- #cmakedefine HAVE_IPV6 1
- #cmakedefine HAVE_ZLIB 1
- #cmakedefine HAVE_I18N 1
-diff --git a/modules/schat.cpp b/modules/schat.cpp
-index aa7a338dcd..66e67e695c 100644
---- a/modules/schat.cpp
-+++ b/modules/schat.cpp
-@@ -25,8 +25,7 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- 
--#if !defined(OPENSSL_VERSION_NUMBER) || defined(LIBRESSL_VERSION_NUMBER) || \
--    OPENSSL_VERSION_NUMBER < 0x10100007
-+#ifndef HAVE_SSL_SESSION_get0_cipher
- /* SSL_SESSION was made opaque in OpenSSL 1.1.0, cipher accessor was added 2
- weeks before the public release.
- See openssl/openssl@e92813234318635639dba0168c7ef5568757449b. */
diff --git a/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch b/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch
deleted file mode 100644
index a2946643fc..0000000000
--- a/package/znc/0003-DH_set0_pqg-and-DH_get0_key-have-existed-since-Libre.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7c8ac8981a8516edaba469641aff4d8ec452ae9e Mon Sep 17 00:00:00 2001
-From: Charlie Li <git@vishwin.info>
-Date: Mon, 14 Mar 2022 18:32:46 -0400
-Subject: [PATCH] DH_set0_pqg and DH_get0_key have existed since LibreSSL 2.7
-
-https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf
-https://github.com/libressl-portable/openbsd/commit/3789e379353c1d53313a249461b3d735de4ac742
-
-Downloaded from upstream commit
-https://github.com/znc/znc/commit/7c8ac8981a8516edaba469641aff4d8ec452ae9e
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/crypt.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/modules/crypt.cpp b/modules/crypt.cpp
-index 7655371b6e..68f7aafcea 100644
---- a/modules/crypt.cpp
-+++ b/modules/crypt.cpp
-@@ -68,7 +68,8 @@ class CCryptMod : public CModule {
-     CString m_sPrivKey;
-     CString m_sPubKey;
- 
--#if OPENSSL_VERSION_NUMBER < 0X10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0X10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x02070000fL)
-     static int DH_set0_pqg(DH* dh, BIGNUM* p, BIGNUM* q, BIGNUM* g) {
-         /* If the fields p and g in dh are nullptr, the corresponding input
-          * parameters MUST be non-nullptr.  q may remain nullptr.
diff --git a/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch b/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
deleted file mode 100644
index cb0988e631..0000000000
--- a/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From fecdd9895894b3afe903021b0843a422eb4d3308 Mon Sep 17 00:00:00 2001
-From: Alexey Sokolov <alexey+znc@asokolov.org>
-Date: Sat, 5 Nov 2022 12:54:40 +0000
-Subject: [PATCH] Add support SWIG 4.1.0, drop support for < 4.0.1
-
-https://bugs.gentoo.org/878587
-
-Upstream: https://github.com/znc/znc/commit/fecdd9895894b3afe903021b0843a422eb4d3308
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt                   | 2 +-
- modules/modperl/CMakeLists.txt   | 1 -
- modules/modpython/CMakeLists.txt | 1 -
- 3 files changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9d43578e0e..efab0ee1ee 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -173,7 +173,7 @@ if(WANT_PYTHON AND NOT EXISTS
- 	endif()
- endif()
- if(search_swig)
--	find_package(SWIG 3.0.0)
-+	find_package(SWIG 4.0.1)
- 	if(NOT SWIG_FOUND)
- 		message(FATAL_ERROR
- 			"Can't find SWIG, therefore Perl and Python aren't supported. "
-diff --git a/modules/modperl/CMakeLists.txt b/modules/modperl/CMakeLists.txt
-index e18fe47644..a87f74e478 100644
---- a/modules/modperl/CMakeLists.txt
-+++ b/modules/modperl/CMakeLists.txt
-@@ -53,7 +53,6 @@ if(SWIG_FOUND)
- 		"-I${PROJECT_SOURCE_DIR}/include"
- 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
- 		"-I${CMAKE_CURRENT_SOURCE_DIR}/include"
--		-DZNC_EXPORT_LIB_EXPORT
- 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
- 		-o "${CMAKE_CURRENT_BINARY_DIR}/modperl_biglib.cpp"
- 		"${CMAKE_CURRENT_SOURCE_DIR}/modperl.i"
-diff --git a/modules/modpython/CMakeLists.txt b/modules/modpython/CMakeLists.txt
-index edbeb41ed5..36a2e649f0 100644
---- a/modules/modpython/CMakeLists.txt
-+++ b/modules/modpython/CMakeLists.txt
-@@ -50,7 +50,6 @@ if(SWIG_FOUND)
- 		"-I${PROJECT_BINARY_DIR}/include"
- 		"-I${PROJECT_SOURCE_DIR}/include"
- 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
--		-DZNC_EXPORT_LIB_EXPORT
- 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
- 		-o "${CMAKE_CURRENT_BINARY_DIR}/modpython_biglib.cpp"
- 		"${CMAKE_CURRENT_SOURCE_DIR}/modpython.i"
diff --git a/package/znc/Config.in b/package/znc/Config.in
index 915b5f632c..3b8f0f7195 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZNC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	help
@@ -11,7 +11,7 @@ config BR2_PACKAGE_ZNC
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads"
+comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 8, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index e86171ba1f..8d59c7a1dc 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff238aae3f2ae0e44e683c4aee17dc8e4fdd261ca9379d83b48a7d422488de0d  znc-1.8.2.tar.gz
+sha256  8b99c9dbb21c1309705073460be9bfacb6f7b0e83a15fe5d4b7140201b39d2a1  znc-1.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 07fced8407..a910655195 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.8.2
+ZNC_VERSION = 1.9.0
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
