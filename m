From: Martin Kelly <martin@surround.io>
Date: Thu, 26 May 2016 14:35:07 -0700
Subject: [Buildroot] [PATCH] Config.in: wrap to column width 72
Message-ID: <1464298507-22817-1-git-send-email-martin@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many lines are not correctly wrapped to 72 column width, so rewrap them.

Signed-off-by: Martin Kelly <martin@surround.io>
---
 Config.in | 301 ++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 153 insertions(+), 148 deletions(-)

diff --git a/Config.in b/Config.in
index 681c00c..6e495d6 100644
--- a/Config.in
+++ b/Config.in
@@ -120,9 +120,9 @@ config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
 	help
-	  Command to be used to extract a gzip'ed file to stdout.
-	  zcat is identical to gunzip -c except that the former may
-	  not be available on your system.
+	  Command to be used to extract a gzip'ed file to stdout.  zcat
+	  is identical to gunzip -c except that the former may not be
+	  available on your system.
 	  Default is "gzip -d -c"
 	  Other possible values include "gunzip -c" or "zcat".
 
@@ -162,8 +162,8 @@ config BR2_DEFCONFIG
 	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
 	default "$(CONFIG_DIR)/defconfig"
 	help
-	  When running 'make savedefconfig', the defconfig file will be saved
-	  in this location.
+	  When running 'make savedefconfig', the defconfig file will be
+	  saved in this location.
 
 config BR2_DL_DIR
 	string "Download dir"
@@ -171,7 +171,8 @@ config BR2_DL_DIR
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BR2_DL_DIR
-	  environment variable, then this overrides this configuration item.
+	  environment variable, then this overrides this configuration
+	  item.
 
 	  The default is $(TOPDIR)/dl
 
@@ -179,9 +180,9 @@ config BR2_HOST_DIR
 	string "Host dir"
 	default "$(BASE_DIR)/host"
 	help
-	  Directory to store all the binary files that are built for the host.
-	  This includes the cross compilation toolchain when building the
-	  internal buildroot toolchain.
+	  Directory to store all the binary files that are built for the
+	  host.  This includes the cross compilation toolchain when
+	  building the internal buildroot toolchain.
 
 	  The default is $(BASE_DIR)/host
 
@@ -191,9 +192,9 @@ config BR2_PRIMARY_SITE
 	string "Primary download site"
 	default ""
 	help
-	  Primary site to download from. If this option is set then buildroot
-	  will try to download package source first from this site and try the
-	  default if the file is not found.
+	  Primary site to download from. If this option is set then
+	  buildroot will try to download package source first from this
+	  site and try the default if the file is not found.
 	  Valid URIs are:
 	    - URIs recognized by $(WGET)
 	    - local URIs of the form file://absolutepath
@@ -206,11 +207,11 @@ config BR2_PRIMARY_SITE_ONLY
 	  If this option is enabled, downloads will only be attempted
 	  from the primary download site. Other locations, like the
 	  package's official download location or the backup download
-	  site, will not be considered. Therefore, if the package is
-	  not present on the primary site, the download fails.
+	  site, will not be considered. Therefore, if the package is not
+	  present on the primary site, the download fails.
 
-	  This is useful for project developers who want to ensure
-	  that the project can be built even if the upstream tarball
+	  This is useful for project developers who want to ensure that
+	  the project can be built even if the upstream tarball
 	  locations disappear.
 
 if !BR2_PRIMARY_SITE_ONLY
@@ -219,9 +220,9 @@ config BR2_BACKUP_SITE
 	string "Backup download site"
 	default "http://sources.buildroot.net"
 	help
-	  Backup site to download from. If this option is set then buildroot
-	  will fall back to download package sources from here if the
-	  normal location fails.
+	  Backup site to download from. If this option is set then
+	  buildroot will fall back to download package sources from here
+	  if the normal location fails.
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
@@ -232,8 +233,8 @@ config BR2_KERNEL_MIRROR
 	  mirror. By default, a CDN is used, which automatically
 	  redirects to a mirror geographically close to you.
 
-	  Have a look on the kernel.org site for a list of mirrors, then enter
-	  the URL to the base directory.  Examples:
+	  Have a look on the kernel.org site for a list of mirrors, then
+	  enter the URL to the base directory.  Examples:
 
 	     http://www.XX.kernel.org/pub (XX = country code)
 	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
@@ -247,8 +248,8 @@ config BR2_GNU_MIRROR
 	  mirror. By default, a generic address is used, which
 	  automatically selects an up-to-date and local mirror.
 
