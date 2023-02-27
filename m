Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C205C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF47D60EA7;
	Mon, 27 Feb 2023 20:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF47D60EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVc5wGQc8MEt; Mon, 27 Feb 2023 20:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 879D661094;
	Mon, 27 Feb 2023 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879D661094
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DCEA1BF36F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69614408D4
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 20:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69614408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XA9478nfKKbO for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 20:53:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7564140151
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7564140151
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 20:53:49 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.130.14])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1CAAB19F5A1;
 Mon, 27 Feb 2023 21:53:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 21:53:34 +0100
Message-Id: <20230227205334.497405-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227205334.497405-1-ju.o@free.fr>
References: <20230227205334.497405-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677531227;
 bh=8wvVLKovfQmTZQqelwha3UXSFtJ3uwTB6p3IGvsUKnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4WTIK9vHCH1lNgJMSt8fmGNIkf+z3tEr2JKlQggsT6ygjpwFAG/bKfMcG+tnfoCW
 aFwkuQs7PCSCjV5fpRdEoFNLy3sQqyrN4DBJJY9f/KsFFnE9F3SAKMndESrrPGGTPf
 hc8GDY2li6jBT+Y4E/63bfPYstr7x78ecL7D4EwwXq+0DP0Q6Woz21NY3z6Te5T7eP
 kv3uX/QXYLlNDTIGo3Gd5oilxfz54alXJYRI1AulPsY/3cRLH6fv6K6DSYN6Py67VY
 IMV3ZXKQiIMgRMTq2BsLjlNXzAy6SKJdR3b17e35gnkBmzG51KTfxYWnq2mR8mRCzh
 P2I/TE1cI6KOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M4WTIK9v
Subject: [Buildroot] [PATCH next 2/2] package/stress-ng: bump to version
 V0.15.04
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

This commit dropped the patch, included upstream in:
https://github.com/ColinIanKing/stress-ng/commit/5d419c790e648c7a2f96f34ed1b93b326f725545
which was included in V0.14.04.

Three patches are also introduced to fix build issues (all
upstream not but not yet in version).

Also, this new version now depends on BR2_TOOLCHAIN_HAS_SYNC_4.

Finally, a new _MAKE_FLAGS is introduced to prevent the package to
modify too much its CFLAGS.

For change log since V0.13.05, see:
- https://github.com/ColinIanKing/stress-ng/blob/V0.15.04/debian/changelog
or commit logs:
- https://github.com/ColinIanKing/stress-ng/commits/V0.15.04

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on top of branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_stress_ng
    ...
    OK

    utils/test-pkg -a -p stress-ng 
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: SKIPPED
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: SKIPPED
    45 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 ...1-Makefile-fix-build-with-kernel-5.6.patch | 60 --------------
 ...build-with-HAVE_SYSCALL-or-__NR_mmap.patch | 54 +++++++++++++
 ...002-stress-regs-fix-build-on-riscv32.patch | 43 ++++++++++
 ...introduce-PRESERVE_CFLAGS-build-flag.patch | 78 +++++++++++++++++++
 package/stress-ng/Config.in                   |  2 +
 package/stress-ng/stress-ng.hash              |  2 +-
 package/stress-ng/stress-ng.mk                |  7 +-
 7 files changed, 183 insertions(+), 63 deletions(-)
 delete mode 100644 package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
 create mode 100644 package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
 create mode 100644 package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
 create mode 100644 package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch

