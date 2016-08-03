From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Aug 2016 23:48:24 +0200
Subject: [Buildroot] [PATCH] gcc: bump 4.9 series to 4.9.4
Message-ID: <1470260904-27174-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two patches are removed, as they have been upstreamed:

 - 130-fix_build_with_gcc-6.patch (svn commit 233721, Git commit
   8c3fa311caa86f61b4e28d1563d1110b44340fb2)

 - 920-libgcc-remove-unistd-header.patch (svn commit 226092, Git commit
   e940d7953f06af11d09229a29ecbcc1ba25b378d)

All other patches have simply been refreshed, with no manual edit
needed.

A build+runtime test has been done with an ARM, Cortex-A8, EABIhf, musl
configuration, booted under Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.9.3/130-fix_build_with_gcc-6.patch   | 153 ---------------------
 .../4.9.3/920-libgcc-remove-unistd-header.patch    |  12 --
 package/gcc/{4.9.3 => 4.9.4}/100-uclibc-conf.patch |   0
 ...00-powerpc-link-with-math-lib.patch.conditional |  28 ++--
 package/gcc/{4.9.3 => 4.9.4}/111-pr65730.patch     |   9 +-
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  11 +-
 package/gcc/{4.9.3 => 4.9.4}/130-pr43538.patch     |   0
 ...tizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch |   0
 .../{4.9.3 => 4.9.4}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |  14 +-
 .../{4.9.3 => 4.9.4}/830-arm_unbreak_armv4t.patch  |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |  39 +++---
 .../850-libstdcxx-uclibc-c99.patch                 | 135 ++++++++++--------
 package/gcc/{4.9.3 => 4.9.4}/860-cilk-wchar.patch  |   0
 .../870-xtensa-add-mauto-litpools-option.patch     |  61 ++++----
 .../871-xtensa-reimplement-register-spilling.patch |   0
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |   0
 .../873-xtensa-fix-_Unwind_GetCFA.patch            |   0
 .../874-xtensa-add-uclinux-support.patch           |  25 ++--
 .../880-nios2_legitimize_address.patch             |   0
 .../{4.9.3 => 4.9.4}/890-fix-m68k-compile.patch    |   0
 .../{4.9.3 => 4.9.4}/891-fix-m68k-uclinux.patch    |   0
 .../gcc/{4.9.3 => 4.9.4}/900-musl-support.patch    |  14 +-
 .../{4.9.3 => 4.9.4}/901-microblaze-uclibc.patch   |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 .../940-uclinux-enable-threads.patch               |   9 +-
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 28 files changed, 177 insertions(+), 339 deletions(-)
 delete mode 100644 package/gcc/4.9.3/130-fix_build_with_gcc-6.patch
 delete mode 100644 package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch
 rename package/gcc/{4.9.3 => 4.9.4}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/1000-powerpc-link-with-math-lib.patch.conditional (84%)
 rename package/gcc/{4.9.3 => 4.9.4}/111-pr65730.patch (85%)
 rename package/gcc/{4.9.3 => 4.9.4}/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch (87%)
 rename package/gcc/{4.9.3 => 4.9.4}/130-pr43538.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/810-arm-softfloat-libgcc.patch (67%)
 rename package/gcc/{4.9.3 => 4.9.4}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/840-microblaze-enable-dwarf-eh-support.patch (81%)
 rename package/gcc/{4.9.3 => 4.9.4}/850-libstdcxx-uclibc-c99.patch (48%)
 rename package/gcc/{4.9.3 => 4.9.4}/860-cilk-wchar.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/870-xtensa-add-mauto-litpools-option.patch (87%)
 rename package/gcc/{4.9.3 => 4.9.4}/871-xtensa-reimplement-register-spilling.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/873-xtensa-fix-_Unwind_GetCFA.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/874-xtensa-add-uclinux-support.patch (91%)
 rename package/gcc/{4.9.3 => 4.9.4}/880-nios2_legitimize_address.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/890-fix-m68k-compile.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/900-musl-support.patch (99%)
 rename package/gcc/{4.9.3 => 4.9.4}/901-microblaze-uclibc.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/930-libgcc-disable-split-stack-nothreads.patch (100%)
 rename package/gcc/{4.9.3 => 4.9.4}/940-uclinux-enable-threads.patch (65%)