-	  Have a look on the gnu.org site for a list of mirrors, then enter
-	  the URL to the base directory.  Examples:
+	  Have a look on the gnu.org site for a list of mirrors, then
+	  enter the URL to the base directory.  Examples:
 
 	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
@@ -265,8 +266,8 @@ config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "http://cpan.metacpan.org"
 	help
-	  CPAN (Comprehensive Perl Archive Network) is a repository
-	  of Perl packages. It has multiple software mirrors scattered
+	  CPAN (Comprehensive Perl Archive Network) is a repository of
+	  Perl packages. It has multiple software mirrors scattered
 	  around the world. This option allows you to select a mirror.
 
 	  The list of mirrors is available at:
@@ -281,23 +282,21 @@ config BR2_JLEVEL
 	default "0"
 	help
 	  Number of jobs to run simultaneously.  If 0, determine
-	  automatically according to number of CPUs on the host
-	  system.
+	  automatically according to number of CPUs on the host system.
 
 config BR2_CCACHE
 	bool "Enable compiler cache"
 	help
-	  This option will enable the use of ccache, a compiler
-	  cache. It will cache the result of previous builds to speed
-	  up future builds. By default, the cache is stored in
+	  This option will enable the use of ccache, a compiler cache.
+	  It will cache the result of previous builds to speed up future
+	  builds. By default, the cache is stored in
 	  $HOME/.buildroot-ccache.
 
 	  Note that Buildroot does not try to invalidate the cache
-	  contents when the compiler changes in an incompatible
-	  way. Therefore, if you make a change to the compiler version
-	  and/or configuration, you are responsible for purging the
-	  ccache cache by removing the $HOME/.buildroot-ccache
-	  directory.
+	  contents when the compiler changes in an incompatible way.
+	  Therefore, if you make a change to the compiler version and/or
+	  configuration, you are responsible for purging the ccache
+	  cache by removing the $HOME/.buildroot-ccache directory.
 
 if BR2_CCACHE
 
@@ -310,16 +309,19 @@ config BR2_CCACHE_DIR
 config BR2_CCACHE_INITIAL_SETUP
 	string "Compiler cache initial setup"
 	help
-	  Initial ccache settings to apply, such as --max-files or --max-size.
+	  Initial ccache settings to apply, such as --max-files or
+	  --max-size.
 
-	  For example, if your project is known to require more space than the
-	  default max cache size, then you might want to increase the cache size
-	  to a suitable amount using the -M (--max-size) option.
+	  For example, if your project is known to require more space
+	  than the default max cache size, then you might want to
+	  increase the cache size to a suitable amount using the -M
+	  (--max-size) option.
 
-	  The string you specify here is passed verbatim to ccache.  Refer to
-	  ccache documentation for more details.
+	  The string you specify here is passed verbatim to ccache.
+	  Refer to ccache documentation for more details.
 
-	  These initial settings are applied after ccache has been compiled.
+	  These initial settings are applied after ccache has been
+	  compiled.
 
 config BR2_CCACHE_USE_BASEDIR
 	bool "Use relative paths"
@@ -328,25 +330,25 @@ config BR2_CCACHE_USE_BASEDIR
 	  Allow ccache to convert absolute paths within the output
 	  directory into relative paths.
 
-	  During the build, many -I include directives are given with
-	  an absolute path. These absolute paths end up in the hashes
-	  that are computed by ccache. Therefore, when you build from a
-	  different directory, the hash will be different and the
-	  cached object will not be used.
+	  During the build, many -I include directives are given with an
+	  absolute path. These absolute paths end up in the hashes that
+	  are computed by ccache. Therefore, when you build from a
+	  different directory, the hash will be different and the cached
+	  object will not be used.
 
 	  To improve cache performance, set this option to y. This
 	  allows ccache to rewrite absolute paths within the output
-	  directory into relative paths. Note that only paths within
-	  the output directory will be rewritten; therefore, if you
-	  change BR2_HOST_DIR to point outside the output directory and
+	  directory into relative paths. Note that only paths within the
+	  output directory will be rewritten; therefore, if you change
+	  BR2_HOST_DIR to point outside the output directory and
 	  subsequently move it to a different location, this will lead
 	  to cache misses.
 
 	  This option has as a result that the debug information in the
 	  object files also has only relative paths. Therefore, make
 	  sure you cd to the build directory before starting gdb. See
