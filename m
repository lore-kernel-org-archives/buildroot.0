Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1126606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TuQwlR/3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0945811DD;
	Fri,  6 Nov 2026 15:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOWJPDXUPqtf; Fri,  6 Nov 2026 15:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 107AC8137E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980774;
	b=Th222zso0C1rW++yPjd2jRM68jBm9o7IZQkuMGCJnxyJ4SwrMslqj0i8OCEFPwlaiA6Y
	 hdktQ7MAY2RTRsGpZ6ogWhNsOAk6v2ExHAorLvFdhrgoqOJEN8Fr4go2CN2ZQcISgsZ/t
	 PHYMZ4G+JjZHGQwmFurFVQfujfS9k/WD026cbrxyaUogz8poMJHk92rdfdIujrf0evUE0
	 IBBSNLcFH21956WhapOBbtlIenM+KhZUC/g8HnvELwZKmdewIjAmmhJL3wkkkiv9B5IDj
	 ypwIxp/vwmWYYiM1CnJmjvXLrl0Ff4rXKLKoV0+iGDFuwkI+zjYYkVJ826mvQoojllQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NFj4XlFmT7hVL6CxouYieP01HohRWXByoAWJRd0m84Q=;
	b=LWHhLQRFMj1m2ptjPtfirOWBH7HN0plTFszO4dstlHqz/5Igo05xZGbqn9bSKqBbfrbh
	 ZW43U9WROt/zCL6Inasspt26K5nD9xSLkpuvvCyoEQlYzzW8KGzNyicZLA7taG4w+I4fV
	 GTBkMxHQr1Bnd+in1mhV19WxOBYmfuIRJA3Gc3bVKC0GlaNLlg6eSGUGexL6r/aKyucwk
	 S2jgaAe+uBipAF2VxzwIRRSm3ohQYMt6a5lP3+r4dNyuWlL/o9eVGAmOB3OmPioQtOBru
	 0vqsb3GGLgKTnEHPVNogw9l7s7mlSMD3tK5qTiunLmI0C6glGDPP/19tj/g2pmG3cyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980774;
	bh=NFj4XlFmT7hVL6CxouYieP01HohRWXByoAWJRd0m84Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TuQwlR/3VNIajdhgFrixEdJitSF8ieom6yeQ6P/wIGzc7KyNPwkYxPR29YbiurYTq
	 WxfG5nSsM6CQRIdCE8H92xPz+inGKWb7Hkax/zQgwHHuVJK0+NSjU4EWXzAnAiq+NE
	 1TJqruYiZMMAV7y0mxpjqAi1190YzgelXP9dCTNY0k0NJhVDZ/VTJbT26AkO5sjIaE
	 2NmeKkPnqaus3dBWntsyPgt0B51YnWYxaLu893XzDJfoEF1b5HH/nBmxphdIHv56/S
	 2oXqbmvbMnMLg1vl0wzezgG16/y+IFvhqJh4XYIe5NJGXnmmWvf1onQVBPz0RiuNvb
	 TAl+JsYfL2FOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 107AC8137E;
	Fri,  6 Nov 2026 15:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8BD4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E5AE406CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_i84amH9KKd for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41E3840917
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41E3840917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79A4B9E0A8; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 08:40:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4734ba2b3f170750e1cf794d8db1145fc7ae6ef2
X-Git-Newrev: 46d1cc02378c3fc3c3567224786b2afa7827830a
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.79A4B9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh: fix build
 with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5008522185583306740=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5008522185583306740==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46d1cc02378c3fc3c3567224786b2afa7827830a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building libssh with LibreSSL fails with the following error:

```
/home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c: In function 'chacha20_poly1305_packet_setup':
/home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c:942:41: error: 'EVP_PKEY_POLY1305' undeclared (first use in this function)
  942 |         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
      |                                         ^~~~~~~~~~~~~~~~~
```

LibreSSL doesn't define `EVP_PKEY_POLY1305` but has it's own
implementation.

This can be reproduced with the following defconfig:

```
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH_OPENSSL=y
```

Upstream project fixed this with commit [1], included in Buildroot
master branch with libssh bump to v0.12.0 [2].

Support for Poly1305 was originally added in upstream commit [3] (libssh
v0.10.0) and the issue started with upstream commit [4] (libssh v0.11.0)
that removed the declaration check as it was assumed to be implicetely
present with deprecation of older OpenSSL releases.

[1] https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
[2] c522110685 package/libssh: bump version to 0.12.0
[3] https://github.com/libssh/libssh-mirror/commit/60a987fd172f743462e0a9c61638279ec7b77f67
[4] https://github.com/libssh/libssh-mirror/commit/28d27c3ae4fe1fd340972ae38cc6af23866dc83f