diff --git a/package/gcc/4.9.3/130-fix_build_with_gcc-6.patch b/package/gcc/4.9.3/130-fix_build_with_gcc-6.patch
deleted file mode 100644
index 62ac3cb..0000000
--- a/package/gcc/4.9.3/130-fix_build_with_gcc-6.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 2001
-From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Feb 2016 15:33:50 +0000
-Subject: [PATCH 1/1] 2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        Backported from mainline
-        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
-                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        * Make-lang.in: Invoke gperf with -L C++.
-        * cfns.gperf: Remove prototypes for hash and libc_name_p
-        inlines.
-        * cfns.h: Regenerated.
-        * except.c (nothrow_libfn_p): Adjust.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 233720 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- gcc/cp/Make-lang.in |    2 +-
- gcc/cp/cfns.gperf   |   10 ++--------
- gcc/cp/cfns.h       |   41 ++++++++++++++---------------------------
- gcc/cp/except.c     |    3 ++-
- 5 files changed, 31 insertions(+), 37 deletions(-)
-
-diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
-index e98beb1..b09fb02 100644
---- a/gcc/cp/Make-lang.in
-+++ b/gcc/cp/Make-lang.in
-@@ -111,7 +111,7 @@ else
- # deleting the $(srcdir)/cp/cfns.h file.
- $(srcdir)/cp/cfns.h:
- endif
--	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
-+	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
- 		$(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
- 
- #
-diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
-index 68acd3d..214ecf6 100644
---- a/gcc/cp/cfns.gperf
-+++ b/gcc/cp/cfns.gperf
-@@ -1,3 +1,5 @@
-+%language=C++
-+%define class-name libc_name
- %{
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -16,14 +18,6 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- %}
- %%
- # The standard C library functions, for feeding to gperf; the result is used
-diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
-index 1c6665d..596f413 100644
---- a/gcc/cp/cfns.h
-+++ b/gcc/cp/cfns.h
-@@ -1,5 +1,5 @@
--/* ANSI-C code produced by gperf version 3.0.3 */
--/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
-+/* C++ code produced by gperf version 3.0.4 */
-+/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
- 
- #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-@@ -28,7 +28,7 @@
- #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
- #endif
- 
--#line 1 "cfns.gperf"
-+#line 3 "cfns.gperf"
- 
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -47,25 +47,18 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- /* maximum key range = 391, duplicates = 0 */
- 
--#ifdef __GNUC__
--__inline
--#else
--#ifdef __cplusplus
--inline
--#endif
--#endif
--static unsigned int
--hash (register const char *str, register unsigned int len)
-+class libc_name
-+{
-+private:
-+  static inline unsigned int hash (const char *str, unsigned int len);
-+public:
-+  static const char *libc_name_p (const char *str, unsigned int len);
-+};
-+
-+inline unsigned int
-+libc_name::hash (register const char *str, register unsigned int len)
- {
-   static const unsigned short asso_values[] =
-     {
-@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
-   return hval + asso_values[(unsigned char)str[len - 1]];
- }
- 
--#ifdef __GNUC__
--__inline
--#ifdef __GNUC_STDC_INLINE__
--__attribute__ ((__gnu_inline__))
--#endif
--#endif
- const char *
--libc_name_p (register const char *str, register unsigned int len)
-+libc_name::libc_name_p (register const char *str, register unsigned int len)
- {
-   enum
-     {
-diff --git a/gcc/cp/except.c b/gcc/cp/except.c
-index 3ff1ce6..2f2e396 100644
---- a/gcc/cp/except.c
-+++ b/gcc/cp/except.c
-@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
-      unless the system headers are playing rename tricks, and if
-      they are, we don't want to be confused by them.  */
-   id = DECL_NAME (fn);
--  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
-+  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
-+				   IDENTIFIER_LENGTH (id));
- }
- 
- /* Returns nonzero if an exception of type FROM will be caught by a
--- 
-1.7.1
diff --git a/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch b/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch
deleted file mode 100644
index df5372b..0000000
--- a/package/gcc/4.9.3/920-libgcc-remove-unistd-header.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream status: In progress
-
---- a/libgcc/config/nios2/linux-atomic.c
-+++ b/libgcc/config/nios2/linux-atomic.c
-@@ -20,7 +20,6 @@
- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- <http://www.gnu.org/licenses/>.  */
- 
--#include <asm/unistd.h>
- #define EFAULT  14
- #define EBUSY   16
- #define ENOSYS  38
diff --git a/package/gcc/4.9.3/100-uclibc-conf.patch b/package/gcc/4.9.4/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.9.3/100-uclibc-conf.patch
rename to package/gcc/4.9.4/100-uclibc-conf.patch
diff --git a/package/gcc/4.9.3/1000-powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 84%
rename from package/gcc/4.9.3/1000-powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
index b7094fe..5e0484f 100644
--- a/package/gcc/4.9.3/1000-powerpc-link-with-math-lib.patch.conditional
+++ b/package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
@@ -14,19 +14,19 @@ Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
  libgcc/configure.ac |   21 +++++++++++++++++++++
  3 files changed, 56 insertions(+), 1 deletion(-)
 
-Index: gcc-4.8.0/libgcc/Makefile.in
+Index: b/libgcc/Makefile.in
 ===================================================================
---- gcc-4.8.0.orig/libgcc/Makefile.in	2013-02-04 20:06:20.000000000 +0100
-+++ gcc-4.8.0/libgcc/Makefile.in	2013-03-24 09:12:43.000000000 +0100
-@@ -41,6 +41,7 @@
- decimal_float = @decimal_float@
+--- a/libgcc/Makefile.in
++++ b/libgcc/Makefile.in
+@@ -42,6 +42,7 @@
+ enable_vtable_verify = @enable_vtable_verify@
  enable_decimal_float = @enable_decimal_float@
  fixed_point = @fixed_point@
 +LIBGCC_LIBM = @LIBGCC_LIBM@
  
  host_noncanonical = @host_noncanonical@
  target_noncanonical = @target_noncanonical@
-@@ -927,9 +928,10 @@
+@@ -943,9 +944,10 @@
  		@multilib_dir@,$(MULTIDIR),$(subst \
  		@shlib_objs@,$(objects) libgcc.a,$(subst \
  		@shlib_base_name@,libgcc_s,$(subst \
@@ -38,10 +38,10 @@ Index: gcc-4.8.0/libgcc/Makefile.in
  
  libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
  	# @multilib_flags@ is still needed because this may use
-Index: gcc-4.8.0/libgcc/configure
+Index: b/libgcc/configure
 ===================================================================
---- gcc-4.8.0.orig/libgcc/configure	2012-11-05 00:08:42.000000000 +0100
-+++ gcc-4.8.0/libgcc/configure	2013-03-24 09:12:43.000000000 +0100
+--- a/libgcc/configure
++++ b/libgcc/configure
 @@ -564,6 +564,7 @@
  tmake_file
  sfp_machine_header
@@ -50,7 +50,7 @@ Index: gcc-4.8.0/libgcc/configure
  set_have_cc_tls
  vis_hide
  fixed_point
-@@ -4481,6 +4482,37 @@
+@@ -4535,6 +4536,37 @@
  	fi
  fi
  
@@ -88,11 +88,11 @@ Index: gcc-4.8.0/libgcc/configure
  
  # Conditionalize the makefile for this target machine.
  tmake_file_=
-Index: gcc-4.8.0/libgcc/configure.ac
+Index: b/libgcc/configure.ac
 ===================================================================
---- gcc-4.8.0.orig/libgcc/configure.ac	2012-10-15 15:10:30.000000000 +0200
-+++ gcc-4.8.0/libgcc/configure.ac	2013-03-24 09:12:43.000000000 +0100
-@@ -326,6 +326,27 @@
+--- a/libgcc/configure.ac
++++ b/libgcc/configure.ac
+@@ -357,6 +357,27 @@
  fi
  AC_SUBST(set_have_cc_tls)
  
diff --git a/package/gcc/4.9.3/111-pr65730.patch b/package/gcc/4.9.4/111-pr65730.patch
similarity index 85%
rename from package/gcc/4.9.3/111-pr65730.patch
rename to package/gcc/4.9.4/111-pr65730.patch
index f195e30..8a41fd2 100644
--- a/package/gcc/4.9.3/111-pr65730.patch
+++ b/package/gcc/4.9.4/111-pr65730.patch
@@ -16,11 +16,11 @@ Changes to ChangeLog are dropped.
  gcc/config/xtensa/xtensa.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index eb039ba..7296e36 100644
+Index: b/gcc/config/xtensa/xtensa.c
+===================================================================
 --- a/gcc/config/xtensa/xtensa.c
 +++ b/gcc/config/xtensa/xtensa.c
-@@ -1461,8 +1461,9 @@ init_alignment_context (struct alignment_context *ac, rtx mem)
+@@ -1436,8 +1436,9 @@
    if (ac->shift != NULL_RTX)
      {
        /* Shift is the byte count, but we need the bitcount.  */
@@ -32,6 +32,3 @@ index eb039ba..7296e36 100644
  				       NULL_RTX, 1, OPTAB_DIRECT);
        ac->modemask = expand_simple_binop (SImode, ASHIFT,
  					  GEN_INT (GET_MODE_MASK (mode)),
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
similarity index 87%
rename from package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
rename to package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
index c11ad35..bb77c4b 100644
--- a/package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
+++ b/package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
@@ -11,19 +11,16 @@ Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  gcc/config.gcc | 2 +-
  2 files changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 4a7cbd2..9cc765e 100644
+Index: b/gcc/config.gcc
+===================================================================
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -439,7 +439,7 @@ powerpc*-*-*)
- 	cpu_type=rs6000
+@@ -441,7 +441,7 @@
  	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
+ 	need_64bit_hwint=yes
  	case x$with_cpu in
 -	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
 +	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
  		cpu_is_64bit=yes
  		;;
  	esac
--- 
-2.6.2
-
diff --git a/package/gcc/4.9.3/130-pr43538.patch b/package/gcc/4.9.4/130-pr43538.patch
similarity index 100%
rename from package/gcc/4.9.3/130-pr43538.patch
rename to package/gcc/4.9.4/130-pr43538.patch
diff --git a/package/gcc/4.9.3/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch b/package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
similarity index 100%
rename from package/gcc/4.9.3/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
rename to package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
diff --git a/package/gcc/4.9.3/301-missing-execinfo_h.patch b/package/gcc/4.9.4/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.9.3/301-missing-execinfo_h.patch
rename to package/gcc/4.9.4/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.9.3/810-arm-softfloat-libgcc.patch b/package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
similarity index 67%
rename from package/gcc/4.9.3/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
index c8cb377..5efa7fd 100644
--- a/package/gcc/4.9.3/810-arm-softfloat-libgcc.patch
+++ b/package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
@@ -1,8 +1,8 @@
-Index: gcc-4.8.0/gcc/config/arm/linux-elf.h
+Index: b/gcc/config/arm/linux-elf.h
 ===================================================================
---- gcc-4.8.0.orig/gcc/config/arm/linux-elf.h	2013-01-10 21:38:27.000000000 +0100
-+++ gcc-4.8.0/gcc/config/arm/linux-elf.h	2013-03-23 17:40:00.000000000 +0100
-@@ -55,7 +55,7 @@
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
     %{shared:-lc} \
     %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
  
@@ -11,10 +11,10 @@ Index: gcc-4.8.0/gcc/config/arm/linux-elf.h
  
  #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
  
-Index: gcc-4.8.0/libgcc/config/arm/t-linux
+Index: b/libgcc/config/arm/t-linux
 ===================================================================
---- gcc-4.8.0.orig/libgcc/config/arm/t-linux	2012-03-22 16:14:46.000000000 +0100
-+++ gcc-4.8.0/libgcc/config/arm/t-linux	2013-03-23 17:40:54.000000000 +0100
+--- a/libgcc/config/arm/t-linux
++++ b/libgcc/config/arm/t-linux
 @@ -1,6 +1,11 @@
  LIB1ASMSRC = arm/lib1funcs.S
  LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
diff --git a/package/gcc/4.9.3/830-arm_unbreak_armv4t.patch b/package/gcc/4.9.4/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.9.3/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.9.4/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.9.3/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
similarity index 81%
rename from package/gcc/4.9.3/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
index e116e2b..03fc47f 100644
--- a/package/gcc/4.9.3/840-microblaze-enable-dwarf-eh-support.patch
+++ b/package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
@@ -33,11 +33,11 @@ Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
  gcc/config/microblaze/microblaze.md              | 11 +++++++++
  5 files changed, 52 insertions(+), 7 deletions(-)
 
-diff --git a/gcc/common/config/microblaze/microblaze-common.c b/gcc/common/config/microblaze/microblaze-common.c
-index 5835acc..85e6a53 100644
+Index: b/gcc/common/config/microblaze/microblaze-common.c
+===================================================================
 --- a/gcc/common/config/microblaze/microblaze-common.c
 +++ b/gcc/common/config/microblaze/microblaze-common.c
-@@ -39,7 +39,4 @@ static const struct default_options microblaze_option_optimization_table[] =
+@@ -37,7 +37,4 @@
  #undef  TARGET_OPTION_OPTIMIZATION_TABLE
  #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
  
@@ -45,11 +45,11 @@ index 5835acc..85e6a53 100644
 -#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
 -
  struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
-diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
-index c30ec72..260f4e4 100644
+Index: b/gcc/config/microblaze/microblaze-protos.h
+===================================================================
 --- a/gcc/config/microblaze/microblaze-protos.h
 +++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -56,6 +56,7 @@ extern bool microblaze_tls_referenced_p (rtx);
+@@ -54,6 +54,7 @@
  extern int symbol_mentioned_p (rtx);
  extern int label_mentioned_p (rtx);
  extern bool microblaze_cannot_force_const_mem (enum machine_mode, rtx);
@@ -57,11 +57,11 @@ index c30ec72..260f4e4 100644
  #endif  /* RTX_CODE */
  
  /* Declare functions in microblaze-c.c.  */
-diff --git a/gcc/config/microblaze/microblaze.c b/gcc/config/microblaze/microblaze.c
-index fe61fce..15166d3 100644
+Index: b/gcc/config/microblaze/microblaze.c
+===================================================================
 --- a/gcc/config/microblaze/microblaze.c
 +++ b/gcc/config/microblaze/microblaze.c
-@@ -1999,6 +1999,11 @@ microblaze_must_save_register (int regno)
+@@ -1906,6 +1906,11 @@
    if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
      return 1;
  
@@ -73,7 +73,7 @@ index fe61fce..15166d3 100644
    if (!crtl->is_leaf)
      {
        if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
-@@ -2026,6 +2031,13 @@ microblaze_must_save_register (int regno)
+@@ -1933,6 +1938,13 @@
  	return 1;
      }
  
@@ -87,7 +87,7 @@ index fe61fce..15166d3 100644
    return 0;
  }
  
-@@ -3131,6 +3143,12 @@ microblaze_expand_epilogue (void)
+@@ -2962,6 +2974,12 @@
        emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
      }
  
@@ -100,7 +100,7 @@ index fe61fce..15166d3 100644
    emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
  						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
  }
-@@ -3427,10 +3445,13 @@ microblaze_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
+@@ -3256,10 +3274,13 @@
    if (count != 0)
      return NULL_RTX;
  
@@ -118,11 +118,11 @@ index fe61fce..15166d3 100644
  }
  
  /* Queue an .ident string in the queue of top-level asm statements.
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 4072283..5e9f49c 100644
+Index: b/gcc/config/microblaze/microblaze.h
+===================================================================
 --- a/gcc/config/microblaze/microblaze.h
 +++ b/gcc/config/microblaze/microblaze.h
-@@ -184,6 +184,21 @@ extern enum pipeline_type microblaze_pipe;
+@@ -184,6 +184,21 @@
  #define INCOMING_RETURN_ADDR_RTX  			\
    gen_rtx_REG (VOIDmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
  
@@ -144,11 +144,11 @@ index 4072283..5e9f49c 100644
  /* Use DWARF 2 debugging information by default.  */
  #define DWARF2_DEBUGGING_INFO
  #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
-diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
-index ed6131a..dc2405f 100644
+Index: b/gcc/config/microblaze/microblaze.md
+===================================================================
 --- a/gcc/config/microblaze/microblaze.md
 +++ b/gcc/config/microblaze/microblaze.md
-@@ -2327,4 +2327,15 @@
+@@ -2261,4 +2261,15 @@
    (set_attr "mode"      "SI")
    (set_attr "length"    "4")])
  
