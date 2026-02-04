Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A864BE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E70661105;
	Wed,  4 Feb 2026 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG1Ng2ybLCjB; Wed,  4 Feb 2026 17:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426BA60FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224888;
	bh=326ROgse5J0RsxLp1cCRIejW7HN7ZLz+N69eWzcjLxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AiO7rni+hdMnsCf4WFTgToY+NiudN4iWSiVjW29u04+tkofrm6Ryu4j7TfgqEi8u8
	 xJxtJZLRM2CnDME3+QA2hkHMMI6gqoxTQua8ENa1yvu5xapKzIsogfI2nervNeXCvk
	 iuBKLYJx/hTvJT62C5r3H6psZhd7L5II/kB0mjRrdZ2wfogln60HWAm4aW8E1RmzDI
	 J2t2dueoN9Gv7pCoCcYSxAXD8oxWA1U4QXWKvRx22Pwk1NuJ0k8Ta941opsDl3zbSF
	 GV1GBcDwbsLoir+nZWcDCiBRkBaqjDGhL9nbFJhYHdAIspo5XBgIzjsmLxWPxKD+wG
	 0B0/wo0vJe7Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426BA60FCF;
	Wed,  4 Feb 2026 17:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D103F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E45F83D29
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQZsESgrNqcU for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB1583E9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EB1583E9A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 348D086976; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:43:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e04741990f21b6fae5dbb7b559fd009d68d05ecc
X-Git-Newrev: dbf192e1764e5ba93e8dee1063e06d729bf222c3
X-Patchwork-Hint: ignore
Message-Id: <20260204170638.348D086976@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Package/libopenssl:
 security bump to v3.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbf192e1764e5ba93e8dee1063e06d729bf222c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerabilities:

CVE-2025-11187 - Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
CVE-2025-15467 - Stack buffer overflow in CMS AuthEnvelopedData parsing.
CVE-2025-15468 - NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
CVE-2025-66199 - TLS 1.3 CompressedCertificate excessive memory allocation.
CVE-2025-68160 - Heap out-of-bounds write in BIO_f_linebuffer on short writes.
CVE-2025-69418 - Unauthenticated/unencrypted trailing bytes with low-level OCB function calls.
CVE-2025-69419 - Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
CVE-2025-69420 - Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
CVE-2025-69421 - NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
CVE-2026-22795 - Missing ASN1_TYPE validation in PKCS#12 parsing.
CVE-2026-22796 - ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index abcc6be8f8..ea288054e9 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.3/openssl-3.4.3.tar.gz.sha256
-sha256  fa727ed1399a64e754030a033435003991aee36bda9a5b080995cb2ac5cf7f37  openssl-3.4.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
+sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 24213871fe..8e3ae4cc21 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.3
+LIBOPENSSL_VERSION = 3.4.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