-	  the section "COMPILING IN DIFFERENT DIRECTORIES" in the
-	  ccache manual for more information.
+	  the section "COMPILING IN DIFFERENT DIRECTORIES" in the ccache
+	  manual for more information.
 
 endif
 
@@ -400,11 +402,11 @@ choice
 config BR2_DEBUG_1
 	bool "debug level 1"
 	help
-	  Debug level 1 produces minimal information, enough
-	  for making backtraces in parts of the program that
-	  you don't plan to debug. This includes descriptions
-	  of functions and external variables, but no information
-	  about local variables and no line numbers.
+	  Debug level 1 produces minimal information, enough for making
+	  backtraces in parts of the program that you don't plan to
+	  debug. This includes descriptions of functions and external
+	  variables, but no information about local variables and no
+	  line numbers.
 
 config BR2_DEBUG_2
 	bool "debug level 2"
@@ -414,9 +416,9 @@ config BR2_DEBUG_2
 config BR2_DEBUG_3
 	bool "debug level 3"
 	help
-	  Level 3 includes extra information, such as all the
-	  macro definitions present in the program. Some debuggers
-	  support macro expansion when you use -g3.
+	  Level 3 includes extra information, such as all the macro
+	  definitions present in the program. Some debuggers support
+	  macro expansion when you use -g3.
 endchoice
 endif
 
@@ -429,16 +431,15 @@ config BR2_STRIP_strip
 	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
-	  stripped using the normal 'strip' command. This allows to
-	  save space, mainly by removing debugging symbols. Debugging
-	  symbols on the target are needed for native debugging, but
-	  not when remote debugging is used.
+	  stripped using the normal 'strip' command. This allows to save
+	  space, mainly by removing debugging symbols. Debugging symbols
+	  on the target are needed for native debugging, but not when
+	  remote debugging is used.
 
 config BR2_STRIP_none
 	bool "none"
 	help
-	  Do not strip binaries and libraries in the target
-	  filesystem.
+	  Do not strip binaries and libraries in the target filesystem.
 endchoice
 
 config BR2_STRIP_EXCLUDE_FILES
@@ -446,19 +447,19 @@ config BR2_STRIP_EXCLUDE_FILES
 	depends on !BR2_STRIP_none
 	default ""
 	help
-	  You may specify a space-separated list of binaries and libraries
-	  here that should not be stripped on the target.
+	  You may specify a space-separated list of binaries and
+	  libraries here that should not be stripped on the target.
 
 config BR2_STRIP_EXCLUDE_DIRS
 	string "directories that should be skipped when stripping"
 	depends on !BR2_STRIP_none
 	default ""
 	help
-	  You may specify a space-separated list of directories that should
-	  be skipped when stripping. Binaries and libraries in these
-	  directories will not be touched.
-	  The directories should be specified relative to the target directory,
-	  without leading slash.
+	  You may specify a space-separated list of directories that
+	  should be skipped when stripping. Binaries and libraries in
+	  these directories will not be touched.  The directories should
+	  be specified relative to the target directory, without leading
+	  slash.
 
 choice
 	prompt "gcc optimization level"
@@ -474,64 +475,67 @@ config BR2_OPTIMIZE_0
 config BR2_OPTIMIZE_1
 	bool "optimization level 1"
 	help
-	  Optimize. Optimizing compilation takes somewhat more time,
-	  and a lot more memory for a large function. With -O, the
-	  compiler tries to reduce code size and execution time,
-	  without performing any optimizations that take a great deal
-	  of compilation time. -O turns on the following optimization
+	  Optimize. Optimizing compilation takes somewhat more time, and
+	  a lot more memory for a large function. With -O, the compiler
+	  tries to reduce code size and execution time, without
+	  performing any optimizations that take a great deal of
+	  compilation time. -O turns on the following optimization
 	  flags: -fdefer-pop -fdelayed-branch -fguess-branch-probability
 	  -fcprop-registers -floop-optimize -fif-conversion
 	  -fif-conversion2 -ftree-ccp -ftree-dce -ftree-dominator-opts
 	  -ftree-dse -ftree-ter -ftree-lrs -ftree-sra -ftree-copyrename
-	  -ftree-fre -ftree-ch -funit-at-a-time -fmerge-constants
-	  -O also turns on -fomit-frame-pointer on machines where doing
-	  so does not interfere with debugging.
+	  -ftree-fre -ftree-ch -funit-at-a-time -fmerge-constants. -O
+	  also turns on -fomit-frame-pointer on machines where doing so
+	  does not interfere with debugging.
 
 config BR2_OPTIMIZE_2
 	bool "optimization level 2"
 	help