@@ -164,6 +164,3 @@ index ed6131a..dc2405f 100644
 +
  (include "sync.md")
 +
--- 
-1.8.3.2
-
diff --git a/package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
similarity index 48%
rename from package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
index d103af1..533d01f 100644
--- a/package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
+++ b/package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
@@ -16,9 +16,10 @@ that uClibc defines the __UCLIBC__ definition.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for 4.9.3]
 
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/generic/c_locale.h gcc-4.9.3/libstdc++-v3/config/locale/generic/c_locale.h
---- gcc-4.9.3.orig/libstdc++-v3/config/locale/generic/c_locale.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/config/locale/generic/c_locale.h	2015-06-27 06:46:04.420022179 -0300
+Index: b/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
 @@ -70,7 +70,7 @@
      __builtin_va_list __args;
      __builtin_va_start(__args, __fmt);
@@ -28,9 +29,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/generic/c_locale.h gcc-4.9.
      const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
  #else
      const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/gnu/c_locale.h gcc-4.9.3/libstdc++-v3/config/locale/gnu/c_locale.h
---- gcc-4.9.3.orig/libstdc++-v3/config/locale/gnu/c_locale.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/config/locale/gnu/c_locale.h	2015-06-27 06:46:04.465023743 -0300
+Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/gnu/c_locale.h
++++ b/libstdc++-v3/config/locale/gnu/c_locale.h
 @@ -88,7 +88,7 @@
      __builtin_va_list __args;
      __builtin_va_start(__args, __fmt);
