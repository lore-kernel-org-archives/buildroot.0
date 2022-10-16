Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342ECC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC5FA40924;
	Sun, 16 Oct 2022 15:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5FA40924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0vCb36Z3_Ys; Sun, 16 Oct 2022 15:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0074740905;
	Sun, 16 Oct 2022 15:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0074740905
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99B231BF973
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F3358141D
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3358141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOgiwNeYVqze for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35B9681423
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B9681423
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2691C86756; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:00:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7bd4cabed37d3ea827e7b8aabe0fa50a8effd4c
X-Git-Newrev: db63f65945527527f90b58113d9a56fbcd49c275
X-Patchwork-Hint: ignore
Message-Id: <20221016150425.2691C86756@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: Bump version to 3.38.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=db63f65945527527f90b58113d9a56fbcd49c275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new version. Remove patch that has been applied upstream. Update
hash for COPYING as it's text has changed to clarify some details but
the license remains LGP-2.0+L/GPL-2.0+.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-lib-tlscontext.c-fix-libressl-build.patch | 85 ----------------------
 package/syslog-ng/syslog-ng.conf                   |  2 +-
 package/syslog-ng/syslog-ng.hash                   |  4 +-
 package/syslog-ng/syslog-ng.mk                     |  2 +-
 4 files changed, 4 insertions(+), 89 deletions(-)

diff --git a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
deleted file mode 100644
index 2c438627a4..0000000000
--- a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 6f93484cea81ff8d45df213d5d2b4cffc4eadcad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Jul 2022 18:09:25 +0200
-Subject: [PATCH] lib/tlscontext.c: fix libressl build
-
-Fix the following build failure with libressl raised since version
-3.37.1 and
-https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:
-
-/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
-/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'
-
-Fixes:
- - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/syslog-ng/syslog-ng/pull/4081]
----
- cmake/openssl_functions.cmake | 4 +++-
- configure.ac                  | 2 ++
- lib/tlscontext.c              | 4 ++++
- syslog-ng-config.h.in         | 2 ++
- 4 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
-index afd7b96bfe..319dcc2e23 100644
---- a/cmake/openssl_functions.cmake
-+++ b/cmake/openssl_functions.cmake
-@@ -42,7 +42,9 @@ function (openssl_set_defines)
-     DH_set0_pqg
-     BN_get_rfc3526_prime_2048
-     SSL_CTX_set_num_tickets
--    SSL_CTX_set_ciphersuites)
-+    SSL_CTX_set_ciphersuites
-+    SSL_CTX_set1_sigalgs_list
-+    SSL_CTX_set1_client_sigalgs_list)
- 
-   foreach (symbol ${symbol_list})
-     string(TOUPPER ${symbol} SYMBOL_UPPERCASE)
-diff --git a/configure.ac b/configure.ac
-index 8cfab2251e..ecffb84f06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1055,6 +1055,8 @@ AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
- AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
- AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
- AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
-+AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
-+AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
- 
- CPPFLAGS="$CPPFLAGS_SAVE"
- 
-diff --git a/lib/tlscontext.c b/lib/tlscontext.c
-index ddde21dcaf..dedcf1ce5a 100644
---- a/lib/tlscontext.c
-+++ b/lib/tlscontext.c
-@@ -598,11 +598,15 @@ tls_context_setup_cipher_suite(TLSContext *self)
- static gboolean
- tls_context_setup_sigalgs(TLSContext *self)
- {
-+#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
-   if (self->sigalgs && !SSL_CTX_set1_sigalgs_list(self->ssl_ctx, self->sigalgs))
-     return FALSE;
-+#endif
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
-   if (self->client_sigalgs && !SSL_CTX_set1_client_sigalgs_list(self->ssl_ctx, self->client_sigalgs))
-     return FALSE;
-+#endif
- 
-   return TRUE;
- }
-diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
-index 1817deea50..004b0a7be6 100644
---- a/syslog-ng-config.h.in
-+++ b/syslog-ng-config.h.in
-@@ -57,6 +57,8 @@
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_DH_SET0_PQG
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 45b94facf9..69db9b4b78 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.37
+@version: 3.38
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 764ff45733..6fce7be996 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d67a320cb896cd5d62f24d9e1bec138847fa4618ae13a3946cae2b75c528ee14  syslog-ng-3.37.1.tar.gz
-sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
+sha256  5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7  syslog-ng-3.38.1.tar.gz
+sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 64b3b24498..a7176ad129 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.37.1
+SYSLOG_NG_VERSION = 3.38.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
