Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F339D46BFA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 20:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0239405BB;
	Wed, 28 Jan 2026 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5TyGdbTJzKp; Wed, 28 Jan 2026 20:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95614405F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769631232;
	bh=lhZONrEre4Tt4Tt06s2eqrqd+XiBl2GAlRn+6xENVxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIc5YaIjLnAszdBefowtNKEIjtBYjhmcHMHpOS0hx3ZdGPvsK4dE/ptB0gLKSBBgt
	 HUw2C/h/4EhbZyQRumAzU5exEzguxouAQxY7B1FR8fImnVFyjPq0oZ266cHJ/8YVIr
	 NYhKGaoEyfMNmsbQDGbDEVR2HWVeW4akjYqQjux3RpvOWPl8Zspu/1PouoO84QYarx
	 +bzLJPMJ4mbbEGbblcHQmIvn939XXv5Bq44fNvBn2e+fc49+lCrtHqt4WMdgAKIk3a
	 /C5WZrBmZxyUApvuUPRZM9m0MtSAx/sXJLI33CkZ+gIEMBudDvC9tRhzm49aZ4L59b
	 gyHv2JvXbUS0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95614405F3;
	Wed, 28 Jan 2026 20:13:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F3E7118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 453D460784
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZ-Nelk1vwmu for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 20:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D49A605D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D49A605D4
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 20:13:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04FC385F25; Wed, 28 Jan 2026 20:13:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Jan 2026 20:58:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb650f221b8083d8fabca43db17c7ab79b8ef35
X-Git-Newrev: fce728765632f5882d334f295586864043121cc9
X-Patchwork-Hint: ignore
Message-Id: <20260128201350.04FC385F25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.6.1
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
Content-Type: multipart/mixed; boundary="===============2297074729200413238=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2297074729200413238==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fce728765632f5882d334f295586864043121cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following vulnerabilities:

CVE-2025-11187 - Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
CVE-2025-15467 - Stack buffer overflow in CMS AuthEnvelopedData parsing.
CVE-2025-15468 - NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
CVE-2025-15469 - ‘openssl dgst’ one-shot codepath silently truncates inputs >16MB.
CVE-2025-66199 - TLS 1.3 CompressedCertificate excessive memory allocation.
CVE-2025-68160 - Heap out-of-bounds write in BIO_f_linebuffer on short writes.
CVE-2025-69418 - Unauthenticated/unencrypted trailing bytes with low-level OCB function calls
CVE-2025-69419 - Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
CVE-2025-69420 - Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
CVE-2025-69421 - NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex function
CVE-2026-22795 - Missing ASN1_TYPE validation in PKCS#12 parsing
CVE-2026-22796 - ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function

For more details, see the announcement:
https://openssl-library.org/post/2026-01-27-release-announcement/

Drop now upstreamed 0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch:
https://github.com/openssl/openssl/commit/f529d2659155883026cc5fe1e3a560c274da86b9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch | 36 ----------------------
 package/libopenssl/libopenssl.hash                 |  4 +--
 package/libopenssl/libopenssl.mk                   |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch b/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
deleted file mode 100644
index ab4cf88a40..0000000000
--- a/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a37d316e643a4c2be4708d504cc3ecbf37ec1773 Mon Sep 17 00:00:00 2001
-From: Kai Pastor <dg0yt@darc.de>
-Date: Wed, 8 Oct 2025 18:50:33 +0200
-Subject: [PATCH] Scope aes_cfb128_vaes_encdec_wrapper to x64
-
-This function is only used on x64 and relies on other functions which
-are only implemented for x64.
-Fixes #28745.
-
-Upstream: https://github.com/openssl/openssl/pull/28792
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
-index d5577d00f132e..eb8e0164ac9ed 100644
---- a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
-+++ b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
-@@ -30,6 +30,7 @@
- static int ossl_aes_cfb8_vaes_eligible(void) { return 0; }
- static int ossl_aes_cfb1_vaes_eligible(void) { return 0; }
- 
-+#if (defined(__x86_64) || defined(__x86_64__) || defined(_M_AMD64) || defined(_M_X64))
- /* active in 64-bit builds when AES-NI, AVX512F, and VAES are detected */
- static int aes_cfb128_vaes_encdec_wrapper(
-     PROV_CIPHER_CTX* dat,
-@@ -56,6 +57,7 @@ static int aes_cfb128_vaes_encdec_wrapper(
- 
-     return 1;
- }
-+#endif
-  
- /* generates AES round keys for AES-NI and VAES implementations */
- static int cipher_hw_aesni_initkey(PROV_CIPHER_CTX *dat,
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 9322a56e76..0e0dbd3926 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.0/openssl-3.6.0.tar.gz.sha256
-sha256  b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9  openssl-3.6.0.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.1/openssl-3.6.1.tar.gz.sha256
+sha256  b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e  openssl-3.6.1.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 28dcb9dfc2..d580947899 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.0
+LIBOPENSSL_VERSION = 3.6.1
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0

--===============2297074729200413238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2297074729200413238==--