@@ -40,10 +42,11 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/gnu/c_locale.h gcc-4.9.3/li
      const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
  #else
      const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/basic_string.h gcc-4.9.3/libstdc++-v3/include/bits/basic_string.h
---- gcc-4.9.3.orig/libstdc++-v3/include/bits/basic_string.h	2015-05-28 13:27:46.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/bits/basic_string.h	2015-06-27 06:49:04.741284648 -0300
-@@ -2844,7 +2844,7 @@
+Index: b/libstdc++-v3/include/bits/basic_string.h
+===================================================================
+--- a/libstdc++-v3/include/bits/basic_string.h
++++ b/libstdc++-v3/include/bits/basic_string.h
+@@ -2843,7 +2843,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
  
@@ -52,9 +55,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/basic_string.h gcc-4.9.3/lib
  
  #include <ext/string_conversions.h>
  
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets_nonio.tcc gcc-4.9.3/libstdc++-v3/include/bits/locale_facets_nonio.tcc
---- gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets_nonio.tcc	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/bits/locale_facets_nonio.tcc	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
++++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
 @@ -572,7 +572,7 @@
      {
        const locale __loc = __io.getloc();
@@ -64,9 +68,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets_nonio.tcc gcc-
        // First try a buffer perhaps big enough.
        int __cs_size = 64;
        char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets.tcc gcc-4.9.3/libstdc++-v3/include/bits/locale_facets.tcc
---- gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets.tcc	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/bits/locale_facets.tcc	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets.tcc
++++ b/libstdc++-v3/include/bits/locale_facets.tcc
 @@ -987,7 +987,7 @@
  	char __fbuf[16];
  	__num_base::_S_format_float(__io, __fbuf, __mod);
@@ -76,9 +81,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets.tcc gcc-4.9.3/
  	// First try a buffer perhaps big enough (most probably sufficient
  	// for non-ios_base::fixed outputs)
  	int __cs_size = __max_digits * 3;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/math.h gcc-4.9.3/libstdc++-v3/include/c_compatibility/math.h
---- gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/math.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_compatibility/math.h	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/c_compatibility/math.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/math.h
++++ b/libstdc++-v3/include/c_compatibility/math.h
 @@ -56,7 +56,7 @@
  using std::floor;
  using std::fmod;
@@ -88,9 +94,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/math.h gcc-4.9.3/
  using std::fpclassify;
  using std::isfinite;
  using std::isinf;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/wchar.h gcc-4.9.3/libstdc++-v3/include/c_compatibility/wchar.h
---- gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/wchar.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_compatibility/wchar.h	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/wchar.h
++++ b/libstdc++-v3/include/c_compatibility/wchar.h
 @@ -103,7 +103,7 @@
  using std::wmemset;
  using std::wcsftime;
@@ -100,9 +107,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/wchar.h gcc-4.9.3
  using std::wcstold;
  using std::wcstoll;
  using std::wcstoull;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdio gcc-4.9.3/libstdc++-v3/include/c_global/cstdio
---- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdio	2014-01-23 18:17:15.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_global/cstdio	2015-06-27 06:46:04.481024298 -0300
+Index: b/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdio
++++ b/libstdc++-v3/include/c_global/cstdio
 @@ -146,7 +146,7 @@
    using ::vsprintf;
  } // namespace
