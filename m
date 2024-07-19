Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A701AC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 17:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4303840F13;
	Fri, 19 Jul 2024 17:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORgo_bw6fbV4; Fri, 19 Jul 2024 17:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F1340242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3F1340242;
	Fri, 19 Jul 2024 17:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08AC31BF30D
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 17:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CED83B7B
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 17:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHegrxizSYlm for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 17:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 407A882083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407A882083
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407A882083
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 17:37:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C7BB0B00579;
 Fri, 19 Jul 2024 19:37:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 19:37:23 +0200
Message-ID: <20240719173723.546583-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721410654;
 bh=uDapLP1dS3WcwTQovTds74UhTMk8c8noJNX53IprWjg=;
 h=From:To:Cc:Subject:Date:From;
 b=KQfA3c5hdOXsa0SwGmXd0M/fKL7nbiCncJEgyNZulud09kvnCiFGkmV2HQMMGZ4Gn
 mbMv5hvzpAT70uUKjvcmlhrmL7qFnaSp/pe1FuLb3G8h3QMQv43hyak77izaKoGUJJ
 CfU/TJnlhRapxMnMw78BYftw/mTbHmAzxPXjWEvNNWsYupGDWSHBi9fuI/StY4Xq7T
 LeK8y90lI12Vc+Dhe9kYkbE4maQRbIFDP02QUN3CsKCF8ThZuQHtfh5tMj6z1Aod2g
 84+IMNq/rnK2Mq5OArmH2n/isVB1ZjpgnCigsXZjL0R8yaofhppH8vED7evabF3E1F
 79t1K1jF8NEIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KQfA3c5h
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see [1].

This commit removes the package patch, which is now included in this
new version.

The license hash also changed, due to a FSF address update. See [2].
This commit also adds a comment in the hash file about the pgp
signature check.

[1] https://lists.infradead.org/pipermail/kexec/2024-July/030452.html
[2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=f53bcef5063c70960b2b8eb8990722d5c9d1b99e

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...uilding-on-x86_64-with-binutils-2-41.patch | 94 -------------------
 package/kexec/kexec.hash                      |  6 +-
 package/kexec/kexec.mk                        |  2 +-
 3 files changed, 5 insertions(+), 97 deletions(-)
 delete mode 100644 package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch

diff --git a/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch b/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
deleted file mode 100644
index ae44c21fe1..0000000000
--- a/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 328de8e00e298f00d7ba6b25dc3950147e9642e6 Mon Sep 17 00:00:00 2001
-From: Michel Lind <salimma@fedoraproject.org>
-Date: Tue, 30 Jan 2024 04:14:31 -0600
-Subject: Fix building on x86_64 with binutils 2.41
-
-Newer versions of the GNU assembler (observed with binutils 2.41) will
-complain about the ".arch i386" in files assembled with "as --64",
-with the message "Error: 64bit mode not supported on 'i386'".
-
-Fix by moving ".arch i386" below the relevant ".code32" directive, so
-that the assembler is no longer expecting 64-bit instructions to be used
-by the time that the ".arch i386" directive is encountered.
-
-Based on similar iPXE fix:
-https://github.com/ipxe/ipxe/commit/6ca597eee
-
-Signed-off-by: Michel Lind <michel@michel-slm.name>
-Signed-off-by: Simon Horman <horms@kernel.org>
-Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=328de8e00e298f00d7ba6b25dc3950147e9642e6
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- purgatory/arch/i386/entry32-16-debug.S | 2 +-
- purgatory/arch/i386/entry32-16.S       | 2 +-
- purgatory/arch/i386/entry32.S          | 2 +-
- purgatory/arch/i386/setup-x86.S        | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
-index 5167944d..12e11649 100644
---- a/purgatory/arch/i386/entry32-16-debug.S
-+++ b/purgatory/arch/i386/entry32-16-debug.S
-@@ -25,10 +25,10 @@
- 	.globl entry16_debug_pre32
- 	.globl entry16_debug_first32
- 	.globl entry16_debug_old_first32
--	.arch i386
- 	.balign 16
- entry16_debug:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
-index c051aab0..eace0958 100644
---- a/purgatory/arch/i386/entry32-16.S
-+++ b/purgatory/arch/i386/entry32-16.S
-@@ -20,10 +20,10 @@
- #undef i386	
- 	.text
- 	.globl entry16, entry16_regs
--	.arch i386
- 	.balign 16
- entry16:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
-index f7a494f1..8ce9e316 100644
---- a/purgatory/arch/i386/entry32.S
-+++ b/purgatory/arch/i386/entry32.S
-@@ -20,10 +20,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl entry32, entry32_regs
- entry32:
- 	.code32
-+	.arch	i386
- 
- 	/* Setup a gdt that should that is generally usefully */
- 	lgdt	%cs:gdt
-diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
-index 201bb2cb..a212eed4 100644
---- a/purgatory/arch/i386/setup-x86.S
-+++ b/purgatory/arch/i386/setup-x86.S
-@@ -21,10 +21,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl purgatory_start
- purgatory_start:
- 	.code32
-+	.arch	i386
- 
- 	/* Load a gdt so I know what the segment registers are */
- 	lgdt	%cs:gdt
--- 
-cgit 1.2.3-korg
-
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index cfa8790bb1..91496c06fc 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  d2f0ef872f39e2fe4b1b01feb62b0001383207239b9f8041f98a95564161d053  kexec-tools-2.0.28.tar.xz
+# After checking pgp signature with key:
+# B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
+sha256  67b1ac503aade45a54db0bc79228a8830a35d5d4f83cee932cff3e7a81a4a9ec  kexec-tools-2.0.29.tar.xz
 # locally calculated
-sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 1fd8c0f0ab..5f798b6a3f 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.28
+KEXEC_VERSION = 2.0.29
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
