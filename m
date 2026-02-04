Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6351DE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CBB610F5;
	Wed,  4 Feb 2026 17:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzRcraumx4xX; Wed,  4 Feb 2026 17:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B976132B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224995;
	bh=c7J36fRcNTDV8jb5JgFDrLyr2VUhqyQuxyp3U9dO0WI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ozFNJwBjZEfTqGUiZcljVIVSWlPbWsTCBpgjJbB/7LgVJlg+0FQpQl44wux+eTWn/
	 kpjxmNeizZEtOdhCIhgzxBLeTCcpzIC2TQlUAsRuox0xFMu09wkbqzdUHnDyN5+vc6
	 orlvKU+4c5r9Ctevzavp1yWvU3a7A2GKo4KMBTtvinkTi0RdYkgiJW9I5aydKgMTIg
	 tdML8cWUTIBJDjF+hBHmsZnslJmVlUINDD2sHB1yKhtey4aB4AvX89WKKQ2TwvtAcg
	 ZR9uo2PyzmLJbqh+Rx61c7Mg3/paEOHz7YxIZKwfqeyIZMSiWHbd1hT7xTnjrdbFpo
	 x9oe4n0Di4VLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B976132B;
	Wed,  4 Feb 2026 17:09:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A00173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631B740591
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqZE-4R9haKn for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A3A4055B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A3A4055B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D8328697A; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:42:50 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 84b9ddb6ef2402774537a20e14fabd9ae226df7a
X-Git-Newrev: 43e3b5ffb70d32bfd6c2e42dbbaa5be01afdb25c
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.8D8328697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libopenssl:
 security bump to version 3.6.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2201062805444576555=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2201062805444576555==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43e3b5ffb70d32bfd6c2e42dbbaa5be01afdb25c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit fce728765632f5882d334f295586864043121cc9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============2201062805444576555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2201062805444576555==--
