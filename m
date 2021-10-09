Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA9EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BD960EFE
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4BD960EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE57405B0;
	Sat,  9 Oct 2021 18:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRucxrHPWeWR; Sat,  9 Oct 2021 18:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE454059E;
	Sat,  9 Oct 2021 18:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F91F1BF39D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F382840546
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3oIkXkGbbyt for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 18:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16714040F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 18:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9D3A094AD5; Sat,  9 Oct 2021 18:02:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 19:20:35 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: af8f96a8d71b5fd7ae12151f90d3d286649907a5
X-Git-Newrev: 6d93de9920326dea8b3ca38f8520ca20e25a292b
X-Patchwork-Hint: ignore
Message-Id: <20211009180200.9D3A094AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/uclibc: update to
 1.0.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d93de9920326dea8b3ca38f8520ca20e25a292b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2c2c135e4f4c4d6994d4c6bf35d52edae99f5d25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-PIE-PIC-builds-with-newer-gcc-binutils-w.patch | 91 ----------------------
 package/uclibc/uclibc.hash                         |  4 +-
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 3 insertions(+), 94 deletions(-)

diff --git a/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch b/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch
deleted file mode 100644
index 040699df83..0000000000
--- a/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 6c95eccff5eb43c8c3ad865d3b1316b7952cc58e Mon Sep 17 00:00:00 2001
-From: Yann Sionneau <yann@sionneau.net>
-Date: Fri, 28 May 2021 08:59:58 +0200
-Subject: [PATCH] powerpc: fix PIE/PIC builds with newer gcc/binutils which use
- secureplt by default
-
-This patch fixes segfault of all user space processes (including init, which caused a panic) on recent buildroot powerpc32 builds.
-
-The issue has been reported by Romain Naour in this thread: https://mailman.uclibc-ng.org/pipermail/devel/2021-May/002068.html
-
-Recent buildroot toolchain enables secure PLT in powerpc gcc.
-The latter will then supply -msecure-plt to gas invocations by default.
-Recent buildroot also enables PIE by default.
-
-For the secure PLT to work in PIC, the r30 register needs to point to the GOT.
-Old "bss plt" was just a one-instruction-wide PLT slot, pointed-to by a R_PPC_JMP_SLOT relocation, which was written on-the-fly to contain a branch instruction to the correct address. It therefore had to stay writable+executable, which you generally want to avoid for security reasons.
-New secure PLT only contains read-only code which loads the branch address from the writable GOT.
-
-Note: secure PLT without PIC does not need r30 to be set. Because offset between plt stub code and got is known at link-time. In this case the PLT entry looks like:
-1009b3e0 <__uClibc_main@plt>:
-1009b3e0:       3d 60 10 0e     lis     r11,4110
-1009b3e4:       81 6b 03 74     lwz     r11,884(r11)
-1009b3e8:       7d 69 03 a6     mtctr   r11
-1009b3ec:       4e 80 04 20     bctr
-
-Whereas secure PLT with PIC - offset between plt and got is unknown at link-time - looks like this:
-000af800 <00000000.plt_pic32.__uClibc_main>:
-   af800:       81 7e 03 80     lwz     r11,896(r30)
-   af804:       7d 69 03 a6     mtctr   r11
-   af808:       4e 80 04 20     bctr
-   af80c:       60 00 00 00     nop
-
-Upstream status: Pending:
-https://mailman.uclibc-ng.org/pipermail/devel/2021-May/002091.html
-
-Signed-off-by: Yann Sionneau <yann@sionneau.net>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- Rules.mak                         | 3 ++-
- ldso/ldso/powerpc/dl-startup.h    | 3 +++
- libc/sysdeps/linux/powerpc/crt1.S | 4 ++++
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index 10f88b3de..60ac59b85 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -477,9 +477,10 @@ ifeq ($(TARGET_ARCH),powerpc)
- 	PICFLAG:=-fpic
- 	PIEFLAG_NAME:=-fpie
- 	PPC_HAS_REL16:=$(shell printf "\t.text\n\taddis 11,30,_GLOBAL_OFFSET_TABLE_-.@ha\n" | $(CC) -c -x assembler -o /dev/null -  2> /dev/null && echo -n y || echo -n n)
-+	PPC_HAS_SECUREPLT:=$(shell $(CC) --verbose 2>&1 | grep -- --enable-secureplt > /dev/null && echo -n y || echo -n n)
-+	CPU_CFLAGS-$(PPC_HAS_SECUREPLT) += -DPPC_HAS_SECUREPLT
- 	CPU_CFLAGS-$(PPC_HAS_REL16)+= -DHAVE_ASM_PPC_REL16
- 	CPU_CFLAGS-$(CONFIG_E500) += "-D__NO_MATH_INLINES"
--
- endif
- 
- ifeq ($(TARGET_ARCH),bfin)
-diff --git a/ldso/ldso/powerpc/dl-startup.h b/ldso/ldso/powerpc/dl-startup.h
-index 8b2a517e2..7749395eb 100644
---- a/ldso/ldso/powerpc/dl-startup.h
-+++ b/ldso/ldso/powerpc/dl-startup.h
-@@ -25,6 +25,9 @@ __asm__(
- #else
-     "	bl	_GLOBAL_OFFSET_TABLE_-4@local\n" /*  Put our GOT pointer in r31, */
-     "	mflr	31\n"
-+#endif
-+#ifdef PPC_HAS_SECUREPLT
-+    "   mr      30,31\n"
- #endif
-     "	addi	1,1,16\n" /* Restore SP */
-     "	lwz	7,_dl_skip_args@got(31)\n" /* load EA of _dl_skip_args */
-diff --git a/libc/sysdeps/linux/powerpc/crt1.S b/libc/sysdeps/linux/powerpc/crt1.S
-index 27bfc5a5a..3f5d056c0 100644
---- a/libc/sysdeps/linux/powerpc/crt1.S
-+++ b/libc/sysdeps/linux/powerpc/crt1.S
-@@ -56,6 +56,10 @@ _start:
- # else
- 	bl	_GLOBAL_OFFSET_TABLE_-4@local
- 	mflr	r31
-+# endif
-+	/* in PIC/PIE, plt stubs need r30 to point to the GOT if using secure-plt */
-+# ifdef PPC_HAS_SECUREPLT
-+	mr	30,31
- # endif
- #endif
- 	/* Set up the small data pointer in r13.  */
--- 
-2.31.1
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 2935785f48..25bbabf2ea 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.38/uClibc-ng-1.0.38.tar.xz.sha256
-sha256  b1a3328330d2c94a2bec8c1436a8f15673f3a9b5895e155efc2e91d4e1882570  uClibc-ng-1.0.38.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.38/uClibc-ng-1.0.39.tar.xz.sha256
+sha256  cb089dfe14867a38f222d6428e85d0e1191dcbb66dd9b1a671484f6bc7c81920  uClibc-ng-1.0.39.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 180ed9951e..87e283de2a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.38
+UCLIBC_VERSION = 1.0.39
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