@@ -112,9 +120,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdio gcc-4.9.3/libstdc
  
  #undef snprintf
  #undef vfscanf
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdlib gcc-4.9.3/libstdc++-v3/include/c_global/cstdlib
---- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdlib	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_global/cstdlib	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/c_global/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdlib
++++ b/libstdc++-v3/include/c_global/cstdlib
 @@ -182,7 +182,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
@@ -124,9 +133,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdlib gcc-4.9.3/libstd
  
  #undef _Exit
  #undef llabs
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cwchar gcc-4.9.3/libstdc++-v3/include/c_global/cwchar
---- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cwchar	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_global/cwchar	2015-06-27 06:46:04.466023777 -0300
+Index: b/libstdc++-v3/include/c_global/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_global/cwchar
++++ b/libstdc++-v3/include/c_global/cwchar
 @@ -232,7 +232,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
@@ -145,9 +155,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cwchar gcc-4.9.3/libstdc
    using std::wcstold;
    using std::wcstoll;
    using std::wcstoull;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdio gcc-4.9.3/libstdc++-v3/include/c_std/cstdio
---- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdio	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_std/cstdio	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdio
++++ b/libstdc++-v3/include/c_std/cstdio
 @@ -144,7 +144,7 @@
    using ::vsprintf;
  } // namespace std
@@ -157,9 +168,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdio gcc-4.9.3/libstdc++-
  
  #undef snprintf
  #undef vfscanf
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdlib gcc-4.9.3/libstdc++-v3/include/c_std/cstdlib
---- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdlib	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_std/cstdlib	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/c_std/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdlib
++++ b/libstdc++-v3/include/c_std/cstdlib
 @@ -180,7 +180,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
@@ -169,9 +181,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdlib gcc-4.9.3/libstdc++
  
  #undef _Exit
  #undef llabs
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cwchar gcc-4.9.3/libstdc++-v3/include/c_std/cwchar
---- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cwchar	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/c_std/cwchar	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_std/cwchar
++++ b/libstdc++-v3/include/c_std/cwchar
 @@ -228,7 +228,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
@@ -181,9 +194,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cwchar gcc-4.9.3/libstdc++-
  
  #undef wcstold
  #undef wcstoll
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/ext/vstring.h gcc-4.9.3/libstdc++-v3/include/ext/vstring.h
---- gcc-4.9.3.orig/libstdc++-v3/include/ext/vstring.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/ext/vstring.h	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/ext/vstring.h
+===================================================================
+--- a/libstdc++-v3/include/ext/vstring.h
++++ b/libstdc++-v3/include/ext/vstring.h
 @@ -2680,7 +2680,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
@@ -193,9 +207,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/ext/vstring.h gcc-4.9.3/libstdc++
  
  #include <ext/string_conversions.h>
  
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdio gcc-4.9.3/libstdc++-v3/include/tr1/cstdio
---- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdio	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/tr1/cstdio	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/tr1/cstdio
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdio
++++ b/libstdc++-v3/include/tr1/cstdio
 @@ -33,7 +33,7 @@
  
  #include <cstdio>
