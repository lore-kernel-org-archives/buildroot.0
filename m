Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE6DE95360
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AAA060A55;
	Wed,  4 Feb 2026 09:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53iMtyNg4cpe; Wed,  4 Feb 2026 09:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC6160A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198537;
	bh=HwBQ0idpNpm+Kjx1ngWTxYRXEU49jV2tUbfPnXjk/PY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hSsYRMDPD0Ua7xC8x2hTkGRveettsCxiFBl/pkN8oyVmnasOKO+ZFo1QajQiN1mTe
	 k1azv3sq/64SXjeYk7darBzS6nb+O7aBQIfeJxTRAw61A9LXJrh7JphslPCI+et90b
	 S4Ot8CflxBw+Zv3vdpYD6pO/MuJGFJZBnfalR1KLEGMiRVFOoAsiJRc7cxtAtILZOg
	 66puRmFw5kbrSDIuMBB3qyXxJWG+28GbtEZMdu5jPKzyQ+tBYEVAQhl/BY/DBtjqgo
	 BQMGaR6TgL+d5qMh9tOjWvC8/MBlVAVK7Grr/pQKYCkDVUyjy/4QhybZzose3gSGSf
	 n9r74J2tDngZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC6160A7C;
	Wed,  4 Feb 2026 09:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 143D5173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036784016B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIMX0u2ll-AK for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1172A4005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1172A4005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:48:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC91886828; Wed,  4 Feb 2026 09:48:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:47:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b31a28dce605b0088e9b72fb38616cb941661be
X-Git-Newrev: 96f01932be024eebad8e6edef121641eeb16ffd7
X-Patchwork-Hint: ignore
Message-Id: <20260204094854.EC91886828@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix powerpc64 build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96f01932be024eebad8e6edef121641eeb16ffd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit f710640be5869bb3716e254916ae614f79002f2f bumped the
package to version 3.6.0 that includes upstream commit
https://github.com/openssl/openssl/commit/8f24a148e6f112045cf110c3e3f4e2415d9c11fe
which causes build errors on powerpc64.

The upstream commit was also backported to older libopenssl branches:
https://github.com/openssl/openssl/pull/28990#issuecomment-3675219918
but its first appearance on the buildroot master branch was with said
bump to 3.6.0.

This patch adds an upstream patch to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/b28/b286ad40f2240a85b9cd0dc44e089d1d6babd3ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-gcm-ppc.pl-Removed-.localentry-directive.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
new file mode 100644
index 0000000000..7c507a2687
--- /dev/null
+++ b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
@@ -0,0 +1,69 @@
+From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
+From: Danny Tsen <dtsen@us.ibm.com>
+Date: Wed, 28 Jan 2026 07:23:13 -0500
+Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
+
+Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
+and PPC64 big endian builds fail.
+
+Fixes #29815
+
+Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
+
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Tue Feb  3 08:39:50 2026
+(Merged from https://github.com/openssl/openssl/pull/29827)
+
+Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
+index 68918a9305a2b..fd5dcc22a6117 100644
+--- a/crypto/modes/asm/aes-gcm-ppc.pl
++++ b/crypto/modes/asm/aes-gcm-ppc.pl
+@@ -409,7 +409,6 @@
+ ################################################################################
+ .align 4
+ aes_gcm_crypt_1x:
+-.localentry	aes_gcm_crypt_1x,0
+ 
+ 	cmpdi	5, 16
+ 	bge	__More_1x
+@@ -492,7 +491,6 @@
+ ################################################################################
+ .align 4
+ __Process_partial:
+-.localentry	__Process_partial,0
+ 
+ 	# create partial mask
+ 	vspltisb 16, -1
+@@ -564,7 +562,6 @@
+ .global ppc_aes_gcm_encrypt
+ .align 5
+ ppc_aes_gcm_encrypt:
+-.localentry     ppc_aes_gcm_encrypt,0
+ 
+ 	SAVE_REGS
+ 	LOAD_HASH_TABLE
+@@ -752,7 +749,6 @@
+ .global ppc_aes_gcm_decrypt
+ .align 5
+ ppc_aes_gcm_decrypt:
+-.localentry	ppc_aes_gcm_decrypt, 0
+ 
+ 	SAVE_REGS
+ 	LOAD_HASH_TABLE
+@@ -1032,7 +1028,6 @@
+ .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
+ 
+ aes_gcm_out:
+-.localentry	aes_gcm_out,0
+ 
+ 	mr	3, 11			# return count
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
