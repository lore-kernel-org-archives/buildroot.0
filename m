Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F0CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9393B85EA5;
	Tue,  9 Jun 2026 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Pm93xdtwGFc; Tue,  9 Jun 2026 13:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E1685E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010352;
	bh=yNVAUuj4xXPc/KAH07BPRr70K06o3auNHFqPk7BU62k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fcRZJa4InsFRVNuykE+oPSFwsBaTaf6NgbYsJ1kiB6EKVwNypt4o1cbJ+rbttvXcj
	 kLmO1VEabMi3I7E40iSr3gPfZS8N1AXSpOLF4v+biW1jkmWDgMnB84SM6XbQcpzygB
	 RsBK5ZEi1TlUZRhxoaSmurrtYxfeNcXMevLYaLu86LgY/NyGcb0ahx/cchm0WxuR/f
	 PodaJMMfxrXnlaQI75ZulNuwy4tPpcGQZnm+T27q3xe9wGWI2zfPVmaujTSwXwpqtD
	 ugUjEesNhdgM8azdi/eNI/YaIgYN1YYEVUKQFPLFV1GJhhcHskvKakNIP7q6kqo1/N
	 PcNdz48k/R+/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E1685E79;
	Tue,  9 Jun 2026 13:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D6B190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 889BF45076
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_7DSYDeAmVU for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203A345F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 203A345F21
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE4287E8D; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88d346c51ff48ca9d03242bd6be665279318b221
X-Git-Newrev: 50d017a2d681e10458f8aac72103a7661e18134d
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.5BE4287E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: drop support for GCC 13.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50d017a2d681e10458f8aac72103a7661e18134d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that we have added support for GCC 16.x, made GCC 15.x the
default, let's drop support for GCC 13.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - remove remaining gcc-13 patches from commit 10ccbe079ca4
 - move legacy option to 2026.08 version section
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 Config.in.legacy                                   |   7 +
 ...disable-split-stack-for-non-thread-builds.patch |  26 --
 ...002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch |  48 ----
 ...003-Remove-crypt-and-crypt_r-interceptors.patch | 146 ------------
 ...04-libsanitizer-Fix-build-with-glibc-2.42.patch |  81 -------
 ...libcody-Make-it-buildable-by-C-11-to-C-26.patch | 261 ---------------------
 ...sstream-and-memory-include-above-safe-cty.patch |  79 -------
 package/gcc/Config.in.host                         |  12 -
 package/gcc/gcc.hash                               |   2 -
 10 files changed, 7 insertions(+), 656 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9fcb16b6ec..019a92fdb0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -354,7 +354,6 @@ package/ftop/0001-overflow.patch lib_patch.Upstream
 package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
-package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 8095991b25..27b0bcd4b3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_GCC_VERSION_13_X
+	bool "gcc 13.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for building a toolchain based on GCC 13.x has been
+	  removed, chose a newer GCC version instead.
+
 config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	bool "qemu target microblazeel removed"
 	select BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
