From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 20:55:37 +0100
Subject: [Buildroot] [git commit master] binutils: get rid of ancient
	versions
Message-ID: <20091204195655.59B93777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a9c205c981bf3e61abc1e6af01f9b8357c95c08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of 2.17.50.0.17, 2.18.50.0.{1,3,6,8}.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../2.17.50.0.17/100-makeinfo-version.patch        |   32 -----
 .../binutils/2.17.50.0.17/100-uclibc-conf.patch    |  139 --------------------
 .../binutils/2.17.50.0.17/110-arm-eabi-conf.patch  |   24 ----
 .../2.17.50.0.17/300-001_ld_makefile_patch.patch   |   24 ----
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../2.18.50.0.1/100-makeinfo-version.patch         |   32 -----
 .../binutils/2.18.50.0.1/110-arm-eabi-conf.patch   |   24 ----
 .../2.18.50.0.1/300-001_ld_makefile_patch.patch    |   24 ----
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../binutils/2.18.50.0.3/110-arm-eabi-conf.patch   |   24 ----
 .../2.18.50.0.3/300-001_ld_makefile_patch.patch    |   24 ----
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../binutils/2.18.50.0.6/110-arm-eabi-conf.patch   |   24 ----
 .../2.18.50.0.6/300-001_ld_makefile_patch.patch    |   24 ----
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 .../binutils/2.18.50.0.8/110-arm-eabi-conf.patch   |   24 ----
 .../2.18.50.0.8/300-001_ld_makefile_patch.patch    |   24 ----
 .../300-012_check_ldrunpath_length.patch           |   21 ---
 toolchain/binutils/Config.in                       |   30 ----
 19 files changed, 0 insertions(+), 578 deletions(-)
 delete mode 100644 toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch
 delete mode 100644 toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch
 delete mode 100644 toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.1/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.1/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.3/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.3/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.3/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.8/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.8/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.18.50.0.8/300-012_check_ldrunpath_length.patch

