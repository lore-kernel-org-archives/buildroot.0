Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BADAC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB4540CDE;
	Mon, 19 May 2025 16:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnnpoyWRE6Ia; Mon, 19 May 2025 16:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDEA40E04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDEA40E04;
	Mon, 19 May 2025 16:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEA02D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF0D040167
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDqpqfVBZlo9 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3431D403C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3431D403C8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24608874A8; Mon, 19 May 2025 16:48:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:46:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e1fafa1f0f5069418e92f702c2a66db6408a634
X-Git-Newrev: 58cf7c51da3ae4804332f68ee934e153d695d047
X-Patchwork-Hint: ignore
Message-Id: <20250519164806.24608874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: drop support for
 GCC 12.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=58cf7c51da3ae4804332f68ee934e153d695d047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added support for GCC 15.x, made GCC 14.x the
default, let's drop support for GCC 12.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 Config.in.legacy                                   |   7 ++
 ...disable-split-stack-for-non-thread-builds.patch |  26 ----
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch |  48 -------
 ...ensa-add-.note.GNU-stack-section-on-linux.patch | 105 ----------------
 ...004-Remove-crypt-and-crypt_r-interceptors.patch | 140 ---------------------
 ..._BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch |  44 -------
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch |  53 --------
 package/gcc/Config.in.host                         |  16 +--
 package/gcc/gcc.hash                               |   2 -
 10 files changed, 9 insertions(+), 433 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c8f708217b..b9e3b42915 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -475,7 +475,6 @@ package/ftop/0001-overflow.patch lib_patch.Upstream
 package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
-package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/15.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 54792bc22f..3289bd8385 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_GCC_VERSION_12_X
+	bool "gcc 12.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for building a toolchain based on GCC 12.x has been
+	  removed, chose a newer GCC version instead.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "mesa Gallium swrast driver was replaced by softpipe"
 	select BR2_LEGACY
