From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Mar 2020 22:15:40 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove version 5.5.5
In-Reply-To: <20200322211540.556085-1-romain.naour@gmail.com>
References: <20200322211540.556085-1-romain.naour@gmail.com>
Message-ID: <20200322211540.556085-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 9.2 is around, gcc 8.4 is the default version, so drop
5.5 in order to reduce the gcc choice.

GCC 5.5 was disabled for Glibc based toolchain since Glibc
2.30 needs GCC 6.2 or later.

See:
https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy                              |   9 +
 .../5.5.0/0001-m68k-coldfire-pr68467.patch    |  48 ---
 ...2-libsanitizer-Use-pre-computed-size.patch |  72 -----
 package/gcc/5.5.0/100-uclibc-conf.patch       |  15 -
 ...ix-typo-for-powerpc-e6500-cpu_is_64b.patch |  29 --
 .../gcc/5.5.0/301-missing-execinfo_h.patch    |  13 -
 .../gcc/5.5.0/810-arm-softfloat-libgcc.patch  |  30 --
 .../gcc/5.5.0/830-arm_unbreak_armv4t.patch    |  15 -
 ...473-Reduce-size-of-Cortex-A8-automat.patch |  68 ----
 ...0-microblaze-enable-dwarf-eh-support.patch | 166 ----------
 .../gcc/5.5.0/850-libstdcxx-uclibc-c99.patch  | 273 -----------------
 package/gcc/5.5.0/860-cilk-wchar.patch        |  56 ----
 ...870-xtensa-add-mauto-litpools-option.patch | 290 ------------------
 ...xtensa-reimplement-register-spilling.patch |  76 -----
 .../874-xtensa-add-uclinux-support.patch      | 174 -----------
 .../875-xtensa-implement-trap-pattern.patch   |  67 ----
 .../880-gcc-nios2-Add-IJMP_REGS-enum.patch    | 103 -------
 package/gcc/5.5.0/890-fix-m68k-compile.patch  |  15 -
 .../900-libitm-fixes-for-musl-support.patch   |  65 ----
 ...-fixincludes-update-for-musl-support.patch |  32 --
 .../gcc/5.5.0/902-unwind-fix-for-musl.patch   |  36 ---
 ...libgfortran-gthr-workaround-for-musl.patch |  80 -----
 package/gcc/5.5.0/904-musl-libc-config.patch  | 285 -----------------
 .../5.5.0/905-add-musl-support-to-gcc.patch   | 130 --------
 package/gcc/5.5.0/906-mips-musl-support.patch |  37 ---
 package/gcc/5.5.0/907-x86-musl-support.patch  |  45 ---
 package/gcc/5.5.0/908-arm-musl-support.patch  |  45 ---
 .../gcc/5.5.0/909-aarch64-musl-support.patch  |  33 --
 .../910-microblaze-musl-and-uclibc.patch      |  36 ---
 package/gcc/5.5.0/911-ppc-musl-support.patch  |  75 -----
 package/gcc/5.5.0/912-sh-musl-support.patch   |  50 ---
 ...libgcc-disable-split-stack-nothreads.patch |  14 -
 .../5.5.0/940-uclinux-enable-threads.patch    |  19 --
 ...41-mips-Add-support-for-mips-r6-musl.patch |  43 ---
 package/gcc/Config.in.host                    |  14 -
 package/gcc/gcc.hash                          |   2 -
 36 files changed, 9 insertions(+), 2551 deletions(-)
 delete mode 100644 package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
 delete mode 100644 package/gcc/5.5.0/0002-libsanitizer-Use-pre-computed-size.patch
 delete mode 100644 package/gcc/5.5.0/100-uclibc-conf.patch
 delete mode 100644 package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
 delete mode 100644 package/gcc/5.5.0/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
 delete mode 100644 package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
 delete mode 100644 package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
 delete mode 100644 package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/5.5.0/860-cilk-wchar.patch
 delete mode 100644 package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
 delete mode 100644 package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
 delete mode 100644 package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
 delete mode 100644 package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
 delete mode 100644 package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
 delete mode 100644 package/gcc/5.5.0/890-fix-m68k-compile.patch
 delete mode 100644 package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/902-unwind-fix-for-musl.patch
 delete mode 100644 package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
 delete mode 100644 package/gcc/5.5.0/904-musl-libc-config.patch
 delete mode 100644 package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
 delete mode 100644 package/gcc/5.5.0/906-mips-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/907-x86-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/908-arm-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/909-aarch64-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
 delete mode 100644 package/gcc/5.5.0/911-ppc-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/912-sh-musl-support.patch
 delete mode 100644 package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
 delete mode 100644 package/gcc/5.5.0/940-uclinux-enable-threads.patch
 delete mode 100644 package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index b925e563d3..77dea41e02 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2020.05"
+
+config BR2_GCC_VERSION_5_X
+	bool "gcc 5.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 5.x has been removed. The current
+	  default version (8.x or later) has been selected instead.
+
 comment "Legacy options removed in 2020.02"
 
 config BR2_PACKAGE_JAMVM