diff --git a/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch b/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch
deleted file mode 100644
index 5a39913..0000000
--- a/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -ur binutils-2.17.50.0.17/configure binutils-2.17.50.0.17-patched/configure
---- binutils-2.17.50.0.17/configure	2007-06-18 12:29:28.000000000 -0500
-+++ binutils-2.17.50.0.17-patched/configure	2008-01-26 14:31:23.477741690 -0600
-@@ -6111,10 +6111,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- 
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
-diff -ur binutils-2.17.50.0.17/configure.ac binutils-2.17.50.0.17-patched/configure.ac
---- binutils-2.17.50.0.17/configure.ac	2007-06-18 12:29:28.000000000 -0500
-+++ binutils-2.17.50.0.17-patched/configure.ac	2008-01-26 14:31:23.481741737 -0600
-@@ -2397,10 +2397,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- changequote(,)
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
diff --git a/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch b/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch
deleted file mode 100644
index 62465c7..0000000
--- a/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch
+++ /dev/null
@@ -1,139 +0,0 @@
---- binutils-2.16.91.0.7/bfd/configure
-+++ binutils-2.16.91.0.7/bfd/configure
-@@ -3576,7 +3576,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/binutils/configure
-+++ binutils-2.16.91.0.7/binutils/configure
-@@ -3411,7 +3411,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/configure
-+++ binutils-2.16.91.0.7/configure
-@@ -1270,7 +1270,7 @@
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -1578,7 +1578,7 @@
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.16.91.0.7/configure.ac
-+++ binutils-2.16.91.0.7/configure.ac
-@@ -468,7 +468,7 @@
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -776,7 +776,7 @@
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
-       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.16.91.0.7/gas/configure
-+++ binutils-2.16.91.0.7/gas/configure
-@@ -3411,7 +3411,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/gprof/configure
-+++ binutils-2.16.91.0.7/gprof/configure
-@@ -3419,6 +3419,11 @@
-   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd* | knetbsd*-gnu)
-   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
---- binutils-2.16.91.0.7/ld/configure
-+++ binutils-2.16.91.0.7/ld/configure
-@@ -3413,7 +3413,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/libtool.m4
-+++ binutils-2.16.91.0.7/libtool.m4
-@@ -739,7 +739,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/ltconfig
-+++ binutils-2.16.91.0.7/ltconfig
-@@ -602,6 +602,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
-+linux-uclibc*) ;;
- linux-gnu*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
-@@ -1247,7 +1248,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
---- binutils-2.16.91.0.7/opcodes/configure
-+++ binutils-2.16.91.0.7/opcodes/configure
-@@ -3579,7 +3579,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
diff --git a/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch b/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch
deleted file mode 100644
index 04e19be..0000000
--- a/toolchain/binutils/2.17.50.0.17/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/configure binutils-2.17.50.0.17/configure
---- binutils-2.17.50.0.17.oorig/configure	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure	2007-06-25 09:58:36.000000000 +0200
-@@ -2224,7 +2224,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
-diff -u binutils-2.17.50.0.17.oorig/configure.ac binutils-2.17.50.0.17/configure.ac
---- binutils-2.17.50.0.17.oorig/configure.ac	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure.ac	2007-06-25 09:58:36.000000000 +0200
-@@ -513,7 +513,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
diff --git a/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.17.50.0.17/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.17.50.0.17/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch b/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch
deleted file mode 100644
index d911d62..0000000
--- a/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -u binutils-2.18-orig/configure binutils-2.18/configure
---- binutils-2.18-orig/configure	2007-08-06 16:29:40.000000000 -0400
-+++ binutils-2.18/configure	2007-09-27 22:41:51.000000000 -0400
-@@ -6125,10 +6125,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- 
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
-diff -u binutils-2.18-orig/configure.ac binutils-2.18/configure.ac
---- binutils-2.18-orig/configure.ac	2007-08-28 16:24:26.000000000 -0400
-+++ binutils-2.18/configure.ac	2007-09-27 22:41:00.000000000 -0400
-@@ -2400,10 +2400,10 @@
-   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
-   *)
- changequote(,)
--    # For an installed makeinfo, we require it to be from texinfo 4.4 or
-+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
diff --git a/toolchain/binutils/2.18.50.0.1/110-arm-eabi-conf.patch b/toolchain/binutils/2.18.50.0.1/110-arm-eabi-conf.patch
deleted file mode 100644
index 04e19be..0000000
--- a/toolchain/binutils/2.18.50.0.1/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/configure binutils-2.17.50.0.17/configure
---- binutils-2.17.50.0.17.oorig/configure	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure	2007-06-25 09:58:36.000000000 +0200
-@@ -2224,7 +2224,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
-diff -u binutils-2.17.50.0.17.oorig/configure.ac binutils-2.17.50.0.17/configure.ac
---- binutils-2.17.50.0.17.oorig/configure.ac	2007-06-18 19:29:28.000000000 +0200
-+++ binutils-2.17.50.0.17/configure.ac	2007-06-25 09:58:36.000000000 +0200
-@@ -513,7 +513,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
diff --git a/toolchain/binutils/2.18.50.0.1/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.18.50.0.1/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.18.50.0.1/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.18.50.0.1/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.18.50.0.1/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.18.50.0.1/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.18.50.0.3/110-arm-eabi-conf.patch b/toolchain/binutils/2.18.50.0.3/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/toolchain/binutils/2.18.50.0.3/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
---- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
-@@ -2245,7 +2245,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
-diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
---- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
-@@ -522,7 +522,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/toolchain/binutils/2.18.50.0.3/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.18.50.0.3/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.18.50.0.3/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.18.50.0.3/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.18.50.0.3/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.18.50.0.3/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch b/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/toolchain/binutils/2.18.50.0.6/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
---- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
-@@ -2245,7 +2245,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
-diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
---- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
-@@ -522,7 +522,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.18.50.0.6/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.18.50.0.6/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.18.50.0.8/110-arm-eabi-conf.patch b/toolchain/binutils/2.18.50.0.8/110-arm-eabi-conf.patch
deleted file mode 100644
index af26329..0000000
--- a/toolchain/binutils/2.18.50.0.8/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup binutils-2.18.50.0.3.orig/configure binutils-2.18.50.0.3/configure
---- binutils-2.18.50.0.3.orig/configure	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure	2007-11-22 12:45:01.000000000 +0100
-@@ -2245,7 +2245,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
-diff -rdup binutils-2.18.50.0.3.orig/configure.ac binutils-2.18.50.0.3/configure.ac
---- binutils-2.18.50.0.3.orig/configure.ac	2007-11-22 12:41:26.000000000 +0100
-+++ binutils-2.18.50.0.3/configure.ac	2007-11-22 12:44:54.000000000 +0100
-@@ -522,7 +522,7 @@ case "${target}" in
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-*gnueabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/toolchain/binutils/2.18.50.0.8/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.18.50.0.8/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 5cb0f61..0000000
--- a/toolchain/binutils/2.18.50.0.8/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
---- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
-@@ -18,7 +18,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.in binutils-2.17.50.0.17/ld/Makefile.in
---- binutils-2.17.50.0.17.oorig/ld/Makefile.in	2007-06-18 19:29:29.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/Makefile.in	2007-06-25 10:00:36.000000000 +0200
-@@ -287,7 +287,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.18.50.0.8/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.18.50.0.8/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 6e80921..0000000
--- a/toolchain/binutils/2.18.50.0.8/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -u binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em binutils-2.17.50.0.17/ld/emultempl/elf32.em
---- binutils-2.17.50.0.17.oorig/ld/emultempl/elf32.em	2007-06-18 19:31:40.000000000 +0200
-+++ binutils-2.17.50.0.17/ld/emultempl/elf32.em	2007-06-25 10:01:25.000000000 +0200
-@@ -1007,6 +1007,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -1191,6 +1193,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index 0ca2786..b892b6f 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -13,37 +13,12 @@ choice
 		depends on BR2_DEPRECATED || (BR2_avr32 && BR2_EXT_BINUTILS_VERSION_2_17)
 		bool "binutils 2.17"
 