@@ -205,9 +220,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdio gcc-4.9.3/libstdc++-v3
  
  namespace std _GLIBCXX_VISIBILITY(default)
  {
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdlib gcc-4.9.3/libstdc++-v3/include/tr1/cstdlib
---- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdlib	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/tr1/cstdlib	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/tr1/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdlib
++++ b/libstdc++-v3/include/tr1/cstdlib
 @@ -35,7 +35,7 @@
  
  #if _GLIBCXX_HOSTED
@@ -217,9 +233,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdlib gcc-4.9.3/libstdc++-v
  
  namespace std _GLIBCXX_VISIBILITY(default)
  {
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cwchar gcc-4.9.3/libstdc++-v3/include/tr1/cwchar
---- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cwchar	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/tr1/cwchar	2015-06-27 06:46:04.480024263 -0300
+Index: b/libstdc++-v3/include/tr1/cwchar
+===================================================================
+--- a/libstdc++-v3/include/tr1/cwchar
++++ b/libstdc++-v3/include/tr1/cwchar
 @@ -52,7 +52,7 @@
    using std::vwscanf;
  #endif
@@ -229,9 +246,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cwchar gcc-4.9.3/libstdc++-v3
    using std::wcstold;
    using std::wcstoll;
    using std::wcstoull;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/stdlib.h gcc-4.9.3/libstdc++-v3/include/tr1/stdlib.h
---- gcc-4.9.3.orig/libstdc++-v3/include/tr1/stdlib.h	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/include/tr1/stdlib.h	2015-06-27 06:46:04.481024298 -0300
+Index: b/libstdc++-v3/include/tr1/stdlib.h
+===================================================================
+--- a/libstdc++-v3/include/tr1/stdlib.h
++++ b/libstdc++-v3/include/tr1/stdlib.h
 @@ -33,7 +33,7 @@
  
  #if _GLIBCXX_HOSTED
@@ -241,9 +259,10 @@ diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/stdlib.h gcc-4.9.3/libstdc++-
  
  using std::tr1::atoll;
  using std::tr1::strtoll;
-diff -Nura gcc-4.9.3.orig/libstdc++-v3/src/c++11/debug.cc gcc-4.9.3/libstdc++-v3/src/c++11/debug.cc
---- gcc-4.9.3.orig/libstdc++-v3/src/c++11/debug.cc	2014-01-02 19:30:10.000000000 -0300
-+++ gcc-4.9.3/libstdc++-v3/src/c++11/debug.cc	2015-06-27 06:46:04.481024298 -0300
+Index: b/libstdc++-v3/src/c++11/debug.cc
+===================================================================
+--- a/libstdc++-v3/src/c++11/debug.cc
++++ b/libstdc++-v3/src/c++11/debug.cc
 @@ -788,7 +788,7 @@
  				     int __n __attribute__ ((__unused__)), 
  				     const char* __fmt, _Tp __s) const throw ()
diff --git a/package/gcc/4.9.3/860-cilk-wchar.patch b/package/gcc/4.9.4/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/4.9.3/860-cilk-wchar.patch
rename to package/gcc/4.9.4/860-cilk-wchar.patch
diff --git a/package/gcc/4.9.3/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
similarity index 87%
rename from package/gcc/4.9.3/870-xtensa-add-mauto-litpools-option.patch
rename to package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
index aa1376c..98c7b3f 100644
--- a/package/gcc/4.9.3/870-xtensa-add-mauto-litpools-option.patch
+++ b/package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
@@ -48,8 +48,8 @@ Changes to ChangeLogs and documentation are dropped.
  gcc/config/xtensa/xtensa.opt     |  4 ++++
  7 files changed, 54 insertions(+), 20 deletions(-)
 
-diff --git a/gcc/config/xtensa/constraints.md b/gcc/config/xtensa/constraints.md
-index 30f4c1f..773d4f9 100644
+Index: b/gcc/config/xtensa/constraints.md
+===================================================================
 --- a/gcc/config/xtensa/constraints.md
 +++ b/gcc/config/xtensa/constraints.md
 @@ -111,6 +111,11 @@
@@ -64,11 +64,11 @@ index 30f4c1f..773d4f9 100644
  ;; Memory constraints.  Do not use define_memory_constraint here.  Doing so
  ;; causes reload to force some constants into the constant pool, but since
  ;; the Xtensa constant pool can only be accessed with L32R instructions, it
-diff --git a/gcc/config/xtensa/elf.h b/gcc/config/xtensa/elf.h
-index e59bede..12056f7 100644
+Index: b/gcc/config/xtensa/elf.h
+===================================================================
 --- a/gcc/config/xtensa/elf.h
 +++ b/gcc/config/xtensa/elf.h
-@@ -48,7 +48,9 @@ along with GCC; see the file COPYING3.  If not see
+@@ -48,7 +48,9 @@
    %{mtarget-align:--target-align} \
    %{mno-target-align:--no-target-align} \
    %{mlongcalls:--longcalls} \
@@ -79,11 +79,11 @@ index e59bede..12056f7 100644
  
  #undef LIB_SPEC
  #define LIB_SPEC "-lc -lsim -lc -lhandlers-sim -lhal"
-diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
-index 675aacf..5b0243a 100644
+Index: b/gcc/config/xtensa/linux.h
+===================================================================
 --- a/gcc/config/xtensa/linux.h
 +++ b/gcc/config/xtensa/linux.h
-@@ -42,7 +42,9 @@ along with GCC; see the file COPYING3.  If not see
+@@ -42,7 +42,9 @@
    %{mtarget-align:--target-align} \
    %{mno-target-align:--no-target-align} \
    %{mlongcalls:--longcalls} \
@@ -94,8 +94,8 @@ index 675aacf..5b0243a 100644
  
  #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
  
-diff --git a/gcc/config/xtensa/predicates.md b/gcc/config/xtensa/predicates.md
-index e02209e..d7dfa11 100644
+Index: b/gcc/config/xtensa/predicates.md
+===================================================================
 --- a/gcc/config/xtensa/predicates.md
 +++ b/gcc/config/xtensa/predicates.md
 @@ -142,7 +142,8 @@
@@ -108,11 +108,11 @@ index e02209e..d7dfa11 100644
  			    && GET_MODE_SIZE (mode) % UNITS_PER_WORD == 0")))))
  
  ;; Accept the floating point constant 1 in the appropriate mode.
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index eb039ba..206ff80 100644
+Index: b/gcc/config/xtensa/xtensa.c
+===================================================================
 --- a/gcc/config/xtensa/xtensa.c
 +++ b/gcc/config/xtensa/xtensa.c
-@@ -501,6 +501,9 @@ xtensa_valid_move (machine_mode mode, rtx *operands)
+@@ -477,6 +477,9 @@
      {
        int dst_regnum = xt_true_regnum (operands[0]);
  
@@ -121,8 +121,8 @@ index eb039ba..206ff80 100644
 +
        /* The stack pointer can only be assigned with a MOVSP opcode.  */
        if (dst_regnum == STACK_POINTER_REGNUM)
- 	return !TARGET_WINDOWED_ABI
-@@ -1069,7 +1072,7 @@ xtensa_emit_move_sequence (rtx *operands, machine_mode mode)
+ 	return (mode == SImode
+@@ -1044,7 +1047,7 @@
  	  return 1;
  	}
  
@@ -131,7 +131,7 @@ index eb039ba..206ff80 100644
  	{
  	  src = force_const_mem (SImode, src);
  	  operands[1] = src;
-@@ -2449,6 +2452,20 @@ print_operand (FILE *file, rtx x, int letter)
+@@ -2428,6 +2431,20 @@
  	}
        break;
  
@@ -152,11 +152,11 @@ index eb039ba..206ff80 100644
      default:
        if (GET_CODE (x) == REG || GET_CODE (x) == SUBREG)
  	fprintf (file, "%s", reg_names[xt_true_regnum (x)]);
-diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
-index 6d84384..0e673a3 100644
+Index: b/gcc/config/xtensa/xtensa.md
+===================================================================
 --- a/gcc/config/xtensa/xtensa.md
 +++ b/gcc/config/xtensa/xtensa.md
-@@ -761,8 +761,8 @@
+@@ -799,8 +799,8 @@
  })
  
  (define_insn "movsi_internal"
@@ -167,7 +167,7 @@ index 6d84384..0e673a3 100644
    "xtensa_valid_move (SImode, operands)"
    "@
     movi.n\t%0, %x1
-@@ -774,15 +774,16 @@
+@@ -812,15 +812,16 @@
     mov\t%0, %1
     movsp\t%0, %1
     movi\t%0, %x1
@@ -186,7 +186,7 @@ index 6d84384..0e673a3 100644
  
  ;; 16-bit Integer moves
  
-@@ -796,21 +797,22 @@
+@@ -834,21 +835,22 @@
  })
  
  (define_insn "movhi_internal"
@@ -213,7 +213,7 @@ index 6d84384..0e673a3 100644
  
  ;; 8-bit Integer moves
  
-@@ -881,7 +883,7 @@
+@@ -919,7 +921,7 @@
  	(match_operand:SF 1 "general_operand" ""))]
    ""
  {
@@ -222,7 +222,7 @@ index 6d84384..0e673a3 100644
      operands[1] = force_const_mem (SFmode, operands[1]);
  
    if ((!register_operand (operands[0], SFmode)
-@@ -896,8 +898,8 @@
+@@ -934,8 +936,8 @@
  })
  
  (define_insn "movsf_internal"
@@ -233,7 +233,7 @@ index 6d84384..0e673a3 100644
    "((register_operand (operands[0], SFmode)
       || register_operand (operands[1], SFmode))
      && !(FP_REG_P (xt_true_regnum (operands[0]))
-@@ -912,13 +914,14 @@
+@@ -950,13 +952,14 @@
     mov\t%0, %1
     wfr\t%0, %1
     rfr\t%0, %1
@@ -250,7 +250,7 @@ index 6d84384..0e673a3 100644
  
  (define_insn "*lsiu"
    [(set (match_operand:SF 0 "register_operand" "=f")
-@@ -991,7 +994,7 @@
+@@ -997,7 +1000,7 @@
  	(match_operand:DF 1 "general_operand" ""))]
    ""
  {
@@ -259,7 +259,7 @@ index 6d84384..0e673a3 100644
      operands[1] = force_const_mem (DFmode, operands[1]);
  
    if (!register_operand (operands[0], DFmode)
-@@ -1002,8 +1005,8 @@
+@@ -1008,8 +1011,8 @@
  })
  
  (define_insn_and_split "movdf_internal"
@@ -270,11 +270,11 @@ index 6d84384..0e673a3 100644
    "register_operand (operands[0], DFmode)
     || register_operand (operands[1], DFmode)"
    "#"
-diff --git a/gcc/config/xtensa/xtensa.opt b/gcc/config/xtensa/xtensa.opt
-index 2fd6cee..21c6e96 100644
+Index: b/gcc/config/xtensa/xtensa.opt
+===================================================================
 --- a/gcc/config/xtensa/xtensa.opt
 +++ b/gcc/config/xtensa/xtensa.opt
-@@ -38,6 +38,10 @@ mtext-section-literals
+@@ -38,6 +38,10 @@
  Target
  Intersperse literal pools with code in the text section
  
@@ -285,6 +285,3 @@ index 2fd6cee..21c6e96 100644
  mserialize-volatile
  Target Report Mask(SERIALIZE_VOLATILE)
  -mno-serialize-volatile	Do not serialize volatile memory references with MEMW instructions
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch b/package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch
similarity index 100%
rename from package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch
rename to package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch
diff --git a/package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
similarity index 100%
rename from package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
rename to package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
diff --git a/package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch
similarity index 100%
rename from package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch
rename to package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch
diff --git a/package/gcc/4.9.3/874-xtensa-add-uclinux-support.patch b/package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
similarity index 91%
rename from package/gcc/4.9.3/874-xtensa-add-uclinux-support.patch
rename to package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
index 23db3d8..881aec0 100644
--- a/package/gcc/4.9.3/874-xtensa-add-uclinux-support.patch
+++ b/package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
@@ -24,11 +24,11 @@ Backported from: r228450
  create mode 100644 gcc/config/xtensa/uclinux.h
  create mode 100644 gcc/config/xtensa/uclinux.opt
 
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index c52f5a8..56797bd 100644
+Index: b/gcc/config.gcc
+===================================================================
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2995,6 +2995,11 @@ xtensa*-*-linux*)
+@@ -2871,6 +2871,11 @@
  	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h xtensa/linux.h"
  	tmake_file="${tmake_file} xtensa/t-xtensa"
  	;;
@@ -40,9 +40,8 @@ index c52f5a8..56797bd 100644
  am33_2.0-*-linux*)
  	tm_file="mn10300/mn10300.h dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h mn10300/linux.h"
  	gas=yes gnu_ld=yes
-diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
-new file mode 100644
-index 0000000..4606020
+Index: b/gcc/config/xtensa/uclinux.h
+===================================================================
 --- /dev/null
 +++ b/gcc/config/xtensa/uclinux.h
 @@ -0,0 +1,69 @@
@@ -115,9 +114,8 @@ index 0000000..4606020
 +
 +#undef DBX_REGISTER_NUMBER
 +
-diff --git a/gcc/config/xtensa/uclinux.opt b/gcc/config/xtensa/uclinux.opt
-new file mode 100644
-index 0000000..95ef777
+Index: b/gcc/config/xtensa/uclinux.opt
+===================================================================
 --- /dev/null
 +++ b/gcc/config/xtensa/uclinux.opt
 @@ -0,0 +1,32 @@
@@ -153,11 +151,11 @@ index 0000000..95ef777
 +Driver JoinedOrMissing
 +
 +; This comment is to ensure we retain the blank line above.
-diff --git a/libgcc/config.host b/libgcc/config.host
-index 2c64756..2ee92c1 100644
+Index: b/libgcc/config.host
+===================================================================
 --- a/libgcc/config.host
 +++ b/libgcc/config.host
-@@ -1295,6 +1295,11 @@ xtensa*-*-linux*)
+@@ -1213,6 +1213,11 @@
  	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
  	md_unwind_header=xtensa/linux-unwind.h
  	;;
@@ -169,6 +167,3 @@ index 2c64756..2ee92c1 100644
  am33_2.0-*-linux*)
  	# Don't need crtbeginT.o from *-*-linux* default.
  	extra_parts="crtbegin.o crtend.o crtbeginS.o crtendS.o"
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.3/880-nios2_legitimize_address.patch b/package/gcc/4.9.4/880-nios2_legitimize_address.patch
similarity index 100%
rename from package/gcc/4.9.3/880-nios2_legitimize_address.patch
rename to package/gcc/4.9.4/880-nios2_legitimize_address.patch
diff --git a/package/gcc/4.9.3/890-fix-m68k-compile.patch b/package/gcc/4.9.4/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/4.9.3/890-fix-m68k-compile.patch
rename to package/gcc/4.9.4/890-fix-m68k-compile.patch
diff --git a/package/gcc/4.9.3/891-fix-m68k-uclinux.patch b/package/gcc/4.9.4/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/4.9.3/891-fix-m68k-uclinux.patch
rename to package/gcc/4.9.4/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/4.9.3/900-musl-support.patch b/package/gcc/4.9.4/900-musl-support.patch
similarity index 99%
rename from package/gcc/4.9.3/900-musl-support.patch
rename to package/gcc/4.9.4/900-musl-support.patch
index 90f64de..a862d01 100644
--- a/package/gcc/4.9.3/900-musl-support.patch
+++ b/package/gcc/4.9.4/900-musl-support.patch
@@ -60,7 +60,7 @@ Index: b/gcc/config.gcc
      *)
        tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
        ;;
