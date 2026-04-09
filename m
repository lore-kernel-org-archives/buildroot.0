Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F81F364B5
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 19:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F257940C41;
	Thu,  9 Apr 2026 19:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg0U-6MLD1xp; Thu,  9 Apr 2026 19:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A19140C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775762746;
	bh=+v80omTlmaU8YWQMHlkDKOirm3UzCF2px9m8ZrqT5Y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BKfJwxyRWoblPKpLysyZXSYT7w1VUbddkGrfVwU/iWi2CaIwXAoIO7xq3BpkzNLRZ
	 A6RFthT6Z4g1OPwKf+29oPn3id87ICF/uJENdsMv/yvHqF+ngc8duQRcDhektEXVj7
	 AgiLEuJk8olAs2Z6+Ng8XVxs63OzpsSmVatxerSD+YYcuwnDiFLXaQUX9l9Qfi7M+d
	 eJ3WWiZ/iTwC/OhoKRfSAgJtha1Vgg5Gt+SEp4WuOtmmvR7KgOAQKczNxJlZgRNEGn
	 8SrBUK9m0qGYHKvbVPZ7rt6WqnqbztGQQaF2D/cXOKZp/RQnfImfp57ypgUKjiXgkJ
	 PvLq4rqCQP6sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A19140C42;
	Thu,  9 Apr 2026 19:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A441F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B108114A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yuiV-gQR6kC for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 19:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EA381129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28EA381129
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:25:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B154B80F5C; Thu,  9 Apr 2026 19:25:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Apr 2026 21:21:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad5faa474cfd8d79a67e884c8b5fa67223385c11
X-Git-Newrev: 58d2330b62ce1f94fe7dd942b4393e6bb9b8db83
X-Patchwork-Hint: ignore
Message-Id: <20260409192543.B154B80F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58d2330b62ce1f94fe7dd942b4393e6bb9b8db83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://openssl-library.org/post/2026-04-07-release-announcement/

Fixes the following vulnerabilities:

CVE-2026-31790 - Incorrect Failure Handling in RSA KEM RSASVE Encapsulation.
CVE-2026-28386 - Out-of-bounds Read in AES-CFB-128 on X86-64 with AVX-512 Support.
CVE-2026-28387 - Potential Use-after-free in DANE Client Code.
CVE-2026-28388 - NULL Pointer Dereference When Processing a Delta CRL.
CVE-2026-28389 - Possible NULL Dereference When Processing CMS KeyAgreeRecipientInfo.
CVE-2026-28390 - Possible NULL Dereference When Processing CMS KeyTransportRecipientInfo.
CVE-2026-31789 - Heap Buffer Overflow in Hexadecimal Conversion.

Removed patch 0004 which is included in this release, merged in:
https://github.com/openssl/openssl/commit/7936b4c415ae0d27162bf2c6ef9a96d1e5ffb5a9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-gcm-ppc.pl-Removed-.localentry-directive.patch | 69 ----------------------
 package/libopenssl/libopenssl.hash                 |  4 +-
 package/libopenssl/libopenssl.mk                   |  2 +-
 3 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
deleted file mode 100644
index 7c507a2687..0000000000
--- a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
-From: Danny Tsen <dtsen@us.ibm.com>
-Date: Wed, 28 Jan 2026 07:23:13 -0500
-Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
-
-Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
-and PPC64 big endian builds fail.
-
-Fixes #29815
-
-Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-MergeDate: Tue Feb  3 08:39:50 2026
-(Merged from https://github.com/openssl/openssl/pull/29827)
-
-Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
-index 68918a9305a2b..fd5dcc22a6117 100644
---- a/crypto/modes/asm/aes-gcm-ppc.pl
-+++ b/crypto/modes/asm/aes-gcm-ppc.pl
-@@ -409,7 +409,6 @@
- ################################################################################
- .align 4
- aes_gcm_crypt_1x:
--.localentry	aes_gcm_crypt_1x,0
- 
- 	cmpdi	5, 16
- 	bge	__More_1x
-@@ -492,7 +491,6 @@
- ################################################################################
- .align 4
- __Process_partial:
--.localentry	__Process_partial,0
- 
- 	# create partial mask
- 	vspltisb 16, -1
-@@ -564,7 +562,6 @@
- .global ppc_aes_gcm_encrypt
- .align 5
- ppc_aes_gcm_encrypt:
--.localentry     ppc_aes_gcm_encrypt,0
- 
- 	SAVE_REGS
- 	LOAD_HASH_TABLE
-@@ -752,7 +749,6 @@
- .global ppc_aes_gcm_decrypt
- .align 5
- ppc_aes_gcm_decrypt:
--.localentry	ppc_aes_gcm_decrypt, 0
- 
- 	SAVE_REGS
- 	LOAD_HASH_TABLE
-@@ -1032,7 +1028,6 @@
- .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
- 
- aes_gcm_out:
--.localentry	aes_gcm_out,0
- 
- 	mr	3, 11			# return count
- 
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 0e0dbd3926..05777cdac2 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.1/openssl-3.6.1.tar.gz.sha256
-sha256  b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e  openssl-3.6.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
+sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index d580947899..bd4b889c88 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.1
+LIBOPENSSL_VERSION = 3.6.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
