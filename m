Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80A606A31F
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PfHbscNH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5502A808A0;
	Sun, 25 Oct 2026 20:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faEuevdYfi_v; Sun, 25 Oct 2026 20:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 25FF1808A8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960782;
	b=gPYUE7w6l3nTu00iefVp0m6JAzpxcEmb+yvDH0RFPetCK38DhinKLGM+C75oOgT5TNxP
	 C2EUnBpvnLaBrPC4NOwScbjfcKt51rpn9muZiMUwz5M7vuMirQxi2hESKAa2rQCThM6Pu
	 UwwHQjVcD6YjbF6HhY0VddUL8IpqZrb9If0SmOaDG2fgzdUc/ecBDuUeNwI+ryUxBH/F9
	 6UxTQLpmnNxF643Q7BaVbVcSUav7XdaRRipvW7Viyh5SziyK1+zm+6rxNlm+pCbjFup6y
	 4Yf7/lU4myENHLDRh/nnTRZraRmPebtTd1hZagPmb8iDAoQC2dj/IT5+9gtfPFay37w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tSwYAZecvM/pL4DN3eR1JV4O3jMAjdEnVBDsq4DNyvw=;
	b=O631CdMBW+P3xT30BuCFCZIkDzcCjay7efs2z/lVKfyMDBfjyxoBResQGwvLJFYXl/R+
	 aE/x3rxw0i2QpFz6ldfLPUIGyyXApqIImdlzYPRgl6LoKEymgdkY70SX04ww9E57pn6f8
	 cVHAiHWWR24qwd9f4rfDFoJ67GkBUawI6kS1VwagS+o5GML25IgzgOBuT0bqNtj9sumjL
	 4MKFqEz/QGiXzVaV7cniXSGKyWLaSJRmjdNL82Y+B0qFzgtjlRvn4sUSoecswrFP4L3dO
	 6b7qwfeqPTObDIQEiJvj7SrkP1u/r56yPWWoeJ0pu0zeYcgmHEDp/bV1a/esaClBpvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960782;
	bh=tSwYAZecvM/pL4DN3eR1JV4O3jMAjdEnVBDsq4DNyvw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PfHbscNHZGx12XtUjJF+Xj1+U3olN7FMgLhHuj/81E+i1ggwPB1EACduWxiUZ+8xL
	 glIwWZfu4yWu46UGDAtqZF0QzHo0aZrqBVtDA76DeXt9iL8lE4XJvuwSAeP5IZoKAa
	 DsK2SsJN5/3t2QG1u7ROk02BaekMupJmF+MW9saLy980ab+6Eeb4Cn7eLkfYO7prtP
	 laewDqJdieOJsLvbMzpTQw80wePwk/9OOaWlblDE6B45cL73ASHylD+qA8lRoEgz7s
	 /2GAlhzxyKs3eFuTTiWpA5IqsBeENr9FaCU78rPnGUVZrPBttm6zbwyOGw2ZctUUIC
	 qF1b3fs+97GWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FF1808A8;
	Sun, 25 Oct 2026 20:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE1B79F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E0E440070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70f3CBlqQIVq for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BA8D540057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960778;
 b=IcwmQydbHji3mYsbWRtnLGlhewH+WOeAUraaazoGjkbRI/n83if3BCUTGjIUcrGeMqgk
 dj0Bc2fsA5KBhEVxl+YbUIFB+ID6JyG2Qt+BjSj6NqUIvTwiedwVDwRx+VP6wpEoWjmDH
 zsY5lNbXH7ElFCIVt5pjH9Yb0cvJwsVgtT57O6r3X3kq7HSa155h8apLSdzo15adyKomf
 6AQ1MCMYhTNkD0UsV/gf6llw6Gj18LscQGtTJHn5/ky2XXqsBPptqeyKghtH4/aNzzQIf
 oTgVDIRLgXu2lMpmDt+etALbCZEOtjKcBUwFjKNs21uK+qEoxBhOP5kI+tBv2YHqvyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960778;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6ZgYDnUYRB7YFJIWNuiyn5tRyE76Zp9Vsd+nIBQ+16Q=;
 b=W80vnyczOqVKS+HzhGi005HURvqAcR05zmPfqUXUgwBl/IOPkR5QXFfNGjNmd+Ps7yux
 Q/Xq2s7tI1nROoREk4b87Jzd6/vRHg4e60ebFl34z7QOhrArle3GAbM6SNiHKfGlD+wcR
 xeepyVjsHjG3xpZ4Ot3k2jHW/JzcLAG66lOBinQy3fKm9h94PersbPYLzgGYuAU7nFTCN
 +XuuE47/B/4utoCqiaA7xq8FsGcQ6oYgHAiZz1iRP/pMvCV9p5sgvZWa4SSm6ikVMNVpY
 QTk0mss/45Z5qP+gqT/naoiv94rBHiAULnFEDspqMyaYAp4sRMtvQ8V67hzbsBT04dQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8D540057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B1999B9A7; Sun, 25 Oct 2026 20:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:38:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 328f848ce1bc0d593b21142522390f73cc325de8