-@@ -2322,6 +2325,10 @@
+@@ -2338,6 +2341,10 @@
  	    powerpc*-*-linux*paired*)
  		tm_file="${tm_file} rs6000/750cl.h" ;;
  	esac
@@ -308,7 +308,7 @@ Index: b/gcc/config/microblaze/linux.h
 ===================================================================
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
-@@ -25,7 +25,23 @@
+@@ -28,7 +28,23 @@
  #undef TLS_NEEDS_GOT
  #define TLS_NEEDS_GOT 1
  
@@ -337,7 +337,7 @@ Index: b/gcc/config/rs6000/linux64.h
 ===================================================================
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -375,17 +375,23 @@
+@@ -371,17 +371,23 @@
  #endif
  #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
  #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
@@ -452,7 +452,7 @@ Index: b/gcc/configure
 ===================================================================
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -27449,6 +27453,9 @@
+@@ -27601,6 +27601,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -466,7 +466,7 @@ Index: b/gcc/configure.ac
 ===================================================================
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5108,6 +5112,9 @@
+@@ -5173,6 +5173,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -588,7 +588,7 @@ Index: b/libstdc++-v3/configure.host
 ===================================================================
 --- a/libstdc++-v3/configure.host
 +++ b/libstdc++-v3/configure.host
