Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813D7C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 14:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6A64059B;
	Tue, 23 Jul 2024 14:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fd1Z8r-g2zb; Tue, 23 Jul 2024 14:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF370405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF370405AB;
	Tue, 23 Jul 2024 14:59:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72DF91BF215
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 611186069E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 14:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiEKcAztfxWD for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 14:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B957606BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B957606BE
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28A92873BD; Tue, 23 Jul 2024 14:59:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:51:37 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 169284cd1f901fbf22c7b1f8ef9d85de0523ba27
X-Git-Newrev: 3d1d01f92838d712553b85272a19c8c4cd75ad06
X-Patchwork-Hint: ignore
Message-Id: <20240723145900.28A92873BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/exim: security
 bump version to 4.98
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d1d01f92838d712553b85272a19c8c4cd75ad06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Release notes:
https://lists.exim.org/lurker/message/20240710.155945.8823670d.en.html

Fixes CVE-2024-39929: https://bugs.exim.org/show_bug.cgi?id=3099#c4

Removed patch 0004 due to removal of codesourcery arm/aarch64 toolchains
with commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511.

Patch 0005 (renamed to 0004) is still necessary with gcc-13.x,
reformatted Upstream trailer.

Removed patches 0006, 0007 & 0008 which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a409fafb0ea24e8e8f07529623d55e8d3435598)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 -
 ...-exim_lock-fix-lstat-related-build-errors.patch | 53 --------------------
 ...ors.patch => 0004-sieve-fix-build-errors.patch} |  2 +-
 package/exim/0006-OpenSSL-fix-non-DANE-build.patch | 28 -----------
 package/exim/0007-typoes.patch                     | 58 ----------------------
 ...s-openssl.c-fix-build-with-libressl-3.5.0.patch | 43 ----------------
 package/exim/exim.hash                             |  4 +-
 package/exim/exim.mk                               |  2 +-
 8 files changed, 4 insertions(+), 188 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8a21b3f155..a755319824 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -595,8 +595,6 @@ package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch lib_patch.Upstr
 package/exim/0001-Build-buildconfig-for-the-host.patch lib_patch.Upstream
 package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch lib_patch.Upstream
 package/exim/0003-Skip-version-check-and-symlink-installation.patch lib_patch.Upstream
-package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch lib_patch.Upstream
-package/exim/0005-sieve-fix-build-errors.patch lib_patch.Upstream
 package/exim/S86exim lib_sysv.Indent lib_sysv.Variables
 package/expect/0001-enable-cross-compilation.patch lib_patch.Upstream
 package/expect/0002-allow-tcl-build-directory.patch lib_patch.Upstream
diff --git a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
deleted file mode 100644
index 616ada5026..0000000000
--- a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From bbcf4320134efd8a01ce5a02bb9af62019ca05f6 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Tue, 4 Feb 2020 15:57:48 +0100
-Subject: [PATCH] exim_lock: fix lstat-related build errors
-
-exim_lock fails to cross-compile with the Sourcery CodeBench ARM 2014.05
-toolchain due the a missing include of sys/types.h, needed for the
-constants used by fstat() and lstat().
-
-Discovered when cross-compiling with the Buildroot embedded Linux
-buildsystem.
-
-Fixes:
-
-  exim_lock.c:427:30: error: 'S_IFMT' undeclared (first use in this function)
-         if ((statbuf.st_mode & S_IFMT) == S_IFLNK)
-                                ^
-  exim_lock.c:427:30: note: each undeclared identifier is reported only once for each function it appears in
-  exim_lock.c:427:41: error: 'S_IFLNK' undeclared (first use in this function)
-         if ((statbuf.st_mode & S_IFMT) == S_IFLNK)
-                                           ^
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
-[Bernd: rebased for version 4.97.1]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/exim_lock.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/exim_lock.c b/src/exim_lock.c
-index 068216816054..cb140aff6436 100644
---- a/src/exim_lock.c
-+++ b/src/exim_lock.c
-@@ -14,6 +14,8 @@ Copyright (c) The Exim Maintainers 2016 - 2021
- SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-+#define _XOPEN_SOURCE
-+
- #include "os.h"
-
- #include <stdio.h>
-@@ -27,6 +29,7 @@ Copyright (c) The Exim Maintainers 2016
- #include <unistd.h>
- #include <utime.h>
- #include <sys/utsname.h>
-+#include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <pwd.h>
---
-2.25.0
diff --git a/package/exim/0005-sieve-fix-build-errors.patch b/package/exim/0004-sieve-fix-build-errors.patch
similarity index 95%
rename from package/exim/0005-sieve-fix-build-errors.patch
rename to package/exim/0004-sieve-fix-build-errors.patch
index 20323c17cd..c1a2c45b8d 100644
--- a/package/exim/0005-sieve-fix-build-errors.patch
+++ b/package/exim/0004-sieve-fix-build-errors.patch
@@ -20,7 +20,7 @@ Discovered when cross-compiling with the Buildroot embedded Linux
 buildsystem.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