-	config BR2_BINUTILS_VERSION_2_17_50_0_17
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.17.50.0.17"
-
 	config BR2_BINUTILS_VERSION_2_18
 		depends on !BR2_nios2
 		depends on BR2_DEPRECATED || BR2_avr32
 		depends on BR2_EXT_BINUTILS_VERSION_2_18
 		bool "binutils 2.18"
 
-	config BR2_BINUTILS_VERSION_2_18_50_0_1
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18.50.0.1"
-
-	config BR2_BINUTILS_VERSION_2_18_50_0_3
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18.50.0.3"
-
-	config BR2_BINUTILS_VERSION_2_18_50_0_6
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18.50.0.6"
-
-	config BR2_BINUTILS_VERSION_2_18_50_0_8
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
-		bool "binutils 2.18.50.0.8"
-
 	config BR2_BINUTILS_VERSION_2_18_50_0_9
 		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_DEPRECATED
@@ -69,12 +44,7 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.15"		if BR2_nios2
 	default "2.17"		if BR2_BINUTILS_VERSION_2_17
-	default "2.17.50.0.17"	if BR2_BINUTILS_VERSION_2_17_50_0_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
-	default "2.18.50.0.1"	if BR2_BINUTILS_VERSION_2_18_50_0_1
-	default "2.18.50.0.3"	if BR2_BINUTILS_VERSION_2_18_50_0_3
-	default "2.18.50.0.6"	if BR2_BINUTILS_VERSION_2_18_50_0_6
-	default "2.18.50.0.8"	if BR2_BINUTILS_VERSION_2_18_50_0_8
 	default "2.18.50.0.9"	if BR2_BINUTILS_VERSION_2_18_50_0_9
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
-- 
1.6.3.3
