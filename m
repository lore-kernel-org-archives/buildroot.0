Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492FCC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 171ED612DA;
	Mon, 19 May 2025 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOtoT8SR2xV0; Mon, 19 May 2025 10:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2161270B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2161270B99;
	Mon, 19 May 2025 10:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E627D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39DE840E2C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbAGxL5iTXrc for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14CF4145E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E14CF4145E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA9FD8348A; Mon, 19 May 2025 10:39:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 17:25:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5dacd8e056d30aaa8d8abf12b2566a6d64aedddd
X-Git-Newrev: 97c7311c64468532c71699e18e724d8488d3aa3c
X-Patchwork-Hint: ignore
Message-Id: <20250519103959.DA9FD8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_mips*: backport a
 patch for GCC 15.x compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=97c7311c64468532c71699e18e724d8488d3aa3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Mips kernel maintainer merged a patch [1] for GCC 15.x compatibility
that will likely be merged upstream soon.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=0f4ae7c6ecb89bfda026d210dcf8216fb67d2333

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
