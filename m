Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122CEC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 15:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7F983B96;
	Fri, 25 Aug 2023 15:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7F983B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f55jz79ap0ee; Fri, 25 Aug 2023 15:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9F183AC6;
	Fri, 25 Aug 2023 15:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9F183AC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 835511BF271
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D1E840472
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D1E840472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CI2tXbt4VP5e for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 15:50:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43AF4402D0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 15:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43AF4402D0
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5CF89A4C00F9
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:50:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45842)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZZ4T-00087W-38
 for buildroot@buildroot.org; Fri, 25 Aug 2023 17:50:02 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 17:50:01 +0200
Message-Id: <20230825155001.349004-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692978602;
 bh=COJVaGze9MC2obZDliI7/3BbDlFeDp6HD9k7OZnJRTk=;
 h=From:To:Subject:Date:From;
 b=bN058Ni9sA038C5umzcdl9KxDgJjQQDZ/zfygppWppowlu6oaQb/HmJ/vBbOFtuGX
 2q/oP/eHJAEQiwpChWlunuC/MnPSONSADg0V2knfy0J54d15EPGmErLeMS9wadF4+4
 gf56xJ4g2a9ev8LJHT3TFklrSmH+wAdeXnEE33d839vHNgkdqwmZR/IIK0kTcG60nV
 vTNMEz9StfL46NsqbcJc6fkO0wGEe1IIQ1Vb15QSLUP+DtDq4355gzy/XBCGWy+Xca
 CBYShWKbaYreAxm6oNiEZjWmuR5WjF+s8mBaHoBRrLm1dFvcZvlENC0EsUgEWPayZJ
 JzJaxGo8xeIBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bN058Ni9
Subject: [Buildroot] [PATCH/next 1/1] package/tor: bump version to 0.4.8.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://forum.torproject.org/t/stable-release-0-4-8-4/8884

Removed all patches due to upstream commit adding compatibility with
LibreSSL 3.5:
https://github.com/torproject/tor/commit/f3dabd705f26c56076934323f24b5b05ecdfd39c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Build-tested using this defconfig

BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_TOR=y

 .checkpackageignore                           |  3 -
 ...rc_lib_crypt_ops_crypto_dh_openssl_c.patch | 67 -------------------
 ...c_lib_crypt_ops_crypto_rsa_openssl_c.patch | 58 ----------------
 ...003-patch-src_lib_tls_x509_openssl_c.patch | 22 ------
 package/tor/tor.hash                          |  4 +-
 package/tor/tor.mk                            |  2 +-
 6 files changed, 3 insertions(+), 153 deletions(-)
 delete mode 100644 package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
 delete mode 100644 package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
 delete mode 100644 package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 55eb177f8b..8e56ed3ccf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1440,9 +1440,6 @@ package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch Upstream
 package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch Upstream
 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstream
-package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch Upstream
-package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch Upstream
-package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch Upstream
 package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
