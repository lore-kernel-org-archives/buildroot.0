Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CEDEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480B384885;
	Fri, 13 Feb 2026 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrR28hEmJ7tZ; Fri, 13 Feb 2026 19:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC0284889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011557;
	bh=xdxtnpARO0mo1G+o5qfbFWA7LWsmUFH29gRW+VKGbaM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gZUD7wnebdbhNA7xh+eeC0JC3P3+V2Vvb4k5joOpHai1j9IF7TiOeXwX8gXlDP/nl
	 zQa7fYpe/KHhD0Gp6RHs2U0nHTKlgSbIqTPYyOr9CTf97Bcoh8oX5YBolZdk3OKEtM
	 01fYwmMng8wzRW8RbK4CXOl6QBZnqEJl/okjUEj/fS4c94GQO+z97gAxNIDXJJMxM8
	 UHphZeU0vq6VAlsBhTgopEjLpPl6FNGZuF9u0KhukSUYe60TowJqw82uPjmRSefVnu
	 msU8qOjgLIILCq2IIkaVcG875I/8vrJQAlS01XPaYt6ArGKF8iYmT9hg2yia4F6FFd
	 7qB1kWovAgCTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC0284889;
	Fri, 13 Feb 2026 19:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B33C369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A9A9412DB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OHjD0iJc4hO for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8832E412D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8832E412D1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B90C85DA7; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:58 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: fcf5b59d6135e891c30f60ef4404aadd873ab35e
X-Git-Newrev: d2882b9acdd22ff7c99838d4eac37fabcbb14615
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.7B90C85DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libopenssl: fix
 powerpc64 build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2882b9acdd22ff7c99838d4eac37fabcbb14615
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 96f01932be024eebad8e6edef121641eeb16ffd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
