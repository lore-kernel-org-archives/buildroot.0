Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A2FC0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5CC440486;
	Wed, 25 Oct 2023 20:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5CC440486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVFqUrw1KHsP; Wed, 25 Oct 2023 20:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5077240111;
	Wed, 25 Oct 2023 20:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5077240111
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7501BF356
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56D5440492
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56D5440492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYWJ-rzirqmt for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 20:24:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD5CB40111
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 20:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5CB40111
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9758A85EDB; Wed, 25 Oct 2023 20:24:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 22:22:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed573043b5ae27de6efbe6cf1f24f2561bf48f87
X-Git-Newrev: 91381143e86110f1912ca539b807be9bad4716ed
X-Patchwork-Hint: ignore
Message-Id: <20231025202414.9758A85EDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: bump version to 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=91381143e86110f1912ca539b807be9bad4716ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now upstreamed patches.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...enssl-x509-Remove-internal-OpenSSL-crypto.patch | 44 ------------
 ...cryptlib_openssl-ecd-Allow-disabling-code.patch | 56 ---------------
 ...enssl-ec-Remove-internal-OpenSSL-crypto-i.patch | 82 ----------------------
 ...txt-Allow-disabling-EDDSA-support-from-co.patch | 31 --------
 package/libspdm/libspdm.hash                       |  2 +-
 package/libspdm/libspdm.mk                         |  2 +-
 6 files changed, 2 insertions(+), 215 deletions(-)

