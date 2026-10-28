Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988D606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KHOZxCn7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B30D6064F;
	Wed, 28 Oct 2026 17:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqQ_VPs6u21v; Wed, 28 Oct 2026 17:20:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 018E96060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793208011;
	b=ix3FKc9bwAhOBnkrmPavR/vFGM190C7nHyFs/YK4nAO3B2BtYKtexTmoHVZF9djMHIl7
	 g/BbBdYsW4CgrEf8EIHox91BXDxtz/hceuT1ntjQhTpjAjYJhWmniiTv1GUOPaWYddfto
	 3zEUvfEtfLDeMdSomv9L0Tn/oEHuW7JAcoS5g7wB3ySuroBYD3X+GDA4mFUmMPqjGxkrN
	 zK+Hm7mIbNsHkCbFjELYMOU9iN1YzxlCQTwmWJC+GKOqmqdRLj/xWO37Q7XdeH1XeNvDh
	 BbCz0f9/Nc6gbqRitHrVeE1a5RKG+gp/druBuBF+XXP9hNutusybL61jbv0BGB3JsHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793208011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P/tseQQ14805knvlEObcbSrYNI1ss1jorOMoJkYYDE0=;
	b=ROQ4nakHWdPlm+0y6MIzYAUL5sV7AFr+qWwYY/uxeJyHr/htvaqIGwkNm/llii36jx8x
	 GBwlfXYjaGz3CV3yDiwCtJ7f2yyH67cGfIktnJT+9FwUpGdEnot74gJTC4iTOJLQ/Ytui
	 v1JGoZybLXaTOxgTkreRd7dmkUhhrzH4zgIETcq9Par9v3xeAY/qJXv2opU/VfhDLGJxp
	 vz5ap1jDwrh9/LdNItC1LgtjTnCtCe5UH73X8pqG95pz2YFtFLVoTNRgOVcSXvZmcRxT2
	 h/Tq/0olI6LVMdIzi/qJduRoI1lAXJmTMpDV82vHbRnUB9LM4vjSJ/GGrS7v6kQ0TKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793208011;
	bh=P/tseQQ14805knvlEObcbSrYNI1ss1jorOMoJkYYDE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KHOZxCn7JzGgr1iIseoCSLWpcxjPRrAy28eV69aZ/kOV6yvU+bICXSPGvDQxphZ2U
	 GCrPD5pH5JU7GckUdtYLHGKzvTD3JRIHS5StCBYJ9EMGNUlRZtbkB/5AlYvQY1Vvib
	 bElVWoHOmvZrZMWfEEXnC1Oa/oR2TnBcZW3x9sDRfrzPIco8x6JQY7E+K6Z4hRcjvb
	 7MyoziuKQTEaoRDxdEYGy9bfuawyv6fAsz3KW6vSHjSKp9cK6qeMnC5ihq3XhZc5DB
	 uxZL5jT1S+RZ62VkVrL4Id4MdMihZljaWB5yPp9nl4lSlhSPLYtS/LatLo/8hDcBwD
	 I0sx6s/1dSwtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 018E96060A;
	Wed, 28 Oct 2026 17:20:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E6B9F8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C98FA810A1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWSzj96wjNAe for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E7254810A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793208004;
 b=JZeDp7zmChtdvbaCxlkApewntkLFT2RJBJn5cJbCILzW/3Ea7Eq8DFkBmkbL87kdB0ek
 JOKMxxc2dWRMkeOz0RFP80P9JuUagIl5dSWvxMv70PXW19zSWMN7XkD70BEhjssDtA7mx
 ATVb2e2/RNCpCwV5wCklnn8Oj+bktIJ0j0/Bi0YKLf8puGShGEffZ2C5Dh8pW6AATneoc
 9lmSFfNm4q7wFi17grk/ULo0iQtWHqubtsUTX2bibD3iu6Nml8qemRTp43MXpJFIVQSRQ
 BgXM0hc1jiISaoW7ZmJTSxKbcIVWoztNywHI9Y3YqwveGusTfFNzHy7CRYIKgytAH2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793208004;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rq8sMGto9xAaV7aLmXHRZTGPx7RUyo9YjR4NI4xTQeE=;
 b=H/Wy12aQp5wBz9DO2GKoAVy0eVOOF+z8OWyWxpy2RsP9PF8e4diFxPWpkrI+YlKO0qeR
 H9Yu+H254FJ/ef07MGLLFzuRLo12/SYe70PC2EDEDtztd4MscEtVg/g/CntSEnSRxH9Pe
 rcNGG4arP600qqYhLRzfYPW/XpJPfPJHaweWDCI+ZjGY8kSCKqp+fJR28ixf9sCF9kR2N
 sFePyl00li8kokrWitSD4ZJYN4ZLVOp1SnCQntVaQlTEs+WAeoBxhR3/kiv3s1Z6BuUSY
 oU0SU9pdbxnKxoot+1SZPPqHwtobPOQpy1JvroNXJJthw0Wuz8Rv5MIVyCgk/LBperw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7254810A0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A8C9D218; Wed, 28 Oct 2026 17:18:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 18:18:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 302f5b6a2fc54ff49a6eb90b6daa24f39c8fec43
