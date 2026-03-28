Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FCD10D1484
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFD580CCE;
	Sat, 28 Mar 2026 21:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gX8YyD-Objt; Sat, 28 Mar 2026 21:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A8880D18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774732501;
	bh=Q8HWtb5TSDJzBMpOoxEAcJDTH58zrr4BxvEbBzARD5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ikcFwrTEpeZaa1hT5Q/RysY4GGyoxqpVb99WgCZWu+om+HumGAz+mZzbLFtMM3LZI
	 PZSOelwyBh0nfYJHXwf+YM+KpC7TZyoQacEvPtEcJtwAAGlWaAX/Rh1AL9MHQXT3MG
	 wnqHid9G7/oawnCi5QPceCQRZ3EG8s0actA4/Bs119qX2MYL0J0viVpFZx/EdKeGQh
	 UPrbIZlijxgTry/UaQ7TcdENNDrrWUC6xBFWCE3hJHCsajPjvBorAzWvnuDHOih/VG
	 goNufBIsOj4lchpv8BtdBpDxBi8YT22GKQ6g2GFlrc+QwjbFS0Bxx99DtRV379Ogsb
	 88mVWHAWrYTdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A8880D18;
	Sat, 28 Mar 2026 21:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D932EB
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D72D9607D6
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi8Edgsqt4aM for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 21:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2D5605EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F2D5605EC
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:14:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDF397FCF1; Sat, 28 Mar 2026 21:14:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Mar 2026 22:11:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62c7bd4887ca462378e4ff0dc509a20d2e8c1c46
X-Git-Newrev: 6561290de5efbfb8b13ad5c814958ad25a9657e9
X-Patchwork-Hint: ignore
Message-Id: <20260328211455.BDF397FCF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 4.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6561290de5efbfb8b13ad5c814958ad25a9657e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4

Removed patch due to upstream commit
https://github.com/ncroxon/gnu-efi/commit/f3ececb9eba2ad3104b6d39bd33e579091fce888
which contains a different fix.

Added patch to fix build errors with syslinux:
build/syslinux-6.03/com32/lib/exit.c:57:(.text+0x19):
 undefined reference to `longjmp'
build/syslinux-6.03/com32/lib/sys/module/exec.c:206:(.text+0xdc):
 undefined reference to `setjmp'

LICENSE was clarified and new license files were added in:
https://github.com/ncroxon/gnu-efi/commit/71d5d1746ba50378e0e2d563f7d132c421b7b4f8

licenses/LICENSE.efilib was updated in:
https://github.com/ncroxon/gnu-efi/commit/71b05279b196beea0c8ee4398c7dd0c7963d78ab

This commit reflects those changes by updating _LICENSE_FILES and
adding the new license hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 ...ts-don-t-override-ARCH-when-cross-compili.patch |  32 ---
 ...rt-setjmp-longjmp-ABI-break-in-ncroxon-77.patch | 250 +++++++++++++++++++++
 package/gnu-efi/gnu-efi.hash                       |  10 +-
 package/gnu-efi/gnu-efi.mk                         |  17 +-
 5 files changed, 271 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8c64f9ce51..e9a002f766 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -401,7 +401,6 @@ package/gerbera/S99gerbera lib_sysv.Indent
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch lib_patch.Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.Upstream
-package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
 package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
