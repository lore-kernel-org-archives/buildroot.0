Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6B1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57AFF41DA5;
	Thu,  9 May 2024 16:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GRqKVlgKQLs; Thu,  9 May 2024 16:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB8D40358
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB8D40358;
	Thu,  9 May 2024 16:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3951BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B71960FF7
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzgUTIpsv_Lk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0216360FB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0216360FB4
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:17:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D231186C71; Thu,  9 May 2024 16:17:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:02:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a686a8769804474379e7ec2998e6bb05c3adb3d9
X-Git-Newrev: 105f0398c76f3288b2668e0b3ec722b2ebe55a0b
X-Patchwork-Hint: ignore
Message-Id: <20240509161730.D231186C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: bump to 4.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=105f0398c76f3288b2668e0b3ec722b2ebe55a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announcement:
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.4.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.5.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.6.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.7.0
 - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.7.1

Bump info:
 - sha256 update for COPYING:
 https://github.com/syslog-ng/syslog-ng/commit/52e9e10053f332ba0a4ba0fccc58a67f48c58788

 - json-c is now a hard-dependency:
 https://github.com/syslog-ng/syslog-ng/commit/d9220c79b202cb23209f52bd941f16acac0d0d74

 - enable-cloud-auth requires curl
 https://github.com/syslog-ng/syslog-ng/pull/4755

 - 0001-fix-build-on-uclibc.patch upstream:
 https://github.com/buytenh/ivykis/commit/5100a11a838722d063e67baf3200446861c96027 and
 https://github.com/syslog-ng/syslog-ng/commit/468df07d80d58db806072d1565ec5f63bb02ffc3

 - 0002-lib-transport-tls-context.c-fix-libressl-build.patch upstream:
 https://github.com/syslog-ng/syslog-ng/commit/065c09c52296148b33a273495796cdaaa09bb5e2

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/0001-fix-build-on-uclibc.patch   | 52 ------------
 ...ransport-tls-context.c-fix-libressl-build.patch | 97 ----------------------
 package/syslog-ng/Config.in                        |  3 +
 package/syslog-ng/syslog-ng.conf                   |  2 +-
 package/syslog-ng/syslog-ng.hash                   |  4 +-
 package/syslog-ng/syslog-ng.mk                     | 17 +---
 6 files changed, 10 insertions(+), 165 deletions(-)

diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/syslog-ng/0001-fix-build-on-uclibc.patch
deleted file mode 100644
index 07c3f0721c..0000000000
--- a/package/syslog-ng/0001-fix-build-on-uclibc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 98bd6106f8c48bc8f0a27bd712ed4ba6249e9a5f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 13 Jan 2019 11:03:51 +0100
-Subject: [PATCH] fix build on m68k with uclibc
-
-uclibc on m68k defines pthread_spinlock_t but does not define
-pthread_spin_trylock so check for this function before using it
-
-Fixes:
- - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
-
-Upstream: https://github.com/buytenh/ivykis/pull/22
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac   | 3 +++
- src/spinlock.h | 4 ++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/lib/ivykis/configure.ac b/lib/ivykis/configure.ac
-index e9b10c0..24152a9 100644
---- a/lib/ivykis/configure.ac
-+++ b/lib/ivykis/configure.ac
-@@ -110,6 +110,9 @@ AC_CACHE_CHECK(for linux/netfilter_ipv4.h, ac_cv_header_linux_netfilter_ipv4_h,
- # Check for pthread_spinlock_t.
- AC_CHECK_TYPES([pthread_spinlock_t], [], [], [[#include <pthread.h>]])
- 
-+# Check for pthread_spin_trylock
-+AC_CHECK_FUNCS([pthread_spin_trylock])
-+
- # Check which header file defines 'struct timespec'.
- for hdr in sys/time.h sys/timers.h time.h pthread.h
- do
-diff --git a/lib/ivykis/src/spinlock.h b/lib/ivykis/src/spinlock.h
-index ebcdbec..d837df8 100644
---- a/lib/ivykis/src/spinlock.h
-+++ b/lib/ivykis/src/spinlock.h
-@@ -76,7 +76,11 @@ static inline void fallback_spin_unlock(fallback_spinlock_t *lock)
- 
- static inline int pthread_spinlocks_available(void)
- {
-+#ifdef HAVE_PTHREAD_SPIN_TRYLOCK
- 	return !!(pthread_spin_trylock != NULL);
-+#else
-+	return 0;
-+#endif
- }
- 
- 
--- 
-2.14.1
-
diff --git a/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
deleted file mode 100644
index 17cc72b983..0000000000
--- a/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From ede106afd7d70a8f962acf10a4e3f4a50a70cb15 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Oct 2023 11:27:09 +0200
-Subject: [PATCH] lib/transport/tls-context.c: fix libressl build
-
-Fix the following build failure with libressl raised since version 4.0.0
-and
-https://github.com/syslog-ng/syslog-ng/commit/bc05f28a4b511ac9090195280163a7f822712ceb:
-
-lib/transport/tls-context.c: In function 'tls_context_setup_cmd_context':
-lib/transport/tls-context.c:320:3: error: unknown type name 'SSL_CONF_CTX'; did you mean 'SSL_AEAD_CTX'?
-  320 |   SSL_CONF_CTX *ssl_conf_ctx = SSL_CONF_CTX_new();
-      |   ^~~~~~~~~~~~
-      |   SSL_AEAD_CTX
-
-Fixes:
- - http://autobuild.buildroot.org/results/dc4d60d752e579ef054915eee3d7e3e73c25929b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/syslog-ng/syslog-ng/pull/4655
----
- cmake/openssl_functions.cmake | 1 +
- configure.ac                  | 1 +
- lib/transport/tls-context.c   | 4 ++++
- syslog-ng-config.h.in         | 1 +
- 4 files changed, 7 insertions(+)
-
-diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
-index 5afbd7f12..da06ca59a 100644
---- a/cmake/openssl_functions.cmake
-+++ b/cmake/openssl_functions.cmake
-@@ -41,6 +41,7 @@ function (openssl_set_defines)
-     X509_get_extension_flags
-     DH_set0_pqg
-     BN_get_rfc3526_prime_2048
-+    SSL_CONF_CTX_new
-     SSL_CTX_set_num_tickets
-     SSL_CTX_set_ciphersuites
-     SSL_CTX_set1_sigalgs_list
-diff --git a/configure.ac b/configure.ac
-index d636bbefa..46e43db7b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1136,6 +1136,7 @@ AC_CHECK_DECLS([EVP_MD_CTX_reset], [], [], [[#include <openssl/evp.h>]])
- AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
- AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
- AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
-+AC_CHECK_DECLS([SSL_CONF_CTX_new],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
- AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
-diff --git a/lib/transport/tls-context.c b/lib/transport/tls-context.c
-index be2fea68d..713b63f31 100644
---- a/lib/transport/tls-context.c
-+++ b/lib/transport/tls-context.c
-@@ -314,6 +314,7 @@ tls_context_setup_sigalgs(TLSContext *self)
-   return TRUE;
- }
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
- static gboolean
- tls_context_setup_cmd_context(TLSContext *self)
- {
-@@ -347,6 +348,7 @@ tls_context_setup_cmd_context(TLSContext *self)
-   SSL_CONF_CTX_free(ssl_conf_ctx);
-   return result;
- }
-+#endif
- 
- static PKCS12 *
- _load_pkcs12_file(TLSContext *self, const gchar *pkcs12_file)
-@@ -593,8 +595,10 @@ tls_context_setup_context(TLSContext *self)
-   if (!tls_context_setup_sigalgs(self))
-     goto error;
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
-   if (!tls_context_setup_cmd_context(self))
-     goto error;
-+#endif
- 
-   return TLS_CONTEXT_SETUP_OK;
- 
-diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
-index 412294d2a..6d01b84a0 100644
---- a/syslog-ng-config.h.in
-+++ b/syslog-ng-config.h.in
-@@ -60,6 +60,7 @@
- #cmakedefine ENV_LD_LIBRARY_PATH @ENV_LD_LIBRARY_PATH@
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_EVP_MD_CTX_RESET
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
--- 
-2.40.1
-
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index aa1e71d225..1302e6ac46 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
@@ -16,5 +18,6 @@ config BR2_PACKAGE_SYSLOG_NG
 
 comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 06e48cdd50..bab628f521 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.3
+@version: 4.7
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 6841ed5eb1..7f829c8b13 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  999dbab62982c3cffba02c0be22c596ee1ce81d6954689dc9b3a6afeb513cce3  syslog-ng-4.3.1.tar.gz
-sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
+sha256  5477189a2d12325aa4faebfcf59f5bdd9084234732f0c3ec16dd253847dacf1c  syslog-ng-4.7.1.tar.gz
+sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index dd02a6e3af..4f9a455e81 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,15 +6,13 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.3.1
+SYSLOG_NG_VERSION = 4.7.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_CPE_ID_VENDOR = oneidentity
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	libglib2 openssl pcre2
-# We're patching configure.ac
-SYSLOG_NG_AUTORECONF = YES
+	json-c libglib2 openssl pcre2
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb \
 	--disable-python
@@ -48,13 +46,6 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-smtp
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-SYSLOG_NG_DEPENDENCIES += json-c
-SYSLOG_NG_CONF_OPTS += --enable-json
-else
-SYSLOG_NG_CONF_OPTS += --disable-json
-endif
-
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 SYSLOG_NG_DEPENDENCIES += util-linux
 endif
@@ -70,10 +61,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSLOG_NG_DEPENDENCIES += libcurl
-SYSLOG_NG_CONF_OPTS += --enable-http
+SYSLOG_NG_CONF_OPTS += --enable-http --enable-cloud-auth
 SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
 else
-SYSLOG_NG_CONF_OPTS += --disable-http
+SYSLOG_NG_CONF_OPTS += --disable-http --disable-cloud-auth
 endif
 
 ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