X-Git-Newrev: 210e86765e62428633862d74e6daf7447f31eb45
X-Patchwork-Hint: ignore
Message-Id: <20261028171837.E9A8C9D218@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 258.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/210e86765e62428633862d74e6daf7447f31eb45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a stable patch release, no changes to options/services. The
default for the dns-servers option in meson_options.txt has changed to
use different domain names for the Cloudflare DNS servers, but the
same IP addresses.

Remove patch included upstream [1].

[1] https://github.com/systemd/systemd/commit/3ed9869c4780846b4a5380bf921073fa2fac0730

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-compilation-with-openssl-4.0.0-beta1.patch | 86 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 2 insertions(+), 88 deletions(-)

diff --git a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
deleted file mode 100644
index d38be8d51b..0000000000
--- a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 693ecaac7e12c120d1323478b2433d77367aa0c9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>
-Date: Tue, 14 Apr 2026 18:59:07 +0200
-Subject: [PATCH] various: fix compilation with openssl-4.0.0-beta1
-
-Various types have been made opaque, so we need to use some accessor
-functions.
-
-Upstream: https://github.com/systemd/systemd/commit/693ecaac7e12c120d1323478b2433d77367aa0c9
-
-[Bernd: rebased for 258.7]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/sbsign/sbsign.c      |  5 +++--
- src/shared/pkcs11-util.c | 15 ++++++++-------
- 2 files changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/src/sbsign/sbsign.c b/src/sbsign/sbsign.c
-index ee1c0f77ab..f54dacf65a 100644
---- a/src/sbsign/sbsign.c
-+++ b/src/sbsign/sbsign.c
-@@ -262,8 +262,9 @@ static int spc_indirect_data_content_new(const void *digest, size_t digestsz, ui
-                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SpcPeImageData object: %s",
-                                        ERR_error_string(ERR_get_error(), NULL));
- 
--        idc->data->value->value.sequence->data = TAKE_PTR(peidraw);
--        idc->data->value->value.sequence->length = peidrawsz;
-+        if (!ASN1_STRING_set(idc->data->value->value.sequence, peidraw, peidrawsz))
-+                return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to set ASN1_STRING data.");
-+
-         idc->messageDigest->digestAlgorithm->algorithm = OBJ_nid2obj(NID_sha256);
-         if (!idc->messageDigest->digestAlgorithm->algorithm)
-                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SHA256 object: %s",
-diff --git a/src/shared/pkcs11-util.c b/src/shared/pkcs11-util.c
-index 165fefbea1..96b25c4ac3 100644
---- a/src/shared/pkcs11-util.c
-+++ b/src/shared/pkcs11-util.c
-@@ -555,7 +555,11 @@ int pkcs11_token_read_public_key(
-                         return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to init an EVP_PKEY_CTX for EC.");
- 
-                 OSSL_PARAM ec_params[8] = {
--                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY, os->data, os->length)
-+                        /* We need to drop the const from the data param, because ec_params is
-+                         * modified below. But we'll not modify ec_params[0]. */
-+                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY,
-+                                                (unsigned char *) ASN1_STRING_get0_data(os),
-+                                                ASN1_STRING_length(os)),
-                 };
- 
-                 _cleanup_free_ void *order = NULL, *p = NULL, *a = NULL, *b = NULL, *generator = NULL;
-@@ -683,13 +687,10 @@ int pkcs11_token_read_x509_certificate(
-                 CK_OBJECT_HANDLE object,
-                 X509 **ret_cert) {
- 
--        _cleanup_free_ char *t = NULL;
-         CK_ATTRIBUTE attribute = {
-                 .type = CKA_VALUE
-         };
-         CK_RV rv;
--        _cleanup_(X509_freep) X509 *x509 = NULL;
--        X509_NAME *name = NULL;
-         int r;
- 
-         r = dlopen_p11kit();
-@@ -713,15 +714,15 @@ int pkcs11_token_read_x509_certificate(
-                                        "Failed to read X.509 certificate data off token: %s", sym_p11_kit_strerror(rv));
- 
-         const unsigned char *p = attribute.pValue;
--        x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
-+        _cleanup_(X509_freep) X509 *x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
-         if (!x509)
-                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to parse X.509 certificate.");
- 
--        name = X509_get_subject_name(x509);
-+        const X509_NAME *name = X509_get_subject_name(x509);
-         if (!name)
-                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to acquire X.509 subject name.");
- 
--        t = X509_NAME_oneline(name, NULL, 0);
-+        _cleanup_free_ char *t = X509_NAME_oneline(name, NULL, 0);
-         if (!t)
-                 return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to format X.509 subject name as string.");
- 
--- 
-2.47.3
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e96d3ba7ad..cb652998cd 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
+sha256  5062da9c9b0b6fd3ed0efaa2c6ec37be2e634c6e516abd6275ee42f85282c891  systemd-258.12.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 52c434b28e..346d034822 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.7
+SYSTEMD_VERSION = 258.12
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
