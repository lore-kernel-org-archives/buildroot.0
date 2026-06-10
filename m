Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96645CD8C90
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 17:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D28282082;
	Wed, 10 Jun 2026 17:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxr3NXCuVMp0; Wed, 10 Jun 2026 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DAD82037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781112225;
	bh=bEoPeIddV96Dr8Z0hyw/prXR91Quft5hSeEhsxPLXJw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YH4zXCgknos7hGZE4yHHw/62iPU3UzseFOb2/GOG90EqKAYqBE/nWSsShIKadJvQo
	 op/GK+GLYhjIu8cxZfsi5Y2IZcZxLyi7B7vHy4rUpDIzZxKWsaTJslC+P7CWYa193K
	 nv6RMtaCbkORBu6YmBKrmL/2NdkN7P+E+Y3YwEKLzdZJJTYCDkm3f1DYD5EcDS2vVt
	 ZjQR5PG7Cd8BygH//5UrvhzhhDaV9u/Rps0EJYCTSLCd0/WVwyalPiqoOtDqfu0kmq
	 BVAK8lWJm2xXNFUQX6ReSElEjV5iE63s0vFoJiQ3a27AhMEH4LtNk/cSynfRs4+LQb
	 OL3aGi0g9r6XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DAD82037;
	Wed, 10 Jun 2026 17:23:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9698196
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C5B360B10
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMS7D0AqmcE9 for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 17:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C71660B16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C71660B16
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:23:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CE8B87F62; Wed, 10 Jun 2026 17:23:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jun 2026 19:17:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9f7f918e06c16b8afa27526b0908c08f488aead
X-Git-Newrev: b0ea6e310fc8a77e7c982154b38a482d2c3a8b64
X-Patchwork-Hint: ignore
Message-Id: <20260610172324.0CE8B87F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.6.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0ea6e310fc8a77e7c982154b38a482d2c3a8b64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

    Fixed heap use-after-free in PKCS7_verify().
    (CVE-2026-45447)

    Fixed CMS AuthEnvelopedData processing may accept forged messages.
    (CVE-2026-34182)

    Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
    (CVE-2026-34183)

    Fixed double-free when checking OCSP stapled response.
    (CVE-2026-35188)

    Fixed NULL pointer dereference in QUIC server initial packet handling.
    (CVE-2026-42764)

    Fixed AES-OCB IV ignored on EVP_Cipher() path.
    (CVE-2026-45445)

    Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
    (CVE-2026-7383)

    Fixed out-of-bounds read in CMS password-based decryption.
    (CVE-2026-9076)

    Fixed heap buffer over-read in ASN.1 content parsing.
    (CVE-2026-34180)

    Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
    (CVE-2026-34181)

    Fixed NULL dereference in certificate verification with OCSP Checking.
    (CVE-2026-42765)

    Fixed possible NULL dereference in password-dased CMS decryption.
    (CVE-2026-42766)

    Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
    (CVE-2026-42767)

    Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
    and PKCS7_decrypt().
    (CVE-2026-42768)

    Fixed trust anchor substitution via cert/issuer typo in CMP
    rootCaKeyUpdate.
    (CVE-2026-42769)

    Fixed FFC-DH peer validation uses attacker-supplied q.
    (CVE-2026-42770)

    Fixed incorrect tag processing for empty messages in AES-GCM-SIV
    and AES-SIV modes.
    (CVE-2026-45446)

For more details, see the release notes and advisory:

https://github.com/openssl/openssl/releases/tag/openssl-3.6.3
https://openssl-library.org/news/secadv/20260609.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 05777cdac2..fc1a125521 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
-sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
+sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index bd4b889c88..e9f795832a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.2
+LIBOPENSSL_VERSION = 3.6.3
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
