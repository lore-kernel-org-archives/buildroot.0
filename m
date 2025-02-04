Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C16AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBD485A69;
	Fri, 28 Feb 2025 17:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcSPGRQBx2q3; Fri, 28 Feb 2025 17:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBB285A66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBB285A66;
	Fri, 28 Feb 2025 17:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A4568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D5541412
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXp_z277tILt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F73B42F4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F73B42F4C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9941D86A52; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 10:16:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9
X-Git-Newrev: 32829d0d131ec3cd16d2622b741f8b24bcac594a
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.9941D86A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: drop
 binutils 2.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=32829d0d131ec3cd16d2622b741f8b24bcac594a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added binutils 2.44, made binutils 2.43 the default,
let's continue to follow our usual policy and drop support for
binutils 2.41.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   6 +
 package/binutils/2.41/0001-sh-conf.patch           |  50 ----
 .../2.41/0002-poison-system-directories.patch      | 309 ---------------------
 ...s-assertion-fail-in-nios2_elf32_install_i.patch | 125 ---------
 package/binutils/Config.in.host                    |   4 -
 package/binutils/binutils.hash                     |   1 -
 6 files changed, 6 insertions(+), 489 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index edca3eef47..a8baecad58 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_BINUTILS_VERSION_2_41_X
+	bool "binutils 2.41 has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.41 has been removed, use a newer version.
+
 config BR2_TARGET_ROOTFS_EXT2_2r0
 	bool "ext2 rev0 support been removed"
 	select BR2_LEGACY
