Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8712AC77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFFE42C9B;
	Fri, 12 May 2023 15:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFFE42C9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFiJVXlxdqrs; Fri, 12 May 2023 15:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DFF42B47;
	Fri, 12 May 2023 15:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DFF42B47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF281BF2CB
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58826409D7
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58826409D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puZnO74l28ZB for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 15:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 277E44018B
 for <buildroot@buildroot.org>; Fri, 12 May 2023 15:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277E44018B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15DDE86405; Fri, 12 May 2023 15:23:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 17:21:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b52d2817c935314136170645a90a9e8cb47dd03
X-Git-Newrev: a157ea5fa6bba5fb8f1ce87fa041e4e77822c16c
X-Patchwork-Hint: ignore
Message-Id: <20230512152354.15DDE86405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: bump to version 0.15.07
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

commit: https://git.buildroot.net/buildroot/commit/?id=a157ea5fa6bba5fb8f1ce87fa041e4e77822c16c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now included patches and regenerate ignore file.

https://github.com/ColinIanKing/stress-ng/blob/V0.15.07/debian/changelog

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 -
 ...-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch | 54 ---------------
 .../0002-stress-regs-fix-build-on-riscv32.patch    | 43 ------------
 ...file-introduce-PRESERVE_CFLAGS-build-flag.patch | 78 ----------------------
 package/stress-ng/stress-ng.hash                   |  2 +-
 package/stress-ng/stress-ng.mk                     |  2 +-
 6 files changed, 2 insertions(+), 180 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a1895e54ea..1e131d00a6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1503,9 +1503,6 @@ package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch Upstream
 package/start-stop-daemon/0002-just-warn-on-missing-arch.patch Upstream
 package/statserial/0001-ncurses-link.patch Upstream
 package/stellarium/0001-add-missing-include.patch Upstream
-package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch Upstream
-package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch Upstream
-package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch Upstream
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 package/supervisor/S99supervisord Variables
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
index 5b967d2b95..a02b65c992 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92922b979b5ca6ee05b03fd792c32a0b25a01fea6161b418b5e672c64ffb549f  stress-ng-0.15.04.tar.gz
+sha256  7ad1f30237011149e7f83451ea7cb49e88c0a79bed55e29b556c6a72b9f1d79d  stress-ng-0.15.07.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 28116b455d..0f204bcf79 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.15.04
+STRESS_NG_VERSION = 0.15.07
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
