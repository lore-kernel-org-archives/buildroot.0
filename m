Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D58BC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8229260638;
	Sun, 21 Jul 2024 16:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o37PfVytX78x; Sun, 21 Jul 2024 16:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBE9605F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BBE9605F0;
	Sun, 21 Jul 2024 16:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 977341BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 906C1400F6
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzC9g9TWDNED for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DAA400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51DAA400C7
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:17:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD39C86ECB; Sun, 21 Jul 2024 16:17:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:17:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c8f6dc5e4d7244b493e290c055202cadc9a12cb
X-Git-Newrev: acdcc4c98ad7b04fa1def79c3e8b42dbb866b91b
X-Patchwork-Hint: ignore
Message-Id: <20240721161714.AD39C86ECB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: bump to version 2.0.29
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=acdcc4c98ad7b04fa1def79c3e8b42dbb866b91b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce, see [1].

This commit removes the package patch, which is now included in this
new version.

The license hash also changed, due to a FSF address update. See [2].
This commit also adds a comment in the hash file about the pgp
signature check.

[1] https://lists.infradead.org/pipermail/kexec/2024-July/030452.html
[2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=f53bcef5063c70960b2b8eb8990722d5c9d1b99e

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-building-on-x86_64-with-binutils-2-41.patch | 94 ----------------------
 package/kexec/kexec.hash                           |  6 +-
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 5 insertions(+), 97 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