diff --git a/package/binutils/2.41/0001-sh-conf.patch b/package/binutils/2.41/0001-sh-conf.patch
deleted file mode 100644
index ffa23a88a7..0000000000
--- a/package/binutils/2.41/0001-sh-conf.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 87551ade276aa0db86c4567b3ac219c4f979b538 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:38:13 +0100
-Subject: [PATCH] sh-conf
-
-Likewise, binutils has no idea about any of these new targets either, so we
-fix that up too.. now we're able to actually build a real toolchain for
-sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
-inept targets than that one, really. Go look, I promise).
-
-Upstream: N/A [Buildroot specific]
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
-index 417fc5a970c..fa8ba331796 100755
---- a/configure
-+++ b/configure
-@@ -4067,7 +4067,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index 3a1eb0357e5..d700c14ddf5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1300,7 +1300,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.40.1
-
diff --git a/package/binutils/2.41/0002-poison-system-directories.patch b/package/binutils/2.41/0002-poison-system-directories.patch
deleted file mode 100644
index 4b927b630e..0000000000
--- a/package/binutils/2.41/0002-poison-system-directories.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From a6d90a842e349545ceb27f022317618dd99378ce Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:45:38 +0100
-Subject: [PATCH] poison-system-directories
-
-Patch adapted to binutils 2.23.2 and extended to use
-BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
-
-[Waldemar: rebase on top of 2.39]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Romain: rebase on top of 2.33.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Gustavo: adapt to binutils 2.25]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Upstream-Status: Inappropriate [distribution: codesourcery]
-Upstream: N/A [Buildroot specific]
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
-index ad0dc6a106c..d21edaddce7 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -58,6 +58,9 @@
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
-index 43b44be1dc6..28f054ea3f8 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -839,6 +839,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1521,6 +1522,8 @@ Optional Features:
-   --enable-checking       enable run-time checks
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15504,7 +15507,18 @@ else
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
-index 77edac3258c..a74dac63038 100644
---- a/ld/configure.ac
-+++ b/ld/configure.ac
-@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
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
-index 05649ff61b8..1818c227473 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -163,6 +163,14 @@ typedef struct
-      in the linker script.  */
-   bool force_group_allocation;
- 
-+  /* If TRUE (the default) warn for uses of system directories when
-+     cross linking.  */
-+  bool poison_system_directories;
-+
-+  /* If TRUE (default FALSE) give an error for uses of system
-+     directories when cross linking instead of a warning.  */
-+  bool error_poison_system_directories;
-+
-   /* Big or little endian as set on command line.  */
-   enum endian_enum endian;
- 
-diff --git a/ld/ld.texi b/ld/ld.texi
-index db3a9f09b45..9dacc934f80 100644
---- a/ld/ld.texi
-+++ b/ld/ld.texi
-@@ -2949,6 +2949,18 @@ string identifying the original linked file does not change.
- Passing @code{none} for @var{style} disables the setting from any
- @code{--build-id} options earlier on the command line.
- 
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
-+
- @kindex --package-metadata=@var{JSON}
- @item --package-metadata=@var{JSON}
- Request the creation of a @code{.note.package} ELF note section.  The
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index b8fd4e5d8e0..1f1d8e23bc9 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
-index 0538f0a06a1..d1de3aec23d 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -166,6 +166,8 @@ enum option_values
-   OPTION_CTF_VARIABLES,
-   OPTION_NO_CTF_VARIABLES,
-   OPTION_CTF_SHARE_TYPES,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
-   OPTION_WARN_EXECSTACK,
-   OPTION_NO_WARN_EXECSTACK,
-   OPTION_WARN_RWX_SEGMENTS,
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 9290a189b0d..e2e3074e872 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -321,6 +321,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = true;
-   command_line.warn_search_mismatch = true;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = true;
-+  command_line.error_poison_system_directories = false;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index c5960385572..da0a7829914 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =
- 		   "                                <method> is: share-unconflicted (default),\n"
- 		   "                                             share-duplicated"),
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
-@@ -625,6 +633,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1692,6 +1701,14 @@ parse_args (unsigned argc, char **argv)
- 	  }
- 	  break;
- 
-+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.poison_system_directories = false;
-+	  break;
-+
-+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+	  command_line.error_poison_system_directories = true;
-+	  break;
-+
- 	case OPTION_PUSH_STATE:
- 	  input_flags.pushed = xmemdup (&input_flags,
- 					sizeof (input_flags),
-@@ -1837,6 +1854,10 @@ parse_args (unsigned argc, char **argv)
-       command_line.soname = NULL;
-     }
- 
-+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
-+    command_line.error_poison_system_directories = true;
-+
-   while (ingroup)
-     {
-       einfo (_("%P: missing --end-group; added as last command line option\n"));
--- 
-2.40.1
-
diff --git a/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch b/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
deleted file mode 100644
index 4753ae13c4..0000000000
--- a/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Fri, 16 Feb 2024 22:33:29 +1030
-Subject: [PATCH] PR27597, nios: assertion fail in nios2_elf32_install_imm16
-
-The assertion in nios2_elf32_install_imm16 triggers when the PLT is
-twice the maximum allowable size for a branch from PLTn to reach
-.PLTresolve, and on no other call to nios2_elf32_install_imm16.  That
-makes the assertion completely useless.  We can handle a PIC PLT
-exceeding 0x8000 in size by bouncing branches that won't reach through
-previous branches.
-
-	PR 27597
-	* elf32-nios2.c (nios2_elf32_install_imm16): Delete BFD_ASSERT.
-	(nios2_build_one_stub): Don't bother masking value passed to
-	nios2_elf32_install_imm16.
-	(nios2_elf32_finish_dynamic_symbol): Likewise.  Handle overflow
-	of PLTn branch to .PLTresolve by bouncing through prior branches.
-
-Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-nios2.c | 40 ++++++++++++++++++++++++----------------
- 1 file changed, 24 insertions(+), 16 deletions(-)
-
-diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
-index bebf4239958..7f61e2f8507 100644
---- a/bfd/elf32-nios2.c
-+++ b/bfd/elf32-nios2.c
-@@ -1878,8 +1878,6 @@ nios2_elf32_install_imm16 (asection *sec, bfd_vma offset, bfd_vma value)
- {
-   bfd_vma word = bfd_get_32 (sec->owner, sec->contents + offset);
- 
--  BFD_ASSERT (value <= 0xffff || ((bfd_signed_vma) value) >= -0xffff);
--
-   bfd_put_32 (sec->owner, word | ((value & 0xffff) << 6),
- 	      sec->contents + offset);
- }
-@@ -2518,7 +2516,7 @@ nios2_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg ATTRIBUTE_U
-       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset,
- 				 hiadj (sym_value));
-       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset + 4,
--				 (sym_value & 0xffff));
-+				 sym_value);
-       stub_sec->size += 12;
-       break;
-     default:
-@@ -4986,16 +4984,28 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
-       /* Emit the PLT entry.  */
-       if (bfd_link_pic (info))
- 	{
-+	  bfd_vma br_offset;
-+
- 	  nios2_elf32_install_data (splt, nios2_so_plt_entry, h->plt.offset,
- 				    3);
- 	  plt_index = (h->plt.offset - 24) / 12;
- 	  got_offset = (plt_index + 3) * 4;
- 	  nios2_elf32_install_imm16 (splt, h->plt.offset,
--				     hiadj(plt_index * 4));
-+				     hiadj (plt_index * 4));
- 	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
--				     (plt_index * 4) & 0xffff);
--	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8,
--				     0xfff4 - h->plt.offset);
-+				     plt_index * 4);
-+	  br_offset = -(h->plt.offset + 12);
-+	  /* If this plt entry is too far away from the start of .plt
-+	     for the "br" to reach .PLTresolve, bounce through one or
-+	     more of the previous "br" instructions.  */
-+	  if (br_offset < (bfd_vma) -32768)
-+	    {
-+	      br_offset += 32768 / 12 * 12 - 4;
-+	      while (br_offset < (bfd_vma) -32768)
-+		br_offset += 32768 / 12 * 12;
-+	    }
-+	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8, br_offset);
-+
- 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
- 			 + got_offset);
- 
-@@ -5014,9 +5024,8 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
- 	  nios2_elf32_install_data (splt, nios2_plt_entry, h->plt.offset, 3);
- 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
- 			 + got_offset);
--	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj(got_address));
--	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
--				     got_address & 0xffff);
-+	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj (got_address));
-+	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4, got_address);
- 
- 	  /* Fill in the entry in the global offset table.  */
- 	  bfd_put_32 (output_bfd,
-@@ -5217,8 +5226,8 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
- 	      BFD_ASSERT ((got_pcrel & 0xf) == 0);
- 	      nios2_elf32_install_data (splt, nios2_so_plt0_entry, 0, 6);
- 	      nios2_elf32_install_imm16 (splt, 4, hiadj (got_pcrel));
--	      nios2_elf32_install_imm16 (splt, 12, got_pcrel & 0xffff);
--	      nios2_elf32_install_imm16 (splt, 16, (got_pcrel + 4) & 0xffff);
-+	      nios2_elf32_install_imm16 (splt, 12, got_pcrel);
-+	      nios2_elf32_install_imm16 (splt, 16, got_pcrel + 4);
- 	    }
- 	  else
- 	    {
-@@ -5240,14 +5249,13 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
- 
- 	      nios2_elf32_install_data (splt, nios2_plt0_entry, res_size, 7);
- 	      nios2_elf32_install_imm16 (splt, res_size, hiadj (res_start));
--	      nios2_elf32_install_imm16 (splt, res_size + 4,
--					 res_start & 0xffff);
-+	      nios2_elf32_install_imm16 (splt, res_size + 4, res_start);
- 	      nios2_elf32_install_imm16 (splt, res_size + 12,
- 					 hiadj (got_address));
- 	      nios2_elf32_install_imm16 (splt, res_size + 16,
--					 (got_address + 4) & 0xffff);
-+					 got_address + 4);
- 	      nios2_elf32_install_imm16 (splt, res_size + 20,
--					 (got_address + 8) & 0xffff);
-+					 got_address + 8);
- 	    }
- 	}
-     }
--- 
-2.34.1
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 717d178a9e..8e0c21bae0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,9 +12,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_41_X
-	bool "binutils 2.41"
-
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.41)"
 	depends on BR2_arc
@@ -33,7 +30,6 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2023.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
 	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
 	default "2.43.1"	if BR2_BINUTILS_VERSION_2_43_X
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 2485693a86..ec0a382501 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
 sha512  155f3ba14cd220102f4f29a4f1e5cfee3c48aa03b74603460d05afb73c70d6657a9d87eee6eb88bf13203fe6f31177a5c9addc04384e956e7da8069c8ecd20a6  binutils-2.42.tar.xz
 sha512  20977ad17729141a2c26d358628f44a0944b84dcfefdec2ba029c2d02f40dfc41cc91c0631044560d2bd6f9a51e1f15846b4b311befbe14f1239f14ff7d57824  binutils-2.43.1.tar.xz
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
