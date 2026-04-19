Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA8AEA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B17C40FB4;
	Sun, 19 Apr 2026 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny5cyA2Q9K2Y; Sun, 19 Apr 2026 19:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A3040FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776626675;
	bh=c1GZqKrzaPLDRE7nPkXcZ81pD2JBFWnLMRxIe/XlSOE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I2v1Nn/d2iF9YwUeAku5cWdbW1rlpuITUGDL441guB4gPCaNb5u/daGVcQHwdc6Ig
	 Gg1s0hxs7cXUdLeYwx5F8h5UYgW7SDgQo8N9opeE5ZdrX3NZY1X6VEHA9YPB0wSYdG
	 NqT86nZhxRmhrgbObj1uL4BmFyVXotVNuEr1FLcrRbILXvXzaooMn0ib8ic1VrhjbZ
	 4i2d47DCnSAYxR8TTQCtjiMNavnoyhWkBU6XFUe4FqGpeAw/OEiXVpqmNOAd2n4Af8
	 l7abD3/CnJ7kXzGM5UG/jdG5fNbS2sdO2ilFVVZqazu+Gm67fULvQTIVQxU0csPJB2
	 Z3g2+uZEn6tag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A3040FCC;
	Sun, 19 Apr 2026 19:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA09D24D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBF9A40FCC
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAbsBiEvz9pd for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E82940FB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E82940FB4
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB25681F7B; Sun, 19 Apr 2026 19:24:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:19:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1fcca3a79790c5a1bcb412d25b857385a5ecdce
X-Git-Newrev: dcf78651abe57bf745703d6bd95aed6ae2c12af3
X-Patchwork-Hint: ignore
Message-Id: <20260419192431.AB25681F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: bump version to 7.99
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dcf78651abe57bf745703d6bd95aed6ae2c12af3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nmap/nmap/blob/master/CHANGELOG

Removed patch which is not needed anymore due to upstream commit
https://github.com/nmap/nmap/commit/1b3ca45054cd1e569f5fc0da59fceaa7a518b631

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...g-Crypto.cc-fix-build-with-libressl-3.5.0.patch | 41 ----------------------
 package/nmap/nmap.hash                             |  6 ++--
 package/nmap/nmap.mk                               |  2 +-
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 700b8585f1..0000000000
--- a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0a79771c302bf398150da78cd18b67cb9b67f47a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 21 May 2022 17:51:37 +0200
-Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-Crypto.cc: In static member function 'static int Crypto::aes128_cbc_encrypt(u8*, size_t, u8*, u8*, size_t, u8*)':
-Crypto.cc:139:26: error: aggregate 'EVP_CIPHER_CTX ctx' has incomplete type and cannot be defined
-  139 |           EVP_CIPHER_CTX ctx;
-      |                          ^~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2e6eebbe2ed8305b88047bc92c19350c1ecada16
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/nmap/nmap/pull/2480
-[Julien: rebased patch on version 7.95]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- nping/Crypto.cc | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/nping/Crypto.cc b/nping/Crypto.cc
-index 6f05db6..1d11d55 100755
---- a/nping/Crypto.cc
-+++ b/nping/Crypto.cc
-@@ -69,7 +69,9 @@
- #include <openssl/evp.h>
- #include <openssl/err.h>
- 
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && !defined LIBRESSL_VERSION_NUMBER
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
-+	((!defined LIBRESSL_VERSION_NUMBER) || \
-+	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
- #define HAVE_OPAQUE_EVP_PKEY 1
- #else
- #define EVP_MD_CTX_new EVP_MD_CTX_create
--- 
-2.45.2
-
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 9303ff613e..17f9eb7f5e 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.98.tar.bz2.digest.txt (lowercase)
-sha256  ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6  nmap-7.98.tar.bz2
-sha512  14e13689d1276f70efc8c905e8eb0a15970f4312c2ef86d8d97e9df11319735e7f7cd73f728f69cf43d27a078ef5ac1e0f39cd119d8cb9262060c42606c6cab3  nmap-7.98.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
+sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
+sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 629a00f30e..b04d8b080d 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.98
+NMAP_VERSION = 7.99
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