-	  Optimize even more. GCC performs nearly all supported optimizations
-	  that do not involve a space-speed tradeoff. The compiler does not
-	  perform loop unrolling or function inlining when you specify -O2.
-	  As compared to -O, this option increases both compilation time and
-	  the performance of the generated code. -O2 turns on all optimization
-	  flags specified by -O. It also turns on the following optimization
-	  flags: -fthread-jumps -fcrossjumping -foptimize-sibling-calls
+	  Optimize even more. GCC performs nearly all supported
+	  optimizations that do not involve a space-speed tradeoff. The
+	  compiler does not perform loop unrolling or function inlining
+	  when you specify -O2.  As compared to -O, this option
+	  increases both compilation time and the performance of the
+	  generated code. -O2 turns on all optimization flags specified
+	  by -O. It also turns on the following optimization flags:
+	  -fthread-jumps -fcrossjumping -foptimize-sibling-calls
 	  -fcse-follow-jumps -fcse-skip-blocks -fgcse  -fgcse-lm
-	  -fexpensive-optimizations -fstrength-reduce -frerun-cse-after-loop
-	  -frerun-loop-opt -fcaller-saves -fpeephole2 -fschedule-insns
-	  -fschedule-insns2 -fsched-interblock -fsched-spec -fregmove
-	  -fstrict-aliasing -fdelete-null-pointer-checks -freorder-blocks
-	  -freorder-functions -falign-functions -falign-jumps -falign-loops
-	  -falign-labels -ftree-vrp -ftree-pre
-	  Please note the warning under -fgcse about invoking -O2 on programs
+	  -fexpensive-optimizations -fstrength-reduce
+	  -frerun-cse-after-loop -frerun-loop-opt -fcaller-saves
+	  -fpeephole2 -fschedule-insns -fschedule-insns2
+	  -fsched-interblock -fsched-spec -fregmove -fstrict-aliasing
+	  -fdelete-null-pointer-checks -freorder-blocks
+	  -freorder-functions -falign-functions -falign-jumps
+	  -falign-loops -falign-labels -ftree-vrp -ftree-pre. Please
+	  note the warning under -fgcse about invoking -O2 on programs
 	  that use computed gotos.
 
 config BR2_OPTIMIZE_3
 	bool "optimization level 3"
 	help
-	  Optimize yet more. -O3 turns on all optimizations specified by -O2
-	  and also turns on the -finline-functions, -funswitch-loops and
-	  -fgcse-after-reload options.
+	  Optimize yet more. -O3 turns on all optimizations specified by
+	  -O2 and also turns on the -finline-functions, -funswitch-loops
+	  and -fgcse-after-reload options.
 
 config BR2_OPTIMIZE_G
 	bool "optimize for debugging"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  Optimize for debugging. This enables optimizations that do not
-	  interfere with debugging. It should be the optimization level of
-	  choice for the standard edit-compile-debug cycle, offering a
-	  reasonable level of optimization while maintaining fast compilation
-	  and a good debugging experience.
+	  interfere with debugging. It should be the optimization level
+	  of choice for the standard edit-compile-debug cycle, offering
+	  a reasonable level of optimization while maintaining fast
+	  compilation and a good debugging experience.
 
 config BR2_OPTIMIZE_S
 	bool "optimize for size"
 	help
-	  Optimize for size. -Os enables all -O2 optimizations that do not
-	  typically increase code size. It also performs further optimizations
-	  designed to reduce code size. -Os disables the following optimization
-	  flags: -falign-functions -falign-jumps -falign-loops -falign-labels
-	  -freorder-blocks -freorder-blocks-and-partition -fprefetch-loop-arrays
+	  Optimize for size. -Os enables all -O2 optimizations that do
+	  not typically increase code size. It also performs further
+	  optimizations designed to reduce code size. -Os disables the
+	  following optimization flags: -falign-functions -falign-jumps
+	  -falign-loops -falign-labels -freorder-blocks
+	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
 
 endchoice
@@ -543,13 +547,13 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	help
-	  This option will enable the use of google breakpad, a
-	  library and tool suite that allows you to distribute an
-	  application to users with compiler-provided debugging
-	  information removed, record crashes in compact "minidump"
-	  files, send them back to your server and produce C and C++
-	  stack traces from these minidumps.  Breakpad can also write
-	  minidumps on request for programs that have not crashed.
+	  This option will enable the use of google breakpad, a library
+	  and tool suite that allows you to distribute an application to
+	  users with compiler-provided debugging information removed,
+	  record crashes in compact "minidump" files, send them back to
+	  your server and produce C and C++ stack traces from these
+	  minidumps.  Breakpad can also write minidumps on request for
+	  programs that have not crashed.
 
 if BR2_GOOGLE_BREAKPAD_ENABLE
 