diff --git a/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
deleted file mode 100644
index d5d233b7ab..0000000000
--- a/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7db883cdb3369cfaf9f0890b0eda503f47a5ffa3 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 11 Aug 2023 16:26:53 -0400
-Subject: [PATCH] cryptlib_openssl: x509: Remove internal OpenSSL crypto
- include
-
-The OpenSSL source code describes the crypto include as:
-"Internal EC functions for other submodules: not for application use"
- - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
-
-Using the internal APIS makes it difficult to use libspdm as a library
-with other packages. So let's remove the uses of the internal API and
-instead use the public API.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream: https://github.com/DMTF/libspdm/commit/7db883cdb3369cfaf9f0890b0eda503f47a5ffa3
----
- os_stub/cryptlib_openssl/pk/x509.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/os_stub/cryptlib_openssl/pk/x509.c b/os_stub/cryptlib_openssl/pk/x509.c
-index c067f3d0ca..1a2736132b 100644
---- a/os_stub/cryptlib_openssl/pk/x509.c
-+++ b/os_stub/cryptlib_openssl/pk/x509.c
-@@ -17,7 +17,6 @@
- #include <openssl/bn.h>
- #include <openssl/pem.h>
- #include <openssl/bio.h>
--#include <crypto/x509.h>
- 
- #if LIBSPDM_CERT_PARSE_SUPPORT
- 
-@@ -2318,7 +2317,7 @@ bool libspdm_set_attribute_for_req(X509_REQ *req, uint8_t *req_info, size_t req_
-     /*get subject name from req_info and set it to CSR*/
-     x509_req_info = d2i_X509_REQ_INFO(NULL, (const unsigned char **)(&req_info), req_info_len);
-     if (x509_req_info) {
--        X509_REQ_set_subject_name(req, x509_req_info->subject);
-+        X509_REQ_set_subject_name(req, X509_REQ_get_subject_name((X509_REQ *)x509_req_info));
-         X509_REQ_INFO_free(x509_req_info);
-     } else {
-         return false;
--- 
-2.40.1
-
diff --git a/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch b/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
deleted file mode 100644
index 0ab347b3e0..0000000000
--- a/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From e87687d72688e980b929920b7d77dca26fff169e Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 21 Aug 2023 14:00:46 -0400
-Subject: [PATCH] cryptlib_openssl: ecd: Allow disabling code
-
-The OpenSSL source code describes the crypto include as:
-"Internal EC functions for other submodules: not for application use"
- - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
-
-Using the internal APIS makes it difficult to use libspdm as a library
-with other packages. So let's remove the uses of the internal API and
-instead use the public API.
-
-The current ECD code uses internal APIs, making it unsuitable for use in
-production code or libraries.
-
-The supported way to do this is via OSSL params, either with
-EVP_PKEY_fromdata() [1] or using EVP_PKEY_set_octet_string_param().
-
-Unfortunately this isn't supported in OpenSSL and ed25519_set_params()
-and ed448_set_params() will always return 1, indicating no support.
-
-As there doesn't appear to be a supported method in OpenSSL to set the
-public and private keys, let's instead allow users to disable this
-support so the library can be used with the regular OpenSSL libraries.
-
-https://www.openssl.org/docs/man3.0/man3/EVP_PKEY_fromdata.html
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream: https://github.com/DMTF/libspdm/commit/e87687d72688e980b929920b7d77dca26fff169e
----
- os_stub/cryptlib_openssl/pk/ecd.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/os_stub/cryptlib_openssl/pk/ecd.c b/os_stub/cryptlib_openssl/pk/ecd.c
-index d7cc156d86..23dbd0390b 100644
---- a/os_stub/cryptlib_openssl/pk/ecd.c
-+++ b/os_stub/cryptlib_openssl/pk/ecd.c
-@@ -12,6 +12,9 @@
-  **/
- 
- #include "internal_crypt_lib.h"
-+
-+#if (LIBSPDM_EDDSA_ED25519_SUPPORT) || (LIBSPDM_EDDSA_ED448_SUPPORT)
-+
- #include <openssl/evp.h>
- #include <crypto/evp.h>
- 
-@@ -471,3 +474,4 @@ bool libspdm_eddsa_verify(const void *ecd_context, size_t hash_nid,
-     EVP_MD_CTX_free(ctx);
-     return true;
- }
-+#endif /* (LIBSPDM_EDDSA_ED25519_SUPPORT) || (LIBSPDM_EDDSA_ED448_SUPPORT) */
--- 
-2.40.1
-
diff --git a/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch b/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
deleted file mode 100644
index aacda14789..0000000000
--- a/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 567b1c8ea731fe42650d43ede50a105b772dc7aa Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 11 Aug 2023 16:24:23 -0400
-Subject: [PATCH] cryptlib_openssl: ec: Remove internal OpenSSL crypto include
-
-The OpenSSL source code describes the crypto include as:
-"Internal EC functions for other submodules: not for application use"
- - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
-
-Using the internal APIS makes it difficult to use libspdm as a library
-with other packages. So let's remove the uses of the internal API and
-instead use the public API.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream: https://github.com/DMTF/libspdm/commit/567b1c8ea731fe42650d43ede50a105b772dc7aa
----
- os_stub/cryptlib_openssl/pk/ec.c | 26 ++++++++++++++++++++++----
- 1 file changed, 22 insertions(+), 4 deletions(-)
-
-diff --git a/os_stub/cryptlib_openssl/pk/ec.c b/os_stub/cryptlib_openssl/pk/ec.c
-index 7dd9a8b0f8..09df0b9a25 100644
---- a/os_stub/cryptlib_openssl/pk/ec.c
-+++ b/os_stub/cryptlib_openssl/pk/ec.c
-@@ -15,7 +15,6 @@
- #include <openssl/bn.h>
- #include <openssl/ec.h>
- #include <openssl/objects.h>
--#include <crypto/ec.h>
- 
- /**
-  * Allocates and Initializes one Elliptic Curve context for subsequent use
-@@ -854,7 +853,7 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
-                                            uint8_t* random, size_t random_len)
- {
-     BN_CTX *ctx = NULL;
--    BIGNUM *k = NULL, *r = NULL, *X = NULL;
-+    BIGNUM *k = NULL, *r = NULL, *X = NULL, *e = NULL;
-     const BIGNUM *order;
-     EC_POINT *tmp_point = NULL;
-     const EC_GROUP *group;
-@@ -901,6 +900,11 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
-         goto err;
-     }
- 
-+    e = BN_CTX_get(ctx);
-+    if (e == NULL) {
-+        return 0;
-+    }
-+
-     /*random number*/
-     k = BN_bin2bn(random, random_len, NULL);
- 
-@@ -915,10 +919,24 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
-         goto err;
-     }
- 
--    /* compute the inverse of k */
--    if (!ossl_ec_group_do_inverse_ord(group, k, k, ctx)) {
-+    /*
-+     * compute the inverse of k
-+     * Based on ossl_ec_group_do_inverse_ord() from OpenSSL
-+     */
-+    BN_CTX_start(ctx);
-+    if (!BN_set_word(e, 2)) {
-+        BN_CTX_end(ctx);
-+        goto err;
-+    }
-+    if (!BN_sub(e, order, e)) {
-+        BN_CTX_end(ctx);
-+        goto err;
-+    }
-+    if (!BN_mod_exp_mont(k, k, e, order, ctx, EC_GROUP_get_mont_data(group))) {
-+        BN_CTX_end(ctx);
-         goto err;
-     }
-+    BN_CTX_end(ctx);
- 
-     /* clear old values if necessary */
-     BN_clear_free(*rp);
--- 
-2.40.1
-
diff --git a/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch b/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
deleted file mode 100644
index fe616490f7..0000000000
--- a/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 97611ce8279341205463ace6a5f2ff93c52fc417 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 30 Aug 2023 13:37:07 +1000
-Subject: [PATCH] CMakeLists.txt: Allow disabling EDDSA support from command
- line
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream: https://github.com/DMTF/libspdm/pull/2330
----
- CMakeLists.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8a18c467a5..47b93f8bb7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -155,6 +155,11 @@ else()
-     MESSAGE(FATAL_ERROR "Unknown CRYPTO")
- endif()
- 
-+if(DISABLE_EDDSA STREQUAL "1")
-+    add_definitions(-DLIBSPDM_EDDSA_ED25519_SUPPORT=0)
-+    add_definitions(-DLIBSPDM_EDDSA_ED448_SUPPORT=0)
-+endif()
-+
- if(ENABLE_BINARY_BUILD STREQUAL "1")
-     if(NOT CRYPTO STREQUAL "openssl")
-         MESSAGE(FATAL_ERROR "enabling binary build not supported for non-openssl")
--- 
-2.40.1
-
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 5095d3c3b8..3280ebfb88 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3a40daa59f32843062c3d2699acee09bd0ee217eb8ebf0378ae12b60b6db0636  libspdm-3.0.0.tar.gz
+sha256  73e0d7df3c91beeb9f61a50eaa0a44c8e32b7a62ce32ed3cab1f0fab406ed5b8  libspdm-3.1.0.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index cbcbed29de..b216d98093 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.0.0
+LIBSPDM_VERSION = 3.1.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
