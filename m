Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8000EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32AE140A18;
	Sat, 23 Apr 2022 14:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeDNBRNEifwP; Sat, 23 Apr 2022 14:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B3F840915;
	Sat, 23 Apr 2022 14:12:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8E71BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16BE140477
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQQKUBKqOXj8 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A8F3400F8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DDC41812D4; Sat, 23 Apr 2022 14:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:07:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e93cec6d3c6bec31ab264812f23da7596f749f0f
X-Git-Newrev: 5706080f69402cf2689d8a38cde38c2b9cc01183
X-Patchwork-Hint: ignore
Message-Id: <20220423140153.DDC41812D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: remove 2.35.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5706080f69402cf2689d8a38cde38c2b9cc01183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   6 +
 package/binutils/2.35.2/0001-sh-conf.patch         |  48 --
 .../2.35.2/0002-poison-system-directories.patch    | 306 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch |  59 ---
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 -----------
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 ---
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 ---------------------
 ...lf32-or1k-fix-building-with-gcc-version-5.patch |  50 ---
 ...-relative-relocation-against-dynamic-on-P.patch |  59 ---
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch |  75 ----
 ...low-GOT32-relocations-against-ABS-symbols.patch |  46 --
 package/binutils/Config.in.host                    |   8 -
 package/binutils/binutils.hash                     |   1 -
 13 files changed, 6 insertions(+), 1469 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27f19f14e7..27a4fcd33b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_BINUTILS_VERSION_2_35_X
+	bool "binutils 2.35.x has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.35 has been removed, use a newer version.
+
 config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 	bool "boost versioned layout removed"
 	select BR2_LEGACY
