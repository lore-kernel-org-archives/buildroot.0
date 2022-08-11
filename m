Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD9FC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEDE6108D;
	Thu, 11 Aug 2022 11:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EEDE6108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8PDj1_Xix0g; Thu, 11 Aug 2022 11:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E0760F58;
	Thu, 11 Aug 2022 11:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E0760F58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D17E1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFF54032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFF54032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXvkWQnZ7keG for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:45:33 +0000 (UTC)
X-Greylist: delayed 12:06:53 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 723834023B
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 723834023B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:45:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3F0C531E00C3; Thu, 11 Aug 2022 13:45:29 +0200 (CEST)
Date: Thu, 11 Aug 2022 13:45:29 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YvTr2e/Y0o128SWs@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1660218330; bh=n7t7JmMnphAseA7T3w3CQFyGli7+VKpm89K0ga+QC5w=;
 h=Date:From:To:Subject:From;
 b=MphjY9mKuiLQj52SaTtz2DzB0ga0T4NCcJMa+riAipIne8zdEVIJn9NRSpcevz7E8
 727jehIz5Edl9BhLhVGOLSeSdNux/q973TBxpJ7lpSnnLdioKbNVuJGm38zJaLwRIS
 CmeWiDFz2O0NRRKV6Sop5o8sMmsWTCTBiiaH37mFKldWNuurxx2Kfxtk4Vl3I1ZuO+
 jV7NsuDpy/1Ip0PxND/o2/jFkHKuEVqqfs0qyZm7B6Psfr01xBqdfunsQ4EvSoqOst
 FOtJwg2VzYp+1lyIvzG/VgjNSDT7CgQD+jTOrsvB5L/tSNaQRJxGgy3zQ8tKxFrzY0
 cw1MwbaE8LtoQ==
Subject: [Buildroot] [PATCH 1/2] package/binutils: add version 2.39
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0002-poison-system-directories.patch got rebased.
Patch 0004+0005 is upstreamed and got removed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/2.39/0001-sh-conf.patch      |  48 +++
 .../2.39/0002-poison-system-directories.patch | 298 ++++++++++++++++++
 ...or1k-fix-building-with-gcc-version-5.patch |  50 +++
 package/binutils/Config.in.host               |   4 +
 package/binutils/binutils.hash                |   1 +
 5 files changed, 401 insertions(+)
 create mode 100644 package/binutils/2.39/0001-sh-conf.patch
 create mode 100644 package/binutils/2.39/0002-poison-system-directories.patch
 create mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch

diff --git a/package/binutils/2.39/0001-sh-conf.patch b/package/binutils/2.39/0001-sh-conf.patch
new file mode 100644
index 0000000000..fcc597e4d9
--- /dev/null
+++ b/package/binutils/2.39/0001-sh-conf.patch
@@ -0,0 +1,48 @@
+From 33f3c1f804efc2e4f97849081589efb70cda31e5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 3dd206525a7..6881ce632f5 100755
+--- a/configure
++++ b/configure
+@@ -3892,7 +3892,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 797a624621e..1f9256bbf18 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1175,7 +1175,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.31.1
+
diff --git a/package/binutils/2.39/0002-poison-system-directories.patch b/package/binutils/2.39/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..1d9447b5c2
--- /dev/null
+++ b/package/binutils/2.39/0002-poison-system-directories.patch
@@ -0,0 +1,298 @@
+From 4d8705ddb55897e8a74b617ab95736d520d9e1ea Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+
+Patch originally created by Mark Hatle, forward-ported to
+binutils 2.21 by Scott Garman.
+
+purpose:  warn for uses of system directories when cross linking
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * ld.h (args_type): Add error_poison_system_directories.
+    * ld.texinfo (--error-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.error_poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.error_poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --error-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+    ld/
+    * config.in: Regenerate.
+    * ld.h (args_type): Add poison_system_directories.
+    * ld.texinfo (--no-poison-system-directories): Document.
+    * ldfile.c (ldfile_add_library_path): Check
+    command_line.poison_system_directories.
+    * ldmain.c (main): Initialize
+    command_line.poison_system_directories.
+    * lexsup.c (enum option_values): Add
+    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+    (ld_options): Add --no-poison-system-directories.
+    (parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+    Merge from Sourcery G++ binutils 2.17:
+
+    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+    ld/
+    * configure.ac (--enable-poison-system-directories): New option.
+    * configure, config.in: Regenerate.
+    * ldfile.c (ldfile_add_library_path): If
+    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texi      | 12 ++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff -Nur binutils-2.39.orig/ld/config.in binutils-2.39/ld/config.in
+--- binutils-2.39.orig/ld/config.in	2022-08-05 11:56:56.000000000 +0200
++++ binutils-2.39/ld/config.in	2022-08-11 13:00:55.310472243 +0200
+@@ -55,6 +55,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff -Nur binutils-2.39.orig/ld/configure binutils-2.39/ld/configure
+--- binutils-2.39.orig/ld/configure	2022-08-05 11:56:54.000000000 +0200
++++ binutils-2.39/ld/configure	2022-08-11 13:00:55.370470806 +0200
+@@ -836,6 +836,7 @@
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1514,6 +1515,8 @@
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15370,7 +15373,18 @@
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
+ 
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
+ 
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+diff -Nur binutils-2.39.orig/ld/configure.ac binutils-2.39/ld/configure.ac
+--- binutils-2.39.orig/ld/configure.ac	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/configure.ac	2022-08-11 13:00:55.370470806 +0200
+@@ -102,6 +102,16 @@
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++         AS_HELP_STRING([--enable-poison-system-directories],
++                [warn for use of native system library directories]),,
++         [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++       [1],
++       [Define to warn for use of native system library directories])
++fi
++
+ dnl Use --enable-gold to decide if this linker should be the default.
+ dnl "install_as_default" is set to false if gold is the default linker.
+ dnl "installed_linker" is the installed BFD linker name.
+diff -Nur binutils-2.39.orig/ld/ldfile.c binutils-2.39/ld/ldfile.c
+--- binutils-2.39.orig/ld/ldfile.c	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/ldfile.c	2022-08-11 13:00:55.394470231 +0200
+@@ -117,6 +117,23 @@
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
+   else
+     new_dirs->name = xstrdup (name);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (command_line.poison_system_directories
++  && ((!strncmp (name, "/lib", 4))
++      || (!strncmp (name, "/usr/lib", 8))
++      || (!strncmp (name, "/usr/local/lib", 14))
++      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++   {
++     if (command_line.error_poison_system_directories)
++       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++     else
++       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++            "cross-compilation\n"), name);
++   }
++#endif
++
+ }
+ 
+ /* Try to open a BFD for a lang_input_statement.  */
+diff -Nur binutils-2.39.orig/ld/ld.h binutils-2.39/ld/ld.h
+--- binutils-2.39.orig/ld/ld.h	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/ld.h	2022-08-11 13:00:55.382470519 +0200
+@@ -162,6 +162,14 @@
+      in the linker script.  */
+   bool force_group_allocation;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bool poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bool error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff -Nur binutils-2.39.orig/ld/ldlex.h binutils-2.39/ld/ldlex.h
+--- binutils-2.39.orig/ld/ldlex.h	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/ldlex.h	2022-08-11 13:03:35.462636396 +0200
+@@ -164,6 +164,8 @@
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_WARN_EXECSTACK,
+   OPTION_NO_WARN_EXECSTACK,
+   OPTION_WARN_RWX_SEGMENTS,
+diff -Nur binutils-2.39.orig/ld/ldmain.c binutils-2.39/ld/ldmain.c
+--- binutils-2.39.orig/ld/ldmain.c	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/ldmain.c	2022-08-11 13:00:55.402470040 +0200
+@@ -321,6 +321,8 @@
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff -Nur binutils-2.39.orig/ld/ld.texi binutils-2.39/ld/ld.texi
+--- binutils-2.39.orig/ld/ld.texi	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/ld.texi	2022-08-11 13:02:44.627853889 +0200
+@@ -2936,6 +2936,18 @@
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
+ 
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
++
+ @kindex --package-metadata=@var{JSON}
+ @item --package-metadata=@var{JSON}
+ Request the creation of a @code{.note.package} ELF note section.  The
+diff -Nur binutils-2.39.orig/ld/lexsup.c binutils-2.39/ld/lexsup.c
+--- binutils-2.39.orig/ld/lexsup.c	2022-07-08 11:46:48.000000000 +0200
++++ binutils-2.39/ld/lexsup.c	2022-08-11 13:00:55.434469274 +0200
+@@ -608,6 +608,14 @@
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
+     TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -620,6 +628,7 @@
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1679,6 +1688,14 @@
+ 	  }
+ 	  break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = false;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = true;
++	  break;
++
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1824,6 +1841,10 @@
+       command_line.soname = NULL;
+     }
+ 
++  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
++  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
++    command_line.error_poison_system_directories = true;
++
+   while (ingroup)
+     {
+       einfo (_("%P: missing --end-group; added as last command line option\n"));
+-- 
+2.31.1
diff --git a/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..bfd531b818
--- /dev/null
+++ b/package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From ef4ba1da823e8366ea4f126f50885a44ebf4dcf0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.31.1
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9fa0cc4e8d..dec00d3e2e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -21,6 +21,9 @@ config BR2_BINUTILS_VERSION_2_37_X
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38"
 
+config BR2_BINUTILS_VERSION_2_39_X
+	bool "binutils 2.39"
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
@@ -33,6 +36,7 @@ config BR2_BINUTILS_VERSION
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
+	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
 
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index e98cb85275..7acf6fb52d 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
+sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
