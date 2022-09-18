Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88599C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001E4419C3;
	Sun, 18 Sep 2022 10:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001E4419C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEVSjVS0ztS8; Sun, 18 Sep 2022 10:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C70416E3;
	Sun, 18 Sep 2022 10:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C70416E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 379111BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E87A416E3
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E87A416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4f4FOLf8Jzx for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:54:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B55BF416C4
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55BF416C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC4F85015; Sun, 18 Sep 2022 10:54:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:54:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e2eefd5ad86b85c312f263b59b9df2d4653aaa9
X-Git-Newrev: d588b55458f3ac35ee1c054a0e66c2326c40e7c8
X-Patchwork-Hint: ignore
Message-Id: <20220918105432.9DC4F85015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: bump to version
 LTS_07_2022_Ref01
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

commit: https://git.buildroot.net/buildroot/commit/?id=d588b55458f3ac35ee1c054a0e66c2326c40e7c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop patch (already in version).

See https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_07_2022_Ref01

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-adapters-fix-build-with-libressl-2.8.0.patch | 85 ----------------------
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk         |  2 +-
 3 files changed, 2 insertions(+), 87 deletions(-)

diff --git a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
deleted file mode 100644
index e2a241bffe..0000000000
--- a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 43b313988d66de144a528e4cf57827df1e8c692d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 12 Apr 2022 20:00:36 +0200
-Subject: [PATCH] adapters: fix build with libressl >= 2.8.0 (#589)
-
-Fix the following build failure with libressl >= 2.8.0 raised since
-https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
-
-/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
-/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-  961 |             bio_method = BIO_s_mem();
-      |                        ^
-cc1: all warnings being treated as errors
-
-Fix #585
-
-Fixes:
- - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/Azure/azure-c-shared-utility/commit/43b313988d66de144a528e4cf57827df1e8c692d]
----
- adapters/tlsio_openssl.c                | 2 +-
- adapters/x509_openssl.c                 | 4 ++--
- tests/x509_openssl_ut/x509_openssl_ut.c | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/c-utility/adapters/tlsio_openssl.c b/c-utility/adapters/tlsio_openssl.c
-index 4a3df8496..aa48ce52d 100644
---- a/c-utility/adapters/tlsio_openssl.c
-+++ b/c-utility/adapters/tlsio_openssl.c
-@@ -953,7 +953,7 @@ static int add_certificate_to_store(TLS_IO_INSTANCE* tls_io_instance, const char
-         }
-         else
-         {
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-             const BIO_METHOD* bio_method;
- #else
-             BIO_METHOD* bio_method;
-diff --git a/c-utility/adapters/x509_openssl.c b/c-utility/adapters/x509_openssl.c
-index 5a9e5ac29..46195b403 100644
---- a/c-utility/adapters/x509_openssl.c
-+++ b/c-utility/adapters/x509_openssl.c
-@@ -75,7 +75,7 @@ static int load_certificate_chain(SSL_CTX* ssl_ctx, const char* certificate)
-                 // certificates.
- 
-                 /* Codes_SRS_X509_OPENSSL_07_006: [ If successful x509_openssl_add_ecc_credentials shall to import each certificate in the cert chain. ] */
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-                 SSL_CTX_clear_extra_chain_certs(ssl_ctx);
- #else
-                 if (ssl_ctx->extra_certs != NULL)
-@@ -345,7 +345,7 @@ int x509_openssl_add_certificates(SSL_CTX* ssl_ctx, const char* certificates)
-         else
-         {
-             /*Codes_SRS_X509_OPENSSL_02_012: [ x509_openssl_add_certificates shall get the memory BIO method function by calling BIO_s_mem. ]*/
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-             const BIO_METHOD* bio_method;
- #else
-             BIO_METHOD* bio_method;
-diff --git a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-index b3349f6b0..f73191e3f 100644
---- a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-+++ b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
-@@ -348,7 +348,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
-         STRICT_EXPECTED_CALL(BIO_new_mem_buf((void*)TEST_PUBLIC_CERTIFICATE, -1));
-         STRICT_EXPECTED_CALL(PEM_read_bio_X509_AUX(IGNORED_PTR_ARG, NULL, NULL, NULL));
-         STRICT_EXPECTED_CALL(SSL_CTX_use_certificate(IGNORED_PTR_ARG, IGNORED_PTR_ARG));
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-         // Actual macro name: SSL_CTX_clear_extra_chain_certs:
-         STRICT_EXPECTED_CALL(SSL_CTX_ctrl(TEST_SSL_CTX_STRUCTURE, SSL_CTRL_CLEAR_EXTRA_CHAIN_CERTS, 0, NULL));
- #endif
-@@ -537,7 +537,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
- 
-         umock_c_negative_tests_snapshot();
- 
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
-     #ifdef __APPLE__
-         size_t calls_cannot_fail_rsa[] = { 4, 5, 6, 10, 12, 13, 14 };
-         size_t calls_cannot_fail_ecc[] = { 3, 4, 8, 10, 11, 12} ;
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 5dbb530954..187b90a35a 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  082e41f7cdf06fec036b8cfa1793f03e81ba527b55ea13c66be0e4cf9f20ff7b  azure-iot-sdk-c-LTS_01_2022_Ref01-br1.tar.gz
+sha256  7c23506e5acd6f400982f6f7a053d494c83b8a709c449bb9ded07aff9cfada78  azure-iot-sdk-c-LTS_07_2022_Ref01-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 874646c445..42fdd56b48 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_01_2022_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_07_2022_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