diff --git a/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch b/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
deleted file mode 100644
index 4c62da3241..0000000000
--- a/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5d419c790e648c7a2f96f34ed1b93b326f725545 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 13 Aug 2022 17:17:05 +0200
-Subject: [PATCH] Makefile: fix build with kernel < 5.6
-
-Fix the following build failure with kernel >= 5.1 and < 5.5 (i.e.
-before
-https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
-raised since version 0.11.21 and
-https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:
-
-In file included from stress-io-uring.c:26:
-io-uring.h:1:9: error: macro names must be identifiers
-    1 | #define #define HAVE_IORING_OP_NOP 0
-      |         ^
-
-Moreover, IORING_OP_FALLOCATE is not available before kernel 5.6 and
-https://github.com/torvalds/linux/commit/d63d1b5edb7b832210bfde587ba9e7549fa064eb
-
-Fixes:
- - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from
-https://github.com/ColinIanKing/stress-ng/commit/5d419c790e648c7a2f96f34ed1b93b326f725545]
----
- Makefile          | 2 +-
- stress-io-uring.c | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 2f9cc9918..ee17ae08b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -528,7 +528,7 @@ stress-personality.c: personality.h
- #
- io-uring.h:
- 	$(V)$(CPP) $(CFLAGS) core-io-uring.c  | $(GREP) IORING_OP | sed 's/,//' | \
--	sed 's/IORING_OP_/#define HAVE_IORING_OP_/' > io-uring.h
-+	sed 's/.*\(IORING_OP_.*\)/#define HAVE_\1/' > io-uring.h
- 	$(Q)echo "MK io-uring.h"
- 
- stress-io-uring.c: io-uring.h
-diff --git a/stress-io-uring.c b/stress-io-uring.c
-index ab9fd0749..84f463611 100644
---- a/stress-io-uring.c
-+++ b/stress-io-uring.c
-@@ -311,7 +311,11 @@ static inline int stress_io_uring_complete(
- 			break;
- 
- 		cqe = &cring->cqes[head & *submit->cq_ring.ring_mask];
--		if ((cqe->res < 0) && (opcode != IORING_OP_FALLOCATE)) {
-+		if ((cqe->res < 0)
-+#ifdef HAVE_IORING_OP_FALLOCATE
-+			&& (opcode != IORING_OP_FALLOCATE)
-+#endif
-+		) {
- 			const int err = abs(cqe->res);
- 
- 			/* Silently ignore EOPNOTSUPP completion errors */
diff --git a/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch b/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
new file mode 100644
index 0000000000..41a2647133
--- /dev/null
+++ b/package/stress-ng/0001-stress-mmap-fix-build-with-HAVE_SYSCALL-or-__NR_mmap.patch
@@ -0,0 +1,54 @@
+From 625dd7e458e6aa488f7dd4764e4a62b6fbf79a9d Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Thu, 23 Feb 2023 21:54:16 +0100
+Subject: [PATCH] stress-mmap: fix build with HAVE_SYSCALL or __NR_mmap2 is
+ undefined
+
+Commit afae500a added macro tests for defined(HAVE_SYSCALL) and
+system call numbers.
+
+More specifically, in stress-mmap.c, function mmap2_try() was defined
+only if __NR_mmap2 is defined.  See:
+https://github.com/ColinIanKing/stress-ng/commit/afae500a23b198b9df421ad0fd9270fcdf65c3fb#diff-ffb0db2473f6c5e1b93dd33bce389ee836671a628fff9f903d097733f7ddfc9c
+
+This commit forgot to replicate the same test when the mmap2_try()
+function is used later at:
+https://github.com/ColinIanKing/stress-ng/blob/50f3ef2560e928c4694894be0bb652e663af5076/stress-mmap.c#L754
+
+When HAVE_SYSCALL or __NR_mmap2 is undefined, compilation fails with:
+
+    stress-mmap.c: In function 'stress_mmap':
+    stress-mmap.c:809:31: error: 'mmap2_try' undeclared (first use in this function); did you mean 'mmap_prot'?
+       context.mmap = (mmap_func_t)mmap2_try;
+                                   ^~~~~~~~~
+                                   mmap_prot
+    stress-mmap.c:809:31: note: each undeclared identifier is reported only once for each function it appears in
+
+This patch fixes this issue.
+
+Upstream-reference:
+https://github.com/ColinIanKing/stress-ng/commit/3da49180fdfa8a70307569202ed9431f5295913e
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ stress-mmap.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/stress-mmap.c b/stress-mmap.c
+index cf343078..68f5a9b8 100644
+--- a/stress-mmap.c
++++ b/stress-mmap.c
+@@ -805,7 +805,9 @@ static int stress_mmap(const stress_args_t *args)
+ 		context.mmap_file = true;
+ 
+ 	if (mmap_mmap2) {
+-#if defined(HAVE_MMAP2)
++#if defined(HAVE_MMAP2) && \
++    defined(HAVE_SYSCALL) && \
++    defined(__NR_mmap2)
+ 		context.mmap = (mmap_func_t)mmap2_try;
+ #else
+ 		if (args->instance == 0)
+-- 
+2.39.2
+
diff --git a/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch b/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..cb2a507bfd
--- /dev/null
+++ b/package/stress-ng/0002-stress-regs-fix-build-on-riscv32.patch
@@ -0,0 +1,43 @@
+From 40309f5d313524f4189f4ef158920391e92e226d Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Thu, 23 Feb 2023 21:38:25 +0100
+Subject: [PATCH] stress-regs: fix build on riscv32
+
+RISC-V register test routine is using 64bit registers only.
+When compiling on 32bit RISC-V, compilation fails with output:
+
+    stress-regs.c: In function 'stress_regs_helper':
+    stress-regs.c:485:27: error: register specified for 's1' isn't suitable for data type
+      485 |         register uint64_t s1  __asm__("s1")  = v;
+          |                           ^~
+    stress-regs.c:495:27: error: register specified for 's11' isn't suitable for data type
+      495 |         register uint64_t s11 __asm__("s11") = s1 ^ 0xa5a5a5a5a5a5a5a5ULL;
+          |                           ^~~
+
+This patch fix this issue by protecting the stress_regs_helper()
+function with an additional test, to restrict to 64bit.
+
+Upstream-reference:
+https://github.com/ColinIanKing/stress-ng/commit/6c335ac3abba535e79ddbddf34591ef5b9ee0a96
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ stress-regs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stress-regs.c b/stress-regs.c
+index 4d4d32d2..0ffac4d1 100644
+--- a/stress-regs.c
++++ b/stress-regs.c
+@@ -473,7 +473,7 @@ do {			\
+ }
+ #endif
+ 
+-#if defined(STRESS_ARCH_RISCV)
++#if defined(STRESS_ARCH_RISCV) && (__riscv_xlen == 64)
+ 
+ #define STRESS_REGS_HELPER
+ /*
+-- 
+2.39.2
+
diff --git a/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch b/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch
new file mode 100644
index 0000000000..beb5429dc1
--- /dev/null
+++ b/package/stress-ng/0003-Makefile-introduce-PRESERVE_CFLAGS-build-flag.patch
@@ -0,0 +1,78 @@
+From d3ab0bad6afc2e8f4be70fe38dd24788f1b3d4be Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 24 Feb 2023 21:11:30 +0100
+Subject: [PATCH] Makefile: introduce PRESERVE_CFLAGS build flag
+
+The stress-ng Makefile includes many nice environment auto-detection
+features to adjust compilation flags. This is very convenient in
+many compilation use-cases. However, in some other specific cross
+compilation environments, those automatic CFLAGS adjustments may
+create compilation failures.
+
+For example, commit c00e695ed5 added -fstack-protector-strong if the
+compiler recognize the flag. In some situations, for example a gcc
+toolchain based on uClibc-ng without stack-protector libssp
+enabled, gcc will recognize the option. Then, the Makefile adds the
+option to CFLAGS, and the compilation/link fails at link time with an
+error like:
+
+    /toolchain/arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp_nonshared: No such file or directory
+    /toolchain/arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lssp: No such file or directory
+
+stress-ng is included in the Buildroot build system [1] [2], which
+supports many architectures and toolchain configurations. This build
+system carefully controls its CFLAGS. In such a case, it is
+preferable for a package to avoid changing compilation flags.
+
+This patch introduces the PRESERVE_CFLAGS Makefile variable which will
+disable those CFLAGS adjustments, if set to 1. The current build
+behavior is preserved if unset.
+
+Upstream-reference:
+https://github.com/ColinIanKing/stress-ng/commit/3d87d50561505a5a79008c01e35fc2e100000160
+
+[1] https://buildroot.org/
+[2] https://git.buildroot.org/buildroot/tree/package/stress-ng?h=2022.11.1
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 7a969aba..35151d74 100644
+--- a/Makefile
++++ b/Makefile
+@@ -45,6 +45,7 @@ endif
+ # Test for hardening flags and apply them if applicable
+ #
+ MACHINE = $(shell uname -m)
++ifneq ($(PRESERVE_CFLAGS),1)
+ ifneq ($(MACHINE),$(filter $(MACHINE),alpha parisc))
+ ifeq ($(shell $(CC) $(CFLAGS) -fstack-protector-strong -E -xc /dev/null > /dev/null 2>& 1 && echo 1),1)
+ CFLAGS += -fstack-protector-strong
+@@ -58,6 +59,7 @@ ifeq ($(shell $(CC) $(CFLAGS) -D_FORTIFY_SOURCE=2 -E -xc /dev/null > /dev/null 2
+ CFLAGS += -D_FORTIFY_SOURCE=2
+ endif
+ endif
++endif
+ 
+ #
+ # Expected build warnings
+@@ -83,11 +85,13 @@ PRE_V=
+ PRE_Q=@#
+ endif
+ 
++ifneq ($(PRESERVE_CFLAGS),1)
+ ifeq ($(findstring icc,$(CC)),icc)
+ CFLAGS += -no-inline-max-size -no-inline-max-total-size
+ CFLAGS += -axAVX,CORE-AVX2,CORE-AVX-I,CORE-AVX512,SSE2,SSE3,SSSE3,SSE4.1,SSE4.2,SANDYBRIDGE,SKYLAKE,SKYLAKE-AVX512,TIGERLAKE,SAPPHIRERAPIDS
+ CFLAGS += -ip -falign-loops -funroll-loops -ansi-alias -fma -qoverride-limits
+ endif
++endif
+ 
+ #ifeq ($(findstring clang,$(CC)),clang)
+ #CFLAGS += -Weverything
+-- 
+2.39.2
+
diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 839cbb1cc0..918c3db194 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STRESS_NG
 	bool "stress-ng"
 	depends on BR2_USE_MMU # fork()
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
 	depends on !BR2_nios2
@@ -16,5 +17,6 @@ config BR2_PACKAGE_STRESS_NG
 
 comment "stress-ng needs a toolchain w/ headers >= 3.3"
 	depends on !BR2_nios2 && !BR2_arc
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 2e3f998769..5b967d2b95 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3de49e1100866634f549e99c1644283d0cde817b844a69dcf7f80afa2227d350  stress-ng-0.13.05.tar.gz
+sha256  92922b979b5ca6ee05b03fd792c32a0b25a01fea6161b418b5e672c64ffb549f  stress-ng-0.15.04.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 0b2287c7fb..28116b455d 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.13.05
+STRESS_NG_VERSION = 0.15.04
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
+STRESS_NG_MAKE_FLAGS = \
+	PRESERVE_CFLAGS=1
+
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 STRESS_NG_DEPENDENCIES += libbsd
 endif
@@ -18,7 +21,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 define STRESS_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(STRESS_NG_MAKE_FLAGS)
 endef
 
 # Don't use make install otherwise stress-ng will be rebuild without
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