@@ -577,12 +581,13 @@ choice
 	  Enable stack smashing protection support using GCC's
 	  -fstack-protector option family.
 
-	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  See
+	  http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
 
-	  Note that this requires the toolchain to have SSP
-	  support. This is always the case for glibc and eglibc
-	  toolchain, but is optional in uClibc toolchains.
+	  Note that this requires the toolchain to have SSP support.
+	  This is always the case for glibc and eglibc toolchain, but is
+	  optional in uClibc toolchains.
 
 config BR2_SSP_NONE
 	bool "None"
@@ -630,20 +635,19 @@ choice
 	help
 	  Select the type of libraries you want to use on the target.
 
-	  The default is to build dynamic libraries and use those on
-	  the target filesystem, except when the architecture and/or
-	  the selected binary format does not support shared
-	  libraries.
+	  The default is to build dynamic libraries and use those on the
+	  target filesystem, except when the architecture and/or the
+	  selected binary format does not support shared libraries.
 
 config BR2_STATIC_LIBS
 	bool "static only"
 	help
-	  Build and use only static libraries. No shared libraries
-	  will be instaled on the target. This potentially increases
-	  your code size and should only be used if you know what you
-	  are doing. Note that some packages may not be available when
-	  this option is enabled, due to their need for dynamic
-	  library support.
+	  Build and use only static libraries. No shared libraries will
+	  be instaled on the target. This potentially increases your
+	  code size and should only be used if you know what you are
+	  doing. Note that some packages may not be available when this
+	  option is enabled, due to their need for dynamic library
+	  support.
 
 config BR2_SHARED_LIBS
 	bool "shared only"
@@ -669,29 +673,30 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	default "$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
-	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,
-	  which allows to tell Buildroot to use an existing directory
-	  as the source directory for a particular package. See the
-	  Buildroot documentation for more details on this feature.
+	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which
+	  allows to tell Buildroot to use an existing directory as the
+	  source directory for a particular package. See the Buildroot
+	  documentation for more details on this feature.
 
 config BR2_GLOBAL_PATCH_DIR
 	string "global patch directories"
 	help
-	  You may specify a space separated list of one or more directories
-	  containing global package patches. For a specific version
-	  <packageversion> of a specific package <packagename>, patches are
-	  applied as follows:
+	  You may specify a space separated list of one or more
+	  directories containing global package patches. For a specific
+	  version <packageversion> of a specific package <packagename>,
+	  patches are applied as follows:
 
-	  First, the default Buildroot patch set for the package is applied
-	  from the package's directory in Buildroot.
+	  First, the default Buildroot patch set for the package is
+	  applied from the package's directory in Buildroot.
 
 	  Then for every directory - <global-patch-dir> - that exists in
 	  BR2_GLOBAL_PATCH_DIR, if the directory
-	  <global-patch-dir>/<packagename>/<packageversion>/ exists, then all
-	  *.patch files in this directory will be applied.
+	  <global-patch-dir>/<packagename>/<packageversion>/ exists,
+	  then all *.patch files in this directory will be applied.
 
-	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
-	  then all *.patch files in the directory will be applied.
+	  Otherwise, if the directory <global-patch-dir>/<packagename>
+	  exists, then all *.patch files in the directory will be
+	  applied.
 
 menu "Advanced"
 
@@ -700,13 +705,13 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	default y
 	help
 	  By default, when this option is disabled, when the Buildroot
-	  cross-compiler will encounter an unsafe library or header
-	  path (such as /usr/include, or /usr/lib), the compiler will
-	  display a warning.
+	  cross-compiler will encounter an unsafe library or header path
+	  (such as /usr/include, or /usr/lib), the compiler will display
+	  a warning.
 
-	  By enabling this option, this warning is turned into an
-	  error, which will completely abort the build when such
-	  unsafe paths are encountered.
+	  By enabling this option, this warning is turned into an error,
+	  which will completely abort the build when such unsafe paths
+	  are encountered.
 
 	  Note that this mechanism is available for both the internal
 	  toolchain (through gcc and binutils patches) and external
-- 
2.1.4