diff --git a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
deleted file mode 100644
index cbba80b00a..0000000000
--- a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 893a75202407e8ff3d75b217813a5df87da7c807 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Jan 2019 21:07:11 +0100
-Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
-
-Don't override the user-provided ARCH when cross-compiling otherwise
-ARCH won't be correct for armv5, aarch64 and x86_64
-
-Fixes:
- - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Make.defaults | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Make.defaults b/Make.defaults
-index 1347aca..bb21874 100755
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -99,7 +99,7 @@ ARCH          ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[34567
- 
- # Get ARCH from the compiler if cross compiling 
- ifneq ($(CROSS_COMPILE),)
--  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
-+  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
- endif
- 
- # FreeBSD (and possibly others) reports amd64 instead of x86_64
--- 
-2.47.1
-
diff --git a/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch b/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch
new file mode 100644
index 0000000000..fe2bd60686
--- /dev/null
+++ b/package/gnu-efi/0001-Revert-setjmp-longjmp-ABI-break-in-ncroxon-77.patch
@@ -0,0 +1,250 @@
+From 2e3092703698657703e0af9d463c289d78c3c195 Mon Sep 17 00:00:00 2001
+From: lzcunt <lzcunt@rawr.fun>
+Date: Tue, 9 Dec 2025 15:37:03 +0300
+Subject: [PATCH] Revert setjmp/longjmp ABI break in #77
+
+aa27c28 introduced an ABI break in a minor version which broke syslinux.
+syslinux externs the setjmp/longjmp implementation of GNU-EFI, therefore
+depends on the symbol name.
+
+Let's alias base_setjmp and base_longjmp to setjmp and longjmp
+respectively so syslinux builds again.
+
+Signed-off-by: lzcunt <lzcunt@rawr.fun>
+
+Upstream: https://github.com/ncroxon/gnu-efi/pull/77#ref-commit-2e30927
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/aarch64/setjmp.S     |  6 ++++++
+ lib/arm/setjmp.S         |  6 ++++++
+ lib/ia32/setjmp.S        | 14 +++++++++++---
+ lib/ia64/setjmp.S        |  6 ++++++
+ lib/loongarch64/setjmp.S |  7 ++++++-
+ lib/mips64el/setjmp.S    |  6 ++++++
+ lib/riscv64/setjmp.S     |  6 ++++++
+ lib/x86_64/setjmp.S      |  8 ++++++++
+ 8 files changed, 55 insertions(+), 4 deletions(-)
+
+diff --git a/lib/aarch64/setjmp.S b/lib/aarch64/setjmp.S
+index a83eb88e..27acce71 100644
+--- a/lib/aarch64/setjmp.S
++++ b/lib/aarch64/setjmp.S
+@@ -33,6 +33,9 @@ BASIS,
+ #define REG_PAIR(REG1, REG2, OFFS)      stp REG1, REG2, [x0, OFFS]
+ #define REG_ONE(REG1, OFFS)             str REG1, [x0, OFFS]
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -48,6 +51,9 @@ base_setjmp:
+ #define REG_PAIR(REG1, REG2, OFFS)      ldp REG1, REG2, [x0, OFFS]
+ #define REG_ONE(REG1, OFFS)             ldr REG1, [x0, OFFS]
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/arm/setjmp.S b/lib/arm/setjmp.S
+index 2f0b9543..8fe3a439 100644
+--- a/lib/arm/setjmp.S
++++ b/lib/arm/setjmp.S
+@@ -11,6 +11,9 @@
+  */
+ 	.text
+ 	.arm
++	.globl	setjmp
++	.type	setjmp, %function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, %function
+ base_setjmp:
+@@ -19,6 +22,9 @@ base_setjmp:
+ 	eor	r0, r0, r0
+ 	bx	lr
+ 
++	.globl	longjmp
++	.type	longjmp, %function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, %function
+ base_longjmp:
+diff --git a/lib/ia32/setjmp.S b/lib/ia32/setjmp.S
+index b59e7391..2708d1a7 100644
+--- a/lib/ia32/setjmp.S
++++ b/lib/ia32/setjmp.S
+@@ -13,12 +13,16 @@ BASIS,
+  * IMPLIED.
+  */
+ 	.text
++	.globl	setjmp
+ 	.globl	base_setjmp
+ #ifndef __MINGW32__
+-	.type base_setjmp, @function
++	.type	setjmp, @function
++	.type	base_setjmp, @function
+ #else
+-	.def base_setjmp; .scl 2; .type 32; .endef
++	.def	setjmp; .scl 2; .type 32; .endef
++	.def	base_setjmp; .scl 2; .type 32; .endef
+ #endif
++setjmp:
+ base_setjmp:
+ 	pop	%ecx
+ 	movl	(%esp), %edx
+@@ -30,12 +34,16 @@ base_setjmp:
+ 	xorl	%eax, %eax
+ 	jmp	*%ecx
+ 
++	.globl	longjmp
+ 	.globl	base_longjmp
+ #ifndef __MINGW32__
++	.type	longjmp, @function
+ 	.type	base_longjmp, @function
+ #else
+-	.def base_longjmp; .scl 2; .type 32; .endef
++	.def	longjmp; .scl 2; .type 32; .endef
++	.def	base_longjmp; .scl 2; .type 32; .endef
+ #endif
++longjmp:
+ base_longjmp:
+ 	pop	%eax
+ 	pop	%edx
+diff --git a/lib/ia64/setjmp.S b/lib/ia64/setjmp.S
+index 3ab9a153..26d35530 100644
+--- a/lib/ia64/setjmp.S
++++ b/lib/ia64/setjmp.S
+@@ -13,6 +13,9 @@ BASIS,
+  * IMPLIED.
+  */
+ 	.text
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -96,6 +99,9 @@ base_setjmp:
+ 	br.ret.sptk	b0
+ 	;;
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ 	.regstk 2, 0, 0, 0
+diff --git a/lib/loongarch64/setjmp.S b/lib/loongarch64/setjmp.S
+index 42f411e0..9f043593 100644
+--- a/lib/loongarch64/setjmp.S
++++ b/lib/loongarch64/setjmp.S
+@@ -20,7 +20,9 @@
+ 	.text
+ 	.p2align 3
+ 
+-
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -40,6 +42,9 @@ base_setjmp:
+ 	move $a0, $zero
+ 	jr   $ra
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/mips64el/setjmp.S b/lib/mips64el/setjmp.S
+index c07e239d..5bbbed5f 100644
+--- a/lib/mips64el/setjmp.S
++++ b/lib/mips64el/setjmp.S
+@@ -18,6 +18,9 @@ BASIS,
+ 	.text
+ 	.p2align 3
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl	base_setjmp
+ 	.type	base_setjmp, @function
+ base_setjmp:
+@@ -54,6 +57,9 @@ base_setjmp:
+ 	move	$v0, $zero
+ 	jr	$ra
+ 
++	.globl	longjmp
++	.type	longjmp, @function
++longjmp:
+ 	.globl	base_longjmp
+ 	.type	base_longjmp, @function
+ base_longjmp:
+diff --git a/lib/riscv64/setjmp.S b/lib/riscv64/setjmp.S
+index 2f96e18d..f9552b55 100644
+--- a/lib/riscv64/setjmp.S
++++ b/lib/riscv64/setjmp.S
+@@ -39,6 +39,9 @@
+ #define REG_ONE(R, P) sd R, P(a0)
+ #define FREG_ONE(R, P) fsd R, P(a0)
+ 
++	.globl	setjmp
++	.type	setjmp, @function
++setjmp:
+ 	.globl base_setjmp
+ 	.type base_setjmp, @function
+ 
+@@ -56,6 +59,9 @@ base_setjmp:
+ #define REG_ONE(R, P) ld R, P(a0)
+ #define FREG_ONE(R, P) fld R, P(a0)
+ 
++	.globl	longjmp
++	.type	lobgjmp, @function
++longjmp:
+ 	.globl base_longjmp
+ 	.type base_longjmp, @function
+ 
+diff --git a/lib/x86_64/setjmp.S b/lib/x86_64/setjmp.S
+index 719b0219..bf320c83 100644
+--- a/lib/x86_64/setjmp.S
++++ b/lib/x86_64/setjmp.S
+@@ -1,10 +1,14 @@
+ 	.text
++	.globl	setjmp
+ 	.globl	base_setjmp
+ #ifndef __MINGW32__
++	.type	setjmp, @function
+ 	.type base_setjmp, @function
+ #else
+ 	.def base_setjmp; .scl 2; .type 32; .endef
++	.def setjmp; .scl 2; .type 32; .endef
+ #endif
++setjmp:
+ base_setjmp:
+ 	pop	%rsi
+ 	movq	%rbx,0x00(%rdi)
+@@ -19,12 +23,16 @@ base_setjmp:
+ 	xor	%rax,%rax
+ 	ret
+ 
++	.globl	longjmp
+ 	.globl	base_longjmp
+ #ifndef __MINGW32__
++	.type	longjmp, @function
+ 	.type	base_longjmp, @function
+ #else
++	.def longjmp; .scl 2; .type 32; .endef
+ 	.def base_longjmp; .scl 2; .type 32; .endef
+ #endif
++longjmp:
+ base_longjmp:
+ 	movl	%esi, %eax
+ 	movq	0x00(%rdi), %rbx
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 5a2f47cfae..74487834cd 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,5 +1,9 @@
 # Locally computed
-sha256  a2e5dfd25e7fc0cd2027d75dc2517b4c74d94f801ff4784eca557ac1b9835899  gnu-efi-4.0.0.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
-sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  licenses/LICENSE.efilib
+sha256  40b61e842a4efcbf80f3e53b2f220c044e8cfe46eb4dd6396c83b751240b1c0d  gnu-efi-4.0.4.tar.gz
+sha256  e2b4e4a370f19dfdb3c84256ccb1d545ee98329faa20adbb5a06797119c3cd55  LICENSE
+sha256  01852478a0585ed9955de5d674f417ced8ef8934c300f124ab66a8cf251c46d8  licenses/LICENSE.BSD-3-Clause
 sha256  7aa278b6f1a2125d0a0c596fa537caca5a41e7b03f7d2dd0489905f65ffdb984  licenses/LICENSE.edk2
+sha256  146958d2c66a609a6ea72f73017ca626023e0cb3ecbfd9f55722f493427253e7  licenses/LICENSE.efilib
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/LICENSE.GPL-2.0-or-later
+sha256  4796125347fa98a7f3f056117fff04191712538ab9d9ab797075daad808bb538  licenses/LICENSE.GPL-3.0-or-later
+sha256  c0e22e2ea9fe4e12448ab248194a3d53703a13f67a4bb7a412715cb05cd1b274  licenses/LICENSE.LGPL-3.0-or-later
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 268e5350cf..f615df91bc 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,11 +4,22 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 4.0.0
+GNU_EFI_VERSION = 4.0.4
 GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib), BSD-2-Clause-Patent (EDK2 routines)
-GNU_EFI_LICENSE_FILES = LICENSE licenses/LICENSE.edk2 licenses/LICENSE.efilib
+
+GNU_EFI_LICENSE = \
+	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause (efilib), \
+	BSD-2-Clause-Patent (EDK2 routines)
+GNU_EFI_LICENSE_FILES = \
+	LICENSE \
+	licenses/LICENSE.BSD-3-Clause \
+	licenses/LICENSE.edk2 \
+	licenses/LICENSE.efilib \
+	licenses/LICENSE.GPL-2.0-or-later \
+	licenses/LICENSE.GPL-3.0-or-later \
+	licenses/LICENSE.LGPL-3.0-or-later
 
 # gnu-efi is a set of library and header files used to build
 # standalone EFI applications such as bootloaders. There is no point
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
