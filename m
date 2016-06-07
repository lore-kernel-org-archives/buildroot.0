From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 22:21:48 -0300
Subject: [Buildroot] [PATCH] gcc: bump 5.x series to version 5.4.0
Message-ID: <1465262508-31816-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

130-fix_build_with_gcc-6.patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/5.3.0/130-fix_build_with_gcc-6.patch   | 153 ---------------------
 package/gcc/{5.3.0 => 5.4.0}/100-uclibc-conf.patch |   0
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |   0
 .../{5.3.0 => 5.4.0}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{5.3.0 => 5.4.0}/830-arm_unbreak_armv4t.patch  |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |   0
 .../850-libstdcxx-uclibc-c99.patch                 |   0
 package/gcc/{5.3.0 => 5.4.0}/860-cilk-wchar.patch  |   0
 .../870-xtensa-add-mauto-litpools-option.patch     |   0
 .../871-xtensa-reimplement-register-spilling.patch |   0
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |   0
 .../873-xtensa-fix-_Unwind_GetCFA.patch            |   0
 .../874-xtensa-add-uclinux-support.patch           |   0
 .../{5.3.0 => 5.4.0}/890-fix-m68k-compile.patch    |   0
 .../{5.3.0 => 5.4.0}/891-fix-m68k-uclinux.patch    |   0
 .../{5.3.0 => 5.4.0}/892-microblaze-uclibc.patch   |   0
 .../900-libitm-fixes-for-musl-support.patch        |   0
 .../901-fixincludes-update-for-musl-support.patch  |   0
 .../{5.3.0 => 5.4.0}/902-unwind-fix-for-musl.patch |   0
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |   0
 .../{5.3.0 => 5.4.0}/904-musl-libc-config.patch    |   0
 .../905-add-musl-support-to-gcc.patch              |   0
 .../{5.3.0 => 5.4.0}/906-mips-musl-support.patch   |   0
 .../{5.3.0 => 5.4.0}/907-x86-musl-support.patch    |   0
 .../{5.3.0 => 5.4.0}/908-arm-musl-support.patch    |   0
 .../909-aarch64-musl-support.patch                 |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 30 files changed, 3 insertions(+), 156 deletions(-)
 delete mode 100644 package/gcc/5.3.0/130-fix_build_with_gcc-6.patch
 rename package/gcc/{5.3.0 => 5.4.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/840-microblaze-enable-dwarf-eh-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/870-xtensa-add-mauto-litpools-option.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/871-xtensa-reimplement-register-spilling.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/873-xtensa-fix-_Unwind_GetCFA.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/874-xtensa-add-uclinux-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/890-fix-m68k-compile.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/892-microblaze-uclibc.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/900-libitm-fixes-for-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/901-fixincludes-update-for-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/902-unwind-fix-for-musl.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/904-musl-libc-config.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/905-add-musl-support-to-gcc.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/906-mips-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/907-x86-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/908-arm-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/909-aarch64-musl-support.patch (100%)
 rename package/gcc/{5.3.0 => 5.4.0}/930-libgcc-disable-split-stack-nothreads.patch (100%)

diff --git a/package/gcc/5.3.0/130-fix_build_with_gcc-6.patch b/package/gcc/5.3.0/130-fix_build_with_gcc-6.patch
deleted file mode 100644
index 62ac3cb..0000000
--- a/package/gcc/5.3.0/130-fix_build_with_gcc-6.patch
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
diff --git a/package/gcc/5.3.0/100-uclibc-conf.patch b/package/gcc/5.4.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/5.3.0/100-uclibc-conf.patch
rename to package/gcc/5.4.0/100-uclibc-conf.patch
diff --git a/package/gcc/5.3.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.4.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
similarity index 100%
rename from package/gcc/5.3.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
rename to package/gcc/5.4.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
diff --git a/package/gcc/5.3.0/301-missing-execinfo_h.patch b/package/gcc/5.4.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/5.3.0/301-missing-execinfo_h.patch
rename to package/gcc/5.4.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/5.3.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.4.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/5.3.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/5.4.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/5.3.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.4.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/5.3.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/5.4.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/5.3.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/5.3.0/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/5.3.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/5.3.0/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/5.3.0/860-cilk-wchar.patch b/package/gcc/5.4.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/5.3.0/860-cilk-wchar.patch
rename to package/gcc/5.4.0/860-cilk-wchar.patch
diff --git a/package/gcc/5.3.0/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/5.4.0/870-xtensa-add-mauto-litpools-option.patch
similarity index 100%
rename from package/gcc/5.3.0/870-xtensa-add-mauto-litpools-option.patch
rename to package/gcc/5.4.0/870-xtensa-add-mauto-litpools-option.patch
diff --git a/package/gcc/5.3.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.4.0/871-xtensa-reimplement-register-spilling.patch
similarity index 100%
rename from package/gcc/5.3.0/871-xtensa-reimplement-register-spilling.patch
rename to package/gcc/5.4.0/871-xtensa-reimplement-register-spilling.patch
diff --git a/package/gcc/5.3.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/5.4.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
similarity index 100%
rename from package/gcc/5.3.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
rename to package/gcc/5.4.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
diff --git a/package/gcc/5.3.0/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch
similarity index 100%
rename from package/gcc/5.3.0/873-xtensa-fix-_Unwind_GetCFA.patch
rename to package/gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch
diff --git a/package/gcc/5.3.0/874-xtensa-add-uclinux-support.patch b/package/gcc/5.4.0/874-xtensa-add-uclinux-support.patch
similarity index 100%
rename from package/gcc/5.3.0/874-xtensa-add-uclinux-support.patch
rename to package/gcc/5.4.0/874-xtensa-add-uclinux-support.patch
diff --git a/package/gcc/5.3.0/890-fix-m68k-compile.patch b/package/gcc/5.4.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/5.3.0/890-fix-m68k-compile.patch
rename to package/gcc/5.4.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/5.3.0/891-fix-m68k-uclinux.patch b/package/gcc/5.4.0/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/5.3.0/891-fix-m68k-uclinux.patch
rename to package/gcc/5.4.0/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/5.3.0/892-microblaze-uclibc.patch b/package/gcc/5.4.0/892-microblaze-uclibc.patch
similarity index 100%
rename from package/gcc/5.3.0/892-microblaze-uclibc.patch
rename to package/gcc/5.4.0/892-microblaze-uclibc.patch
diff --git a/package/gcc/5.3.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.4.0/900-libitm-fixes-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/900-libitm-fixes-for-musl-support.patch
rename to package/gcc/5.4.0/900-libitm-fixes-for-musl-support.patch
diff --git a/package/gcc/5.3.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.4.0/901-fixincludes-update-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/901-fixincludes-update-for-musl-support.patch
rename to package/gcc/5.4.0/901-fixincludes-update-for-musl-support.patch
diff --git a/package/gcc/5.3.0/902-unwind-fix-for-musl.patch b/package/gcc/5.4.0/902-unwind-fix-for-musl.patch
similarity index 100%
rename from package/gcc/5.3.0/902-unwind-fix-for-musl.patch
rename to package/gcc/5.4.0/902-unwind-fix-for-musl.patch
diff --git a/package/gcc/5.3.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.4.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
similarity index 100%
rename from package/gcc/5.3.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
rename to package/gcc/5.4.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
diff --git a/package/gcc/5.3.0/904-musl-libc-config.patch b/package/gcc/5.4.0/904-musl-libc-config.patch
similarity index 100%
rename from package/gcc/5.3.0/904-musl-libc-config.patch
rename to package/gcc/5.4.0/904-musl-libc-config.patch
diff --git a/package/gcc/5.3.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.4.0/905-add-musl-support-to-gcc.patch
similarity index 100%
rename from package/gcc/5.3.0/905-add-musl-support-to-gcc.patch
rename to package/gcc/5.4.0/905-add-musl-support-to-gcc.patch
diff --git a/package/gcc/5.3.0/906-mips-musl-support.patch b/package/gcc/5.4.0/906-mips-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/906-mips-musl-support.patch
rename to package/gcc/5.4.0/906-mips-musl-support.patch
diff --git a/package/gcc/5.3.0/907-x86-musl-support.patch b/package/gcc/5.4.0/907-x86-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/907-x86-musl-support.patch
rename to package/gcc/5.4.0/907-x86-musl-support.patch
diff --git a/package/gcc/5.3.0/908-arm-musl-support.patch b/package/gcc/5.4.0/908-arm-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/908-arm-musl-support.patch
rename to package/gcc/5.4.0/908-arm-musl-support.patch
diff --git a/package/gcc/5.3.0/909-aarch64-musl-support.patch b/package/gcc/5.4.0/909-aarch64-musl-support.patch
similarity index 100%
rename from package/gcc/5.3.0/909-aarch64-musl-support.patch
rename to package/gcc/5.4.0/909-aarch64-musl-support.patch
diff --git a/package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/5.4.0/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/5.4.0/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cfb0958..17de65c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
-	default "5.3.0"     if BR2_GCC_VERSION_5_X
+	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
 	default "arc-2016.03" if BR2_GCC_VERSION_4_8_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1bed770..82160bf 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,8 +6,8 @@ sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
 sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
-sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
+sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
-- 
2.7.3
