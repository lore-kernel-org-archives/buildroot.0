Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C1AC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7107E84100;
	Wed, 24 May 2023 19:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7107E84100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSw4XGjKKYFv; Wed, 24 May 2023 19:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E0884005;
	Wed, 24 May 2023 19:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E0884005
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69FC01BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327DA41788
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327DA41788
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzVBJAbyJE45 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 496D2429E2
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 496D2429E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 378A6868B3; Wed, 24 May 2023 19:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 21:15:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e418a2c06a1bdc7a5fc65ce58400ed0a9c9e28bb
X-Git-Newrev: ad4775fb2f6a51e1d88110c520e98147deb752ab
X-Patchwork-Hint: ignore
Message-Id: <20230524191609.378A6868B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc_mpc8544ds_defconfig:
 remove kernel patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad4775fb2f6a51e1d88110c520e98147deb752ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ppc-mpc8544ds is the only qemu configuration that requires a kernel patch:
board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch

But this patch doesn't apply after a backport between v6.1.20 and v6.1.21

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=da0beae2449376326086e9f57468fd2b64736d2a

So the patch 0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch doesn't
seem required anymore.

 Welcome to Buildroot
 buildroot login: root
 # uname -a
 Linux buildroot 6.1.28 #1 Wed May 24 09:08:27 UTC 2023 ppc GNU/Linux
 # cat /proc/cpuinfo
 processor	: 0
 cpu		: e500v2
 clock		: 400.000000MHz
 revision	: 3.0 (pvr 8021 0030)
 bogomips	: 800.00

 timebase	: 400000000
 platform	: MPC8544 DS
 model		: MPC8544DS
 Memory		: 128 MB

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895282
https://bugs.busybox.net/show_bug.cgi?id=15581

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...pc-Fix-mcpu-options-for-SPE-only-compiler.patch | 53 ----------------------
 configs/qemu_ppc_mpc8544ds_defconfig               |  1 -
 3 files changed, 55 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 947f4606aa..f2dea0dfd9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -74,7 +74,6 @@ board/pine64/rockpro64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
 board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
-board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch Upstream
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
 board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch Upstream
diff --git a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
deleted file mode 100644
index b8c8a72587..0000000000
--- a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a0919e3177295f4aaa9006915adcddc31788d809 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Wed, 26 Dec 2018 00:00:40 +0000
-Subject: [PATCH] powerpc: Fix -mcpu= options for SPE-only compiler
-
-GCC for Debian's "powerpcspe" architecture only supports 32-bit
-SPE targets, and using -mcpu=powerpc or -mcpu=powerpc64 is a fatal
-error.
-
-* Change the test for a biarch compiler to pass both the -m32 and -m64
-  options, so that it doesn't catch 32-bit-only compilers
-* Add an ifdef CONFIG_PPC64 around the 64-bit CPU option definitions
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-[Romain: Patch from Debian repository:
-https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/powerpc/Makefile | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
-index 5c8c06215dd4..e3dbea6d7ae0 100644
---- a/arch/powerpc/Makefile
-+++ b/arch/powerpc/Makefile
-@@ -12,7 +12,7 @@
- # Rewritten by Cort Dougan and Paul Mackerras
- #
- 
--HAS_BIARCH	:= $(call cc-option-yn, -m32)
-+HAS_BIARCH	:= $(call cc-option-yn, -m32 -m64)
- 
- # Set default 32 bits cross compilers for vdso and boot wrapper
- CROSS32_COMPILE ?=
-@@ -164,6 +164,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
- 
- CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
- 
-+ifdef CONFIG_PPC64
- ifdef CONFIG_PPC_BOOK3S_64
- ifdef CONFIG_CPU_LITTLE_ENDIAN
- CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-@@ -175,6 +176,7 @@ endif
- else
- CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
- endif
-+endif
- 
- ifdef CONFIG_FUNCTION_TRACER
- CC_FLAGS_FTRACE := -pg
--- 
-2.17.1
-
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index ca1a429167..6d8a214e05 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc=y
 BR2_powerpc_8548=y
 
 # System
-BR2_GLOBAL_PATCH_DIR="board/qemu/ppc-mpc8544ds/patches"
 BR2_SYSTEM_DHCP="eth0"
 
 # Filesystem
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
