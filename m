Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F71606A320
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SL9qCxJx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06CD2810E7;
	Wed, 28 Oct 2026 15:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QdTAcnXatNT; Wed, 28 Oct 2026 15:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9F83810FC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202711;
	b=td/t8UFDXlvJmtjoQS/v+oTa96CTSW+JztmQ4/49u3WaLLlo0fyAzoJpxb0oZBH0lku4
	 p2rVDWGvUCNl1enc1R+QwN8G8tCwJOLbbiKxOCtJf9Y+jx2LAUo1IDjfwDPBjL386/CSV
	 y/rNMfMoeZaczsZZmrAmagk6KkkNq7/whjAi3khd6ydStlLNGRaxgTvt2PEMMl4hTSdUG
	 e7n0xXEN4A6oJnoOHZhHg/ZtBkNfodzr23fOgzQnyM9UiX5vSBXYMU2Q22e6TPKNB6gYl
	 bTZa+S3R7IiFBjss5X1GzaVD0h03PC4yndwgwXugRUk9VjJh3IqkRHSAsacZhhfJBuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7aFQmB/aqw3E2jkUEZVpEo7L1gu3VxsaojRxQbtEKJk=;
	b=aBYVZIvJ3D4BkpZ3V9QMgKPjyYaN6r5hM3kilN04K3s2Yckcnkn4SWp9bE7M/mnnAyME
	 SiwmQ8esAeRvPIezI+Of8s5HUwOMuv6A6f0AdexPbpoyUEVB5/W5KbrY+N/aQqbUDUBKV
	 796FFS5GMcR/DOIf1KB8lKIpFBcITKvkw5XNqdl1OjPw73UJSDiZ4gfxVaKDN/aUtSa7Z
	 hM36JpBmcEcBLLNK1h+PTFYP1B+caFH/UhN5ZftXzGPxGv+m0I3aD8SNjltHo4xDegovM
	 9cUKPReafpRlCIRJDrVCZo0lQKQvI/JuOE+scja+UETUkzXSIBqei5aFDaVBBC1bmRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202711;
	bh=7aFQmB/aqw3E2jkUEZVpEo7L1gu3VxsaojRxQbtEKJk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SL9qCxJxYltPgN5OzJ1CgqRRiWEUvhFlRJ1Q4bL2LfRB5ZWWA8Yr/SvuWJiNiyztV
	 C3sRrhNKL2fyA1eamEpDoa7UYvWjHeT1FkVlZ3+3a5L4JJUtsFSAX8jEkgSLkq2kSV
	 6fNB9j1VoQHWeZi2xd383TmhF2NHHEybFtgy7bE1VMtiwtwM6BqX8oSZeySb606pMB
	 M996vUpDIvCljJ47AxPoqiOXdk6kRltFUr+N9LAEIoZ2FsYIMMaGMeTP5pu2To8A9y
	 7+exLEHRORcDLSludkehLVA8qdKCeQrf6iKU6MsoXtnFfqx3aeawMT5UKWNHAz0uj3
	 GN9a8UTMWDowg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F83810FC;
	Wed, 28 Oct 2026 15:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EEBDD1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF05404F8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN0hiBcPCLeu for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8022640505
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202708;
 b=PkGk3MtUY5o1EMzXMuQDnfSeVEVEE3CGhmwSYkMD4iH1PQYSBN0Rg3v9f+yVHBHZjaZI
 vU4ramotLS6R0sPe9quRaJpM//HvUpJ9GqlOVlt5IhLTsY0+SaeLtZawnMxwzF6420aqt
 wkNOvw4MVlS+LWc5tE6rD4xT1PpTC8maKsjFVgcT8rdo62uFNQYeNnLRw9B45Vfmbfz9d
 xISGF4qh2p0rX5dZxsLrdtN+eoBni5zsC4GTYFBWhE2k88p02/3rurJyqcoe78vJRUbZ9
 2iPACS8Yi/FwdNcvUlkx6bx8gXfKVKh4pzrmJf77wCgM37oGxNLgalw3kn0p6BPaWOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202708;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=jcf+6P8cfaTrLZCcybpKtzV31uX12gtH2r0i2UonMWI=;
 b=ArusGylmbb5jLANqh4lgQdVRPFQnoLuRr8bmFpsbBktE7RuwG6OVaNUg5KWPnvxNpD8Z
 1zm9n487PCZARPKRw9v+egqSuV4UpiEYK+REe7ijpPZZEDJSsks+N/pkBc+qUe3BCq3U3
 CdmBO8krSQ4bzSfYeT92LuLP4l6ebd9zb1QC1+GqMZvtRKTfklttMBsptKTM3wVYd5KmU
 Rim0Sf63Abv8yIyaL8kyLlXhgZr0UYnDG78MCNkbcghlyrR3kA6I8IQReu0x2XdEfTAVD
 I6G/N1wRrD1XzdY5gW21RbR0Pr1LFo2HdXRUAf5xpRTjcufMeAoRSFZ9vJXxWdE6C6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tarutJE7; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8022640505
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1wsFIr2kKN-00bder; Wed, 28
 Oct 2026 16:51:38 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 28 Oct 2026 16:51:20 +0100
Message-ID: <20261028155122.3226008-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fJhe7NP2EPC7kSBloz7id/ulxmGg1UvgSiueOl8ldmYBHWjKOQo
 0uxSGp+ziCglgFn0OcSx0pwGzt3m01zXmx5qK4tU2Z0vtITat3d0o84wJK5SLI2ScPAWI6N
 OXETvY/lPn84A32wOxfO7QpHGFOCTT4BwaoxO/ApXxVuRBTepxV8en9IFJxuKiB4AS5sU7Q
 EsnoepmEp6eeugyzKogGg==
UI-OutboundReport: notjunk:1;M01:P0:o+ZskaVPZzc=;SyKWBQrszoDOGpNSG5djOFkKaqh
 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
 D8J6KqRkIE8sO0Y
Subject: [Buildroot] [PATCH v4 1/3] package/systemd: bump version to 258.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

This is a stable patch release, no changes to options/services. The
default for the dns-servers option in meson_options.txt has changed to
use different domain names for the Cloudflare DNS servers, but the
same IP addresses.

Remove patch included upstream [1].

[1] https://github.com/systemd/systemd/commit/3ed9869c4780846b4a5380bf921073fa2fac0730

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* replace adding a ukify patch with update to a fixed version from the
  same stable branch

 ...compilation-with-openssl-4.0.0-beta1.patch | 86 -------------------
 package/systemd/systemd.hash                  |  2 +-
 package/systemd/systemd.mk                    |  2 +-
 3 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
