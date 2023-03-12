Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C09C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 23:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE73260769;
	Sun, 12 Mar 2023 23:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE73260769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oFkqoeIyY9F; Sun, 12 Mar 2023 23:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D034B60D58;
	Sun, 12 Mar 2023 23:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D034B60D58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8F3F1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 23:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934DB40514
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 23:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934DB40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtjF2CjhpPCm for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 23:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007994058B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 007994058B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 23:10:13 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.98.73])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 09BF27802D6;
 Mon, 13 Mar 2023 00:10:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 00:09:58 +0100
Message-Id: <20230312230958.788816-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678662610;
 bh=tliKrmuJKDYB6fIjp595wXOzeULrt78dUpnpsGkB2hw=;
 h=From:To:Cc:Subject:Date:From;
 b=ljEXS82LFgqLr1S2SxA0bJDTe7g01rdfKAJIEqsnNtxoRnkpIJMPtKbyUPbHFzOHj
 LJKnBC0aaOsHrIgmB2eVqogIsUz6gvhVKEfxrBA9hZ2w+6RkwD6cO3cUUdkj3M4gi7
 a+B0haB1K76/29fotuCWYUD2qsBa36dktpD+BaJ86sugUPYRSIR6QYxS+70DDipBiJ
 sG72slucpswmONbbr2KO5fo6CVMjEmwumnL2xpRxVaPdxvW0RtnlpTHKwgSzHCYcNp
 zPlVzVnwLXr6/dIF3+qZCKVieK3MwtayEIxAeuBr18pYWcGzqdTV3Voz60X09tPtVH
 B3fiUmvKKHTsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ljEXS82L
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version V0.15.05
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit drops all the patches which are now all included
upstream.

For change log since V0.15.04, see:
- https://github.com/ColinIanKing/stress-ng/blob/V0.15.05/debian/changelog
or commit logs:
- https://github.com/ColinIanKing/stress-ng/commits/V0.15.05

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on top of branch master at commit df48bcd with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_stress_ng
    ...
    OK

    utils/test-pkg -a -p stress-ng 
    ...
    45 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 ...build-with-HAVE_SYSCALL-or-__NR_mmap.patch | 54 -------------
 ...002-stress-regs-fix-build-on-riscv32.patch | 43 ----------
 ...introduce-PRESERVE_CFLAGS-build-flag.patch | 78 -------------------
 package/stress-ng/stress-ng.hash              |  2 +-
 package/stress-ng/stress-ng.mk                |  2 +-
 5 files changed, 2 insertions(+), 177 deletions(-)
 delete mode 100644 package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
 delete mode 100644 package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
 delete mode 100644 package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch

diff --git a/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch b/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
deleted file mode 100644
index 41a2647133..0000000000
--- a/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 625dd7e458e6aa488f7dd4764e4a62b6fbf79a9d Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Thu, 23 Feb 2023 21:54:16 +0100
-Subject: [PATCH] stress-mmap: fix build with HAVE_SYSCALL or __NR_mmap2 is
- undefined
-
-Commit afae500a added macro tests for defined(HAVE_SYSCALL) and
-system call numbers.
-
-More specifically, in stress-mmap.c, function mmap2_try() was defined
-only if __NR_mmap2 is defined.  See:
-https://github.com/ColinIanKing/stress-ng/commit/afae500a23b198b9df421ad0fd9270fcdf65c3fb#diff-ffb0db2473f6c5e1b93dd33bce389ee836671a628fff9f903d097733f7ddfc9c
-
-This commit forgot to replicate the same test when the mmap2_try()
-function is used later at:
-https://github.com/ColinIanKing/stress-ng/blob/50f3ef2560e928c4694894be0bb652e663af5076/stress-mmap.c#L754
-
-When HAVE_SYSCALL or __NR_mmap2 is undefined, compilation fails with:
-
-    stress-mmap.c: In function 'stress_mmap':
-    stress-mmap.c:809:31: error: 'mmap2_try' undeclared (first use in this function); did you mean 'mmap_prot'?
-       context.mmap = (mmap_func_t)mmap2_try;
-                                   ^~~~~~~~~
-                                   mmap_prot
-    stress-mmap.c:809:31: note: each undeclared identifier is reported only once for each function it appears in
-
-This patch fixes this issue.
-
-Upstream-reference:
-https://github.com/ColinIanKing/stress-ng/commit/3da49180fdfa8a70307569202ed9431f5295913e
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- stress-mmap.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/stress-mmap.c b/stress-mmap.c
-index cf343078..68f5a9b8 100644
---- a/stress-mmap.c
-+++ b/stress-mmap.c
-@@ -805,7 +805,9 @@ static int stress_mmap(const stress_args_t *args)
- 		context.mmap_file = true;
- 
- 	if (mmap_mmap2) {
--#if defined(HAVE_MMAP2)
-+#if defined(HAVE_MMAP2) && \
-+    defined(HAVE_SYSCALL) && \
-+    defined(__NR_mmap2)
- 		context.mmap = (mmap_func_t)mmap2_try;
- #else
- 		if (args->instance == 0)
--- 
-2.39.2
-
diff --git a/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch b/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
deleted file mode 100644
index cb2a507bfd..0000000000
--- a/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 40309f5d313524f4189f4ef158920391e92e226d Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Thu, 23 Feb 2023 21:38:25 +0100
-Subject: [PATCH] stress-regs: fix build on riscv32
-
-RISC-V register test routine is using 64bit registers only.
-When compiling on 32bit RISC-V, compilation fails with output:
-
-    stress-regs.c: In function 'stress_regs_helper':
-    stress-regs.c:485:27: error: register specified for 's1' isn't suitable for data type
-      485 |         register uint64_t s1  __asm__("s1")  = v;
-          |                           ^~
-    stress-regs.c:495:27: error: register specified for 's11' isn't suitable for data type
-      495 |         register uint64_t s11 __asm__("s11") = s1 ^ 0xa5a5a5a5a5a5a5a5ULL;
-          |                           ^~~
-
-This patch fix this issue by protecting the stress_regs_helper()
-function with an additional test, to restrict to 64bit.
-
-Upstream-reference:
-https://github.com/ColinIanKing/stress-ng/commit/6c335ac3abba535e79ddbddf34591ef5b9ee0a96
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- stress-regs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stress-regs.c b/stress-regs.c
-index 4d4d32d2..0ffac4d1 100644
---- a/stress-regs.c
-+++ b/stress-regs.c
-@@ -473,7 +473,7 @@ do {			\
- }
- #endif
- 
--#if defined(STRESS_ARCH_RISCV)
-+#if defined(STRESS_ARCH_RISCV) && (__riscv_xlen == 64)
- 
- #define STRESS_REGS_HELPER
- /*
--- 
-2.39.2
-
diff --git a/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch b/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch
deleted file mode 100644
index beb5429dc1..0000000000
--- a/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From d3ab0bad6afc2e8f4be70fe38dd24788f1b3d4be Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Fri, 24 Feb 2023 21:11:30 +0100
-Subject: [PATCH] Makefile: introduce PRESERVE_CFLAGS build flag
-
-The stress-ng Makefile includes many nice environment auto-detection
-features to adjust compilation flags. This is very convenient in
-many compilation use-cases. However, in some other specific cross
-compilation environments, those automatic CFLAGS adjustments may
-create compilation failures.
-
-For example, commit c00e695ed5 added -fstack-protector-strong if the
-compiler recognize the flag. In some situations, for example a gcc
-toolchain based on uClibc-ng without stack-protector libssp
-enabled, gcc will recognize the option. Then, the Makefile adds the
-option to CFLAGS, and the compilation/link fails at link time with an
-error like:
-
-    /toolchain/arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp_nonshared: No such file or directory
-    /toolchain/arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp: No such file or directory
-
-stress-ng is included in the Buildroot build system [1] [2], which
-supports many architectures and toolchain configurations. This build
-system carefully controls its CFLAGS. In such a case, it is
-preferable for a package to avoid changing compilation flags.
-
-This patch introduces the PRESERVE_CFLAGS Makefile variable which will
-disable those CFLAGS adjustments, if set to 1. The current build
-behavior is preserved if unset.
-
-Upstream-reference:
-https://github.com/ColinIanKing/stress-ng/commit/3d87d50561505a5a79008c01e35fc2e100000160
-
-[1] https://buildroot.org/
-[2] https://git.buildroot.org/buildroot/tree/package/stress-ng?h=2022.11.1
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 7a969aba..35151d74 100644
---- a/Makefile
-+++ b/Makefile
-@@ -45,6 +45,7 @@ endif
- # Test for hardening flags and apply them if applicable
- #
- MACHINE = $(shell uname -m)
-+ifneq ($(PRESERVE_CFLAGS),1)
- ifneq ($(MACHINE),$(filter $(MACHINE),alpha parisc))
- ifeq ($(shell $(CC) $(CFLAGS) -fstack-protector-strong -E -xc /dev/null > /dev/null 2>& 1 && echo 1),1)
- CFLAGS += -fstack-protector-strong
-@@ -58,6 +59,7 @@ ifeq ($(shell $(CC) $(CFLAGS) -D_FORTIFY_SOURCE=2 -E -xc /dev/null > /dev/null 2
- CFLAGS += -D_FORTIFY_SOURCE=2
- endif
- endif
-+endif
- 
- #
- # Expected build warnings
-@@ -83,11 +85,13 @@ PRE_V=
- PRE_Q=@#
- endif
- 
-+ifneq ($(PRESERVE_CFLAGS),1)
- ifeq ($(findstring icc,$(CC)),icc)
- CFLAGS += -no-inline-max-size -no-inline-max-total-size
- CFLAGS += -axAVX,CORE-AVX2,CORE-AVX-I,CORE-AVX512,SSE2,SSE3,SSSE3,SSE4.1,SSE4.2,SANDYBRIDGE,SKYLAKE,SKYLAKE-AVX512,TIGERLAKE,SAPPHIRERAPIDS
- CFLAGS += -ip -falign-loops -funroll-loops -ansi-alias -fma -qoverride-limits
- endif
-+endif
- 
- #ifeq ($(findstring clang,$(CC)),clang)
- #CFLAGS += -Weverything
--- 
-2.39.2
-
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 5b967d2b95..1c7cd1cdf6 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92922b979b5ca6ee05b03fd792c32a0b25a01fea6161b418b5e672c64ffb549f  stress-ng-0.15.04.tar.gz
+sha256  303cca1bd78323a9f45d76a65e4348de266c3d5eeafcfd214173de3f61a0002d  stress-ng-0.15.05.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 28116b455d..196d926a4b 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.15.04
+STRESS_NG_VERSION = 0.15.05
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