diff --git a/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch b/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
deleted file mode 100644
index 2df7c6b6a7..0000000000
--- a/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Fix build with opaque structs in LibreSSL 3.5
-
-Downloaded from OpenBSD ports:
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_crypt_ops_crypto_dh_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
-
-Patch series was sent upstream:
-https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: src/lib/crypt_ops/crypto_dh_openssl.c
---- a/src/lib/crypt_ops/crypto_dh_openssl.c.orig
-+++ b/src/lib/crypt_ops/crypto_dh_openssl.c
-@@ -60,7 +60,7 @@ crypto_validate_dh_params(const BIGNUM *p, const BIGNU
-   /* Copy into a temporary DH object, just so that DH_check() can be called. */
-   if (!(dh = DH_new()))
-       goto out;
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   BIGNUM *dh_p, *dh_g;
-   if (!(dh_p = BN_dup(p)))
-     goto out;
-@@ -223,7 +223,7 @@ new_openssl_dh_from_params(BIGNUM *p, BIGNUM *g)
-     goto err;
-   }
- 
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
- 
-   if (!DH_set0_pqg(res_dh, dh_p, NULL, dh_g)) {
-     goto err;
-@@ -276,7 +276,7 @@ crypto_dh_get_bytes(crypto_dh_t *dh)
- int
- crypto_dh_generate_public(crypto_dh_t *dh)
- {
--#ifndef OPENSSL_1_1_API
-+#if !defined(OPENSSL_1_1_API) && !defined(LIBRESSL_VERSION_NUMBER)
-  again:
- #endif
-   if (!DH_generate_key(dh->dh)) {
-@@ -286,7 +286,7 @@ crypto_dh_generate_public(crypto_dh_t *dh)
-     return -1;
-     /* LCOV_EXCL_STOP */
-   }
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   /* OpenSSL 1.1.x doesn't appear to let you regenerate a DH key, without
-    * recreating the DH object.  I have no idea what sort of aliasing madness
-    * can occur here, so do the check, and just bail on failure.
-@@ -327,7 +327,7 @@ crypto_dh_get_public(crypto_dh_t *dh, char *pubkey, si
- 
-   const BIGNUM *dh_pub;
- 
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   const BIGNUM *dh_priv;
-   DH_get0_key(dh->dh, &dh_pub, &dh_priv);
- #else
-@@ -338,7 +338,7 @@ crypto_dh_get_public(crypto_dh_t *dh, char *pubkey, si
-     if (crypto_dh_generate_public(dh)<0)
-       return -1;
-     else {
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-       DH_get0_key(dh->dh, &dh_pub, &dh_priv);
- #else
-       dh_pub = dh->dh->pub_key;
diff --git a/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch b/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
deleted file mode 100644
index 1354a4221e..0000000000
--- a/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Fix build with opaque structs in LibreSSL 3.5
-
-Downloaded from OpenBSD ports:
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_crypt_ops_crypto_rsa_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
-
-Patch series was sent upstream:
-https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: src/lib/crypt_ops/crypto_rsa_openssl.c
---- a/src/lib/crypt_ops/crypto_rsa_openssl.c.orig
-+++ b/src/lib/crypt_ops/crypto_rsa_openssl.c
-@@ -47,7 +47,7 @@ struct crypto_pk_t
- int
- crypto_pk_key_is_private(const crypto_pk_t *k)
- {
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   if (!k || !k->key)
-     return 0;
- 
-@@ -212,7 +212,7 @@ crypto_pk_public_exponent_ok(const crypto_pk_t *env)
- 
-   const BIGNUM *e;
- 
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   const BIGNUM *n, *d;
-   RSA_get0_key(env->key, &n, &e, &d);
- #else
-@@ -242,7 +242,7 @@ crypto_pk_cmp_keys(const crypto_pk_t *a, const crypto_
-   const BIGNUM *a_n, *a_e;
-   const BIGNUM *b_n, *b_e;
- 
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   const BIGNUM *a_d, *b_d;
-   RSA_get0_key(a->key, &a_n, &a_e, &a_d);
-   RSA_get0_key(b->key, &b_n, &b_e, &b_d);
-@@ -279,7 +279,7 @@ crypto_pk_num_bits(crypto_pk_t *env)
-   tor_assert(env);
-   tor_assert(env->key);
- 
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-   /* It's so stupid that there's no other way to check that n is valid
-    * before calling RSA_bits().
-    */
-@@ -572,7 +572,7 @@ static bool
- rsa_private_key_too_long(RSA *rsa, int max_bits)
- {
-   const BIGNUM *n, *e, *p, *q, *d, *dmp1, *dmq1, *iqmp;
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
- 
- #if OPENSSL_VERSION_NUMBER >= OPENSSL_V_SERIES(1,1,1)
-   n = RSA_get0_n(rsa);
diff --git a/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch b/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch
deleted file mode 100644
index fe8586357a..0000000000
--- a/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix build with opaque structs in LibreSSL 3.5
-
-Downloaded from OpenBSD ports:
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_tls_x509_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
-
-Patch series was sent upstream:
-https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: src/lib/tls/x509_openssl.c
---- a/src/lib/tls/x509_openssl.c.orig
-+++ b/src/lib/tls/x509_openssl.c
-@@ -329,7 +329,7 @@ tor_tls_cert_is_valid(int severity,
-   cert_key = X509_get_pubkey(cert->cert);
-   if (check_rsa_1024 && cert_key) {
-     RSA *rsa = EVP_PKEY_get1_RSA(cert_key);
--#ifdef OPENSSL_1_1_API
-+#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
-     if (rsa && RSA_bits(rsa) == 1024) {
- #else
-     if (rsa && BN_num_bits(rsa->n) == 1024) {
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a6b5f27c40..d87e2742d3 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.14.tar.gz.sha256sum
-sha256  a5ac67f6466380fc05e8043d01c581e4e8a2b22fe09430013473e71065e65df8  tor-0.4.7.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.4.tar.gz.sha256sum
+sha256  09c1ce74a25fc3b48c81ff146cbd0dd538cbbb8fe4e2964fc2fb2b192f6a1d2b  tor-0.4.8.4.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b794296c6a..b3360d3c3b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.14
+TOR_VERSION = 0.4.8.4
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