-@@ -264,6 +264,13 @@
+@@ -266,6 +266,13 @@
      os_include_dir="os/bsd/freebsd"
      ;;
    gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
@@ -602,7 +602,7 @@ Index: b/libstdc++-v3/configure.host
      if [ "$uclibc" = "yes" ]; then
        os_include_dir="os/uclibc"
      elif [ "$bionic" = "yes" ]; then
-@@ -272,6 +279,9 @@
+@@ -274,6 +281,9 @@
        os_include_dir="os/gnu-linux"
      fi
      ;;
diff --git a/package/gcc/4.9.3/901-microblaze-uclibc.patch b/package/gcc/4.9.4/901-microblaze-uclibc.patch
similarity index 100%
rename from package/gcc/4.9.3/901-microblaze-uclibc.patch
rename to package/gcc/4.9.4/901-microblaze-uclibc.patch
diff --git a/package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/4.9.3/940-uclinux-enable-threads.patch b/package/gcc/4.9.4/940-uclinux-enable-threads.patch
similarity index 65%
rename from package/gcc/4.9.3/940-uclinux-enable-threads.patch
rename to package/gcc/4.9.4/940-uclinux-enable-threads.patch
index f89f090..5108147 100644
--- a/package/gcc/4.9.3/940-uclinux-enable-threads.patch
+++ b/package/gcc/4.9.4/940-uclinux-enable-threads.patch
@@ -4,10 +4,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 
-diff -Nur gcc-4.9.3.orig/gcc/config.gcc gcc-4.9.3/gcc/config.gcc
---- gcc-4.9.3.orig/gcc/config.gcc	2015-05-21 22:50:59.000000000 +0200
-+++ gcc-4.9.3/gcc/config.gcc	2016-06-30 22:05:21.338233965 +0200
-@@ -807,6 +807,9 @@
+Index: b/gcc/config.gcc
+===================================================================
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -810,6 +810,9 @@
  *-*-uclinux*)
    extra_options="$extra_options gnu-user.opt"
    use_gcc_stdint=wrap
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bcfb196..2b54959 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -104,7 +104,7 @@ config BR2_GCC_VERSION
 	string
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
-	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
+	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
 	default "arc-2016.09-eng007" if BR2_GCC_VERSION_4_8_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 9f4069b..ecde393 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1
 sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189  gcc-4.7.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.5/sha512.sum
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
-sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.4/sha512.sum
+sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
 sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
-- 
2.7.4
