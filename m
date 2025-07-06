Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB286C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B58D41322;
	Sun,  6 Jul 2025 20:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_A6iXO-xJ8y; Sun,  6 Jul 2025 20:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7F041318
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7F041318;
	Sun,  6 Jul 2025 20:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE86412E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0744816E3
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqLK1Y_YlR8S for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8688181EEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8688181EEE
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8216781D59; Sun,  6 Jul 2025 20:18:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 22:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a8e8686235657b71819003ebef7c8dcaf8daf1c
X-Git-Newrev: 67343d59bfd5f8d07e59dff34f404e2b56f34fea
X-Patchwork-Hint: ignore
Message-Id: <20250706201837.8216781D59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: bump to v3.14.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67343d59bfd5f8d07e59dff34f404e2b56f34fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more information see the release note:
  - https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-add-compatibility-for-wolfssl-5-0.patch   | 30 ----------
 .../0002-compatibility-for-openssl-3.0.patch       | 31 -----------
 ...03-CMakeLists.txt-add-BUILD_WERROR-option.patch | 30 ----------
 ...004-add-compatibility-with-mbed-tls-3-0-0.patch | 64 ----------------------
 package/libuhttpd/libuhttpd.hash                   |  2 +-
 package/libuhttpd/libuhttpd.mk                     |  2 +-
 7 files changed, 2 insertions(+), 158 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 298d080475..06fca7f364 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -711,7 +711,6 @@ package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch lib_patch.Upstream
-package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch lib_patch.Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patch.Upstream
diff --git a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
deleted file mode 100644
index 7da7199e7e..0000000000
--- a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 73aa4ef762b2de67bc8c7c260bd36b34fdb91e63 Mon Sep 17 00:00:00 2001
-From: "Sergey V. Lobanov" <sergey@lobanov.in>
-Date: Mon, 3 Jan 2022 19:36:52 +0300
-Subject: [PATCH] add compatibility for wolfssl >= 5.0
-
-NTRU support has been removed in wolfssl 5.0 so it is required to
-mask NTRU specific code if wolfssl >= 5.0
-
-Signed-off-by: Sergey V. Lobanov <sergey at lobanov.in>
-[Retrieved from:
-https://github.com/zhaojh329/ssl/commit/73aa4ef762b2de67bc8c7c260bd36b34fdb91e63]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- openssl.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/ssl/openssl.c b/src/ssl/openssl.c
-index 5a49267..278bab5 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -336,7 +336,9 @@ static bool handle_wolfssl_asn_error(void *ssl, int r,
-     case ASN_SIG_HASH_E:
-     case ASN_SIG_KEY_E:
-     case ASN_DH_KEY_E:
-+#if LIBWOLFSSL_VERSION_HEX < 0x05000000
-     case ASN_NTRU_KEY_E:
-+#endif
-     case ASN_CRIT_EXT_E:
-     case ASN_ALT_NAME_E:
-     case ASN_NO_PEM_HEADER:
diff --git a/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch b/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
deleted file mode 100644
index 484d472bad..0000000000
--- a/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d93e6426ec1d8c019bd302e4599f3b91ba95fb3b Mon Sep 17 00:00:00 2001
-From: Jianhui Zhao <zhaojh329@gmail.com>
-Date: Fri, 29 Apr 2022 23:47:31 +0800
-Subject: [PATCH] compatibility for openssl >= 3.0
-
-Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
-
-Upstream: https://github.com/zhaojh329/ssl/commit/d93e6426ec1d8c019bd302e4599f3b91ba95fb3b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- openssl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/openssl.c b/openssl.c
-index 278bab5..2169db1 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -139,8 +139,11 @@ const char *ssl_last_error_string(char *buf, int len)
- 
-     if (ssl_err_code == SSL_ERROR_SSL) {
-         int used;
--
-+#if OPENSSL_VERSION_MAJOR < 3
-         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
-+#else
-+        ssl_err_code = ERR_peek_error_all(&file, &line, NULL, &data, &flags);
-+#endif
-         ERR_error_string_n(ssl_err_code, buf, len);
- 
-         used = strlen(buf);
diff --git a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
deleted file mode 100644
index 2e87014e87..0000000000
--- a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c0f2260d8b7e435bce765e7ac91d51f1b349b87b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Mar 2024 13:43:12 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_WERROR option
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/zhaojh329/libuhttpd/commit/c0f2260d8b7e435bce765e7ac91d51f1b349b87b
----
- CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6fb9651..6719e5f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,13 @@ include(CheckLibraryExists)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
- add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
--add_compile_options(-O -Wall -Werror --std=gnu99)
-+add_compile_options(-O -Wall --std=gnu99)
-+
-+option(BUILD_WERROR "Build with -Werror" ON)
-+
-+if(BUILD_WERROR)
-+    add_compile_options(-Werror)
-+endif()
- 
- option(BUILD_STATIC "Build static library" OFF)
- 
diff --git a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
deleted file mode 100644
index 1f45d4634c..0000000000
--- a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 28cc9b5d98179d161673d20e79333ae5a4864228 Mon Sep 17 00:00:00 2001
-From: Jianhui Zhao <zhaojh329@gmail.com>
-Date: Sat, 4 May 2024 19:40:07 +0800
-Subject: [PATCH] Add compatibility with Mbed TLS 3.0.0
-
-Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
-Upstream: https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
-[thomas: 
-  - Apply to submodule directory
-  - Rename 'urandom' to '_urandom'
-  - Adapt line numbers
-]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/ssl/mbedtls.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/ssl/mbedtls.c b/src/ssl/mbedtls.c
-index 2e02e1c..cad7e00 100644
---- a/src/ssl/mbedtls.c
-+++ b/src/ssl/mbedtls.c
-@@ -49,7 +49,6 @@
- #include "ssl.h"
- 
- #include <mbedtls/ssl.h>
--#include <mbedtls/certs.h>
- #include <mbedtls/x509.h>
- #include <mbedtls/rsa.h>
- #include <mbedtls/error.h>
-@@ -136,9 +135,13 @@ static const int default_ciphersuites_client[] =
-     AES_CBC_CIPHERS(ECDHE_ECDSA),
-     AES_CBC_CIPHERS(ECDHE_RSA),
-     AES_CBC_CIPHERS(DHE_RSA),
-+#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
-     MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
-     AES_CIPHERS(RSA),
-+#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
-     MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
-     0
- };
- 
-@@ -221,7 +224,7 @@ static void ssl_update_own_cert(struct ssl_context *ctx)
-     if (!ctx->cert.version)
-         return;
- 
--    if (!ctx->key.pk_info)
-+    if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
-         return;
- 
-     mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
-@@ -258,7 +261,11 @@ int ssl_load_key_file(struct ssl_context *ctx, const char *file)
- {
-     int ret;
- 
-+#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
-+    ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _urandom, NULL);
-+#else
-     ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
-+#endif
-     if (ret)
-         return -1;
- 
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index e4fde4eb64..7f0ecc0030 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  512d4abfced0ec916d985d3d1eac7528e6676eecae6aca27fdaf313374e29f16  libuhttpd-3.14.1.tar.gz
+sha256  ce2abbc599a922c4bac12f1cdf3e9c9740f387f819a54ca01e9fed60905baa40  libuhttpd-3.14.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 78e0f42b22..dca26fc3c0 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.14.1
+LIBUHTTPD_VERSION = 3.14.2
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