Fixes: https://autobuild.buildroot.org/results/abd/abd2de32e2edd82bdaacb25002e393e00bbf8c83/
Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...to-Add-support-for-Poly1305-from-LibreSSL.patch | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
new file mode 100644
index 0000000000..9f7ee2bc99
--- /dev/null
+++ b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
@@ -0,0 +1,124 @@
+From a1e49728baee40c6814a93fbe4c1a53b186efd30 Mon Sep 17 00:00:00 2001
+From: Shreyas Mahajan <shreyasmahajan05@gmail.com>
+Date: Wed, 21 Jan 2026 17:45:08 +0530
+Subject: [PATCH] crypto: Add support for Poly1305 from LibreSSL
+
+Signed-off-by: Shreyas Mahajan <shreyasmahajan05@gmail.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+Upstream: https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
+[Thomas: backport for libssh 0.11.5]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index b928451..6210142 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -40,7 +40,9 @@
+ #endif
+ 
+ #ifdef HAVE_LIBCRYPTO
+-
++#ifdef LIBRESSL_VERSION_NUMBER
++#include <openssl/poly1305.h>
++#endif
+ #include <openssl/err.h>
+ #include <openssl/md5.h>
+ #include <openssl/opensslv.h>
+@@ -749,7 +751,10 @@ struct chacha20_poly1305_keysched {
+     EVP_CIPHER_CTX *main_evp;
+     /* cipher handle used for encrypting the length field */
+     EVP_CIPHER_CTX *header_evp;
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* LibreSSL Poly1305 context */
++    poly1305_context poly_ctx;
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     /* mac handle used for authenticating the packets */
+     EVP_PKEY_CTX *pctx;
+     /* Poly1305 key */
+@@ -777,7 +782,9 @@ chacha20_poly1305_cleanup(struct ssh_cipher_struct *cipher)
+     ctx->main_evp  = NULL;
+     EVP_CIPHER_CTX_free(ctx->header_evp);
+     ctx->header_evp = NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* nothing to free */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     /* ctx->pctx is freed as part of MD context */
+     EVP_PKEY_free(ctx->key);
+     ctx->key = NULL;
+@@ -841,7 +848,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
+     /* The Poly1305 key initialization is delayed to the time we know
+      * the actual key for packet so we do not need to create a bogus keys
+      */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* nothing, poly1305_context is stack based */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     ctx->mctx = EVP_MD_CTX_new();
+     if (ctx->mctx == NULL) {
+         SSH_LOG(SSH_LOG_TRACE, "EVP_MD_CTX_new failed");
+@@ -935,8 +944,11 @@ chacha20_poly1305_packet_setup(struct ssh_cipher_struct *cipher,
+     ssh_log_hexdump("poly_key", poly_key, POLY1305_KEYLEN);
+ #endif /* DEBUG_CRYPTO */
+ 
+-    /* Set the Poly1305 key */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++/* LibreSSL path: use direct Poly1305 implementation */
++#if defined(LIBRESSL_VERSION_NUMBER)
++    CRYPTO_poly1305_init(&ctx->poly_ctx, poly_key);
++/* Set the Poly1305 key */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     if (ctx->key == NULL) {
+         /* Poly1305 Initialization needs to know the actual key */
+         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
+@@ -1030,7 +1042,9 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
+     uint8_t tag[POLY1305_TAGLEN] = {0};
+     int ret = SSH_ERROR;
+     int rv, cmp, len = 0;
++#if !defined(LIBRESSL_VERSION_NUMBER)
+     size_t taglen = POLY1305_TAGLEN;
++#endif
+ 
+     /* Prepare the Poly1305 key */
+     rv = chacha20_poly1305_packet_setup(cipher, seq, 0);
+@@ -1044,7 +1058,13 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
+ #endif /* DEBUG_CRYPTO */
+ 
+     /* Calculate MAC of received data */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    CRYPTO_poly1305_update(&ctx->poly_ctx,
++                           complete_packet,
++                           encrypted_size + sizeof(uint32_t));
++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
++
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     rv = EVP_DigestSignUpdate(ctx->mctx, complete_packet,
+                               encrypted_size + sizeof(uint32_t));
+     if (rv != 1) {
+@@ -1114,7 +1134,9 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
+ {
+     struct ssh_packet_header *in_packet = in, *out_packet = out;
+     struct chacha20_poly1305_keysched *ctx = cipher->chacha20_schedule;
++#if !defined(LIBRESSL_VERSION_NUMBER)
+     size_t taglen = POLY1305_TAGLEN;
++#endif
+     int ret, outlen = 0;
+ 
+     /* Prepare the Poly1305 key */
+@@ -1161,7 +1183,13 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
+     }
+ 
+     /* step 4, compute the MAC */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++
++    CRYPTO_poly1305_update(&ctx->poly_ctx,
++                           (const unsigned char *)out_packet,
++                           len);
++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     ret = EVP_DigestSignUpdate(ctx->mctx, out_packet, len);
+     if (ret <= 0) {
+         SSH_LOG(SSH_LOG_TRACE, "EVP_DigestSignUpdate failed");

--===============5008522185583306740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5008522185583306740==--
