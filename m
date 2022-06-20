Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A53AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D0D60FEC;
	Mon, 20 Jun 2022 19:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D0D60FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZ4-rFjM-Ezf; Mon, 20 Jun 2022 19:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0961F60FE9;
	Mon, 20 Jun 2022 19:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0961F60FE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D49BB1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF231418BB
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF231418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lL0mhHhaYA2B for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:09:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2466418C9
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2466418C9
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:09:07 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout12.t-online.de (Postfix) with SMTP id 002CC1BB45
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:09:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.84]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o3Mlk-3TMrtR0; Mon, 20 Jun 2022 21:09:04 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54574)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o3Mlk-00072t-Dg
 for buildroot@buildroot.org; Mon, 20 Jun 2022 21:09:04 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:09:04 +0200
Message-Id: <20220620190904.856075-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655752144-0143B811-02F475FE/0/0 CLEAN NORMAL
X-TOI-MSGID: d9897be7-29bc-43c3-87e8-6d945e59f06d
Subject: [Buildroot] [PATCH 1/1] package/tor: fix LibreSSL build
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

Fixes:
http://autobuild.buildroot.net/results/71e/71e03ee8f6e6e5a235556b85a360cbad23a22897/
http://autobuild.buildroot.net/results/4a9/4a93bea0b83eca133ace3e3cfd2b5cb60b691d6e/
http://autobuild.buildroot.net/results/6b8/6b8ab9c5253586426b33d2cba20e7f9f992dbee9/
http://autobuild.buildroot.net/results/8a9/8a9c19878c2d599de6aa3bb3a849b1701f50a829/

and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...rc_lib_crypt_ops_crypto_dh_openssl_c.patch | 67 +++++++++++++++++++
 ...c_lib_crypt_ops_crypto_rsa_openssl_c.patch | 58 ++++++++++++++++
 ...003-patch-src_lib_tls_x509_openssl_c.patch | 22 ++++++
 3 files changed, 147 insertions(+)
 create mode 100644 package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
 create mode 100644 package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
 create mode 100644 package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch

diff --git a/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch b/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
new file mode 100644
index 0000000000..2df7c6b6a7
--- /dev/null
+++ b/package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch
@@ -0,0 +1,67 @@
+Fix build with opaque structs in LibreSSL 3.5
+
+Downloaded from OpenBSD ports:
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_crypt_ops_crypto_dh_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
+
+Patch series was sent upstream:
+https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: src/lib/crypt_ops/crypto_dh_openssl.c
+--- a/src/lib/crypt_ops/crypto_dh_openssl.c.orig
++++ b/src/lib/crypt_ops/crypto_dh_openssl.c
+@@ -60,7 +60,7 @@ crypto_validate_dh_params(const BIGNUM *p, const BIGNU
+   /* Copy into a temporary DH object, just so that DH_check() can be called. */
+   if (!(dh = DH_new()))
+       goto out;
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   BIGNUM *dh_p, *dh_g;
+   if (!(dh_p = BN_dup(p)))
+     goto out;
+@@ -223,7 +223,7 @@ new_openssl_dh_from_params(BIGNUM *p, BIGNUM *g)
+     goto err;
+   }
+ 
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+ 
+   if (!DH_set0_pqg(res_dh, dh_p, NULL, dh_g)) {
+     goto err;
+@@ -276,7 +276,7 @@ crypto_dh_get_bytes(crypto_dh_t *dh)
+ int
+ crypto_dh_generate_public(crypto_dh_t *dh)
+ {
+-#ifndef OPENSSL_1_1_API
++#if !defined(OPENSSL_1_1_API) && !defined(LIBRESSL_VERSION_NUMBER)
+  again:
+ #endif
+   if (!DH_generate_key(dh->dh)) {
+@@ -286,7 +286,7 @@ crypto_dh_generate_public(crypto_dh_t *dh)
+     return -1;
+     /* LCOV_EXCL_STOP */
+   }
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   /* OpenSSL 1.1.x doesn't appear to let you regenerate a DH key, without
+    * recreating the DH object.  I have no idea what sort of aliasing madness
+    * can occur here, so do the check, and just bail on failure.
+@@ -327,7 +327,7 @@ crypto_dh_get_public(crypto_dh_t *dh, char *pubkey, si
+ 
+   const BIGNUM *dh_pub;
+ 
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   const BIGNUM *dh_priv;
+   DH_get0_key(dh->dh, &dh_pub, &dh_priv);
+ #else
+@@ -338,7 +338,7 @@ crypto_dh_get_public(crypto_dh_t *dh, char *pubkey, si
+     if (crypto_dh_generate_public(dh)<0)
+       return -1;
+     else {
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+       DH_get0_key(dh->dh, &dh_pub, &dh_priv);
+ #else
+       dh_pub = dh->dh->pub_key;
diff --git a/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch b/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
new file mode 100644
index 0000000000..1354a4221e
--- /dev/null
+++ b/package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch
@@ -0,0 +1,58 @@
+Fix build with opaque structs in LibreSSL 3.5
+
+Downloaded from OpenBSD ports:
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_crypt_ops_crypto_rsa_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
+
+Patch series was sent upstream:
+https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: src/lib/crypt_ops/crypto_rsa_openssl.c
+--- a/src/lib/crypt_ops/crypto_rsa_openssl.c.orig
++++ b/src/lib/crypt_ops/crypto_rsa_openssl.c
+@@ -47,7 +47,7 @@ struct crypto_pk_t
+ int
+ crypto_pk_key_is_private(const crypto_pk_t *k)
+ {
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   if (!k || !k->key)
+     return 0;
+ 
+@@ -212,7 +212,7 @@ crypto_pk_public_exponent_ok(const crypto_pk_t *env)
+ 
+   const BIGNUM *e;
+ 
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   const BIGNUM *n, *d;
+   RSA_get0_key(env->key, &n, &e, &d);
+ #else
+@@ -242,7 +242,7 @@ crypto_pk_cmp_keys(const crypto_pk_t *a, const crypto_
+   const BIGNUM *a_n, *a_e;
+   const BIGNUM *b_n, *b_e;
+ 
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   const BIGNUM *a_d, *b_d;
+   RSA_get0_key(a->key, &a_n, &a_e, &a_d);
+   RSA_get0_key(b->key, &b_n, &b_e, &b_d);
+@@ -279,7 +279,7 @@ crypto_pk_num_bits(crypto_pk_t *env)
+   tor_assert(env);
+   tor_assert(env->key);
+ 
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+   /* It's so stupid that there's no other way to check that n is valid
+    * before calling RSA_bits().
+    */
+@@ -572,7 +572,7 @@ static bool
+ rsa_private_key_too_long(RSA *rsa, int max_bits)
+ {
+   const BIGNUM *n, *e, *p, *q, *d, *dmp1, *dmq1, *iqmp;
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ #if OPENSSL_VERSION_NUMBER >= OPENSSL_V_SERIES(1,1,1)
+   n = RSA_get0_n(rsa);
diff --git a/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch b/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch
new file mode 100644
index 0000000000..fe8586357a
--- /dev/null
+++ b/package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch
@@ -0,0 +1,22 @@
+Fix build with opaque structs in LibreSSL 3.5
+
+Downloaded from OpenBSD ports:
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tor/patches/patch-src_lib_tls_x509_openssl_c?rev=1.2&content-type=text/x-cvsweb-markup
+
+Patch series was sent upstream:
+https://forum.torproject.net/t/tor-relays-openbsd-stable-net-tor-and-0-4-7-7/3244
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: src/lib/tls/x509_openssl.c
+--- a/src/lib/tls/x509_openssl.c.orig
++++ b/src/lib/tls/x509_openssl.c
+@@ -329,7 +329,7 @@ tor_tls_cert_is_valid(int severity,
+   cert_key = X509_get_pubkey(cert->cert);
+   if (check_rsa_1024 && cert_key) {
+     RSA *rsa = EVP_PKEY_get1_RSA(cert_key);
+-#ifdef OPENSSL_1_1_API
++#if defined(OPENSSL_1_1_API) || defined(LIBRESSL_VERSION_NUMBER)
+     if (rsa && RSA_bits(rsa) == 1024) {
+ #else
+     if (rsa && BN_num_bits(rsa->n) == 1024) {
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