+Upstream: https://bugs.exim.org/show_bug.cgi?id=2523
 [Bernd: rebased for version 4.97.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
diff --git a/package/exim/0006-OpenSSL-fix-non-DANE-build.patch b/package/exim/0006-OpenSSL-fix-non-DANE-build.patch
deleted file mode 100644
index 8ae63d2226..0000000000
--- a/package/exim/0006-OpenSSL-fix-non-DANE-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 37b849dca4dfd855212a763662825e967a4d77b1 Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Tue, 7 Nov 2023 15:02:18 +0000
-Subject: [PATCH] OpenSSL: fix non-DANE build
-
-Upstream: https://git.exim.org/exim.git/commitdiff/37b849dca4dfd855212a763662825e967a4d77b1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tls-openssl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/src/tls-openssl.c b/src/src/tls-openssl.c
-index ef11de593..851ac77c5 100644
---- a/src/tls-openssl.c
-+++ b/src/tls-openssl.c
-@@ -2605,7 +2605,7 @@ if (!(bs = OCSP_response_get1_basic(rsp)))
-     asking for certificate-status under DANE, so this callback won't run for
-     that combination. It still will for non-DANE. */
- 
--#ifdef EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_SIGNER
-+#if defined(EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_SIGNER) && defined(SUPPORT_DANE)
-     X509 * signer;
- 
-     if (  tls_out.dane_verified
--- 
-2.30.2
-
diff --git a/package/exim/0007-typoes.patch b/package/exim/0007-typoes.patch
deleted file mode 100644
index 6bbfc9eecd..0000000000
--- a/package/exim/0007-typoes.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From caf57fe7eb5018b8df196e6d9f99586232798eb3 Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Wed, 8 Nov 2023 14:22:37 +0000
-Subject: [PATCH] typoes
-
-Upstream: https://git.exim.org/exim.git/commit/caf57fe7eb5018b8df196e6d9f99586232798eb3
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/src/tls-openssl.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/tls-openssl.c b/src/tls-openssl.c
-index 851ac77c5..237303ba9 100644
---- a/src/tls-openssl.c
-+++ b/src/tls-openssl.c
-@@ -77,9 +77,9 @@ change this guard and punt the issue for a while longer. */
- #  define EXIM_HAVE_OPENSSL_KEYLOG
- #  define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
- #  define EXIM_HAVE_SESSION_TICKET
--#  define EXIM_HAVE_OPESSL_TRACE
--#  define EXIM_HAVE_OPESSL_GET0_SERIAL
--#  define EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
-+#  define EXIM_HAVE_OPENSSL_TRACE
-+#  define EXIM_HAVE_OPENSSL_GET0_SERIAL
-+#  define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
- #  define EXIM_HAVE_SSL_GET0_VERIFIED_CHAIN
- #  ifndef DISABLE_OCSP
- #   define EXIM_HAVE_OCSP
-@@ -1756,7 +1756,7 @@ level. */
- DEBUG(D_tls)
-   {
-   SSL_CTX_set_info_callback(ctx, info_callback);
--#if defined(EXIM_HAVE_OPESSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
-+#if defined(EXIM_HAVE_OPENSSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
-   /* this needs a debug build of OpenSSL */
-   SSL_CTX_set_msg_callback(ctx, SSL_trace);
- #endif
-@@ -2442,7 +2442,7 @@ tls_in.ocsp = OCSP_NOT_RESP;
- if (!olist)
-   return SSL_TLSEXT_ERR_NOACK;
- 
--#ifdef EXIM_HAVE_OPESSL_GET0_SERIAL
-+#ifdef EXIM_HAVE_OPENSSL_GET0_SERIAL
-  {
-   const X509 * cert_sent = SSL_get_certificate(s);
-   const ASN1_INTEGER * cert_serial = X509_get0_serialNumber(cert_sent);
-@@ -2646,7 +2646,7 @@ if (!(bs = OCSP_response_get1_basic(rsp)))
- 
-       debug_printf("certs contained in basicresp:\n");
-       x509_stack_dump_cert_s_names(
--#ifdef EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
-+#ifdef EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
- 	OCSP_resp_get0_certs(bs)
- #else
- 	bs->certs
--- 
-2.30.2
-
diff --git a/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch b/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 67d96fc1af..0000000000
--- a/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 88f45502272a9a674948204e460ebe90202827d4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 11 Feb 2024 21:45:42 +0100
-Subject: [PATCH] src/src/tls-openssl.c: fix build with libressl >= 3.5.0
-
-OCSP_BASICRESP is an opaque structure since libressl 3.5.0 and
-https://github.com/libressl/openbsd/commit/57442b0028fb09287793f279ee57ebb38e9ab954
-resulting in the following build failure since version 4.97 and
-https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:
-
-In file included from tls.c:473:
-tls-openssl.c: In function 'tls_client_stapling_cb':
-tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
- 2652 |         bs->certs
-      |           ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://bugs.exim.org/show_bug.cgi?id=3074
----
- src/src/tls-openssl.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/tls-openssl.c b/src/tls-openssl.c
-index 237303ba9..c7f94c160 100644
---- a/src/tls-openssl.c
-+++ b/src/tls-openssl.c
-@@ -98,6 +98,10 @@ change this guard and punt the issue for a while longer. */
- # define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
- #endif
- 
-+#if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
-+# define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
-+#endif
-+
- #if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x030000000L)
- # define EXIM_HAVE_EXPORT_CHNL_BNGNG
- # define EXIM_HAVE_OPENSSL_X509_STORE_GET1_ALL_CERTS
--- 
-2.43.0
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index a3822302fb..de803bb27b 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  bd782057509a793593508528590626d185ea160ce32cb34beda262e99cefdfa9  exim-4.97.1.tar.xz
+sha256  0ebc108a779f9293ba4b423c20818f9a3db79b60286d96abc6ba6b85a15852f7  exim-4.98.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  eab7ca28b37f1635c48f5e963ab69fcbad539b2c35a84286ecaad7d7ff5210bbefce86452302e08099afdc0710f9cb7ca6d9b152b0ba88a19292f7c5541e0cfc  exim-4.97.1.tar.xz
+sha512  13dd963dd0899bb4d64bee44c20883e720e469a4d77456b877d6693cfc4419805a045cb561508cdf763dbb37cc84fbdc6177d68acc2183934c3224fbd03caf15  exim-4.98.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index d78b95ad15..45708d3941 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.97.1
+EXIM_VERSION = 4.98
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
