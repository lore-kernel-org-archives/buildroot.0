Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AF2C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 06:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6400060807;
	Wed, 22 May 2024 06:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qguGp57fXtsW; Wed, 22 May 2024 06:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62EF460818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62EF460818;
	Wed, 22 May 2024 06:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA091C57E3
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E2060818
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtB_dBpyTG4D for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 06:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E0B60807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43E0B60807
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:20:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EAF5874F9; Wed, 22 May 2024 06:20:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 08:19:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8ee092e337c6b255a689e9b92ef2e78533ff97bf
X-Git-Newrev: 330a987a5396d13e20b385a0c14a8936d9d2bba7
X-Patchwork-Hint: ignore
Message-Id: <20240522062053.2EAF5874F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/kexec: fix x86_64
 build with binutils 2.41
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=330a987a5396d13e20b385a0c14a8936d9d2bba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following x86_64 build failure with binutils 2.41:

purgatory/arch/i386/entry32-16.S:23: Error: 64bit mode not supported on `i386'.

Fixes:
 - http://autobuild.buildroot.org/results/60f2f163b491879a8ea7f2d56a6b0d38b3cf439c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a2be1561693a05e09aee57e50c81b5d6dac05a49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-building-on-x86_64-with-binutils-2-41.patch | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch b/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
new file mode 100644
index 0000000000..ae44c21fe1
--- /dev/null
+++ b/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
@@ -0,0 +1,94 @@
+From 328de8e00e298f00d7ba6b25dc3950147e9642e6 Mon Sep 17 00:00:00 2001
+From: Michel Lind <salimma@fedoraproject.org>
+Date: Tue, 30 Jan 2024 04:14:31 -0600
+Subject: Fix building on x86_64 with binutils 2.41
+
+Newer versions of the GNU assembler (observed with binutils 2.41) will
+complain about the ".arch i386" in files assembled with "as --64",
+with the message "Error: 64bit mode not supported on 'i386'".
+
+Fix by moving ".arch i386" below the relevant ".code32" directive, so
+that the assembler is no longer expecting 64-bit instructions to be used
+by the time that the ".arch i386" directive is encountered.
+
+Based on similar iPXE fix:
+https://github.com/ipxe/ipxe/commit/6ca597eee
+
+Signed-off-by: Michel Lind <michel@michel-slm.name>
+Signed-off-by: Simon Horman <horms@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=328de8e00e298f00d7ba6b25dc3950147e9642e6
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ purgatory/arch/i386/entry32-16-debug.S | 2 +-
+ purgatory/arch/i386/entry32-16.S       | 2 +-
+ purgatory/arch/i386/entry32.S          | 2 +-
+ purgatory/arch/i386/setup-x86.S        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
+index 5167944d..12e11649 100644
+--- a/purgatory/arch/i386/entry32-16-debug.S
++++ b/purgatory/arch/i386/entry32-16-debug.S
+@@ -25,10 +25,10 @@
+ 	.globl entry16_debug_pre32
+ 	.globl entry16_debug_first32
+ 	.globl entry16_debug_old_first32
+-	.arch i386
+ 	.balign 16
+ entry16_debug:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
+index c051aab0..eace0958 100644
+--- a/purgatory/arch/i386/entry32-16.S
++++ b/purgatory/arch/i386/entry32-16.S
+@@ -20,10 +20,10 @@
+ #undef i386	
+ 	.text
+ 	.globl entry16, entry16_regs
+-	.arch i386
+ 	.balign 16
+ entry16:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
+index f7a494f1..8ce9e316 100644
+--- a/purgatory/arch/i386/entry32.S
++++ b/purgatory/arch/i386/entry32.S
+@@ -20,10 +20,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl entry32, entry32_regs
+ entry32:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Setup a gdt that should that is generally usefully */
+ 	lgdt	%cs:gdt
+diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
+index 201bb2cb..a212eed4 100644
+--- a/purgatory/arch/i386/setup-x86.S
++++ b/purgatory/arch/i386/setup-x86.S
+@@ -21,10 +21,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl purgatory_start
+ purgatory_start:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Load a gdt so I know what the segment registers are */
+ 	lgdt	%cs:gdt
+-- 
+cgit 1.2.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