X-Git-Newrev: d1c66c6d8ff032497b75e16456e61821e6c849e4
X-Patchwork-Hint: ignore
Message-Id: <20261025203813.2B1999B9A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-openssl: fix build with
 OpenSSL 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1c66c6d8ff032497b75e16456e61821e6c849e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch 0003 fixes the build error and needs patch 0002 to be applied
cleanly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oading-of-parent-handles-in-TPM-TSS2-keys.patch | 118 +++++++++++++++++++++
 ...003-pkey-fix-compilation-with-OpenSSL-4.1.patch |  88 +++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch b/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch
new file mode 100644
index 0000000000..4997fecc9e
--- /dev/null
+++ b/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch
@@ -0,0 +1,118 @@
+From ec1d2d1380521e9718552c2d0191d6aa26481ed5 Mon Sep 17 00:00:00 2001
+From: Petr Gotthard <petr.gotthard@advantech.cz>
+Date: Sat, 25 Apr 2026 20:06:16 +0200
+Subject: [PATCH] fix loading of parent handles in TPM TSS2 keys
+
+Fixes: #152
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/ec1d2d1380521e9718552c2d0191d6aa26481ed5
+
+[backported without new tests]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am                           |  2 ++
+ src/tpm2-provider-pkey.c              | 38 ++++++++++++++++++---------
+ test/rsa_encodeobject_check.sh        | 27 +++++++++++++++++++
+ test/rsa_encodeobject_check_parent.sh | 29 ++++++++++++++++++++
+ 4 files changed, 84 insertions(+), 12 deletions(-)
+ create mode 100755 test/rsa_encodeobject_check.sh
+ create mode 100755 test/rsa_encodeobject_check_parent.sh
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index f739c17..97fb4dd 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -53,6 +53,8 @@ int
+ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT format)
+ {
+     TSSPRIVKEY *tpk = NULL;
++    BIGNUM *bn_parent = NULL;
++    int res = 0;
+ 
+     uint8_t privbuf[sizeof(keydata->priv)];
+     uint8_t pubbuf[sizeof(keydata->pub)];
+@@ -74,13 +76,18 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+     if (!tpk->type)
+         goto error;
+ 
+-    // note the ASN1_INTEGER_set is not reliable for uin32_t on 32-bit machines
+     tpk->emptyAuth = ! !keydata->emptyAuth;
++
++    // note the ASN1_INTEGER_set is not reliable for uin32_t on 32-bit machines
++    if (!(bn_parent = BN_new()))
++        goto error;
++
+     if (keydata->parent != 0)
+-        ASN1_INTEGER_set_uint64(tpk->parent, keydata->parent);
++        BN_set_word(bn_parent, keydata->parent);
+     else
+-        ASN1_INTEGER_set_uint64(tpk->parent, TPM2_RH_OWNER);
++        BN_set_word(bn_parent, TPM2_RH_OWNER);
+ 
++    BN_to_ASN1_INTEGER(bn_parent, tpk->parent);
+     ASN1_STRING_set(tpk->privkey, &privbuf[0], privbuf_len);
+     ASN1_STRING_set(tpk->pubkey, &pubbuf[0], pubbuf_len);
+ 
+@@ -95,11 +102,11 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+         goto error;
+     }
+ 
+-    TSSPRIVKEY_free(tpk);
+-    return 1;
++    res = 1;
+ error:
++    BN_free(bn_parent);
+     TSSPRIVKEY_free(tpk);
+-    return 0;
++    return res;
+ }
+ 
+ /** Deserialize TPM2_KEYDATA from disk
+@@ -114,9 +121,11 @@ error:
+ int
+ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+ {
+-    uint64_t parent;
++    BIGNUM *bn_parent = NULL;
++    TPM2_HANDLE parent;
+     TSSPRIVKEY *tpk = NULL;
+     char type_oid[64];
++    int res = 0;
+ 
+     switch (format) {
+     case KEY_FORMAT_PEM:
+@@ -135,9 +144,14 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+     keydata->emptyAuth = (tpk->emptyAuth != V_ASN1_UNDEF && tpk->emptyAuth);
+ 
+     // the ASN1_INTEGER_get on a 32-bit machine will fail for numbers of UINT32_MAX
+-    if (!ASN1_INTEGER_get_uint64(&parent, tpk->parent))
++    if (!(bn_parent = ASN1_INTEGER_to_BN(tpk->parent, NULL)))
+         goto error;
+ 
++    if (BN_is_negative(bn_parent))
++        parent = ASN1_INTEGER_get(tpk->parent);
++    else
++        parent = BN_get_word(bn_parent);
++
+     if (parent == 0)
+         keydata->parent = TPM2_RH_OWNER;
+     else if (parent <= UINT32_MAX)
+@@ -159,11 +173,11 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+                                        &keydata->pub))
+         goto error;
+ 
++    res = 1;
++error:
++    BN_free(bn_parent);
+     TSSPRIVKEY_free(tpk);
+-    return 1;
+- error:
+-    TSSPRIVKEY_free(tpk);
+-    return 0;
++    return res;
+ }
+ 
+ static const TPM2B_PUBLIC primaryRsaTemplate = {
+-- 
+2.47.3
+
diff --git a/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch b/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..5fb34ddfac
--- /dev/null
+++ b/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch
@@ -0,0 +1,88 @@
+From 9cc4cbe25702fc95c536dfb6723ae454e0039faf Mon Sep 17 00:00:00 2001
+From: Moritz Buhl <moritz.buhl@infineon.com>
+Date: Tue, 1 Sep 2026 09:58:28 +0200
+Subject: [PATCH] pkey: fix compilation with OpenSSL 4.1
+
+Avoid deprecated OpenSSL functions, add fallback defines for older
+versions:
+src/tpm2-provider-pkey.c:91:5: error: 'ASN1_STRING_set' is deprecated:
+Since OpenSSL 4.1; use ASN1_STRING_set1_data() or ASN1_STRING_set1_string()
+[-Werror,-Wdeprecated-declarations]
+src/tpm2-provider-pkey.c:165:41: error: 'ASN1_STRING_length' is deprecated:
+Since OpenSSL 4.1; use ASN1_STRING_get_length()
+[-Werror,-Wdeprecated-declarations]
+
+Add missing header:
+src/tpm2-provider-pkey.c:32:1: error: call to undeclared function 'ERR_raise';
+ISO C99 and later do not support implicit function declarations
+[-Wimplicit-function-declaration]
+
+Signed-off-by: Moritz Buhl <moritz.buhl@infineon.com>
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/9cc4cbe25702fc95c536dfb6723ae454e0039faf
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm2-provider-pkey.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index 84a5532..0d1d3f9 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -2,6 +2,8 @@
+ 
+ #include <string.h>
+ 
++#include <openssl/err.h>
++#include <openssl/opensslv.h>
+ #include <openssl/pem.h>
+ #include <openssl/rand.h>
+ 
+@@ -9,6 +11,14 @@
+ 
+ #include "tpm2-provider-pkey.h"
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x40100000
++#define TPM2_ASN1_STRING_get_length(x)		ASN1_STRING_get_length(x)
++#define TPM2_ASN1_STRING_set1_data(s, d, l)	ASN1_STRING_set1_data(s, d, l)
++#else
++#define TPM2_ASN1_STRING_get_length(x)		ASN1_STRING_length(x)
++#define TPM2_ASN1_STRING_set1_data(s, d, l)	ASN1_STRING_set(s, d, l)
++#endif
++
+ typedef struct {
+     ASN1_OBJECT *type;
+     ASN1_BOOLEAN emptyAuth;
+@@ -88,8 +98,8 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+         BN_set_word(bn_parent, TPM2_RH_OWNER);
+ 
+     BN_to_ASN1_INTEGER(bn_parent, tpk->parent);
+-    ASN1_STRING_set(tpk->privkey, &privbuf[0], privbuf_len);
+-    ASN1_STRING_set(tpk->pubkey, &pubbuf[0], pubbuf_len);
++    TPM2_ASN1_STRING_set1_data(tpk->privkey, &privbuf[0], privbuf_len);
++    TPM2_ASN1_STRING_set1_data(tpk->pubkey, &pubbuf[0], pubbuf_len);
+ 
+     switch (format) {
+     case KEY_FORMAT_PEM:
+@@ -162,13 +172,13 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+         goto error;
+ 
+     if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(ASN1_STRING_get0_data(tpk->privkey),
+-                                        ASN1_STRING_length(tpk->privkey), NULL,
+-                                        &keydata->priv))
++                                        TPM2_ASN1_STRING_get_length(tpk->privkey),
++                                        NULL, &keydata->priv))
+         goto error;
+ 
+     if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(ASN1_STRING_get0_data(tpk->pubkey),
+-                                       ASN1_STRING_length(tpk->pubkey), NULL,
+-                                       &keydata->pub))
++                                       TPM2_ASN1_STRING_get_length(tpk->pubkey),
++                                       NULL, &keydata->pub))
+         goto error;
+ 
+     res = 1;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