diff --git a/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
deleted file mode 100644
index e801085dad..0000000000
--- a/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
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
diff --git a/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
deleted file mode 100644
index 4bac597233..0000000000
--- a/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Thu, 29 Sep 2022 15:32:39 +0100
-Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
-
-This was found when testing buildroot with linuxthreads enabled.  In
-this case, the build passes --disable-tls to the toolchain during
-configuration.  After building the OpenRISC toolchain it was still
-generating TLS code sequences and causing linker failures such as:
-
- ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
- ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
-
-This patch fixes this by disabling tls for the OpenRISC target when requested
-via --disable-tls.
-
-gcc/ChangeLog:
-
-	* config/or1k/or1k.cc (TARGET_HAVE_TLS): Only define if
-	HAVE_AS_TLS is defined.
-
-Tested-by: Yann E. MORIN <yann.morin@orange.com>
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gcc/config/or1k/or1k.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
-index da2f59062ba..0ce7b234417 100644
---- a/gcc/config/or1k/or1k.cc
-+++ b/gcc/config/or1k/or1k.cc
-@@ -2206,8 +2206,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
- #undef  TARGET_LEGITIMATE_ADDRESS_P
- #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
- 
-+#ifdef HAVE_AS_TLS
- #undef  TARGET_HAVE_TLS
- #define TARGET_HAVE_TLS true
-+#endif
- 
- #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
- #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
--- 
-2.39.3
-
diff --git a/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
deleted file mode 100644
index 4c79c3448f..0000000000
--- a/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 38cdfcc4b2cca8d251ff8d8d34201dfe9849333e Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 2 Mar 2023 09:45:41 -0800
-Subject: [PATCH] xtensa: add .note.GNU-stack section on linux
-
-gcc/
-	* config/xtensa/linux.h (TARGET_ASM_FILE_END): New macro.
-
-libgcc/
-	* config/xtensa/crti.S: Add .note.GNU-stack section on linux.
-	* config/xtensa/crtn.S: Likewise.
-	* config/xtensa/lib1funcs.S: Likewise.
-	* config/xtensa/lib2funcs.S: Likewise.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6360bf9a2d08f08c151464c77c0da53cd702ff25
----
- gcc/config/xtensa/linux.h        | 1 +
- libgcc/config/xtensa/crti.S      | 6 ++++++
- libgcc/config/xtensa/crtn.S      | 6 ++++++
- libgcc/config/xtensa/lib1funcs.S | 6 ++++++
- libgcc/config/xtensa/lib2funcs.S | 6 ++++++
- 5 files changed, 25 insertions(+)
-
-diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
-index edce618fb94..fe0e3a43797 100644
---- a/gcc/config/xtensa/linux.h
-+++ b/gcc/config/xtensa/linux.h
-@@ -69,3 +69,4 @@ along with GCC; see the file COPYING3.  If not see
- 
- #undef DBX_REGISTER_NUMBER
- 
-+#define TARGET_ASM_FILE_END file_end_indicate_exec_stack
-diff --git a/libgcc/config/xtensa/crti.S b/libgcc/config/xtensa/crti.S
-index 3de7bc101f4..0996e7cb29b 100644
---- a/libgcc/config/xtensa/crti.S
-+++ b/libgcc/config/xtensa/crti.S
-@@ -26,6 +26,12 @@
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- 	.section .init
- 	.globl _init
- 	.type _init,@function
-diff --git a/libgcc/config/xtensa/crtn.S b/libgcc/config/xtensa/crtn.S
-index 06b932edb14..a4cc9830096 100644
---- a/libgcc/config/xtensa/crtn.S
-+++ b/libgcc/config/xtensa/crtn.S
-@@ -27,6 +27,12 @@
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- 	.section .init
- #if XCHAL_HAVE_WINDOWED && !__XTENSA_CALL0_ABI__
- 	retw
-diff --git a/libgcc/config/xtensa/lib1funcs.S b/libgcc/config/xtensa/lib1funcs.S
-index 5a2bd20534f..7177dd4f73a 100644
---- a/libgcc/config/xtensa/lib1funcs.S
-+++ b/libgcc/config/xtensa/lib1funcs.S
-@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- /* Define macros for the ABS and ADDX* instructions to handle cases
-    where they are not included in the Xtensa processor configuration.  */
- 
-diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
-index 681bac1be8c..a40c1a45604 100644
---- a/libgcc/config/xtensa/lib2funcs.S
-+++ b/libgcc/config/xtensa/lib2funcs.S
-@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- /* __xtensa_libgcc_window_spill: This function flushes out all but the
-    current register window.  This is used to set up the stack so that
-    arbitrary frames can be accessed.  */
--- 
-2.39.2
-
diff --git a/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
deleted file mode 100644
index de3c27c8c7..0000000000
--- a/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From bf61483b6a5e32cb397f97a1cd4af2a41d46ade3 Mon Sep 17 00:00:00 2001
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
- .../sanitizer_platform_limits_posix.cpp       |  2 -
- .../sanitizer_platform_limits_posix.h         |  1 -
- 4 files changed, 42 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-index abb38ccfa15d..61250226aa56 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-@@ -9977,41 +9977,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
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
-@@ -10521,8 +10486,6 @@ static void InitializeCommonInterceptors() {
-   INIT_GETUSERSHELL;
-   INIT_SL_INIT;
-   INIT_GETRANDOM;
--  INIT_CRYPT;
--  INIT_CRYPT_R;
-   INIT_GETENTROPY;
-   INIT_QSORT;
-   INIT_QSORT_R;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-index 14610f2df78d..787db66ae2b7 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-@@ -568,8 +568,6 @@
- #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
- #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
- #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
--#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
--#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
- 
- #define SANITIZER_INTERCEPT_GETRANDOM \
-   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index c335f33dda58..bfdccd5df078 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -154,7 +154,6 @@ typedef struct user_fpregs elf_fpregset_t;
- #include <linux/serial.h>
- #include <sys/msg.h>
- #include <sys/ipc.h>
--#include <crypt.h>
- #endif  // SANITIZER_ANDROID
- 
- #include <link.h>
-@@ -254,7 +253,6 @@ namespace __sanitizer {
-   unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
-   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
-   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
--  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index da53b5abef27..2605bb849a78 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -298,7 +298,6 @@ extern unsigned struct_msqid_ds_sz;
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
diff --git a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
deleted file mode 100644
index 386c9287f6..0000000000
--- a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e45f12ecf703eed45515d451cf014fba32e7410b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2023 11:48:35 -0800
-Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
-
-On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
-_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
-
-Fixes
-
-```
-/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
- only with _FILE_OFFSET_BITS=64"
-| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-|     ^
-| 1 error generated.
-```
-
-Reviewed By: thesamesam, MaskRay
-
-Differential Revision: https://reviews.llvm.org/D140812
-
-Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index bfdccd5df07..4cedcbfb4bf 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -18,6 +18,7 @@
- // depends on _FILE_OFFSET_BITS setting.
- // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
- #undef _FILE_OFFSET_BITS
-+#undef _TIME_BITS
- #endif
- 
- // Must go after undef _FILE_OFFSET_BITS.
--- 
-2.45.2
-
diff --git a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
deleted file mode 100644
index 80c3378d7b..0000000000
--- a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 940a0c955bca98aba937c4bfe3fe4a4c17dddb85 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 18 Jul 2024 23:13:41 +0200
-Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
- sanitizer_procmaps_solaris.cpp
-
-Upstream commit
-https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
-of LLVM added a #undef _TIME_BITS in
-libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
-fix the build on 32-bit Linux platforms that have enabled 64-bit
-time_t using _TIME_BITS=64.
-
-Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
-sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
-including any header file. To fix this, the upstream fix was to also
-undef _TIME_BITS.
-
-This commit simply does the same in sanitizer_procmaps_solaris.cpp,
-which also gets compiled under Linux (despite what the file name
-says). In practice on Linux hosts (where _TIME_BITS=64 matters),
-sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
-the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
-the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
-before including sanitizer_platform.h, which will set the
-SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
-
-Fixes:
-
-armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-
-Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-index e16c4e938cb..ca88cf2c2df 100644
---- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-@@ -11,6 +11,7 @@
- 
- // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
- #undef _FILE_OFFSET_BITS
-+#undef _TIME_BITS
- #include "sanitizer_platform.h"
- #if SANITIZER_SOLARIS
- #include "sanitizer_common.h"
--- 
-2.45.2
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 9239149cf0..4258debbd1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,16 +22,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_GCC_VERSION_12_X
-	bool "gcc 12.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
-
 config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x"
 	# powerpc spe support has been deprecated since gcc 8.x.
@@ -86,7 +76,6 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "14.2.0"    if BR2_GCC_VERSION_14_X
 	default "15.1.0"    if BR2_GCC_VERSION_15_X
@@ -118,9 +107,8 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
 	# internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167
-	# fixed in gcc 14.x, so disable gcc 12.x/13.x
-	depends on !(BR2_microblaze && \
-		(BR2_GCC_VERSION_12_X || BR2_GCC_VERSION_13_X))
+	# fixed in gcc 14.x, so disable gcc 13.x
+	depends on !(BR2_microblaze && BR2_GCC_VERSION_13_X)
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 8c4e39c71d..7a473cdc02 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,6 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
-sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