diff --git a/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
deleted file mode 100644
index e801085dad..0000000000
--- a/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 25 Jul 2022 00:29:55 +0200
-Subject: [PATCH] disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- libgcc/config/t-stack | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
-index cc0366b4cd8..f3f97e86d60 100644
---- a/libgcc/config/t-stack
-+++ b/libgcc/config/t-stack
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
--- 
-2.34.3
-
diff --git a/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
deleted file mode 100644
index 4368f08404..0000000000
--- a/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2023 14:21:55 +0200
-Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
-
-GCC should still build with GCC 4.8.3 or newer [1]
-using C++03 by default. But a recent change in
-RISC-V port introduced a C++11 feature "std::log2" [2].
-
-Use log2 from the C header, without the namespace [3].
-
-[1] https://gcc.gnu.org/install/prerequisites.html
-[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
-[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
-
-Fixes:
-https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
-
-gcc/ChangeLog:
-	* config/riscv/genrvv-type-indexer.cc: Use log2 from the C header, without
-	the namespace.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Upstream: https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=87c347c2897537a6aa391efbfc5ed00c625434fe
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/riscv/genrvv-type-indexer.cc b/gcc/config/riscv/genrvv-type-indexer.cc
-index e677b55290c..eebe382d1c3 100644
---- a/gcc/config/riscv/genrvv-type-indexer.cc
-+++ b/gcc/config/riscv/genrvv-type-indexer.cc
-@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2, unsigned eew, bool unsigned_p,
-   if (sew == eew)
-     elmul_log2 = lmul_log2;
-   else if (sew > eew)
--    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
-+    elmul_log2 = lmul_log2 - log2 (sew / eew);
-   else /* sew < eew */
--    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
-+    elmul_log2 = lmul_log2 + log2 (eew / sew);
- 
-   if (float_p)
-     return floattype (eew, elmul_log2);
--- 
-2.34.3
-
diff --git a/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
deleted file mode 100644
index 98bfed5949..0000000000
--- a/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 3521d93c552a11640a959ee61d551c225981c448 Mon Sep 17 00:00:00 2001
-From: Fangrui Song <i@maskray.me>
-Date: Fri, 28 Apr 2023 09:59:17 -0700
-Subject: [PATCH] Remove crypt and crypt_r interceptors
-
-From Florian Weimer's D144073
-
-> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
->
-> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
-
-Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
-newer glibc.
-
-For older glibc, msan will not know that an uninstrumented crypt_r call
-initializes `data`, so there is a risk for false positives. However, with some
-codebase survey, I think crypt_r uses are very few and the call sites typically
-have a `memset(&data, 0, sizeof(data));` anyway.
-
-Fix https://github.com/google/sanitizers/issues/1365
-Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
-
-Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
-
-Differential Revision: https://reviews.llvm.org/D149403
-
-[Thomas: taken from Crosstool-NG]
-Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
-Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../sanitizer_common_interceptors.inc         | 37 -------------------
- .../sanitizer_platform_interceptors.h         |  2 -
- .../sanitizer_platform_limits_posix.cpp       |  8 ----
- .../sanitizer_platform_limits_posix.h         |  1 -
- 4 files changed, 48 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-index ba4b80081f0..662c4199742 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-@@ -10187,41 +10187,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
- #define INIT_GETRANDOM
- #endif
- 
--#if SANITIZER_INTERCEPT_CRYPT
--INTERCEPTOR(char *, crypt, char *key, char *salt) {
--  void *ctx;
--  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
--  char *res = REAL(crypt)(key, salt);
--  if (res != nullptr)
--    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
--  return res;
--}
--#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
--#else
--#define INIT_CRYPT
--#endif
--
--#if SANITIZER_INTERCEPT_CRYPT_R
--INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
--  void *ctx;
--  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
--  char *res = REAL(crypt_r)(key, salt, data);
--  if (res != nullptr) {
--    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
--                                   __sanitizer::struct_crypt_data_sz);
--    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
--  }
--  return res;
--}
--#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
--#else
--#define INIT_CRYPT_R
--#endif
--
- #if SANITIZER_INTERCEPT_GETENTROPY
- INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
-   void *ctx;
-@@ -10772,8 +10737,6 @@ static void InitializeCommonInterceptors() {
-   INIT_GETUSERSHELL;
-   INIT_SL_INIT;
-   INIT_GETRANDOM;
--  INIT_CRYPT;
--  INIT_CRYPT_R;
-   INIT_GETENTROPY;
-   INIT_QSORT;
-   INIT_QSORT_R;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-index 8307b1ec28b..d50166ee6ce 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-@@ -571,8 +571,6 @@
- #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
- #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
- #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
--#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
--#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
- 
- #define SANITIZER_INTERCEPT_GETRANDOM \
-   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index c85cf1626a7..bcbd143d19d 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -176,10 +176,6 @@ typedef struct user_fpregs elf_fpregset_t;
- #  include "sanitizer_platform_interceptors.h"
- #  include "sanitizer_platform_limits_posix.h"
- 
--#if SANITIZER_INTERCEPT_CRYPT_R
--#include <crypt.h>
--#endif
--
- namespace __sanitizer {
-   unsigned struct_utsname_sz = sizeof(struct utsname);
-   unsigned struct_stat_sz = sizeof(struct stat);
-@@ -283,10 +279,6 @@ namespace __sanitizer {
-   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
--#if SANITIZER_INTERCEPT_CRYPT_R
--  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
--#endif
--
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   unsigned struct_timex_sz = sizeof(struct timex);
-   unsigned struct_msqid_ds_sz = sizeof(struct msqid_ds);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index 44dd3d9e22d..29ebb304a9b 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -319,7 +319,6 @@ extern unsigned struct_msqid_ds_sz;
- extern unsigned struct_mq_attr_sz;
- extern unsigned struct_timex_sz;
- extern unsigned struct_statvfs_sz;
--extern unsigned struct_crypt_data_sz;
- #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
- struct __sanitizer_iovec {
--- 
-2.43.0
-
diff --git a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch b/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
deleted file mode 100644
index 13f7f469c4..0000000000
--- a/package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 2 May 2025 17:41:43 +0200
-Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
-
-The termio structure will be removed from glibc 2.42.  It has
-been deprecated since the late 80s/early 90s.
-
-Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
-("[sanitizer_common] Remove interceptors for deprecated struct termio
-(#137403)").
-
-Co-Authored-By: Tom Stellard <tstellar@redhat.com>
-
-libsanitizer/
-
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
-	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
-	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
-
-Upstream: 1789c57dc97ea2f9819ef89e28bf17208b6208e7 (gcc master branch)
-Upstream: d32ece49d32b00448d967e7dbc6900fb25cbc775 (gcc 15.x branch)
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
- .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
- .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
- 3 files changed, 12 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 49ec4097c90..dda11daa77f 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
-   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
-   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
-   _(TCFLSH, NONE, 0);
--#if SANITIZER_GLIBC
--  _(TCGETA, WRITE, struct_termio_sz);
--#endif
-   _(TCGETS, WRITE, struct_termios_sz);
-   _(TCSBRK, NONE, 0);
-   _(TCSBRKP, NONE, 0);
--#if SANITIZER_GLIBC
--  _(TCSETA, READ, struct_termio_sz);
--  _(TCSETAF, READ, struct_termio_sz);
--  _(TCSETAW, READ, struct_termio_sz);
--#endif
-   _(TCSETS, READ, struct_termios_sz);
-   _(TCSETSF, READ, struct_termios_sz);
-   _(TCSETSW, READ, struct_termios_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index c87d5ef42c9..7bbc6f2edac 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
-   unsigned struct_input_id_sz = sizeof(struct input_id);
-   unsigned struct_mtpos_sz = sizeof(struct mtpos);
-   unsigned struct_rtentry_sz = sizeof(struct rtentry);
--#if SANITIZER_GLIBC || SANITIZER_ANDROID
--  unsigned struct_termio_sz = sizeof(struct termio);
--#endif
-   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
-   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
-   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index c07f7cd0b0d..a80df656826 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
- extern unsigned struct_input_absinfo_sz;
- extern unsigned struct_input_id_sz;
- extern unsigned struct_mtpos_sz;
--extern unsigned struct_termio_sz;
- extern unsigned struct_vt_consize_sz;
- extern unsigned struct_vt_sizes_sz;
- extern unsigned struct_vt_stat_sz;
--- 
-2.50.1
-
diff --git a/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index e1d6b5eb32..0000000000
--- a/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb7..147fecdbe50 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b7..93bce93aa94 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb93..c18469fae84 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
--- 
-2.54.0
-
diff --git a/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
deleted file mode 100644
index 3b12747d68..0000000000
--- a/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 9239757a9c6e3a6e8d94d56803329d556ec914d7 Mon Sep 17 00:00:00 2001
-From: Andrew Pinski <quic_apinski@quicinc.com>
-Date: Mon, 25 Nov 2024 14:03:27 -0800
-Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
- [PR124830]
-
-This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
-the <memory> include to fix build issues with a C++20 host compiler.
-
-sstream in some versions of libstdc++ include locale which might not have been
-included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
-c++ header files needed to be included before hand as comment in system.h says:
-/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
-   poisoning the ctype macros through safe-ctype.h */
-
-I don't understand how it was working before when memory was included after
-safe-ctype.h rather than before. But this makes sstream consistent with the
-other C++ headers.
-
-gcc/ChangeLog:
-
-	PR target/117771
-	PR c/124830
-	* system.h: Move the include of sstream and memory above safe-ctype.h.
-
-Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
-(cherry picked from commit 046776dac7cc74bdbab36f450af80644a045858a)
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=9239757a9c6e3a6e8d94d56803329d556ec914d7
----
- gcc/system.h | 21 +++++++++------------
- 1 file changed, 9 insertions(+), 12 deletions(-)
-
-diff --git a/gcc/system.h b/gcc/system.h
-index 0354883ed3f..1f013d3ac7a 100644
---- a/gcc/system.h
-+++ b/gcc/system.h
-@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
- #ifdef INCLUDE_FUNCTIONAL
- # include <functional>
- #endif
-+#ifdef INCLUDE_SSTREAM
-+# include <sstream>
-+#endif
-+/* Some of the headers included by <memory> can use "abort" within a
-+   namespace, e.g. "_VSTD::abort();", which fails after we use the
-+   preprocessor to redefine "abort" as "fancy_abort" below.  */
-+#ifdef INCLUDE_MEMORY
-+# include <memory>
-+#endif
- # include <cstring>
- # include <initializer_list>
- # include <new>
-@@ -736,22 +745,10 @@ extern int vsnprintf (char *, size_t, const char *, va_list);
- #define LIKELY(x) (__builtin_expect ((x), 1))
- #define UNLIKELY(x) (__builtin_expect ((x), 0))
- 
--/* Some of the headers included by <memory> can use "abort" within a
--   namespace, e.g. "_VSTD::abort();", which fails after we use the
--   preprocessor to redefine "abort" as "fancy_abort" below.  */
--
--#ifdef INCLUDE_MEMORY
--# include <memory>
--#endif
--
- #ifdef INCLUDE_MUTEX
- # include <mutex>
- #endif
- 
--#ifdef INCLUDE_SSTREAM
--# include <sstream>
--#endif
--
- #ifdef INCLUDE_MALLOC_H
- #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
- #include <malloc.h>
--- 
-2.54.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e218b13bd2..1c4358f448 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,14 +22,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_GCC_VERSION_13_X
-	bool "gcc 13.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_POWERPC_CPU_HAS_SPE
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-
 config BR2_GCC_VERSION_14_X
 	bool "gcc 14.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
@@ -76,7 +68,6 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "15.2.0"    if BR2_GCC_VERSION_15_X
 	default "16.1.0"    if BR2_GCC_VERSION_16_X
@@ -107,9 +98,6 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	# on architecture building libquadmath, wchar is required
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
-	# internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167
-	# fixed in gcc 14.x, so disable gcc 13.x
-	depends on !(BR2_microblaze && BR2_GCC_VERSION_13_X)
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index da6aa6e879..0b17a809c8 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,5 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
-sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
 sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