diff --git a/package/binutils/2.35.2/0001-sh-conf.patch b/package/binutils/2.35.2/0001-sh-conf.patch
deleted file mode 100644
index 44d5f4e89a..0000000000
--- a/package/binutils/2.35.2/0001-sh-conf.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ae50e875f4292c99b859cded1d036e401b6ddaec Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:38:13 +0100
-Subject: [PATCH] sh-conf
-
-Likewise, binutils has no idea about any of these new targets either, so we
-fix that up too.. now we're able to actually build a real toolchain for
-sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
-inept targets than that one, really. Go look, I promise).
-
-[Romain: rebase on top of 2.32]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 54d0339ab9e..c2f51ffcebb 100755
---- a/configure
-+++ b/configure
-@@ -3937,7 +3937,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index a910c4fd6ba..a93d93c81c3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1178,7 +1178,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.25.4
-
diff --git a/package/binutils/2.35.2/0002-poison-system-directories.patch b/package/binutils/2.35.2/0002-poison-system-directories.patch
deleted file mode 100644
index b77a5e1a66..0000000000
--- a/package/binutils/2.35.2/0002-poison-system-directories.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From db405d1bc5607892ddb25433354b46d78e23b343 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:45:38 +0100
-Subject: [PATCH] poison-system-directories
-
-Patch adapted to binutils 2.23.2 and extended to use
-BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
-
-[Romain: rebase on top of 2.33.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Gustavo: adapt to binutils 2.25]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Upstream-Status: Inappropriate [distribution: codesourcery]
-
-Patch originally created by Mark Hatle, forward-ported to
-binutils 2.21 by Scott Garman.
-
-purpose:  warn for uses of system directories when cross linking
-
-Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
-
-2008-07-02  Joseph Myers  <joseph@codesourcery.com>
-
-    ld/
-    * ld.h (args_type): Add error_poison_system_directories.
-    * ld.texinfo (--error-poison-system-directories): Document.
-    * ldfile.c (ldfile_add_library_path): Check
-    command_line.error_poison_system_directories.
-    * ldmain.c (main): Initialize
-    command_line.error_poison_system_directories.
-    * lexsup.c (enum option_values): Add
-    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
-    (ld_options): Add --error-poison-system-directories.
-    (parse_args): Handle new option.
-
-2007-06-13  Joseph Myers  <joseph@codesourcery.com>
-
-    ld/
-    * config.in: Regenerate.
-    * ld.h (args_type): Add poison_system_directories.
-    * ld.texinfo (--no-poison-system-directories): Document.
-    * ldfile.c (ldfile_add_library_path): Check
-    command_line.poison_system_directories.
-    * ldmain.c (main): Initialize
-    command_line.poison_system_directories.
-    * lexsup.c (enum option_values): Add
-    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
-    (ld_options): Add --no-poison-system-directories.
-    (parse_args): Handle new option.
-
-2007-04-20  Joseph Myers  <joseph@codesourcery.com>
-
-    Merge from Sourcery G++ binutils 2.17:
-
-    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
-    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
-    ld/
-    * configure.ac (--enable-poison-system-directories): New option.
-    * configure, config.in: Regenerate.
-    * ldfile.c (ldfile_add_library_path): If
-    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
-    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
----
- ld/config.in    |  3 +++
- ld/configure    | 14 ++++++++++++++
- ld/configure.ac | 10 ++++++++++
- ld/ld.h         |  8 ++++++++
- ld/ld.texi      | 12 ++++++++++++
- ld/ldfile.c     | 17 +++++++++++++++++
- ld/ldlex.h      |  2 ++
- ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 21 +++++++++++++++++++++
- 9 files changed, 89 insertions(+)
-
-diff --git a/ld/config.in b/ld/config.in
-index 2f4e5ea33e3..8fbb29682b2 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -40,6 +40,9 @@
-    language is requested. */
- #undef ENABLE_NLS
- 
-+/* Define to warn for use of native system library directories */
-+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
-+
- /* Additional extension a shared object might have. */
- #undef EXTRA_SHLIB_EXTENSION
- 
-diff --git a/ld/configure b/ld/configure
-index 6be5280621f..d62e7b12382 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1493,6 +1494,8 @@ Optional Features:
-   --disable-largefile     omit support for large files
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15814,7 +15817,18 @@ else
- fi
- 
- 
-+# Check whether --enable-poison-system-directories was given.
-+if test "${enable_poison_system_directories+set}" = set; then :
-+  enableval=$enable_poison_system_directories;
-+else
-+  enable_poison_system_directories=no
-+fi
-+
-+if test "x${enable_poison_system_directories}" = "xyes"; then
- 
-+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
-+
-+fi
- 
- # Check whether --enable-got was given.
- if test "${enable_got+set}" = set; then :
-diff --git a/ld/configure.ac b/ld/configure.ac
-index 172398ff847..b77f8510ca6 100644
---- a/ld/configure.ac
-+++ b/ld/configure.ac
-@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
- AC_SUBST(TARGET_SYSTEM_ROOT)
- AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
- 
-+AC_ARG_ENABLE([poison-system-directories],
-+         AS_HELP_STRING([--enable-poison-system-directories],
-+                [warn for use of native system library directories]),,
-+         [enable_poison_system_directories=no])
-+if test "x${enable_poison_system_directories}" = "xyes"; then
-+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
-+       [1],
-+       [Define to warn for use of native system library directories])
-+fi
-+
- dnl Use --enable-gold to decide if this linker should be the default.
- dnl "install_as_default" is set to false if gold is the default linker.
- dnl "installed_linker" is the installed BFD linker name.
-diff --git a/ld/ld.h b/ld/ld.h
-index 1790dc81a66..73f832eb169 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -166,6 +166,14 @@ typedef struct
-      in the linker script.  */
-   bfd_boolean force_group_allocation;
- 
-+  /* If TRUE (the default) warn for uses of system directories when
-+     cross linking.  */
-+  bfd_boolean poison_system_directories;
-+
-+  /* If TRUE (default FALSE) give an error for uses of system
-+     directories when cross linking instead of a warning.  */
-+  bfd_boolean error_poison_system_directories;
-+
-   /* Big or little endian as set on command line.  */
-   enum endian_enum endian;
- 
-diff --git a/ld/ld.texi b/ld/ld.texi
-index 2a93e9456ac..3eeb70607fd 100644
---- a/ld/ld.texi
-+++ b/ld/ld.texi
-@@ -2655,6 +2655,18 @@ string identifying the original linked file does not change.
- 
- Passing @code{none} for @var{style} disables the setting from any
- @code{--build-id} options earlier on the command line.
-+
-+@kindex --no-poison-system-directories
-+@item --no-poison-system-directories
-+Do not warn for @option{-L} options using system directories such as
-+@file{/usr/lib} when cross linking.  This option is intended for use
-+in chroot environments when such directories contain the correct
-+libraries for the target system rather than the host.
-+
-+@kindex --error-poison-system-directories
-+@item --error-poison-system-directories
-+Give an error instead of a warning for @option{-L} options using
-+system directories when cross linking.
- @end table
- 
- @c man end
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index e39170b5d94..fadc248a140 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
-     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
-   else
-     new_dirs->name = xstrdup (name);
-+
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
-+  if (command_line.poison_system_directories
-+  && ((!strncmp (name, "/lib", 4))
-+      || (!strncmp (name, "/usr/lib", 8))
-+      || (!strncmp (name, "/usr/local/lib", 14))
-+      || (!strncmp (name, "/usr/X11R6/lib", 14))))
-+   {
-+     if (command_line.error_poison_system_directories)
-+       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
-+            "cross-compilation\n"), name);
-+     else
-+       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
-+            "cross-compilation\n"), name);
-+   }
-+#endif
-+
- }
- 
- /* Try to open a BFD for a lang_input_statement.  */
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 5ea083ebeb3..417f9b858ce 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -155,6 +155,8 @@ enum option_values
-   OPTION_NON_CONTIGUOUS_REGIONS,
-   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
-   OPTION_DEPENDENCY_FILE,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 08be9030cb5..92dc16399eb 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -321,6 +321,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = TRUE;
-   command_line.warn_search_mismatch = TRUE;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = TRUE;
-+  command_line.error_poison_system_directories = FALSE;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 6cab41cf5df..c497f36b148 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -572,6 +572,14 @@ static const struct ld_option ld_options[] =
-   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
-     '\0', NULL, N_("Do not show discarded sections in map file output"),
-     TWO_DASHES },
-+  { {"no-poison-system-directories", no_argument, NULL,
-+    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Do not warn for -L options using system directories"),
-+    TWO_DASHES },
-+  { {"error-poison-system-directories", no_argument, NULL,
-+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
-+    '\0', NULL, N_("Give an error for -L options using system directories"),
-+    TWO_DASHES },
- };
- 
- #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -584,6 +592,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1591,6 +1600,14 @@ parse_args (unsigned argc, char **argv)
- 	  }
- 	  break;
- 
-+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.poison_system_directories = FALSE;
-+	  break;
-+
-+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.error_poison_system_directories = TRUE;
-+	  break;
-+
- 	case OPTION_PUSH_STATE:
- 	  input_flags.pushed = xmemdup (&input_flags,
- 					sizeof (input_flags),
-@@ -1681,6 +1698,10 @@ parse_args (unsigned argc, char **argv)
-       command_line.soname = NULL;
-     }
- 
-+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
-+    command_line.error_poison_system_directories = TRUE;
-+
-   while (ingroup)
-     {
-       einfo (_("%P: missing --end-group; added as last command line option\n"));
--- 
-2.25.4
-
diff --git a/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
deleted file mode 100644
index 81fb6b8518..0000000000
--- a/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From baf313f84b106a5a29f01796afd857e69abf8b08 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:02:14 +0900
-Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
-
-When building protobuf we were seeing the assert failure:
-
-    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
-    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
-    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
-    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
-    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
-    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
-    collect2: error: ld returned 1 exit status
-
-This failure happens while writing out PLT entries, there is a check
-"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
-symbol attributes.  This was failing for symbols that were
-"forced_local" in previous linking code.
-
-The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
-"forced_local" symbols and exclude them from the the PLT.
-
-bfd/ChangeLog:
-
-	PR 27624
-	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
-	condition used to cleanup plt entries to cleanup forced local
-	entries.
-
-Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 7c02d004cc7..bbfa2bfe614 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2568,11 +2568,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+	  || (SYMBOL_CALLS_LOCAL (info, h)
-+	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+	      && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch b/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
deleted file mode 100644
index a4af57d546..0000000000
--- a/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
+++ /dev/null
@@ -1,256 +0,0 @@
-From c67656e248d6dadaa2729975a17c8dd03afe48d0 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:02:15 +0900
-Subject: [PATCH] or1k: Implement relocation R_OR1K_GOT_AHI16 for gotha()
-
-The gotha() relocation mnemonic will be outputted by OpenRISC GCC when
-using the -mcmodel=large option.  This relocation is used along with
-got() to generate 32-bit GOT offsets.  This increases the previous GOT
-offset limit from the previous 16-bit (64K) limit.
-
-This is needed on large binaries where the GOT grows larger than 64k.
-
-bfd/ChangeLog:
-
-	PR 21464
-	* bfd-in2.h: Add BFD_RELOC_OR1K_GOT_AHI16 relocation.
-	* elf32-or1k.c (or1k_elf_howto_table, or1k_reloc_map): Likewise.
-	(or1k_final_link_relocate, or1k_elf_relocate_section,
-	or1k_elf_check_relocs): Likewise.
-	* libbfd.h (bfd_reloc_code_real_names): Likewise.
-	* reloc.c: Likewise.
-
-cpu/ChangeLog:
-
-	PR 21464
-	* or1k.opc (or1k_imm16_relocs, parse_reloc): Define parse logic
-	for gotha() relocation.
-
-include/ChangeLog:
-
-	PR 21464
-	* elf/or1k.h (elf_or1k_reloc_type): Define R_OR1K_GOT_AHI16 number.
-
-opcodes/ChangeLog:
-
-	PR 21464
-	* or1k-asm.c: Regenerate.
-
-gas/ChangeLog:
-
-	PR 21464
-	* testsuite/gas/or1k/reloc-1.s: Add test for new relocation.
-	* testsuite/gas/or1k/reloc-1.d: Add test result for new
-	relocation.
-
-Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
-
-fixup reloc, add tests
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/bfd-in2.h                    |  1 +
- bfd/elf32-or1k.c                 | 21 ++++++++++++++++++++-
- bfd/libbfd.h                     |  1 +
- bfd/reloc.c                      |  2 ++
- cpu/or1k.opc                     |  7 ++++++-
- gas/testsuite/gas/or1k/reloc-1.d |  4 +++-
- gas/testsuite/gas/or1k/reloc-1.s |  4 ++++
- include/elf/or1k.h               |  1 +
- opcodes/or1k-asm.c               |  7 ++++++-
- 9 files changed, 44 insertions(+), 4 deletions(-)
-
-diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index df6f9f45673..ab861395e93 100644
---- a/bfd/bfd-in2.h
-+++ b/bfd/bfd-in2.h
-@@ -5041,6 +5041,7 @@ then it may be truncated to 8 bits.  */
-   BFD_RELOC_OR1K_TLS_TPOFF,
-   BFD_RELOC_OR1K_TLS_DTPOFF,
-   BFD_RELOC_OR1K_TLS_DTPMOD,
-+  BFD_RELOC_OR1K_GOT_AHI16,
- 
- /* H8 elf Relocations.  */
-   BFD_RELOC_H8_DIR16A8,
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index bbfa2bfe614..8e395827123 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -808,6 +808,20 @@ static reloc_howto_type or1k_elf_howto_table[] =
- 	 0,			/* Source Mask.  */
- 	 0x03ffffff,		/* Dest Mask.  */
- 	 TRUE),			/* PC relative offset?  */
-+
-+  HOWTO (R_OR1K_GOT_AHI16,     /* type */
-+	16,                    /* rightshift */
-+	2,                     /* size (0 = byte, 1 = short, 2 = long) */
-+	16,                    /* bitsize */
-+	FALSE,                 /* pc_relative */
-+	0,                     /* bitpos */
-+	complain_overflow_signed, /* complain_on_overflow */
-+	bfd_elf_generic_reloc, /* special_function */
-+	"R_OR1K_GOT_AHI16",    /* name */
-+	FALSE,                 /* partial_inplace */
-+	0,                     /* src_mask */
-+	0xffff,                /* dst_mask */
-+	FALSE),                /* pcrel_offset */
- };
- 
- /* Map BFD reloc types to Or1k ELF reloc types.  */
-@@ -871,6 +885,7 @@ static const struct or1k_reloc_map or1k_reloc_map[] =
-   { BFD_RELOC_OR1K_TLS_IE_LO13,	R_OR1K_TLS_IE_LO13 },
-   { BFD_RELOC_OR1K_SLO13,	R_OR1K_SLO13 },
-   { BFD_RELOC_OR1K_PLTA26,	R_OR1K_PLTA26 },
-+  { BFD_RELOC_OR1K_GOT_AHI16,	R_OR1K_GOT_AHI16 },
- };
- 
- /* tls_type is a mask used to track how each symbol is accessed,
-@@ -1113,6 +1128,7 @@ or1k_final_link_relocate (reloc_howto_type *howto, bfd *input_bfd,
-   switch (howto->type)
-     {
-     case R_OR1K_AHI16:
-+    case R_OR1K_GOT_AHI16:
-     case R_OR1K_GOTOFF_AHI16:
-     case R_OR1K_TLS_IE_AHI16:
-     case R_OR1K_TLS_LE_AHI16:
-@@ -1375,6 +1391,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 	    }
- 	  break;
- 
-+	case R_OR1K_GOT_AHI16:
- 	case R_OR1K_GOT16:
- 	case R_OR1K_GOT_PG21:
- 	case R_OR1K_GOT_LO13:
-@@ -1466,7 +1483,8 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 	    /* The GOT_PG21 and GOT_LO13 relocs are pc-relative,
- 	       while the GOT16 reloc is GOT relative.  */
- 	    relocation = got_base + off;
--	    if (r_type == R_OR1K_GOT16)
-+	    if (r_type == R_OR1K_GOT16
-+		|| r_type == R_OR1K_GOT_AHI16)
- 	      relocation -= got_sym_value;
- 
- 	  /* Addend should be zero.  */
-@@ -1992,6 +2010,7 @@ or1k_elf_check_relocs (bfd *abfd,
- 	    }
- 	  break;
- 
-+	case R_OR1K_GOT_AHI16:
- 	case R_OR1K_GOT16:
- 	case R_OR1K_GOT_PG21:
- 	case R_OR1K_GOT_LO13:
-diff --git a/bfd/libbfd.h b/bfd/libbfd.h
-index b97534fc9fe..795c9b9d27f 100644
---- a/bfd/libbfd.h
-+++ b/bfd/libbfd.h
-@@ -2755,6 +2755,7 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
-   "BFD_RELOC_OR1K_TLS_TPOFF",
-   "BFD_RELOC_OR1K_TLS_DTPOFF",
-   "BFD_RELOC_OR1K_TLS_DTPMOD",
-+  "BFD_RELOC_OR1K_GOT_AHI16",
-   "BFD_RELOC_H8_DIR16A8",
-   "BFD_RELOC_H8_DIR16R8",
-   "BFD_RELOC_H8_DIR24A8",
-diff --git a/bfd/reloc.c b/bfd/reloc.c
-index 9aba84ca81e..1e021febef2 100644
---- a/bfd/reloc.c
-+++ b/bfd/reloc.c
-@@ -6175,6 +6175,8 @@ ENUMX
-   BFD_RELOC_OR1K_GOTPC_HI16
- ENUMX
-   BFD_RELOC_OR1K_GOTPC_LO16
-+ENUMX
-+  BFD_RELOC_OR1K_GOT_AHI16
- ENUMX
-   BFD_RELOC_OR1K_GOT16
- ENUMX
-diff --git a/cpu/or1k.opc b/cpu/or1k.opc
-index f0adcbb00a5..5d20a1f33a7 100644
---- a/cpu/or1k.opc
-+++ b/cpu/or1k.opc
-@@ -193,7 +193,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
-     BFD_RELOC_OR1K_GOT_LO13,
-     BFD_RELOC_UNUSED,
-     BFD_RELOC_UNUSED,
--    BFD_RELOC_UNUSED },
-+    BFD_RELOC_OR1K_GOT_AHI16 },
-   { BFD_RELOC_OR1K_GOTPC_LO16,
-     BFD_RELOC_UNUSED,
-     BFD_RELOC_UNUSED,
-@@ -296,6 +296,11 @@ parse_reloc (const char **strp)
- 	str += 5;
- 	cls = RCLASS_TPOFF;
-       }
-+    else if (strncasecmp (str, "got", 3) == 0)
-+      {
-+	str += 3;
-+	cls = RCLASS_GOT;
-+      }
- 
-     if (strncasecmp (str, "hi(", 3) == 0)
-       {
-diff --git a/gas/testsuite/gas/or1k/reloc-1.d b/gas/testsuite/gas/or1k/reloc-1.d
-index d1bcf5608bb..3a001c4ed99 100644
---- a/gas/testsuite/gas/or1k/reloc-1.d
-+++ b/gas/testsuite/gas/or1k/reloc-1.d
-@@ -68,5 +68,7 @@ OFFSET   TYPE              VALUE
- 000000ec R_OR1K_LO13       x
- 000000f0 R_OR1K_GOT_LO13   x
- 000000f4 R_OR1K_SLO13      x
--
-+000000f8 R_OR1K_GOT_AHI16  x
-+000000fc R_OR1K_GOT_AHI16  x
-+00000100 R_OR1K_GOT_AHI16  x
- 
-diff --git a/gas/testsuite/gas/or1k/reloc-1.s b/gas/testsuite/gas/or1k/reloc-1.s
-index e76abef6532..562609aa869 100644
---- a/gas/testsuite/gas/or1k/reloc-1.s
-+++ b/gas/testsuite/gas/or1k/reloc-1.s
-@@ -74,3 +74,7 @@
- 	l.lbz	r5,po(x)(r3)
- 	l.lbz	r5,gotpo(x)(r3)
- 	l.sb	po(x)(r3),r6
-+
-+	l.movhi	r4,gotha(x)
-+	l.ori	r3,r4,gotha(x)
-+	l.addi	r3,r4,gotha(x)
-diff --git a/include/elf/or1k.h b/include/elf/or1k.h
-index a215ef5c17e..dff37d875f2 100644
---- a/include/elf/or1k.h
-+++ b/include/elf/or1k.h
-@@ -77,6 +77,7 @@ START_RELOC_NUMBERS (elf_or1k_reloc_type)
-   RELOC_NUMBER (R_OR1K_TLS_IE_LO13,   51)
-   RELOC_NUMBER (R_OR1K_SLO13,         52)
-   RELOC_NUMBER (R_OR1K_PLTA26,        53)
-+  RELOC_NUMBER (R_OR1K_GOT_AHI16,     54)
- END_RELOC_NUMBERS (R_OR1K_max)
- 
- #define EF_OR1K_NODELAY (1UL << 0)
-diff --git a/opcodes/or1k-asm.c b/opcodes/or1k-asm.c
-index 5f3c6c74b12..e0c49b3b8cd 100644
---- a/opcodes/or1k-asm.c
-+++ b/opcodes/or1k-asm.c
-@@ -177,7 +177,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
-     BFD_RELOC_OR1K_GOT_LO13,
-     BFD_RELOC_UNUSED,
-     BFD_RELOC_UNUSED,
--    BFD_RELOC_UNUSED },
-+    BFD_RELOC_OR1K_GOT_AHI16 },
-   { BFD_RELOC_OR1K_GOTPC_LO16,
-     BFD_RELOC_UNUSED,
-     BFD_RELOC_UNUSED,
-@@ -280,6 +280,11 @@ parse_reloc (const char **strp)
- 	str += 5;
- 	cls = RCLASS_TPOFF;
-       }
-+    else if (strncasecmp (str, "got", 3) == 0)
-+      {
-+	str += 3;
-+	cls = RCLASS_GOT;
-+      }
- 
-     if (strncasecmp (str, "hi(", 3) == 0)
-       {
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch b/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
deleted file mode 100644
index 82198dd373..0000000000
--- a/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 097b83a1c9c694a14e6081cee034bf24f16875c1 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:02:16 +0900
-Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 overflow failures in presence of
- R_OR1K_GOT_AHI16
-
-Now that we support R_OR1K_GOT_AHI16 we can relax the R_OR1K_GOT16
-overflow validation check if the section has R_OR1K_GOT_AHI16.
-
-We cannot simple disable R_OR1K_GOT16 overflow validation as there will
-still be binaries that will have only R_OR1K_GOT16.  The
-R_OR1K_GOT_AHI16 relocation will only be added by GCC when building with
-the option -mcmodel=large.
-
-This assumes that R_OR1K_GOT_AHI16 will come before R_OR1K_GOT16, which
-is the code pattern that will be emitted by GCC.
-
-bfd/ChangeLog:
-
-	PR 21464
-	* elf32-or1k.c (or1k_elf_relocate_section): Relax R_OR1K_GOT16
-	overflow check if we have R_OR1K_GOT_AHI16 followed by
-	R_OR1K_GOT16.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 8e395827123..9f315bfda99 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -1280,6 +1280,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
-   asection *sgot, *splt;
-   bfd_vma plt_base, got_base, got_sym_value;
-   bfd_boolean ret_val = TRUE;
-+  bfd_boolean saw_gotha = FALSE;
- 
-   if (htab == NULL)
-     return FALSE;
-@@ -1487,6 +1488,16 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 		|| r_type == R_OR1K_GOT_AHI16)
- 	      relocation -= got_sym_value;
- 
-+	    if (r_type == R_OR1K_GOT_AHI16)
-+	      saw_gotha = TRUE;
-+
-+	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
-+	       relocation we assume the code is doing the right thing to avoid
-+	       overflows.  Here we mask the lower 16-bit of the relocation to
-+	       avoid overflow validation failures.  */
-+	    if (r_type == R_OR1K_GOT16 && saw_gotha)
-+	      relocation &= 0xffff;
-+
- 	  /* Addend should be zero.  */
- 	  if (rel->r_addend != 0)
- 	    {
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch b/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
deleted file mode 100644
index c884ab874d..0000000000
--- a/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
+++ /dev/null
@@ -1,500 +0,0 @@
-From c87692eb894b4b86eced7b7ba205f9bf27c2c213 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:02:17 +0900
-Subject: [PATCH] or1k: Support large plt_relocs when generating plt
- entries
-
-The current PLT generation code will generate invalid code when the PLT
-relocation offset exceeds 64k.  This fixes the issue by detecting large
-plt_reloc offsets and generare code sequences to create larger plt
-relocations.
-
-The "large" plt code needs 2 extra instructions to create 32-bit offsets.
-
-bfd/ChangeLog:
-
-	PR 27746
-	* elf32-or1k.c (PLT_ENTRY_SIZE_LARGE, PLT_MAX_INSN_COUNT,
-	OR1K_ADD, OR1K_ORI): New macros to help with plt creation.
-	(elf_or1k_link_hash_table): New field plt_count.
-	(elf_or1k_link_hash_entry): New field plt_index.
-	(elf_or1k_plt_entry_size): New function.
-	(or1k_write_plt_entry): Update to support variable size PLTs.
-	(or1k_elf_finish_dynamic_sections): Use new or1k_write_plt_entry
-	API.
-	(or1k_elf_finish_dynamic_symbol): Update to write large PLTs
-	when needed.
-	(allocate_dynrelocs): Use elf_or1k_plt_entry_size to account for
-	PLT size.
-
-ld/ChangeLog:
-
-	PR 27746
-	testsuite/ld-or1k/or1k.exp (or1kplttests): Add tests for linking
-	along with gotha() relocations.
-	testsuite/ld-or1k/gotha1.dd: New file.
-	testsuite/ld-or1k/gotha1.s: New file.
-	testsuite/ld-or1k/gotha2.dd: New file.
-	testsuite/ld-or1k/gotha2.s: New file
-	testsuite/ld-or1k/pltlib.s (x): Define size to avoid link
-	failure.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c               | 149 ++++++++++++++++++++++++---------
- ld/testsuite/ld-or1k/gotha1.dd |  34 ++++++++
- ld/testsuite/ld-or1k/gotha1.s  |  24 ++++++
- ld/testsuite/ld-or1k/gotha2.dd |  21 +++++
- ld/testsuite/ld-or1k/gotha2.s  |  22 +++++
- ld/testsuite/ld-or1k/or1k.exp  |   8 ++
- ld/testsuite/ld-or1k/pltlib.s  |   1 +
- 7 files changed, 220 insertions(+), 39 deletions(-)
- create mode 100644 ld/testsuite/ld-or1k/gotha1.dd
- create mode 100644 ld/testsuite/ld-or1k/gotha1.s
- create mode 100644 ld/testsuite/ld-or1k/gotha2.dd
- create mode 100644 ld/testsuite/ld-or1k/gotha2.s
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 9f315bfda99..7a14eaa3a46 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -30,10 +30,14 @@
- #define N_ONES(X)	(((bfd_vma)2 << (X)) - 1)
- 
- #define PLT_ENTRY_SIZE 16
-+#define PLT_ENTRY_SIZE_LARGE (6*4)
-+#define PLT_MAX_INSN_COUNT 6
- 
- #define OR1K_MOVHI(D)		(0x18000000 | (D << 21))
- #define OR1K_ADRP(D)		(0x08000000 | (D << 21))
- #define OR1K_LWZ(D,A)		(0x84000000 | (D << 21) | (A << 16))
-+#define OR1K_ADD(D,A,B)		(0xE0000000 | (D << 21) | (A << 16) | (B << 11))
-+#define OR1K_ORI(D,A)		(0xA8000000 | (D << 21) | (A << 16))
- #define OR1K_ORI0(D)		(0xA8000000 | (D << 21))
- #define OR1K_JR(B)		(0x44000000 | (B << 11))
- #define OR1K_NOP		0x15000000
-@@ -907,6 +911,8 @@ struct elf_or1k_link_hash_entry
- {
-   struct elf_link_hash_entry root;
- 
-+  /* For calculating PLT size.  */
-+  bfd_vma plt_index;
-   /* Track type of TLS access.  */
-   unsigned char tls_type;
- };
-@@ -934,9 +940,20 @@ struct elf_or1k_link_hash_table
-   /* Small local sym to section mapping cache.  */
-   struct sym_cache sym_sec;
- 
-+  bfd_vma plt_count;
-   bfd_boolean saw_plta;
- };
- 
-+static size_t
-+elf_or1k_plt_entry_size (bfd_vma plt_index)
-+{
-+  bfd_vma plt_reloc;
-+
-+  plt_reloc = plt_index * sizeof (Elf32_External_Rela);
-+
-+  return (plt_reloc > 0xffff) ? PLT_ENTRY_SIZE_LARGE : PLT_ENTRY_SIZE;
-+}
-+
- /* Get the ELF linker hash table from a link_info structure.  */
- #define or1k_elf_hash_table(p) \
-   (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
-@@ -2224,33 +2241,46 @@ or1k_elf_check_relocs (bfd *abfd,
- }
- 
- static void
--or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insn1,
--		      unsigned insn2, unsigned insn3, unsigned insnj)
-+or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
-+		      unsigned insns[], size_t insn_count)
- {
-   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
--  unsigned insn4;
-+  unsigned output_insns[PLT_MAX_INSN_COUNT];
-+
-+  /* Copy instructions into the output buffer.  */
-+  for (size_t i = 0; i < insn_count; i++)
-+    output_insns[i] = insns[i];
- 
-   /* Honor the no-delay-slot setting.  */
--  if (insn3 == OR1K_NOP)
-+  if (insns[insn_count-1] == OR1K_NOP)
-     {
--      insn4 = insn3;
-+      unsigned slot1, slot2;
-+
-       if (nodelay)
--	insn3 = insnj;
-+	slot1 = insns[insn_count-2], slot2 = insnj;
-       else
--	insn3 = insn2, insn2 = insnj;
-+	slot1 = insnj, slot2 = insns[insn_count-2];
-+
-+      output_insns[insn_count-2] = slot1;
-+      output_insns[insn_count-1] = slot2;
-+      output_insns[insn_count]   = OR1K_NOP;
-     }
-   else
-     {
-+      unsigned slot1, slot2;
-+
-       if (nodelay)
--	insn4 = insnj;
-+	slot1 = insns[insn_count-1], slot2 = insnj;
-       else
--	insn4 = insn3, insn3 = insnj;
-+	slot1 = insnj, slot2 = insns[insn_count-1];
-+
-+      output_insns[insn_count-1] = slot1;
-+      output_insns[insn_count]   = slot2;
-     }
- 
--  bfd_put_32 (output_bfd, insn1, contents);
--  bfd_put_32 (output_bfd, insn2, contents + 4);
--  bfd_put_32 (output_bfd, insn3, contents + 8);
--  bfd_put_32 (output_bfd, insn4, contents + 12);
-+  /* Write out the output buffer.  */
-+  for (size_t i = 0; i < (insn_count+1); i++)
-+    bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
- }
- 
- /* Finish up the dynamic sections.  */
-@@ -2317,7 +2347,8 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
-       splt = htab->root.splt;
-       if (splt && splt->size > 0)
- 	{
--	  unsigned plt0, plt1, plt2;
-+	  unsigned plt[PLT_MAX_INSN_COUNT];
-+	  size_t plt_insn_count = 3;
- 	  bfd_vma got_addr = sgot->output_section->vma + sgot->output_offset;
- 
- 	  /* Note we force 16 byte alignment on the .got, so that
-@@ -2328,27 +2359,27 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
- 	      bfd_vma pc = splt->output_section->vma + splt->output_offset;
- 	      unsigned pa = ((got_addr >> 13) - (pc >> 13)) & 0x1fffff;
- 	      unsigned po = got_addr & 0x1fff;
--	      plt0 = OR1K_ADRP(12) | pa;
--	      plt1 = OR1K_LWZ(15,12) | (po + 8);
--	      plt2 = OR1K_LWZ(12,12) | (po + 4);
-+	      plt[0] = OR1K_ADRP(12) | pa;
-+	      plt[1] = OR1K_LWZ(15,12) | (po + 8);
-+	      plt[2] = OR1K_LWZ(12,12) | (po + 4);
- 	    }
- 	  else if (bfd_link_pic (info))
- 	    {
--	      plt0 = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
--	      plt1 = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
--	      plt2 = OR1K_NOP;
-+	      plt[0] = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
-+	      plt[1] = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
-+	      plt[2] = OR1K_NOP;
- 	    }
- 	  else
- 	    {
- 	      unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
- 	      unsigned lo = got_addr & 0xffff;
--	      plt0 = OR1K_MOVHI(12) | ha;
--	      plt1 = OR1K_LWZ(15,12) | (lo + 8);
--	      plt2 = OR1K_LWZ(12,12) | (lo + 4);
-+	      plt[0] = OR1K_MOVHI(12) | ha;
-+	      plt[1] = OR1K_LWZ(15,12) | (lo + 8);
-+	      plt[2] = OR1K_LWZ(12,12) | (lo + 4);
- 	    }
- 
--	  or1k_write_plt_entry (output_bfd, splt->contents,
--				plt0, plt1, plt2, OR1K_JR(15));
-+	  or1k_write_plt_entry (output_bfd, splt->contents, OR1K_JR(15),
-+				plt, plt_insn_count);
- 
- 	  elf_section_data (splt->output_section)->this_hdr.sh_entsize = 4;
- 	}
-@@ -2391,7 +2422,8 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
- 
-   if (h->plt.offset != (bfd_vma) -1)
-     {
--      unsigned int plt0, plt1, plt2;
-+      unsigned int plt[PLT_MAX_INSN_COUNT];
-+      size_t plt_insn_count = 3;
-       asection *splt;
-       asection *sgot;
-       asection *srela;
-@@ -2403,6 +2435,7 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
-       bfd_vma got_offset;
-       bfd_vma got_addr;
-       Elf_Internal_Rela rela;
-+      bfd_boolean large_plt_entry;
- 
-       /* This symbol has an entry in the procedure linkage table.  Set
- 	 it up.  */
-@@ -2420,10 +2453,13 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
- 	 corresponds to this symbol.  This is the index of this symbol
- 	 in all the symbols for which we are making plt entries.  The
- 	 first entry in the procedure linkage table is reserved.  */
--      plt_index = h->plt.offset / PLT_ENTRY_SIZE - 1;
-+      plt_index = ((struct elf_or1k_link_hash_entry *) h)->plt_index;
-       plt_addr = plt_base_addr + h->plt.offset;
-       plt_reloc = plt_index * sizeof (Elf32_External_Rela);
- 
-+      large_plt_entry = (elf_or1k_plt_entry_size (plt_index)
-+			 == PLT_ENTRY_SIZE_LARGE);
-+
-       /* Get the offset into the .got table of the entry that
- 	corresponds to this function.  Each .got entry is 4 bytes.
- 	The first three are reserved.  */
-@@ -2435,27 +2471,57 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
- 	{
- 	  unsigned pa = ((got_addr >> 13) - (plt_addr >> 13)) & 0x1fffff;
- 	  unsigned po = (got_addr & 0x1fff);
--	  plt0 = OR1K_ADRP(12) | pa;
--	  plt1 = OR1K_LWZ(12,12) | po;
--	  plt2 = OR1K_ORI0(11) | plt_reloc;
-+	  plt[0] = OR1K_ADRP(12) | pa;
-+	  plt[1] = OR1K_LWZ(12,12) | po;
-+	  plt[2] = OR1K_ORI0(11) | plt_reloc;
- 	}
-       else if (bfd_link_pic (info))
- 	{
--	  plt0 = OR1K_LWZ(12,16) | got_offset;
--	  plt1 = OR1K_ORI0(11) | plt_reloc;
--	  plt2 = OR1K_NOP;
-+	  if (large_plt_entry)
-+	    {
-+	      unsigned gotha = ((got_offset + 0x8000) >> 16) & 0xffff;
-+	      unsigned got = got_offset & 0xffff;
-+	      unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
-+	      unsigned pltrello = plt_reloc & 0xffff;
-+
-+	      plt[0] = OR1K_MOVHI(12) | gotha;
-+	      plt[1] = OR1K_ADD(12,12,16);
-+	      plt[2] = OR1K_LWZ(12,12) | got;
-+	      plt[3] = OR1K_MOVHI(11) | pltrelhi;
-+	      plt[4] = OR1K_ORI(11,11) | pltrello;
-+	      plt_insn_count = 5;
-+	    }
-+	  else
-+	    {
-+	      plt[0] = OR1K_LWZ(12,16) | got_offset;
-+	      plt[1] = OR1K_ORI0(11) | plt_reloc;
-+	      plt[2] = OR1K_NOP;
-+	    }
- 	}
-       else
- 	{
- 	  unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
- 	  unsigned lo = got_addr & 0xffff;
--	  plt0 = OR1K_MOVHI(12) | ha;
--	  plt1 = OR1K_LWZ(12,12) | lo;
--	  plt2 = OR1K_ORI0(11) | plt_reloc;
-+	  plt[0] = OR1K_MOVHI(12) | ha;
-+	  plt[1] = OR1K_LWZ(12,12) | lo;
-+	  plt[2] = OR1K_ORI0(11) | plt_reloc;
-+	}
-+
-+      /* For large code model we fixup the non-PIC PLT relocation instructions
-+	 here.  */
-+      if (large_plt_entry && !bfd_link_pic (info))
-+	{
-+	  unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
-+	  unsigned pltrello = plt_reloc & 0xffff;
-+
-+	  plt[2] = OR1K_MOVHI(11) | pltrelhi;
-+	  plt[3] = OR1K_ORI(11,11) | pltrello;
-+	  plt[4] = OR1K_NOP;
-+	  plt_insn_count = 5;
- 	}
- 
-       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
--			    plt0, plt1, plt2, OR1K_JR(12));
-+			    OR1K_JR(12), plt, plt_insn_count);
- 
-       /* Fill in the entry in the global offset table.  We initialize it to
- 	 point to the top of the plt.  This is done to lazy lookup the actual
-@@ -2779,11 +2845,16 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
-       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, bfd_link_pic (info), h))
- 	{
- 	  asection *splt = htab->root.splt;
-+	  bfd_vma plt_index;
-+
-+	  /* Track the index of our plt entry for use in calculating size.  */
-+	  plt_index = htab->plt_count++;
-+	  ((struct elf_or1k_link_hash_entry *) h)->plt_index = plt_index;
- 
- 	  /* If this is the first .plt entry, make room for the special
- 	     first entry.  */
- 	  if (splt->size == 0)
--	    splt->size = PLT_ENTRY_SIZE;
-+	    splt->size = elf_or1k_plt_entry_size (plt_index);
- 
- 	  h->plt.offset = splt->size;
- 
-@@ -2800,7 +2871,7 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
- 	    }
- 
- 	  /* Make room for this entry.  */
--	  splt->size += PLT_ENTRY_SIZE;
-+	  splt->size += elf_or1k_plt_entry_size (plt_index);
- 
- 	  /* We also need to make an entry in the .got.plt section, which
- 	     will be placed in the .got section by the linker script.  */
-diff --git a/ld/testsuite/ld-or1k/gotha1.dd b/ld/testsuite/ld-or1k/gotha1.dd
-new file mode 100644
-index 00000000000..0ad1f8f5399
---- /dev/null
-+++ b/ld/testsuite/ld-or1k/gotha1.dd
-@@ -0,0 +1,34 @@
-+
-+.*\.x:     file format elf32-or1k
-+
-+
-+Disassembly of section \.plt:
-+
-+[0-9a-f]+ <\.plt>:
-+ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
-+ +[0-9a-f]+:	85 ec [0-9a-f]+ [0-9a-f]+ 	l\.lwz r15,[0-9]+\(r12\)
-+ +[0-9a-f]+:	44 00 78 00 	l\.jr r15
-+ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
-+ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
-+ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
-+ +[0-9a-f]+:	44 00 60 00 	l\.jr r12
-+ +[0-9a-f]+:	a9 60 00 00 	l\.ori r11,r0,0x0
-+
-+Disassembly of section \.text:
-+
-+[0-9a-f]+ <_start>:
-+ +[0-9a-f]+:	9c 21 ff fc 	l\.addi r1,r1,-4
-+ +[0-9a-f]+:	d4 01 48 00 	l\.sw 0\(r1\),r9
-+ +[0-9a-f]+:	04 00 00 02 	l\.jal [0-9a-f]+ <_start\+0x10>
-+ +[0-9a-f]+:	1a 60 00 00 	l\.movhi r19,0x0
-+ +[0-9a-f]+:	aa 73 [0-9a-f]+ [0-9a-f]+ 	l\.ori r19,r19,0x[0-9a-f]+
-+ +[0-9a-f]+:	e2 73 48 00 	l\.add r19,r19,r9
-+ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
-+ +[0-9a-f]+:	e2 31 98 00 	l\.add r17,r17,r19
-+ +[0-9a-f]+:	86 31 00 10 	l\.lwz r17,16\(r17\)
-+ +[0-9a-f]+:	84 71 00 00 	l\.lwz r3,0\(r17\)
-+ +[0-9a-f]+:	07 ff ff f2 	l\.jal [0-9a-f]+ <\.plt\+0x10>
-+ +[0-9a-f]+:	15 00 00 00 	l\.nop 0x0
-+ +[0-9a-f]+:	85 21 00 00 	l\.lwz r9,0\(r1\)
-+ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
-+ +[0-9a-f]+:	9c 21 00 04 	l\.addi r1,r1,4
-diff --git a/ld/testsuite/ld-or1k/gotha1.s b/ld/testsuite/ld-or1k/gotha1.s
-new file mode 100644
-index 00000000000..42b16db425c
---- /dev/null
-+++ b/ld/testsuite/ld-or1k/gotha1.s
-@@ -0,0 +1,24 @@
-+	.data
-+	.p2align 16
-+
-+	.text
-+	.globl	_start
-+_start:
-+	l.addi	r1, r1, -4
-+	l.sw	0(r1), r9
-+
-+	l.jal	8
-+	 l.movhi	r19, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
-+	l.ori	r19, r19, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
-+	l.add	r19, r19, r9
-+
-+	l.movhi	r17, gotha(x)
-+	l.add	r17, r17, r19
-+	l.lwz	r17, got(x)(r17)
-+	l.lwz	r3, 0(r17)
-+
-+	l.jal	plt(func)
-+	 l.nop
-+	l.lwz	r9, 0(r1)
-+	l.jr	r9
-+	 l.addi	r1, r1, 4
-diff --git a/ld/testsuite/ld-or1k/gotha2.dd b/ld/testsuite/ld-or1k/gotha2.dd
-new file mode 100644
-index 00000000000..fe09da5466b
---- /dev/null
-+++ b/ld/testsuite/ld-or1k/gotha2.dd
-@@ -0,0 +1,21 @@
-+
-+.*\.x:     file format elf32-or1k
-+
-+
-+Disassembly of section \.text:
-+
-+[0-9a-f]+ <test>:
-+ +[0-9a-f]+:	9c 21 ff f8 	l\.addi r1,r1,-8
-+ +[0-9a-f]+:	d4 01 80 00 	l\.sw 0\(r1\),r16
-+ +[0-9a-f]+:	d4 01 48 04 	l\.sw 4\(r1\),r9
-+ +[0-9a-f]+:	04 00 [0-9a-f]+ [0-9a-f]+ 	l\.jal [0-9a-f]+ <test\+0x14>
-+ +[0-9a-f]+:	1a 00 00 00 	l\.movhi r16,0x0
-+ +[0-9a-f]+:	aa 10 [0-9a-f]+ [0-9a-f]+ 	l\.ori r16,r16,0x[0-9a-f]+
-+ +[0-9a-f]+:	e2 10 48 00 	l\.add r16,r16,r9
-+ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
-+ +[0-9a-f]+:	e2 31 80 00 	l\.add r17,r17,r16
-+ +[0-9a-f]+:	86 31 00 0c 	l\.lwz r17,12\(r17\)
-+ +[0-9a-f]+:	85 21 00 04 	l\.lwz r9,4\(r1\)
-+ +[0-9a-f]+:	86 01 00 00 	l\.lwz r16,0\(r1\)
-+ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
-+ +[0-9a-f]+:	9c 21 00 08 	l\.addi r1,r1,8
-diff --git a/ld/testsuite/ld-or1k/gotha2.s b/ld/testsuite/ld-or1k/gotha2.s
-new file mode 100644
-index 00000000000..164b282f2dd
---- /dev/null
-+++ b/ld/testsuite/ld-or1k/gotha2.s
-@@ -0,0 +1,22 @@
-+	.section	.text
-+	.align 4
-+	.global	test
-+	.type	test, @function
-+test:
-+	l.addi	r1, r1, -8
-+	l.sw	0(r1), r16
-+	l.sw	4(r1), r9
-+
-+	l.jal	8
-+	 l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
-+	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
-+	l.add	r16, r16, r9
-+
-+	l.movhi	r17, gotha(i)
-+	l.add	r17, r17, r16
-+	l.lwz	r17, got(i)(r17)
-+
-+	l.lwz	r9, 4(r1)
-+	l.lwz	r16, 0(r1)
-+	l.jr	r9
-+	 l.addi	r1, r1, 8
-diff --git a/ld/testsuite/ld-or1k/or1k.exp b/ld/testsuite/ld-or1k/or1k.exp
-index 7592e8307c1..8e19ec6c31a 100644
---- a/ld/testsuite/ld-or1k/or1k.exp
-+++ b/ld/testsuite/ld-or1k/or1k.exp
-@@ -53,6 +53,14 @@ set or1kplttests {
-      "" {plt1.s}
-      {{objdump -dr plt1.x.dd}}
-      "plt1.x"}
-+    {"gotha exec plt" "tmpdir/libpltlib.so" ""
-+     "" {gotha1.s}
-+     {{objdump -dr gotha1.dd}}
-+     "gotha1.x"}
-+    {"gotha -fpic -shared" "-fpic -shared" ""
-+     "" {gotha2.s}
-+     {{objdump -dr gotha2.dd}}
-+     "gotha2.x"}
- }
- 
- # Not implemented yet
-diff --git a/ld/testsuite/ld-or1k/pltlib.s b/ld/testsuite/ld-or1k/pltlib.s
-index baf76ca1af7..8b4d7ba48fd 100644
---- a/ld/testsuite/ld-or1k/pltlib.s
-+++ b/ld/testsuite/ld-or1k/pltlib.s
-@@ -1,5 +1,6 @@
- 	.section .data
- 	.globl x, y
-+	.size x, 4
- x:	.long 33
- y:	.long 44
- 
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
deleted file mode 100644
index c3978e22fa..0000000000
--- a/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 9 Jun 2021 17:28:27 +0200
-Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
-
-Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
-an old compiler(i.e. gcc 4.9) build fails on:
-```
-elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
-C99 or C11 mode
-    for (size_t i = 0; i < insn_count; i++)
-    ^
-```
-
-So let's declare `size_t i` at the top of the function instead of inside
-for loop.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 4ae7f324d33..32063ab0289 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
- {
-   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
-   unsigned output_insns[PLT_MAX_INSN_COUNT];
-+  size_t i;
- 
-   /* Copy instructions into the output buffer.  */
--  for (size_t i = 0; i < insn_count; i++)
-+  for (i = 0; i < insn_count; i++)
-     output_insns[i] = insns[i];
- 
-   /* Honor the no-delay-slot setting.  */
-@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
-     }
- 
-   /* Write out the output buffer.  */
--  for (size_t i = 0; i < (insn_count+1); i++)
-+  for (i = 0; i < (insn_count+1); i++)
-     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
- }
- 
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
deleted file mode 100644
index 585b97b2af..0000000000
--- a/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9af93e143a7fbdb75aa1ed37277f9250eb111628 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 10 Jul 2021 17:57:34 +0200
-Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
- relative 26 bit relocation
-
-When building openal we were seeing the assert failure:
-
-/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
-pc-relative relocation against dynamic symbol alSourcePausev
-/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
-pc-relative relocation against dynamic symbol alSourceStopv
-/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
-pc-relative relocation against dynamic symbol alSourceRewindv
-/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
-pc-relative relocation against dynamic symbol alSourcePlayv
-collect2: error: ld returned 1 exit status
-
-This happens because in R_OR1K_INSN_REL_26 case we can't reference local
-symbol as previously done but we need to make sure that calls to actual
-symbol always call the version of current object.
-
-bfd/Changelog:
-
-	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
-	  in switch case R_OR1K_INSN_REL_26 where we need to check for
-	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 4ae7f324d33..4f9092539f5 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 	  break;
- 
- 	case R_OR1K_INSN_REL_26:
-+	  /* For a non-shared link, these will reference plt or call the
-+	     version of actual object.  */
-+	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
-+	    {
-+	      _bfd_error_handler
-+		(_("%pB: pc-relative relocation against dynamic symbol %s"),
-+		 input_bfd, name);
-+	      ret_val = FALSE;
-+	      bfd_set_error (bfd_error_bad_value);
-+	    }
-+	  break;
-+
- 	case R_OR1K_PCREL_PG21:
- 	case R_OR1K_LO13:
- 	case R_OR1K_SLO13:
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
deleted file mode 100644
index e96d49122a..0000000000
--- a/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From fbab8933bca6b7dba2aa19190a71f799a370c3d4 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 Jan 2022 09:03:28 +0900
-Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
- howto
-
-Previously when fixing PR 21464 we masked out upper bits of the
-relocation value in order to avoid overflow complaints when acceptable.
-It turns out this does not work when the relocation value ends up being
-signed.
-
-To fix this this patch introduces a special howto with
-complain_on_overflow set to complain_overflow_dont.  This is used in
-place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
-relocations.
-
-bfd/ChangeLog:
-
-	PR 28735
-	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
-	(or1k_elf_relocate_section): Use new howto instead of trying to
-	mask out relocation bits.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
- 1 file changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 2ff998066a8..3df31172fcb 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
- 	FALSE),                /* pcrel_offset */
- };
- 
-+/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
-+   relocations when we know we can ignore overflows.  */
-+static reloc_howto_type or1k_elf_got16_no_overflow_howto =
-+  HOWTO (R_OR1K_GOT16,		/* type */
-+	 0,			/* rightshift */
-+	 2,			/* size (0 = byte, 1 = short, 2 = long) */
-+	 16,			/* bitsize */
-+	 FALSE,			/* pc_relative */
-+	 0,			/* bitpos */
-+	 complain_overflow_dont, /* complain_on_overflow */
-+	 bfd_elf_generic_reloc, /* special_function */
-+	 "R_OR1K_GOT16",	/* name */
-+	 FALSE,			/* partial_inplace */
-+	 0,			/* src_mask */
-+	 0xffff,		/* dst_mask */
-+	 FALSE);		/* pcrel_offset */
-+
- /* Map BFD reloc types to Or1k ELF reloc types.  */
- 
- struct or1k_reloc_map
-@@ -1508,12 +1525,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 	    if (r_type == R_OR1K_GOT_AHI16)
- 	      saw_gotha = TRUE;
- 
--	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
-+	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
- 	       relocation we assume the code is doing the right thing to avoid
--	       overflows.  Here we mask the lower 16-bit of the relocation to
--	       avoid overflow validation failures.  */
-+	       overflows.  */
- 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
--	      relocation &= 0xffff;
-+	      howto = &or1k_elf_got16_no_overflow_howto;
- 
- 	  /* Addend should be zero.  */
- 	  if (rel->r_addend != 0)
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
deleted file mode 100644
index e95eb1e7c5..0000000000
--- a/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Mon, 7 Feb 2022 15:22:19 -0800
-Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
-
-GOT32 relocations are allowed since absolute value + addend is stored in
-the GOT slot.
-
-Tested on glibc 2.35 build with GCC 11.2 and -Os.
-
-bfd/
-
-	PR ld/28870
-	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
-	relocations.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
-index 7ac2411fc80..d00dc45677b 100644
---- a/bfd/elfxx-x86.c
-+++ b/bfd/elfxx-x86.c
-@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
-       irel = *rel;
- 
-       /* Only allow relocations against absolute symbol, which can be
--	 resolved as absolute value + addend.  GOTPCREL relocations
--	 are allowed since absolute value + addend is stored in the
--	 GOT slot.  */
-+	 resolved as absolute value + addend.  GOTPCREL and GOT32
-+	 relocations are allowed since absolute value + addend is
-+	 stored in the GOT slot.  */
-       if (bed->target_id == X86_64_ELF_DATA)
- 	{
- 	  r_type &= ~R_X86_64_converted_reloc_bit;
-@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
-       else
- 	valid_p = (r_type == R_386_32
- 		   || r_type == R_386_16
--		   || r_type == R_386_8);
-+		   || r_type == R_386_8
-+		   || r_type == R_386_GOT32
-+		   || r_type == R_386_GOT32X);
- 
-       if (valid_p)
- 	*no_dynreloc_p = true;
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 17de6e4e41..21b15b5c36 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -16,13 +16,6 @@ config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
 	depends on !BR2_csky
 
-config BR2_BINUTILS_VERSION_2_35_X
-	bool "binutils 2.35.2"
-	depends on !BR2_csky
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
-
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
 	depends on !BR2_csky
@@ -52,7 +45,6 @@ config BR2_BINUTILS_VERSION
 	string
 	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
-	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index fe31b34d40..4141e0c5f2 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,6 +1,5 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
-sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
 sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
