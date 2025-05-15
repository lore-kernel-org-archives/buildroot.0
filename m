Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD34C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4364C424B6;
	Fri, 16 May 2025 11:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QmaHA0le_ff; Fri, 16 May 2025 11:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49457424B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49457424B1;
	Fri, 16 May 2025 11:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 767E813D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB3CF839BC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ueeo7V_rZXUs for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C62083ABC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C62083ABC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87CF486A00; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 869469e9534fa6715ed0d8bf3764f0df882f05c8
X-Git-Newrev: c120eb5df08361bc473dc823aa8612168214f403
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.87CF486A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/qemu_mips*:
 backport a patch for GCC 15.x compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=c120eb5df08361bc473dc823aa8612168214f403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Mips kernel maintainer merged a patch [1] for GCC 15.x compatibility
that will likely be merged upstream soon.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 97c7311c64468532c71699e18e724d8488d3aa3c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch b/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
new file mode 100644
index 0000000000..630fcf6315
--- /dev/null
+++ b/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch
@@ -0,0 +1,52 @@
+From c94606e06b54bc7b909fb342aa8dae732b50f5cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 29 Mar 2025 08:39:03 -0700
+Subject: [PATCH] mips: Add -std= flag specified in KBUILD_CFLAGS to vdso
+ CFLAGS
+
+GCC 15 changed the default C standard dialect from gnu17 to gnu23,
+which should not have impacted the kernel because it explicitly requests
+the gnu11 standard in the main Makefile. However, mips/vdso code uses
+its own CFLAGS without a '-std=' value, which break with this dialect
+change because of the kernel's own definitions of bool, false, and true
+conflicting with the C23 reserved keywords.
+
+  include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
+     11 |         false   = 0,
+        |         ^~~~~
+  include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
+  include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
+     35 | typedef _Bool                   bool;
+        |                                 ^~~~
+  include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
+
+Add -std as specified in KBUILD_CFLAGS to the decompressor and purgatory
+CFLAGS to eliminate these errors and make the C standard version of these
+areas match the rest of the kernel.
+
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: stable@vger.kernel.org
+Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+[Romain: backport to 6.12.27]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/mips/vdso/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
+index b289b2c1b294..c729bd687804 100644
+--- a/arch/mips/vdso/Makefile
++++ b/arch/mips/vdso/Makefile
+@@ -27,6 +27,7 @@ endif
+ # offsets.
+ cflags-vdso := $(ccflags-vdso) \
+ 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
++	$(filter -std=%,$(KBUILD_CFLAGS)) \
+ 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
+ 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
+ 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