diff --git a/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
deleted file mode 100644
index 75ad536054..0000000000
--- a/package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Backport from upstream, see
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.5.0.orig/gcc/config/m68k/m68k.c gcc-5.5.0/gcc/config/m68k/m68k.c
---- gcc-5.5.0.orig/gcc/config/m68k/m68k.c	2015-01-15 14:28:42.000000000 +0100
-+++ gcc-5.5.0/gcc/config/m68k/m68k.c	2018-02-17 19:34:33.146309632 +0100
-@@ -196,6 +196,8 @@
- 			      const_tree, bool);
- static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
- static bool m68k_output_addr_const_extra (FILE *, rtx);
-+static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
-+						int *, const_tree, int);
- static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
- 
- /* Initialize the GCC target structure.  */
-@@ -338,6 +340,9 @@
- #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
- #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
- 
-+#undef TARGET_PROMOTE_FUNCTION_MODE
-+#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
-+
- static const struct attribute_spec m68k_attribute_table[] =
- {
-   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
-@@ -6548,4 +6553,20 @@
- 	      == m68k_fk_interrupt_handler));
- }
- 
-+/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
-+
-+static machine_mode
-+m68k_promote_function_mode (const_tree type, machine_mode mode,
-+                            int *punsignedp ATTRIBUTE_UNUSED,
-+                            const_tree fntype ATTRIBUTE_UNUSED,
-+                            int for_return)
-+{
-+  /* Promote libcall arguments narrower than int to match the normal C
-+     ABI (for which promotions are handled via
-+     TARGET_PROMOTE_PROTOTYPES).  */
-+  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
-+    return SImode;
-+  return mode;
-+}
-+
- #include "gt-m68k.h"
diff --git a/package/gcc/5.5.0/0002-libsanitizer-Use-pre-computed-size.patch b/package/gcc/5.5.0/0002-libsanitizer-Use-pre-computed-size.patch
deleted file mode 100644
index 6e73331eae..0000000000
--- a/package/gcc/5.5.0/0002-libsanitizer-Use-pre-computed-size.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 61f38c64c01a15560026115a157b7021ec67bd3b Mon Sep 17 00:00:00 2001
-From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 24 May 2018 20:21:54 +0000
-Subject: [PATCH] libsanitizer: Use pre-computed size of struct ustat for Linux
-
-Cherry-pick compiler-rt revision 333213:
-
-<sys/ustat.h> has been removed from glibc 2.28 by:
-
-commit cf2478d53ad7071e84c724a986b56fe17f4f4ca7
-Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date:   Sun Mar 18 11:28:59 2018 +0800
-
-    Deprecate ustat syscall interface
-
-This patch uses pre-computed size of struct ustat for Linux.
-
-	PR sanitizer/85835
-	* sanitizer_common/sanitizer_platform_limits_posix.cc: Don't
-	include <sys/ustat.h> for Linux.
-	(SIZEOF_STRUCT_USTAT): New.
-	(struct_ustat_sz): Use SIZEOF_STRUCT_USTAT for Linux.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 260688 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Downloaded from upstream commit
-https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=61f38c64c01a15560026115a157b7021ec67bd3b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libsanitizer/ChangeLog                                    |  8 ++++++++
- .../sanitizer_common/sanitizer_platform_limits_posix.cc   | 15 +++++++++++++--
- 2 files changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index 31a5e69..8017afd 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -154,7 +154,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <sys/ustat.h>
- #include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
-@@ -247,7 +246,19 @@ namespace __sanitizer {
- #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned struct_ustat_sz = sizeof(struct ustat);
-+  // Use pre-computed size of struct ustat to avoid <sys/ustat.h> which
-+  // has been removed from glibc 2.28.
-+#if defined(__aarch64__) || defined(__s390x__) || defined (__mips64) \
-+  || defined(__powerpc64__) || defined(__arch64__) || defined(__sparcv9) \
-+  || defined(__x86_64__)
-+#define SIZEOF_STRUCT_USTAT 32
-+#elif defined(__arm__) || defined(__i386__) || defined(__mips__) \
-+  || defined(__powerpc__) || defined(__s390__)
-+#define SIZEOF_STRUCT_USTAT 20
-+#else
-+#error Unknown size of struct ustat
-+#endif
-+  unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
-   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
-   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
--- 
-2.9.3
-
diff --git a/package/gcc/5.5.0/100-uclibc-conf.patch b/package/gcc/5.5.0/100-uclibc-conf.patch
deleted file mode 100644
index 73d1f0d3a9..0000000000
--- a/package/gcc/5.5.0/100-uclibc-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: b/contrib/regression/objs-gcc.sh
-===================================================================
---- a/contrib/regression/objs-gcc.sh
-+++ b/contrib/regression/objs-gcc.sh
-@@ -106,6 +106,10 @@
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
diff --git a/package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
deleted file mode 100644
index c11ad35aac..0000000000
--- a/package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Fri, 6 Nov 2015 14:27:23 +0100
-Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
-
-Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
-64-bit binaries by default.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gcc/config.gcc | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 4a7cbd2..9cc765e 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -439,7 +439,7 @@ powerpc*-*-*)
- 	cpu_type=rs6000
- 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
- 	case x$with_cpu in
--	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
-+	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
- 		cpu_is_64bit=yes
- 		;;
- 	esac
--- 
-2.6.2
-
diff --git a/package/gcc/5.5.0/301-missing-execinfo_h.patch b/package/gcc/5.5.0/301-missing-execinfo_h.patch
deleted file mode 100644
index 2d0e7baa44..0000000000
--- a/package/gcc/5.5.0/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: b/boehm-gc/include/gc.h
-===================================================================
---- a/boehm-gc/include/gc.h
-+++ b/boehm-gc/include/gc.h
-@@ -503,7 +503,7 @@
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/5.5.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index 5efa7fd1bc..0000000000
--- a/package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: b/gcc/config/arm/linux-elf.h
-===================================================================
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
-Index: b/libgcc/config/arm/t-linux
-===================================================================
---- a/libgcc/config/arm/t-linux
-+++ b/libgcc/config/arm/t-linux
-@@ -1,6 +1,11 @@
- LIB1ASMSRC = arm/lib1funcs.S
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
-+	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # Just for these, we omit the frame pointer since it makes such a big
- # difference.
diff --git a/package/gcc/5.5.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
deleted file mode 100644
index b730059183..0000000000
--- a/package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
-
-Index: b/gcc/config/arm/linux-eabi.h
-===================================================================
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -45,7 +45,7 @@
-    The ARM10TDMI core is the default for armv5t, so set
-    SUBTARGET_CPU_DEFAULT to achieve this.  */
- #undef  SUBTARGET_CPU_DEFAULT
--#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
-+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
- 
- /* TARGET_BIG_ENDIAN_DEFAULT is set in
-    config.gcc for big endian configurations.  */
diff --git a/package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
deleted file mode 100644
index d8c74f959e..0000000000
--- a/package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 89bd94250827f887b38211ac048b4006229dc9c0 Mon Sep 17 00:00:00 2001
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 26 Aug 2016 10:23:20 +0000
-Subject: [PATCH] [ARM] PR target/70473: Reduce size of Cortex-A8 automaton
-
-	PR target/70473
-	* config/arm/cortex-a8-neon.md (cortex_a8_vfp_muld): Reduce
-	reservation duration to 15 cycles.
-	(cortex_a8_vfp_macs): Likewise.
-	(cortex_a8_vfp_macd): Likewise.
-	(cortex_a8_vfp_divs): Likewise.
-	(cortex_a8_vfp_divd): Likewise.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239772 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Backport from gcc upstream commit 79f5d5e3cd5a668d5ecb2b6b0cce80ef5706ac53.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gcc/config/arm/cortex-a8-neon.md | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config/arm/cortex-a8-neon.md b/gcc/config/arm/cortex-a8-neon.md
-index 04fa01e..4e6d05d 100644
---- a/gcc/config/arm/cortex-a8-neon.md
-+++ b/gcc/config/arm/cortex-a8-neon.md
-@@ -357,30 +357,34 @@
-        (eq_attr "type" "fmuls"))
-   "cortex_a8_vfp,cortex_a8_vfplite*11")
- 
-+;; Don't model a reservation for more than 15 cycles as this explodes the
-+;; state space of the automaton for little gain.  It is unlikely that the
-+;; scheduler will find enough instructions to hide the full latency of the
-+;; instructions.
- (define_insn_reservation "cortex_a8_vfp_muld" 17
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmuld"))
--  "cortex_a8_vfp,cortex_a8_vfplite*16")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_macs" 21
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmacs,ffmas"))
--  "cortex_a8_vfp,cortex_a8_vfplite*20")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_macd" 26
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fmacd,ffmad"))
--  "cortex_a8_vfp,cortex_a8_vfplite*25")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_divs" 37
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fdivs, fsqrts"))
--  "cortex_a8_vfp,cortex_a8_vfplite*36")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- (define_insn_reservation "cortex_a8_vfp_divd" 65
-   (and (eq_attr "tune" "cortexa8")
-        (eq_attr "type" "fdivd, fsqrtd"))
--  "cortex_a8_vfp,cortex_a8_vfplite*64")
-+  "cortex_a8_vfp,cortex_a8_vfplite*15")
- 
- ;; Comparisons can actually take 7 cycles sometimes instead of four,
- ;; but given all the other instructions lumped into type=ffarith that
--- 
-2.7.4
-
diff --git a/package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
deleted file mode 100644
index 9d29090a2a..0000000000
--- a/package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-Fetched from Xilinx gcc git at https://github.com/Xilinx/gcc
-
-From 23c35173490ac2d6348a668dfc9c1a6eb62171f2 Mon Sep 17 00:00:00 2001
-From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
-Date: Mon, 18 Jun 2012 20:18:13 +0200
-Subject: [PATCH] [Patch, microblaze]: Enable DWARF exception handling support.
-
-Changelog
-
-2013-03-18  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
-            David Holsgrove <david.holsgrove@xilinx.com>
-
- * common/config/microblaze/microblaze-common.c: Remove
-   TARGET_EXCEPT_UNWIND_INFO definition.
- * config/microblaze/microblaze-protos.h: Add
-   microblaze_eh_return prototype.
- * gcc/config/microblaze/microblaze.c: (microblaze_must_save_register,
-   microblaze_expand_epilogue, microblaze_return_addr): Handle
-   calls_eh_return
-   (microblaze_eh_return): New function.
- * gcc/config/microblaze/microblaze.h: Define RETURN_ADDR_OFFSET,
-   EH_RETURN_DATA_REGNO, MB_EH_STACKADJ_REGNUM, EH_RETURN_STACKADJ_RTX,
-   ASM_PREFERRED_EH_DATA_FORMAT
- * gcc/config/microblaze/microblaze.md: Define eh_return pattern.
-
-Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
-Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
----
- gcc/common/config/microblaze/microblaze-common.c |  3 ---
- gcc/config/microblaze/microblaze-protos.h        |  1 +
- gcc/config/microblaze/microblaze.c               | 29 ++++++++++++++++++++----
- gcc/config/microblaze/microblaze.h               | 15 ++++++++++++
- gcc/config/microblaze/microblaze.md              | 11 +++++++++
- 5 files changed, 52 insertions(+), 7 deletions(-)
-
-Index: b/gcc/common/config/microblaze/microblaze-common.c
-===================================================================
---- a/gcc/common/config/microblaze/microblaze-common.c
-+++ b/gcc/common/config/microblaze/microblaze-common.c
-@@ -37,7 +37,4 @@
- #undef  TARGET_OPTION_OPTIMIZATION_TABLE
- #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
- 
--#undef TARGET_EXCEPT_UNWIND_INFO
--#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
--
- struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
-Index: b/gcc/config/microblaze/microblaze-protos.h
-===================================================================
---- a/gcc/config/microblaze/microblaze-protos.h
-+++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -56,6 +56,7 @@
- extern int symbol_mentioned_p (rtx);
- extern int label_mentioned_p (rtx);
- extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
-+extern void microblaze_eh_return (rtx op0);
- #endif  /* RTX_CODE */
- 
- /* Declare functions in microblaze-c.c.  */
-Index: b/gcc/config/microblaze/microblaze.c
-===================================================================
---- a/gcc/config/microblaze/microblaze.c
-+++ b/gcc/config/microblaze/microblaze.c
-@@ -1959,6 +1959,11 @@
-   if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
-     return 1;
- 
-+  if (crtl->calls_eh_return
-+      && regno == MB_ABI_SUB_RETURN_ADDR_REGNUM) {
-+    return 1;
-+  }
-+
-   if (!crtl->is_leaf)
-     {
-       if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
-@@ -1986,6 +1991,13 @@
- 	return 1;
-     }
- 
-+  if (crtl->calls_eh_return
-+      && (regno == EH_RETURN_DATA_REGNO (0)
-+          || regno == EH_RETURN_DATA_REGNO (1)))
-+    {
-+      return 1;
-+    }
-+
-   return 0;
- }
- 
-@@ -3067,6 +3079,12 @@
-       emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
-     }
- 
-+  if (crtl->calls_eh_return)
-+    emit_insn (gen_addsi3 (stack_pointer_rtx,
-+                           stack_pointer_rtx,
-+                           gen_rtx_raw_REG (SImode,
-+                                            MB_EH_STACKADJ_REGNUM)));
-+
-   emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
- 						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
- }
-@@ -3364,10 +3382,13 @@
-   if (count != 0)
-     return NULL_RTX;
- 
--  return gen_rtx_PLUS (Pmode,
--		       get_hard_reg_initial_val (Pmode,
--						 MB_ABI_SUB_RETURN_ADDR_REGNUM),
--		       GEN_INT (8));
-+  return get_hard_reg_initial_val (Pmode,
-+                                   MB_ABI_SUB_RETURN_ADDR_REGNUM);
-+}
-+
-+void microblaze_eh_return (rtx op0)
-+{
-+  emit_insn (gen_movsi(gen_rtx_MEM(Pmode, stack_pointer_rtx), op0));
- }
- 
- /* Queue an .ident string in the queue of top-level asm statements.
-Index: b/gcc/config/microblaze/microblaze.h
-===================================================================
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -184,6 +184,21 @@
- #define INCOMING_RETURN_ADDR_RTX  			\
-   gen_rtx_REG (VOIDmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
- 
-+/* Specifies the offset from INCOMING_RETURN_ADDR_RTX and the actual return PC.  */
-+#define RETURN_ADDR_OFFSET (8)
-+
-+/* Describe how we implement __builtin_eh_return.  */
-+#define EH_RETURN_DATA_REGNO(N) (((N) < 2) ? MB_ABI_FIRST_ARG_REGNUM + (N) : INVALID_REGNUM)
-+
-+#define MB_EH_STACKADJ_REGNUM  MB_ABI_INT_RETURN_VAL2_REGNUM
-+#define EH_RETURN_STACKADJ_RTX  gen_rtx_REG (Pmode, MB_EH_STACKADJ_REGNUM)
-+
-+/* Select a format to encode pointers in exception handling data.  CODE
-+   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
-+   true if the symbol may be affected by dynamic relocations.  */
-+#define ASM_PREFERRED_EH_DATA_FORMAT(CODE,GLOBAL) \
-+  ((flag_pic || GLOBAL) ? DW_EH_PE_aligned : DW_EH_PE_absptr)
-+
- /* Use DWARF 2 debugging information by default.  */
- #define DWARF2_DEBUGGING_INFO
- #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
-Index: b/gcc/config/microblaze/microblaze.md
-===================================================================
---- a/gcc/config/microblaze/microblaze.md
-+++ b/gcc/config/microblaze/microblaze.md
-@@ -2272,4 +2272,15 @@
-   (set_attr "mode"      "SI")
-   (set_attr "length"    "4")])
- 
-+; This is used in compiling the unwind routines.
-+(define_expand "eh_return"
-+  [(use (match_operand 0 "general_operand" ""))]
-+  ""
-+  "
-+{
-+  microblaze_eh_return(operands[0]);
-+  DONE;
-+}")
-+
- (include "sync.md")
-+
diff --git a/package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
deleted file mode 100644
index 9e97d945d3..0000000000
--- a/package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-Allow C99-depending features of libstdc++ with uClibc
-
-The libstdc++ code is fairly restrictive on how it checks for C99
-compatibility: it requires *complete* C99 support to enable certain
-features. For example, uClibc provides a good number of C99 features,
-but not C99 complex number support. For this reason, libstdc++
-completely disables many the standard C++ methods that can in fact
-work because uClibc provides the necessary functions.
-
-This patch is similar and highly inspired from
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
-a way that doesn't involve changing the configure.ac script, as
-autoreconfiguring gcc is complicated. It simply relies on the fact
-that uClibc defines the __UCLIBC__ definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/generic/c_locale.h
-+++ b/libstdc++-v3/config/locale/generic/c_locale.h
-@@ -70,7 +70,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/gnu/c_locale.h
-+++ b/libstdc++-v3/config/locale/gnu/c_locale.h
-@@ -88,7 +88,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/include/bits/basic_string.h
-===================================================================
---- a/libstdc++-v3/include/bits/basic_string.h
-+++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -5239,7 +5239,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if __cplusplus >= 201103L && defined(_GLIBCXX_USE_C99)
-+#if __cplusplus >= 201103L && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/bits/locale_facets.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets.tcc
-@@ -992,7 +992,7 @@
- 	char __fbuf[16];
- 	__num_base::_S_format_float(__io, __fbuf, __mod);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 	// Precision is always used except for hexfloat format.
- 	const bool __use_prec =
- 	  (__io.flags() & ios_base::floatfield) != ios_base::floatfield;
-Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-@@ -578,7 +578,7 @@
-     {
-       const locale __loc = __io.getloc();
-       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       // First try a buffer perhaps big enough.
-       int __cs_size = 64;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-Index: b/libstdc++-v3/include/c_compatibility/math.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/math.h
-+++ b/libstdc++-v3/include/c_compatibility/math.h
-@@ -56,7 +56,7 @@
- using std::floor;
- using std::fmod;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::fpclassify;
- using std::isfinite;
- using std::isinf;
-Index: b/libstdc++-v3/include/c_compatibility/wchar.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/wchar.h
-+++ b/libstdc++-v3/include/c_compatibility/wchar.h
-@@ -103,7 +103,7 @@
- using std::wmemset;
- using std::wcsftime;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::wcstold;
- using std::wcstoll;
- using std::wcstoull;
-Index: b/libstdc++-v3/include/c_global/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdlib
-+++ b/libstdc++-v3/include/c_global/cstdlib
-@@ -195,7 +195,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_global/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_global/cwchar
-+++ b/libstdc++-v3/include/c_global/cwchar
-@@ -232,7 +232,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-@@ -289,7 +289,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/c_std/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_std/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdlib
-+++ b/libstdc++-v3/include/c_std/cstdlib
-@@ -192,7 +192,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_std/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_std/cwchar
-+++ b/libstdc++-v3/include/c_std/cwchar
-@@ -228,7 +228,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-Index: b/libstdc++-v3/include/ext/vstring.h
-===================================================================
---- a/libstdc++-v3/include/ext/vstring.h
-+++ b/libstdc++-v3/include/ext/vstring.h
-@@ -2680,7 +2680,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/tr1/cstdio
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdio
-+++ b/libstdc++-v3/include/tr1/cstdio
-@@ -33,7 +33,7 @@
- 
- #include <cstdio>
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cstdlib
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdlib
-+++ b/libstdc++-v3/include/tr1/cstdlib
-@@ -35,7 +35,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cwchar
-===================================================================
---- a/libstdc++-v3/include/tr1/cwchar
-+++ b/libstdc++-v3/include/tr1/cwchar
-@@ -52,7 +52,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/tr1/stdlib.h
-===================================================================
---- a/libstdc++-v3/include/tr1/stdlib.h
-+++ b/libstdc++-v3/include/tr1/stdlib.h
-@@ -33,7 +33,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- using std::tr1::atoll;
- using std::tr1::strtoll;
-Index: b/libstdc++-v3/src/c++11/debug.cc
-===================================================================
---- a/libstdc++-v3/src/c++11/debug.cc
-+++ b/libstdc++-v3/src/c++11/debug.cc
-@@ -788,7 +788,7 @@
- 				     int __n __attribute__ ((__unused__)), 
- 				     const char* __fmt, _Tp __s) const throw ()
-     {
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       std::snprintf(__buf, __n, __fmt, __s);
- #else
-       std::sprintf(__buf, __fmt, __s);
-Index: b/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdio
-+++ b/libstdc++-v3/include/c_global/cstdio
-@@ -146,7 +146,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/5.5.0/860-cilk-wchar.patch b/package/gcc/5.5.0/860-cilk-wchar.patch
deleted file mode 100644
index 1d9916f554..0000000000
--- a/package/gcc/5.5.0/860-cilk-wchar.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] cilk: fix build without wchar
-
-When building against uClibc with wchar support disabled, WCHAR_MIN and
-WCHAR_MAX are not defined leading to compilation errors.
-
-Fix it by only including the wchar code if available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Index: b/libcilkrts/include/cilk/reducer_min_max.h
-===================================================================
---- a/libcilkrts/include/cilk/reducer_min_max.h
-+++ b/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3154,7 +3154,9 @@
- CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3306,7 +3308,9 @@
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3432,7 +3436,9 @@
- CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3584,7 +3590,9 @@
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
deleted file mode 100644
index aa1376c44c..0000000000
--- a/package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
+++ /dev/null
@@ -1,290 +0,0 @@
-From 6d852ffb43b111a39162135c95249e749c4e285b Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 6 Aug 2015 01:16:02 +0300
-Subject: [PATCH] xtensa: add -mauto-litpools option
-
-With support from assembler this option allows compiling huge functions,
-where single literal pool at the beginning of a function may not be
-reachable by L32R instructions at its end.
-
-Currently assembler --auto-litpools option cannot deal with literals
-used from multiple locations separated by more than 256 KBytes of code.
-Don't turn constants into literals, instead use MOVI instruction to load
-them into registers and let the assembler turn them into literals as
-necessary.
-
-2015-08-12  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/constraints.md (define_constraint "Y"): New
-	constraint.
-	* config/xtensa/elf.h (ASM_SPEC): Add m(no-)auto-litpools.
-	* config/xtensa/linux.h (ASM_SPEC): Likewise.
-	* config/xtensa/predicates.md (move_operand): Match constants
-	and symbols in the presence of TARGET_AUTO_LITPOOLS.
-	* config/xtensa/xtensa.c (xtensa_valid_move): Don't allow
-	immediate references to TLS data.
-	(xtensa_emit_move_sequence): Don't force constants to memory in
-	the presence of TARGET_AUTO_LITPOOLS.
-	(print_operand): Add 'y' format, same as default, but capable of
-	printing SF mode constants as well.
-	* config/xtensa/xtensa.md (movsi_internal, movhi_internal)
-	(movsf_internal): Add movi pattern that loads literal.
-	(movsf, movdf): Don't force constants to memory in the presence
-	of TARGET_AUTO_LITPOOLS.
-	(movdf_internal): Add 'Y' constraint.
-	* config/xtensa/xtensa.opt (mauto-litpools): New option.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226828
-Changes to ChangeLogs and documentation are dropped.
-
- gcc/config/xtensa/constraints.md |  5 +++++
- gcc/config/xtensa/elf.h          |  4 +++-
- gcc/config/xtensa/linux.h        |  4 +++-
- gcc/config/xtensa/predicates.md  |  3 ++-
- gcc/config/xtensa/xtensa.c       | 19 ++++++++++++++++++-
- gcc/config/xtensa/xtensa.md      | 35 +++++++++++++++++++----------------
- gcc/config/xtensa/xtensa.opt     |  4 ++++
- 7 files changed, 54 insertions(+), 20 deletions(-)
-
-diff --git a/gcc/config/xtensa/constraints.md b/gcc/config/xtensa/constraints.md
-index 30f4c1f..773d4f9 100644
---- a/gcc/config/xtensa/constraints.md
-+++ b/gcc/config/xtensa/constraints.md
-@@ -111,6 +111,11 @@
-  (and (match_code "const_int")
-       (match_test "xtensa_mask_immediate (ival)")))
- 
-+(define_constraint "Y"
-+ "A constant that can be used in relaxed MOVI instructions."
-+ (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
-+      (match_test "TARGET_AUTO_LITPOOLS")))
-+
- ;; Memory constraints.  Do not use define_memory_constraint here.  Doing so
- ;; causes reload to force some constants into the constant pool, but since
- ;; the Xtensa constant pool can only be accessed with L32R instructions, it
-diff --git a/gcc/config/xtensa/elf.h b/gcc/config/xtensa/elf.h
-index e59bede..12056f7 100644
---- a/gcc/config/xtensa/elf.h
-+++ b/gcc/config/xtensa/elf.h
-@@ -48,7 +48,9 @@ along with GCC; see the file COPYING3.  If not see
-   %{mtarget-align:--target-align} \
-   %{mno-target-align:--no-target-align} \
-   %{mlongcalls:--longcalls} \
--  %{mno-longcalls:--no-longcalls}"
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
- 
- #undef LIB_SPEC
- #define LIB_SPEC "-lc -lsim -lc -lhandlers-sim -lhal"
-diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
-index 675aacf..5b0243a 100644
---- a/gcc/config/xtensa/linux.h
-+++ b/gcc/config/xtensa/linux.h
-@@ -42,7 +42,9 @@ along with GCC; see the file COPYING3.  If not see
-   %{mtarget-align:--target-align} \
-   %{mno-target-align:--no-target-align} \
-   %{mlongcalls:--longcalls} \
--  %{mno-longcalls:--no-longcalls}"
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- 
-diff --git a/gcc/config/xtensa/predicates.md b/gcc/config/xtensa/predicates.md
-index e02209e..d7dfa11 100644
---- a/gcc/config/xtensa/predicates.md
-+++ b/gcc/config/xtensa/predicates.md
-@@ -142,7 +142,8 @@
- 	       (match_test "GET_MODE_CLASS (mode) == MODE_INT
- 			    && xtensa_simm12b (INTVAL (op))"))
- 	  (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
--	       (match_test "TARGET_CONST16 && CONSTANT_P (op)
-+	       (match_test "(TARGET_CONST16 || TARGET_AUTO_LITPOOLS)
-+			    && CONSTANT_P (op)
- 			    && GET_MODE_SIZE (mode) % UNITS_PER_WORD == 0")))))
- 
- ;; Accept the floating point constant 1 in the appropriate mode.
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index eb039ba..206ff80 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -501,6 +501,9 @@ xtensa_valid_move (machine_mode mode, rtx *operands)
-     {
-       int dst_regnum = xt_true_regnum (operands[0]);
- 
-+      if (xtensa_tls_referenced_p (operands[1]))
-+	return FALSE;
-+
-       /* The stack pointer can only be assigned with a MOVSP opcode.  */
-       if (dst_regnum == STACK_POINTER_REGNUM)
- 	return !TARGET_WINDOWED_ABI
-@@ -1069,7 +1072,7 @@ xtensa_emit_move_sequence (rtx *operands, machine_mode mode)
- 	  return 1;
- 	}
- 
--      if (! TARGET_CONST16)
-+      if (! TARGET_AUTO_LITPOOLS && ! TARGET_CONST16)
- 	{
- 	  src = force_const_mem (SImode, src);
- 	  operands[1] = src;
-@@ -2449,6 +2452,20 @@ print_operand (FILE *file, rtx x, int letter)
- 	}
-       break;
- 
-+    case 'y':
-+      if (GET_CODE (x) == CONST_DOUBLE &&
-+	  GET_MODE (x) == SFmode)
-+	{
-+	  REAL_VALUE_TYPE r;
-+	  long l;
-+	  REAL_VALUE_FROM_CONST_DOUBLE (r, x);
-+	  REAL_VALUE_TO_TARGET_SINGLE (r, l);
-+	  fprintf (file, "0x%08lx", l);
-+	  break;
-+	}
-+
-+      /* fall through */
-+
-     default:
-       if (GET_CODE (x) == REG || GET_CODE (x) == SUBREG)
- 	fprintf (file, "%s", reg_names[xt_true_regnum (x)]);
-diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
-index 6d84384..0e673a3 100644
---- a/gcc/config/xtensa/xtensa.md
-+++ b/gcc/config/xtensa/xtensa.md
-@@ -761,8 +761,8 @@
- })
- 
- (define_insn "movsi_internal"
--  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,W,a,a,U,*a,*A")
--	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,i,T,U,r,*A,*r"))]
-+  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,a,W,a,a,U,*a,*A")
-+	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,Y,i,T,U,r,*A,*r"))]
-   "xtensa_valid_move (SImode, operands)"
-   "@
-    movi.n\t%0, %x1
-@@ -774,15 +774,16 @@
-    mov\t%0, %1
-    movsp\t%0, %1
-    movi\t%0, %x1
-+   movi\t%0, %1
-    const16\t%0, %t1\;const16\t%0, %b1
-    %v1l32r\t%0, %1
-    %v1l32i\t%0, %1
-    %v0s32i\t%1, %0
-    rsr\t%0, ACCLO
-    wsr\t%1, ACCLO"
--  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,load,load,store,rsr,wsr")
-+  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,move,load,load,store,rsr,wsr")
-    (set_attr "mode"	"SI")
--   (set_attr "length"	"2,2,2,2,2,2,3,3,3,6,3,3,3,3,3")])
-+   (set_attr "length"	"2,2,2,2,2,2,3,3,3,3,6,3,3,3,3,3")])
- 
- ;; 16-bit Integer moves
- 
-@@ -796,21 +797,22 @@
- })
- 
- (define_insn "movhi_internal"
--  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,U,*a,*A")
--	(match_operand:HI 1 "move_operand" "M,d,r,I,U,r,*A,*r"))]
-+  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,a,U,*a,*A")
-+	(match_operand:HI 1 "move_operand" "M,d,r,I,Y,U,r,*A,*r"))]
-   "xtensa_valid_move (HImode, operands)"
-   "@
-    movi.n\t%0, %x1
-    mov.n\t%0, %1
-    mov\t%0, %1
-    movi\t%0, %x1
-+   movi\t%0, %1
-    %v1l16ui\t%0, %1
-    %v0s16i\t%1, %0
-    rsr\t%0, ACCLO
-    wsr\t%1, ACCLO"
--  [(set_attr "type"	"move,move,move,move,load,store,rsr,wsr")
-+  [(set_attr "type"	"move,move,move,move,move,load,store,rsr,wsr")
-    (set_attr "mode"	"HI")
--   (set_attr "length"	"2,2,3,3,3,3,3,3")])
-+   (set_attr "length"	"2,2,3,3,3,3,3,3,3")])
- 
- ;; 8-bit Integer moves
- 
-@@ -881,7 +883,7 @@
- 	(match_operand:SF 1 "general_operand" ""))]
-   ""
- {
--  if (!TARGET_CONST16 && CONSTANT_P (operands[1]))
-+  if (!TARGET_CONST16 && !TARGET_AUTO_LITPOOLS && CONSTANT_P (operands[1]))
-     operands[1] = force_const_mem (SFmode, operands[1]);
- 
-   if ((!register_operand (operands[0], SFmode)
-@@ -896,8 +898,8 @@
- })
- 
- (define_insn "movsf_internal"
--  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,W,a,a,U")
--	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,iF,T,U,r"))]
-+  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,a,W,a,a,U")
-+	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,Y,iF,T,U,r"))]
-   "((register_operand (operands[0], SFmode)
-      || register_operand (operands[1], SFmode))
-     && !(FP_REG_P (xt_true_regnum (operands[0]))
-@@ -912,13 +914,14 @@
-    mov\t%0, %1
-    wfr\t%0, %1
-    rfr\t%0, %1
-+   movi\t%0, %y1
-    const16\t%0, %t1\;const16\t%0, %b1
-    %v1l32r\t%0, %1
-    %v1l32i\t%0, %1
-    %v0s32i\t%1, %0"
--  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,load,load,store")
-+  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,move,load,load,store")
-    (set_attr "mode"	"SF")
--   (set_attr "length"	"3,3,3,2,2,2,3,3,3,6,3,3,3")])
-+   (set_attr "length"	"3,3,3,2,2,2,3,3,3,3,6,3,3,3")])
- 
- (define_insn "*lsiu"
-   [(set (match_operand:SF 0 "register_operand" "=f")
-@@ -991,7 +994,7 @@
- 	(match_operand:DF 1 "general_operand" ""))]
-   ""
- {
--  if (CONSTANT_P (operands[1]) && !TARGET_CONST16)
-+  if (CONSTANT_P (operands[1]) && !TARGET_CONST16 && !TARGET_AUTO_LITPOOLS)
-     operands[1] = force_const_mem (DFmode, operands[1]);
- 
-   if (!register_operand (operands[0], DFmode)
-@@ -1002,8 +1005,8 @@
- })
- 
- (define_insn_and_split "movdf_internal"
--  [(set (match_operand:DF 0 "nonimmed_operand" "=a,W,a,a,U")
--	(match_operand:DF 1 "move_operand" "r,iF,T,U,r"))]
-+  [(set (match_operand:DF 0 "nonimmed_operand" "=a,a,W,a,a,U")
-+	(match_operand:DF 1 "move_operand" "r,Y,iF,T,U,r"))]
-   "register_operand (operands[0], DFmode)
-    || register_operand (operands[1], DFmode)"
-   "#"
-diff --git a/gcc/config/xtensa/xtensa.opt b/gcc/config/xtensa/xtensa.opt
-index 2fd6cee..21c6e96 100644
---- a/gcc/config/xtensa/xtensa.opt
-+++ b/gcc/config/xtensa/xtensa.opt
-@@ -38,6 +38,10 @@ mtext-section-literals
- Target
- Intersperse literal pools with code in the text section
- 
-+mauto-litpools
-+Target Report Mask(AUTO_LITPOOLS)
-+Relax literals in assembler and place them automatically in the text section
-+
- mserialize-volatile
- Target Report Mask(SERIALIZE_VOLATILE)
- -mno-serialize-volatile	Do not serialize volatile memory references with MEMW instructions
--- 
-1.8.1.4
-
diff --git a/package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
deleted file mode 100644
index 4056f8b8ed..0000000000
--- a/package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 40507bf199440082ed69b777986d50c31efe2520 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 10 Aug 2015 21:35:20 +0300
-Subject: [PATCH 1/3] xtensa: reimplement register spilling
-
-Spilling windowed registers in userspace is much easier, more portable,
-less error-prone and equally effective as in kernel. Now that register
-spilling syscall is considered obsolete in the xtensa linux kernel
-replace it with CALL12 followed by series of ENTRY in libgcc.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
-	CALL12 followed by series of ENTRY to spill windowed registers.
-	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
-	instead of making linux spill syscall.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226962
-
- libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
- 1 file changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
-index 4d451c8..ef0703f 100644
---- a/libgcc/config/xtensa/lib2funcs.S
-+++ b/libgcc/config/xtensa/lib2funcs.S
-@@ -34,10 +34,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 	.global	__xtensa_libgcc_window_spill
- 	.type	__xtensa_libgcc_window_spill, at function
- __xtensa_libgcc_window_spill:
--	entry	sp, 32
--	movi	a2, 0
--	syscall
-+	entry	sp, 48
-+#if XCHAL_NUM_AREGS > 16
-+	call12	1f
-+	retw
-+	.align	4
-+1:
-+	.rept	(XCHAL_NUM_AREGS - 24) / 12
-+	_entry	sp, 48
-+	mov	a12, a0
-+	.endr
-+	_entry	sp, 16
-+#if XCHAL_NUM_AREGS % 12 == 0
-+	mov	a4, a4
-+#elif XCHAL_NUM_AREGS % 12 == 4
-+	mov	a8, a8
-+#elif XCHAL_NUM_AREGS % 12 == 8
-+	mov	a12, a12
-+#endif
- 	retw
-+#else
-+	mov	a8, a8
-+	retw
-+#endif
- 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
- #endif
- 
-@@ -61,10 +80,7 @@ __xtensa_nonlocal_goto:
- 	entry	sp, 32
- 
- 	/* Flush registers.  */
--	mov	a5, a2
--	movi	a2, 0
--	syscall
--	mov	a2, a5
-+	call8	__xtensa_libgcc_window_spill
- 
- 	/* Because the save area for a0-a3 is stored one frame below
- 	   the one identified by a2, the only way to restore those
--- 
-1.8.1.4
-
diff --git a/package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch b/package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
deleted file mode 100644
index 23db3d863c..0000000000
--- a/package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 70c2cb98fb129b4766b5da0f945dc41fd568c77a Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sat, 22 Aug 2015 08:44:26 +0300
-Subject: [PATCH] xtensa: add uclinux support
-
-2015-10-03  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config.gcc (xtensa*-*-uclinux*): New configuration.
-	* config/xtensa/uclinux.h: New file.
-	* config/xtensa/uclinux.opt: New file.
-
-libgcc/
-	* config.host (xtensa*-*-uclinux*): New configuration.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r228450
-
- gcc/config.gcc                |  5 ++++
- gcc/config/xtensa/uclinux.h   | 69 +++++++++++++++++++++++++++++++++++++++++++
- gcc/config/xtensa/uclinux.opt | 32 ++++++++++++++++++++
- libgcc/config.host            |  5 ++++
- 4 files changed, 111 insertions(+)
- create mode 100644 gcc/config/xtensa/uclinux.h
- create mode 100644 gcc/config/xtensa/uclinux.opt
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index c52f5a8..56797bd 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2995,6 +2995,11 @@ xtensa*-*-linux*)
- 	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h xtensa/linux.h"
- 	tmake_file="${tmake_file} xtensa/t-xtensa"
- 	;;
-+xtensa*-*-uclinux*)
-+	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h xtensa/uclinux.h"
-+	tmake_file="${tmake_file} xtensa/t-xtensa"
-+	extra_options="${extra_options} xtensa/uclinux.opt"
-+	;;
- am33_2.0-*-linux*)
- 	tm_file="mn10300/mn10300.h dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h mn10300/linux.h"
- 	gas=yes gnu_ld=yes
-diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
-new file mode 100644
-index 0000000..4606020
---- /dev/null
-+++ b/gcc/config/xtensa/uclinux.h
-@@ -0,0 +1,69 @@
-+/* Xtensa uClinux configuration.
-+   Derived from the configuration for GCC for Intel i386 running Linux.
-+   Copyright (C) 2001-2015 Free Software Foundation, Inc.
-+
-+This file is part of GCC.
-+
-+GCC is free software; you can redistribute it and/or modify it under
-+the terms of the GNU General Public License as published by the Free
-+Software Foundation; either version 3, or (at your option) any later
-+version.
-+
-+GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-+WARRANTY; without even the implied warranty of MERCHANTABILITY or
-+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-+for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with GCC; see the file COPYING3.  If not see
-+<http://www.gnu.org/licenses/>.  */
-+
-+#undef TARGET_OS_CPP_BUILTINS
-+#define TARGET_OS_CPP_BUILTINS()				\
-+  do								\
-+    {								\
-+      GNU_USER_TARGET_OS_CPP_BUILTINS ();			\
-+      builtin_define ("__uClinux__");				\
-+    }								\
-+  while (0)
-+
-+#undef SUBTARGET_CPP_SPEC
-+#define SUBTARGET_CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
-+
-+#undef SIZE_TYPE
-+#define SIZE_TYPE "unsigned int"
-+
-+#undef PTRDIFF_TYPE
-+#define PTRDIFF_TYPE "int"
-+
-+#undef WCHAR_TYPE
-+#define WCHAR_TYPE "long int"
-+
-+#undef WCHAR_TYPE_SIZE
-+#define WCHAR_TYPE_SIZE 32
-+
-+#undef ASM_SPEC
-+#define ASM_SPEC \
-+ "%{mtext-section-literals:--text-section-literals} \
-+  %{mno-text-section-literals:--no-text-section-literals} \
-+  %{mtarget-align:--target-align} \
-+  %{mno-target-align:--no-target-align} \
-+  %{mlongcalls:--longcalls} \
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
-+
-+#undef LINK_SPEC
-+#define LINK_SPEC "%{!no-elf2flt:%{!elf2flt*:-elf2flt}}"
-+
-+#undef LOCAL_LABEL_PREFIX
-+#define LOCAL_LABEL_PREFIX	"."
-+
-+/* Always enable "-fpic" for Xtensa Linux.  */
-+#define XTENSA_ALWAYS_PIC 1
-+
-+#undef TARGET_LIBC_HAS_FUNCTION
-+#define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
-+
-+#undef DBX_REGISTER_NUMBER
-+
-diff --git a/gcc/config/xtensa/uclinux.opt b/gcc/config/xtensa/uclinux.opt
-new file mode 100644
-index 0000000..95ef777
---- /dev/null
-+++ b/gcc/config/xtensa/uclinux.opt
-@@ -0,0 +1,32 @@
-+; Xtensa uClinux options.
-+
-+; Copyright (C) 2015 Free Software Foundation, Inc.
-+;
-+; This file is part of GCC.
-+;
-+; GCC is free software; you can redistribute it and/or modify it under
-+; the terms of the GNU General Public License as published by the Free
-+; Software Foundation; either version 3, or (at your option) any later
-+; version.
-+;
-+; GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-+; WARRANTY; without even the implied warranty of MERCHANTABILITY or
-+; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-+; for more details.
-+;
-+; You should have received a copy of the GNU General Public License
-+; along with GCC; see the file COPYING3.  If not see
-+; <http://www.gnu.org/licenses/>.
-+
-+; See the GCC internals manual (options.texi) for a description of
-+; this file's format.
-+
-+; Please try to keep this file in ASCII collating order.
-+
-+elf2flt
-+Driver
-+
-+elf2flt=
-+Driver JoinedOrMissing
-+
-+; This comment is to ensure we retain the blank line above.
-diff --git a/libgcc/config.host b/libgcc/config.host
-index 2c64756..2ee92c1 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1295,6 +1295,11 @@ xtensa*-*-linux*)
- 	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
- 	md_unwind_header=xtensa/linux-unwind.h
- 	;;
-+xtensa*-*-uclinux*)
-+	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
-+	md_unwind_header=xtensa/linux-unwind.h
-+	extra_parts="$extra_parts crtbeginS.o crtbeginT.o crtendS.o"
-+	;;
- am33_2.0-*-linux*)
- 	# Don't need crtbeginT.o from *-*-linux* default.
- 	extra_parts="crtbegin.o crtend.o crtbeginS.o crtendS.o"
--- 
-1.8.1.4
-
diff --git a/package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch b/package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
deleted file mode 100644
index 870b079e38..0000000000
--- a/package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 2b4b5775554c91a63ccae4ee566db696b633652e Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 10 Jun 2015 15:07:40 +0000
-Subject: [PATCH] xtensa: implement trap pattern
-
-2015-06-10  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa.h (TARGET_DEBUG): New definition.
-	* config/xtensa/xtensa.md (define_attr "type"): New type "trap".
-	(define_insn "trap"): New definition.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 224330 138bc75d-0d04-0410-961f-82ee72b054a4
----
- gcc/config/xtensa/xtensa.h  |  1 +
- gcc/config/xtensa/xtensa.md | 15 ++++++++++++++-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/xtensa/xtensa.h b/gcc/config/xtensa/xtensa.h
-index 615f741..fb8702c 100644
---- a/gcc/config/xtensa/xtensa.h
-+++ b/gcc/config/xtensa/xtensa.h
-@@ -67,6 +67,7 @@ extern unsigned xtensa_current_frame_size;
- #define TARGET_THREADPTR	XCHAL_HAVE_THREADPTR
- #define TARGET_LOOPS	        XCHAL_HAVE_LOOPS
- #define TARGET_WINDOWED_ABI	(XSHAL_ABI == XTHAL_ABI_WINDOWED)
-+#define TARGET_DEBUG		XCHAL_HAVE_DEBUG
- 
- #define TARGET_DEFAULT \
-   ((XCHAL_HAVE_L32R	? 0 : MASK_CONST16) |				\
-diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
-index 6d84384..a577aa3 100644
---- a/gcc/config/xtensa/xtensa.md
-+++ b/gcc/config/xtensa/xtensa.md
-@@ -86,7 +86,7 @@
- ;; Attributes.
- 
- (define_attr "type"
--  "unknown,jump,call,load,store,move,arith,multi,nop,farith,fmadd,fconv,fload,fstore,mul16,mul32,div32,mac16,rsr,wsr,entry"
-+  "unknown,jump,call,load,store,move,arith,multi,nop,farith,fmadd,fconv,fload,fstore,mul16,mul32,div32,mac16,rsr,wsr,entry,trap"
-   (const_string "unknown"))
- 
- (define_attr "mode"
-@@ -1764,6 +1764,19 @@
-   [(set_attr "length" "0")
-    (set_attr "type" "nop")])
- 
-+(define_insn "trap"
-+  [(trap_if (const_int 1) (const_int 0))]
-+  ""
-+{
-+  if (TARGET_DEBUG)
-+    return "break\t1, 15";
-+  else
-+    return (TARGET_DENSITY ? "ill.n" : "ill");
-+}
-+  [(set_attr "type"	"trap")
-+   (set_attr "mode"	"none")
-+   (set_attr "length"	"3")])
-+
- ;; Setting up a frame pointer is tricky for Xtensa because GCC doesn't
- ;; know if a frame pointer is required until the reload pass, and
- ;; because there may be an incoming argument value in the hard frame
--- 
-2.1.4
-
diff --git a/package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch b/package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
deleted file mode 100644
index 7a8c843e55..0000000000
--- a/package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 920a898d2a04933c13eb808a513bc5822e91f70a Mon Sep 17 00:00:00 2001
-From: sandra <sandra@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 12 May 2015 15:57:22 +0000
-Subject: [PATCH] gcc/nios2: Add IJMP_REGS enum
-
-2015-05-12  Chung-Lin Tang  <cltang@codesourcery.com>
-	    Sandra Loosemore <sandra@codesourcery.com>
-
-	gcc/
-	* config/nios2/nios2.h (enum reg_class): Add IJMP_REGS enum
-	value.
-	(REG_CLASS_NAMES): Add "IJMP_REGS".
-	(REG_CLASS_CONTENTS): Add new entry for IJMP_REGS.
-	* config/nios2/nios2.md (indirect_jump,*tablejump): Adjust to
-	use new "c" register constraint.
-	* config/nios2/constraint.md (c): New register constraint
-	corresponding to IJMP_REGS.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223082 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Romain: rebase on gcc 5.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/nios2/constraints.md |  3 +++
- gcc/config/nios2/nios2.h        | 11 +++++++----
- gcc/config/nios2/nios2.md       |  4 ++--
- 3 files changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/nios2/constraints.md b/gcc/config/nios2/constraints.md
-index f4bd9f7..735f892 100644
---- a/gcc/config/nios2/constraints.md
-+++ b/gcc/config/nios2/constraints.md
-@@ -39,6 +39,9 @@
- 
- ;; Register constraints
- 
-+(define_register_constraint "c" "IJMP_REGS"
-+  "A register suitable for an indirect jump.")
-+
- (define_register_constraint "j" "SIB_REGS"
-   "A register suitable for an indirect sibcall.")
- 
-diff --git a/gcc/config/nios2/nios2.h b/gcc/config/nios2/nios2.h
-index 117983d..7c329ae 100644
---- a/gcc/config/nios2/nios2.h
-+++ b/gcc/config/nios2/nios2.h
-@@ -173,6 +173,7 @@ enum reg_class
- {
-   NO_REGS,
-   SIB_REGS,
-+  IJMP_REGS,
-   GP_REGS,
-   ALL_REGS,
-   LIM_REG_CLASSES
-@@ -183,6 +184,7 @@ enum reg_class
- #define REG_CLASS_NAMES   \
-   {  "NO_REGS",		  \
-      "SIB_REGS",	  \
-+     "IJMP_REGS",	  \
-      "GP_REGS",           \
-      "ALL_REGS" }
- 
-@@ -190,10 +192,11 @@ enum reg_class
- 
- #define REG_CLASS_CONTENTS			\
-   {						\
--    /* NO_REGS  */ { 0, 0},			\
--    /* SIB_REGS */ { 0xfe0c, 0},		\
--    /* GP_REGS  */ {~0, 0},			\
--    /* ALL_REGS */ {~0,~0}			\
-+    /* NO_REGS    */ { 0, 0},			\
-+    /* SIB_REGS   */ { 0xfe0c, 0},		\
-+    /* IJMP_REGS  */ { 0x7fffffff, 0},		\
-+    /* GP_REGS    */ {~0, 0},			\
-+    /* ALL_REGS   */ {~0,~0}			\
-   }
- 
- 
-diff --git a/gcc/config/nios2/nios2.md b/gcc/config/nios2/nios2.md
-index 7b35d269..36ef101 100644
---- a/gcc/config/nios2/nios2.md
-+++ b/gcc/config/nios2/nios2.md
-@@ -697,7 +697,7 @@
- ; check or adjust for overflow.
- 
- (define_insn "indirect_jump"
--  [(set (pc) (match_operand:SI 0 "register_operand" "r"))]
-+  [(set (pc) (match_operand:SI 0 "register_operand" "c"))]
-   ""
-   "jmp\\t%0"
-   [(set_attr "type" "control")])
-@@ -811,7 +811,7 @@
- 
- (define_insn "*tablejump"
-   [(set (pc)
--        (match_operand:SI 0 "register_operand" "r"))
-+        (match_operand:SI 0 "register_operand" "c"))
-    (use (label_ref (match_operand 1 "" "")))]
-   ""
-   "jmp\\t%0"
--- 
-2.5.5
-
diff --git a/package/gcc/5.5.0/890-fix-m68k-compile.patch b/package/gcc/5.5.0/890-fix-m68k-compile.patch
deleted file mode 100644
index 6e63de0cd1..0000000000
--- a/package/gcc/5.5.0/890-fix-m68k-compile.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-remove unused header, which breaks the toolchain building
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c gcc-5.3.0/libgcc/config/m68k/linux-atomic.c
---- gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c	2015-01-05 13:33:28.000000000 +0100
-+++ gcc-5.3.0/libgcc/config/m68k/linux-atomic.c	2016-03-19 09:25:07.000000000 +0100
-@@ -33,7 +33,6 @@
-    using the kernel helper defined below.  There is no support for
-    64-bit operations yet.  */
- 
--#include <asm/unistd.h>
- #include <stdbool.h>
- 
- #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
deleted file mode 100644
index fdf4ee724d..0000000000
--- a/package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 22 Apr 2015 14:11:25 +0000 (+0000)
-Subject: libitm fixes for musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=e53a4d49c3d03ab8eaddb073cf972c1c46d75338
-
-libitm fixes for musl support
-
-On behalf of Szabolcs.Nagy at arm.com
-
-2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
-
-       * config/arm/hwcap.cc: Use fcntl.h instead of sys/fcntl.h.
-       * config/linux/x86/tls.h: Only use __GLIBC_PREREQ if defined.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222325 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/libitm/config/arm/hwcap.cc
-===================================================================
---- a/libitm/config/arm/hwcap.cc
-+++ b/libitm/config/arm/hwcap.cc
-@@ -40,7 +40,7 @@
- 
- #ifdef __linux__
- #include <unistd.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <elf.h>
- 
- static void __attribute__((constructor))
-Index: b/libitm/config/linux/x86/tls.h
-===================================================================
---- a/libitm/config/linux/x86/tls.h
-+++ b/libitm/config/linux/x86/tls.h
-@@ -25,16 +25,19 @@
- #ifndef LIBITM_X86_TLS_H
- #define LIBITM_X86_TLS_H 1
- 
--#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
-+#if defined(__GLIBC_PREREQ)
-+#if __GLIBC_PREREQ(2, 10)
- /* Use slots in the TCB head rather than __thread lookups.
-    GLIBC has reserved words 10 through 13 for TM.  */
- #define HAVE_ARCH_GTM_THREAD 1
- #define HAVE_ARCH_GTM_THREAD_DISP 1
- #endif
-+#endif
- 
- #include "config/generic/tls.h"
- 
--#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
-+#if defined(__GLIBC_PREREQ)
-+#if __GLIBC_PREREQ(2, 10)
- namespace GTM HIDDEN {
- 
- #ifdef __x86_64__
-@@ -101,5 +104,6 @@
- 
- } // namespace GTM
- #endif /* >= GLIBC 2.10 */
-+#endif
- 
- #endif // LIBITM_X86_TLS_H
diff --git a/package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
deleted file mode 100644
index 13c08d6b96..0000000000
--- a/package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 22 Apr 2015 14:18:16 +0000 (+0000)
-Subject: fixincludes update for musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=2dc727de2e87c2756a514cbb43cea23c99deaa3d
-
-fixincludes update for musl support
-
-On behalf of Szabolcs.Nagy at arm.com
-
-2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
-
-	* mkfixinc.sh: Add *-musl* with no fixes.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222327 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/fixincludes/mkfixinc.sh
-===================================================================
---- a/fixincludes/mkfixinc.sh
-+++ b/fixincludes/mkfixinc.sh
-@@ -19,7 +19,8 @@
-     powerpc-*-eabi*    | \
-     powerpc-*-rtems*   | \
-     powerpcle-*-eabisim* | \
--    powerpcle-*-eabi* )
-+    powerpcle-*-eabi* | \
-+    *-musl* )
- 	#  IF there is no include fixing,
- 	#  THEN create a no-op fixer and exit
- 	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
diff --git a/package/gcc/5.5.0/902-unwind-fix-for-musl.patch b/package/gcc/5.5.0/902-unwind-fix-for-musl.patch
deleted file mode 100644
index ef470540d9..0000000000
--- a/package/gcc/5.5.0/902-unwind-fix-for-musl.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 22 Apr 2015 14:20:01 +0000 (+0000)
-Subject: unwind fix for musl
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=a2e31d0681d8a47389b8a3552622fbd9827bcef4
-
-unwind fix for musl
-
-On behalf of szabolcs.nagy at arm.com
-
-2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
-	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* unwind-dw2-fde-dip.c (USE_PT_GNU_EH_FRAME): Define it on
-	Linux if target provides dl_iterate_phdr.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222328 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/libgcc/unwind-dw2-fde-dip.c
-===================================================================
---- a/libgcc/unwind-dw2-fde-dip.c
-+++ b/libgcc/unwind-dw2-fde-dip.c
-@@ -59,6 +59,12 @@
- 
- #if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
-     && defined(TARGET_DL_ITERATE_PHDR) \
-+    && defined(__linux__)
-+# define USE_PT_GNU_EH_FRAME
-+#endif
-+
-+#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
-+    && defined(TARGET_DL_ITERATE_PHDR) \
-     && (defined(__DragonFly__) || defined(__FreeBSD__))
- # define ElfW __ElfN
- # define USE_PT_GNU_EH_FRAME
diff --git a/package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
deleted file mode 100644
index c852131258..0000000000
--- a/package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 22 Apr 2015 14:24:11 +0000 (+0000)
-Subject: libstdc++, libgfortran gthr workaround for musl
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=1e5f711c11cb80ce609db9e9c1d8b2da0f7b5b61
-
-libstdc++, libgfortran gthr workaround for musl
-
-On behalf of szabolcs.nagy at arm.com
-
-[libstdc++-v3/]
-2015-04-22  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/os/generic/os_defines.h (_GLIBCXX_GTHREAD_USE_WEAK): Define.
-	* configure.host (os_include_dir): Set to "os/generic" for linux-musl*.
-
-[libgfortran/]
-2015-04-22  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* acinclude.m4 (GTHREAD_USE_WEAK): Define as 0 for *-*-musl*.
-	* configure: Regenerate.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222329 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/libgfortran/acinclude.m4
-===================================================================
---- a/libgfortran/acinclude.m4
-+++ b/libgfortran/acinclude.m4
-@@ -100,7 +100,7 @@
- 	      [Define to 1 if the target supports #pragma weak])
-   fi
-   case "$host" in
--    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
-+    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
-       AC_DEFINE(GTHREAD_USE_WEAK, 0,
- 		[Define to 0 if the target shouldn't use #pragma weak])
-       ;;
-Index: b/libgfortran/configure
-===================================================================
---- a/libgfortran/configure
-+++ b/libgfortran/configure
-@@ -26447,7 +26447,7 @@
- 
-   fi
-   case "$host" in
--    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* )
-+    *-*-darwin* | *-*-hpux* | *-*-cygwin* | *-*-mingw* | *-*-musl* )
- 
- $as_echo "#define GTHREAD_USE_WEAK 0" >>confdefs.h
- 
-Index: b/libstdc++-v3/config/os/generic/os_defines.h
-===================================================================
---- a/libstdc++-v3/config/os/generic/os_defines.h
-+++ b/libstdc++-v3/config/os/generic/os_defines.h
-@@ -33,4 +33,9 @@
- // System-specific #define, typedefs, corrections, etc, go here.  This
- // file will come before all others.
- 
-+// Disable the weak reference logic in gthr.h for os/generic because it
-+// is broken on every platform unless there is implementation specific
-+// workaround in gthr-posix.h and at link-time for static linking.
-+#define _GLIBCXX_GTHREAD_USE_WEAK 0
-+
- #endif
-Index: b/libstdc++-v3/configure.host
-===================================================================
---- a/libstdc++-v3/configure.host
-+++ b/libstdc++-v3/configure.host
-@@ -271,6 +271,9 @@
-   freebsd*)
-     os_include_dir="os/bsd/freebsd"
-     ;;
-+  linux-musl*)
-+    os_include_dir="os/generic"
-+    ;;
-   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
-     if [ "$uclibc" = "yes" ]; then
-       os_include_dir="os/uclibc"
diff --git a/package/gcc/5.5.0/904-musl-libc-config.patch b/package/gcc/5.5.0/904-musl-libc-config.patch
deleted file mode 100644
index 85491406cf..0000000000
--- a/package/gcc/5.5.0/904-musl-libc-config.patch
+++ /dev/null
@@ -1,285 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 8 May 2015 08:25:47 +0000 (+0000)
-Subject: [PATCH 2/13] musl libc config
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=a9173ceabaf29c16f8ef226fbf98af373a4b2ceb
-
-[PATCH 2/13] musl libc config
-
-2015-05-08  Gregor Richards  <gregor.richards@uwaterloo.ca>
-	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config.gcc (LIBC_MUSL): New tm_defines macro.
-	* config/linux.h (OPTION_MUSL): Define.
-	(MUSL_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER32,)
-	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERX32,)
-	(INCLUDE_DEFAULTS_MUSL_GPP, INCLUDE_DEFAULTS_MUSL_LOCAL,)
-	(INCLUDE_DEFAULTS_MUSL_PREFIX, INCLUDE_DEFAULTS_MUSL_CROSS,)
-	(INCLUDE_DEFAULTS_MUSL_TOOL, INCLUDE_DEFAULTS_MUSL_NATIVE): Define.
-	* config/linux.opt (mmusl): New option.
-	* doc/invoke.texi (GNU/Linux Options): Document -mmusl.
-	* configure.ac (gcc_cv_libc_provides_ssp): Add *-*-musl*.
-	(gcc_cv_target_dl_iterate_phdr): Add *-linux-musl*.
-	* configure: Regenerate.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222904 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -575,7 +575,7 @@
- esac
- 
- # Common C libraries.
--tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
-+tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
- 
- # 32-bit x86 processors supported by --with-arch=.  Each processor
- # MUST be separated by exactly one space.
-@@ -720,6 +720,9 @@
-     *-*-*uclibc*)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
-       ;;
-+    *-*-*musl*)
-+      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
-+      ;;
-     *)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
-       ;;
-Index: b/gcc/config/linux.h
-===================================================================
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -32,10 +32,12 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
- #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
-@@ -50,21 +52,25 @@
-     } while (0)
- 
- /* Determine which dynamic linker to use depending on whether GLIBC or
--   uClibc or Bionic is the default C library and whether
--   -muclibc or -mglibc or -mbionic has been passed to change the default.  */
-+   uClibc or Bionic or musl is the default C library and whether
-+   -muclibc or -mglibc or -mbionic or -mmusl has been passed to change
-+   the default.  */
- 
--#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
--  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
-+#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD3, LD4)	\
-+  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
- 
- #if DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U, B, M)
- #elif DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G, B, M)
- #elif DEFAULT_LIBC == LIBC_BIONIC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G, U, M)
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G, U, B)
- #else
- #error "Unsupported DEFAULT_LIBC"
- #endif /* DEFAULT_LIBC */
-@@ -81,24 +87,100 @@
- #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
- #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
- #define BIONIC_DYNAMIC_LINKERX32 "/system/bin/linkerx32"
-+/* Should be redefined for each target that supports musl.  */
-+#define MUSL_DYNAMIC_LINKER "/dev/null"
-+#define MUSL_DYNAMIC_LINKER32 "/dev/null"
-+#define MUSL_DYNAMIC_LINKER64 "/dev/null"
-+#define MUSL_DYNAMIC_LINKERX32 "/dev/null"
- 
- #define GNU_USER_DYNAMIC_LINKER						\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
--			 BIONIC_DYNAMIC_LINKER)
-+			 BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
- #define GNU_USER_DYNAMIC_LINKER32					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
--			 BIONIC_DYNAMIC_LINKER32)
-+			 BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
- #define GNU_USER_DYNAMIC_LINKER64					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
--			 BIONIC_DYNAMIC_LINKER64)
-+			 BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
- #define GNU_USER_DYNAMIC_LINKERX32					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKERX32, \
--			 BIONIC_DYNAMIC_LINKERX32)
-+			 BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKERX32)
- 
- /* Whether we have Bionic libc runtime */
- #undef TARGET_HAS_BIONIC
- #define TARGET_HAS_BIONIC (OPTION_BIONIC)
- 
-+/* musl avoids problematic includes by rearranging the include directories.
-+ * Unfortunately, this is mostly duplicated from cppdefault.c */
-+#if DEFAULT_LIBC == LIBC_MUSL
-+#define INCLUDE_DEFAULTS_MUSL_GPP			\
-+    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
-+    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
-+
-+#ifdef LOCAL_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_LOCAL			\
-+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
-+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_LOCAL
-+#endif
-+
-+#ifdef PREFIX_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_PREFIX			\
-+    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_PREFIX
-+#endif
-+
-+#ifdef CROSS_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_CROSS			\
-+    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_CROSS
-+#endif
-+
-+#ifdef TOOL_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_TOOL			\
-+    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_TOOL
-+#endif
-+
-+#ifdef NATIVE_SYSTEM_HEADER_DIR
-+#define INCLUDE_DEFAULTS_MUSL_NATIVE			\
-+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_NATIVE
-+#endif
-+
-+#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT)
-+# undef INCLUDE_DEFAULTS_MUSL_LOCAL
-+# define INCLUDE_DEFAULTS_MUSL_LOCAL
-+# undef INCLUDE_DEFAULTS_MUSL_NATIVE
-+# define INCLUDE_DEFAULTS_MUSL_NATIVE
-+#else
-+# undef INCLUDE_DEFAULTS_MUSL_CROSS
-+# define INCLUDE_DEFAULTS_MUSL_CROSS
-+#endif
-+
-+#undef INCLUDE_DEFAULTS
-+#define INCLUDE_DEFAULTS				\
-+  {							\
-+    INCLUDE_DEFAULTS_MUSL_GPP				\
-+    INCLUDE_DEFAULTS_MUSL_PREFIX			\
-+    INCLUDE_DEFAULTS_MUSL_CROSS				\
-+    INCLUDE_DEFAULTS_MUSL_TOOL				\
-+    INCLUDE_DEFAULTS_MUSL_NATIVE			\
-+    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-+    { 0, 0, 0, 0, 0, 0 }				\
-+  }
-+#endif
-+
- #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
- /* This is a *uclinux* target.  We don't define below macros to normal linux
-    versions, because doing so would require *uclinux* targets to include
-Index: b/gcc/config/linux.opt
-===================================================================
---- a/gcc/config/linux.opt
-+++ b/gcc/config/linux.opt
-@@ -28,5 +28,9 @@
- Use GNU C library
- 
- muclibc
--Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
-+Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mmusl)
- Use uClibc C library
-+
-+mmusl
-+Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mbionic)
-+Use musl C library
-Index: b/gcc/configure
-===================================================================
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -27809,6 +27813,9 @@
-       gcc_cv_target_dl_iterate_phdr=no
-     fi
-     ;;
-+  *-linux-musl*)
-+    gcc_cv_target_dl_iterate_phdr=yes
-+    ;;
- esac
- 
- if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/configure.ac
-===================================================================
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -5298,6 +5302,9 @@
-       gcc_cv_target_dl_iterate_phdr=no
-     fi
-     ;;
-+  *-linux-musl*)
-+    gcc_cv_target_dl_iterate_phdr=yes
-+    ;;
- esac
- GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
- if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/doc/invoke.texi
-===================================================================
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -667,7 +667,7 @@
- -mcpu=@var{cpu}}
- 
- @emph{GNU/Linux Options}
-- at gccoptlist{-mglibc -muclibc -mbionic -mandroid @gol
-+ at gccoptlist{-mglibc -muclibc -mmusl -mbionic -mandroid @gol
- -tno-android-cc -tno-android-ld}
- 
- @emph{H8/300 Options}
-@@ -15324,13 +15324,19 @@
- @item -mglibc
- @opindex mglibc
- Use the GNU C library.  This is the default except
--on @samp{*-*-linux-*uclibc*} and @samp{*-*-linux-*android*} targets.
-+on @samp{*-*-linux-*uclibc*}, @samp{*-*-linux-*musl*} and
-+ at samp{*-*-linux-*android*} targets.
- 
- @item -muclibc
- @opindex muclibc
- Use uClibc C library.  This is the default on
- @samp{*-*-linux-*uclibc*} targets.
- 
-+ at item -mmusl
-+ at opindex mmusl
-+Use the musl C library.  This is the default on
-+ at samp{*-*-linux-*musl*} targets.
-+
- @item -mbionic
- @opindex mbionic
- Use Bionic C library.  This is the default on
diff --git a/package/gcc/5.5.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
deleted file mode 100644
index 92e743685b..0000000000
--- a/package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 8 May 2015 08:30:40 +0000 (+0000)
-Subject: [PATCH 0/13] Add musl support to GCC
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=f2d678afa5b8385d763b93772d73d6bf80a9739e
-
-[PATCH 0/13] Add musl support to GCC
-
-2015-05-08  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/glibc-stdint.h (OPTION_MUSL): Define.
-	(INT_FAST16_TYPE, INT_FAST32_TYPE, UINT_FAST16_TYPE, UINT_FAST32_TYPE):
-	Change the definition based on OPTION_MUSL for 64 bit targets.
-	* config/linux.h (OPTION_MUSL): Redefine.
-	* config/alpha/linux.h (OPTION_MUSL): Redefine.
-	* config/rs6000/linux.h (OPTION_MUSL): Redefine.
-	* config/rs6000/linux64.h (OPTION_MUSL): Redefine.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222905 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config/alpha/linux.h
-===================================================================
---- a/gcc/config/alpha/linux.h
-+++ b/gcc/config/alpha/linux.h
-@@ -61,10 +61,14 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
- /* Determine what functions are present at the runtime;
-Index: b/gcc/config/glibc-stdint.h
-===================================================================
---- a/gcc/config/glibc-stdint.h
-+++ b/gcc/config/glibc-stdint.h
-@@ -22,6 +22,12 @@
- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- <http://www.gnu.org/licenses/>.  */
- 
-+/* Systems using musl libc should use this header and make sure
-+   OPTION_MUSL is defined correctly before using the TYPE macros. */
-+#ifndef OPTION_MUSL
-+#define OPTION_MUSL 0
-+#endif
-+
- #define SIG_ATOMIC_TYPE "int"
- 
- #define INT8_TYPE "signed char"
-@@ -43,12 +49,12 @@
- #define UINT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
- 
- #define INT_FAST8_TYPE "signed char"
--#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
--#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
-+#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
-+#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
- #define INT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
- #define UINT_FAST8_TYPE "unsigned char"
--#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
--#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
-+#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
-+#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
- #define UINT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
- 
- #define INTPTR_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
-Index: b/gcc/config/linux.h
-===================================================================
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -32,11 +32,13 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#undef OPTION_MUSL
- #define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#undef OPTION_MUSL
- #define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
-Index: b/gcc/config/rs6000/linux.h
-===================================================================
---- a/gcc/config/rs6000/linux.h
-+++ b/gcc/config/rs6000/linux.h
-@@ -30,10 +30,14 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
- /* Determine what functions are present at the runtime;
-Index: b/gcc/config/rs6000/linux64.h
-===================================================================
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -299,10 +299,14 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#undef OPTION_MUSL
-+#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
- /* Determine what functions are present at the runtime;
diff --git a/package/gcc/5.5.0/906-mips-musl-support.patch b/package/gcc/5.5.0/906-mips-musl-support.patch
deleted file mode 100644
index 6b473f9898..0000000000
--- a/package/gcc/5.5.0/906-mips-musl-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 8 May 2015 15:16:50 +0000 (+0000)
-Subject: [PATCH 6/13] mips musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=2550b6a866c887472b587bef87d433c51cf1ebc8
-
-[PATCH 6/13] mips musl support
-
-2015-05-08  Gregor Richards  <gregor.richards@uwaterloo.ca>
-	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Define.
-	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Define.
-	(GNU_USER_DYNAMIC_LINKERN32): Update.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 222915 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config/mips/linux.h
-===================================================================
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -37,7 +37,13 @@
- #define UCLIBC_DYNAMIC_LINKERN32 \
-   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
- 
-+#undef MUSL_DYNAMIC_LINKER32
-+#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
-+#undef MUSL_DYNAMIC_LINKER64
-+#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
-+
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
--                         BIONIC_DYNAMIC_LINKERN32)
-+                         BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKERN32)
diff --git a/package/gcc/5.5.0/907-x86-musl-support.patch b/package/gcc/5.5.0/907-x86-musl-support.patch
deleted file mode 100644
index 3f2fe5df77..0000000000
--- a/package/gcc/5.5.0/907-x86-musl-support.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 15 May 2015 13:20:01 +0000 (+0000)
-Subject: [PATCH 9/13] x86 musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=5551c8d927c17f60837f15f8dfe46f945ba3fa9c
-
-[PATCH 9/13] x86 musl support
-
-On behalf of Szabolcs Nagy.
-
-2015-05-15  Gregor Richards  <gregor.richards@uwaterloo.ca>
-
-	* config/i386/linux.h (MUSL_DYNAMIC_LINKER): Define.
-	* config/i386/linux64.h (MUSL_DYNAMIC_LINKER32): Define.
-	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERX32): Define.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223218 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config/i386/linux.h
-===================================================================
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -21,3 +21,6 @@
- 
- #define GNU_USER_LINK_EMULATION "elf_i386"
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-Index: b/gcc/config/i386/linux64.h
-===================================================================
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -30,3 +30,10 @@
- #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
- #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
- #define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
-+
-+#undef MUSL_DYNAMIC_LINKER32
-+#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-+#undef MUSL_DYNAMIC_LINKER64
-+#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
-+#undef MUSL_DYNAMIC_LINKERX32
-+#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
diff --git a/package/gcc/5.5.0/908-arm-musl-support.patch b/package/gcc/5.5.0/908-arm-musl-support.patch
deleted file mode 100644
index 906355a79a..0000000000
--- a/package/gcc/5.5.0/908-arm-musl-support.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 27 May 2015 13:17:11 +0000 (+0000)
-Subject: [PATCH 4/13] arm musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=de799bd087ab9a179768fea75bd195a31d3432a4
-
-[PATCH 4/13] arm musl support
-
-On behalf of szabolcs.nagy at arm.com
-
-2015-05-27  Gregor Richards  <gregor.richards@uwaterloo.ca>
-
-	* config/arm/linux-eabi.h (MUSL_DYNAMIC_LINKER): Define.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223749 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config/arm/linux-eabi.h
-===================================================================
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -77,6 +77,23 @@
-     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
-     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
- 
-+/* For ARM musl currently supports four dynamic linkers:
-+   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
-+   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
-+   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
-+   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
-+   musl does not support the legacy OABI mode.
-+   All the dynamic linkers live in /lib.
-+   We default to soft-float, EL. */
-+#undef  MUSL_DYNAMIC_LINKER
-+#if TARGET_BIG_ENDIAN_DEFAULT
-+#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
-+#endif
-+#define MUSL_DYNAMIC_LINKER \
-+  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
-+
- /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
-    use the GNU/Linux version, not the generic BPABI version.  */
- #undef  LINK_SPEC
diff --git a/package/gcc/5.5.0/909-aarch64-musl-support.patch b/package/gcc/5.5.0/909-aarch64-musl-support.patch
deleted file mode 100644
index 3d032f51bc..0000000000
--- a/package/gcc/5.5.0/909-aarch64-musl-support.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From: jgreenhalgh <jgreenhalgh@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 27 May 2015 16:46:39 +0000 (+0000)
-Subject: [PATCH 3/13] aarch64 musl support
-X-Git-Url: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;h=b3ff21cf0531be91bc3fb8200296a7633090ec78
-
-[PATCH 3/13] aarch64 musl support
-
-gcc/Changelog:
-
-2015-05-27  Gregor Richards  <gregor.richards@uwaterloo.ca>
-	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/aarch64/aarch64-linux.h (MUSL_DYNAMIC_LINKER): Define.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223766 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-Index: b/gcc/config/aarch64/aarch64-linux.h
-===================================================================
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -23,6 +23,9 @@
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
- 
diff --git a/package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch b/package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
deleted file mode 100644
index 6fe4993406..0000000000
--- a/package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add dynamic linker support for uClibc-ng/musl
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
-
-
-diff -Nur gcc-5.4.0.orig/gcc/config/microblaze/linux.h gcc-5.4.0/gcc/config/microblaze/linux.h
---- gcc-5.4.0.orig/gcc/config/microblaze/linux.h	2015-05-28 16:08:19.000000000 +0200
-+++ gcc-5.4.0/gcc/config/microblaze/linux.h	2016-10-23 17:09:46.962010871 +0200
-@@ -28,7 +28,26 @@
- #undef TLS_NEEDS_GOT
- #define TLS_NEEDS_GOT 1
- 
--#define DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER	"/lib/ld.so.1"
-+#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+
-+#if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
-+#define MUSL_DYNAMIC_LINKER_E "%{EB:;:el}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
-+#endif
-+
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
-+
-+#if DEFAULT_LIBC == LIBC_UCLIBC
-+#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define DYNAMIC_LINKER MUSL_DYNAMIC_LINKER
-+#else
-+#define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-+#endif
-+
- #undef  SUBTARGET_EXTRA_SPECS
- #define SUBTARGET_EXTRA_SPECS \
-   { "dynamic_linker", DYNAMIC_LINKER }
diff --git a/package/gcc/5.5.0/911-ppc-musl-support.patch b/package/gcc/5.5.0/911-ppc-musl-support.patch
deleted file mode 100644
index f4905a4232..0000000000
--- a/package/gcc/5.5.0/911-ppc-musl-support.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Add support for musl on ppc32
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.4.0.orig/gcc/config/rs6000/sysv4.h gcc-5.4.0/gcc/config/rs6000/sysv4.h
---- gcc-5.4.0.orig/gcc/config/rs6000/sysv4.h	2015-09-24 15:46:45.000000000 +0200
-+++ gcc-5.4.0/gcc/config/rs6000/sysv4.h	2016-11-27 13:12:33.226953738 +0100
-@@ -537,6 +537,9 @@
- #ifndef CC1_SECURE_PLT_DEFAULT_SPEC
- #define CC1_SECURE_PLT_DEFAULT_SPEC ""
- #endif
-+#ifndef LINK_SECURE_PLT_DEFAULT_SPEC
-+#define LINK_SECURE_PLT_DEFAULT_SPEC ""
-+#endif
- 
- /* Pass -G xxx to the compiler.  */
- #undef CC1_SPEC
-@@ -757,17 +760,23 @@
- 
- #define LINK_START_LINUX_SPEC ""
- 
-+#define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
-+
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+#define MUSL_DYNAMIC_LINKER \
-+  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
- #if DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
- #elif !defined (DEFAULT_LIBC) || DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
- #else
- #error "Unsupported DEFAULT_LIBC"
- #endif
- #define GNU_USER_DYNAMIC_LINKER \
--  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
-+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
- 
- #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
-   %{rdynamic:-export-dynamic} \
-@@ -889,6 +898,7 @@
-   { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
-   { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
-   { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
-+  { "link_secure_plt_default",	LINK_SECURE_PLT_DEFAULT_SPEC },		\
-   { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
-   { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
-   { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
-diff -Nur gcc-5.4.0.orig/gcc/config/rs6000/sysv4le.h gcc-5.4.0/gcc/config/rs6000/sysv4le.h
---- gcc-5.4.0.orig/gcc/config/rs6000/sysv4le.h	2015-09-24 15:46:45.000000000 +0200
-+++ gcc-5.4.0/gcc/config/rs6000/sysv4le.h	2016-11-27 13:12:33.226953738 +0100
-@@ -31,3 +31,5 @@
- /* Little-endian PowerPC64 Linux uses the ELF v2 ABI by default.  */
- #define LINUX64_DEFAULT_ABI_ELFv2
- 
-+#undef MUSL_DYNAMIC_LINKER_E
-+#define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","le")
-diff -Nur gcc-5.4.0.orig/gcc/config.gcc gcc-5.4.0/gcc/config.gcc
---- gcc-5.4.0.orig/gcc/config.gcc	2015-09-10 16:17:53.000000000 +0200
-+++ gcc-5.4.0/gcc/config.gcc	2016-11-27 13:14:17.149638148 +0100
-@@ -2413,6 +2413,10 @@
- 	    powerpc*-*-linux*paired*)
- 		tm_file="${tm_file} rs6000/750cl.h" ;;
- 	esac
-+	case ${target} in
-+	    powerpc*-*-linux*-musl*)
-+		enable_secureplt=yes ;;
-+	esac
- 	if test x${enable_secureplt} = xyes; then
- 		tm_file="rs6000/secureplt.h ${tm_file}"
- 	fi
diff --git a/package/gcc/5.5.0/912-sh-musl-support.patch b/package/gcc/5.5.0/912-sh-musl-support.patch
deleted file mode 100644
index 6fdfacc6ed..0000000000
--- a/package/gcc/5.5.0/912-sh-musl-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 6e9cad5fc3bdd0a1fa24ae172d4d4c1e3179a51c Mon Sep 17 00:00:00 2001
-From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 20 Oct 2015 18:13:15 +0000
-Subject: [PATCH] musl support for sh
-
-	* config/sh/linux.h (MUSL_DYNAMIC_LINKER): Define.
-	(MUSL_DYNAMIC_LINKER_E, MUSL_DYNAMIC_LINKER_FP): Define.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 229095 138bc75d-0d04-0410-961f-82ee72b054a4
-[Thomas: backport from gcc 6.x]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gcc/config/sh/linux.h | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 0f5d614..61cf777 100644
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -43,6 +43,27 @@ along with GCC; see the file COPYING3.  If not see
- 
- #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
- 
-+#if TARGET_ENDIAN_DEFAULT == MASK_LITTLE_ENDIAN
-+#define MUSL_DYNAMIC_LINKER_E "%{mb:eb}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{!ml:eb}"
-+#endif
-+
-+#if TARGET_CPU_DEFAULT & (MASK_HARD_SH2A_DOUBLE | MASK_SH4)
-+/* "-nofpu" if any nofpu option is specified.  */
-+#define MUSL_DYNAMIC_LINKER_FP \
-+  "%{m1|m2|m2a-nofpu|m3|m4-nofpu|m4-100-nofpu|m4-200-nofpu|m4-300-nofpu|" \
-+  "m4-340|m4-400|m4-500|m4al:-nofpu}"
-+#else
-+/* "-nofpu" if none of the hard fpu options are specified.  */
-+#define MUSL_DYNAMIC_LINKER_FP "%{m2a|m4|m4-100|m4-200|m4-300|m4a:;:-nofpu}"
-+#endif
-+
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER \
-+  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
-+  "%{mfdpic:-fdpic}.so.1"
-+
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
- #undef SUBTARGET_LINK_EMUL_SUFFIX
--- 
-2.7.4
-
diff --git a/package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
deleted file mode 100644
index 07f9a7395b..0000000000
--- a/package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.3.0.orig/libgcc/config/t-stack gcc-5.3.0/libgcc/config/t-stack
---- gcc-5.3.0.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
-+++ gcc-5.3.0/libgcc/config/t-stack	2016-03-07 03:25:32.000000000 +0100
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
diff --git a/package/gcc/5.5.0/940-uclinux-enable-threads.patch b/package/gcc/5.5.0/940-uclinux-enable-threads.patch
deleted file mode 100644
index 490a55b45d..0000000000
--- a/package/gcc/5.5.0/940-uclinux-enable-threads.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enable POSIX threads for uClinux targets
-Reported upstream:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-5.4.0.orig/gcc/config.gcc gcc-5.4.0/gcc/config.gcc
---- gcc-5.4.0.orig/gcc/config.gcc	2015-09-10 16:17:53.000000000 +0200
-+++ gcc-5.4.0/gcc/config.gcc	2016-07-01 21:26:02.772958441 +0200
-@@ -808,6 +808,9 @@
- *-*-uclinux*)
-   extra_options="$extra_options gnu-user.opt"
-   use_gcc_stdint=wrap
-+  case ${enable_threads} in
-+    "" | yes | posix) thread_file='posix' ;;
-+  esac
-   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
-   ;;
- *-*-rdos*)
diff --git a/package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch
deleted file mode 100644
index 337d376b75..0000000000
--- a/package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 83717065090bb8b954556d1216dd9dc397dc0243 Mon Sep 17 00:00:00 2001
-From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Aug 2016 14:13:02 +0000
-Subject: [PATCH] [mips] Add support for mips*r6-*-musl
-
-gcc/
-	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Update.
-	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Update.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239760 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Vincent: tweak to not patch ChangeLog]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- gcc/config/mips/linux.h | 9 ++++++---
- 1 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index fa253b6..dc51c45 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -38,10 +38,13 @@ along with GCC; see the file COPYING3.  If not see
-   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
- 
- #undef MUSL_DYNAMIC_LINKER32
--#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKER32 \
-+  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
- #undef MUSL_DYNAMIC_LINKER64
--#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
--#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKER64 \
-+  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+#define MUSL_DYNAMIC_LINKERN32 \
-+  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
- 
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
--- 
-2.10.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 243310f61e..034dfb5463 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -20,19 +20,6 @@ config BR2_GCC_VERSION_CSKY
 	depends on BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-config BR2_GCC_VERSION_5_X
-	bool "gcc 5.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-	# Broken or unsupported architectures
-	depends on !BR2_arc
-	depends on !BR2_or1k
-	# musl on ppc64 and mips64 unsupported
-	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-	# glibc >= 2.30 needs gcc >= 6.2 on all architectures.
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
 config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
@@ -85,7 +72,6 @@ config BR2_GCC_SUPPORTS_DLANG
 
 config BR2_GCC_VERSION
 	string
-	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index d9df3408d4..321b3767ab 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,5 +1,3 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
-sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.5.0/sha512.sum
 sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa18b1555dbfcd3f55ae582b91a286ccef496b9b65c1579902f96a1f60  gcc-7.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
-- 
2.25.1
