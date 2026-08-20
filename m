Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F62C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB6D81E82;
	Fri, 21 Aug 2026 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNU0Q9sR-jRD; Fri, 21 Aug 2026 15:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325138;
	bh=hcMMwgu8jwfxUljNsPhSHz0oTvb/t7gmXLz3qrvEmJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d617zyhrhZpy96nkSdFC1tCXGWYa45XCyT4Z11ZwlXX+/PtsdocBt4TkjiBOgLDHB
	 F94MHRLOIfETwYXnr37z7ABqnf7QG/noAyIsU4f74qNtrMtj2C5TXnfFP+PE79mx05
	 RXon0stOm9Hku6gBDplYUxPsJ8vt965uggOYKkVkSb7Dbg+kFKSkfqkRFCA9OrXzn4
	 Gy7aKR9G0IwEJEOeSmdpyyY9d+0RBQ3wrZcxe7gwu/MGNfE0n6zJ5gMXowCj74Fc6v
	 Fi9CqJD0utpM+Ngk5ps9+NdSeIV9q60naeYfvJM9FwApEDVBXvwcfIpAsOgxUQ7Gye
	 9ZUHxzv06CZdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E6581E66;
	Fri, 21 Aug 2026 15:12:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6307E29B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601A640A1E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftRco-UwfH9L for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4527340B29
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B85588DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:39:21 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8243a69bdbaf6c12f4f6097ccb815cd13e3ac841
X-Git-Newrev: 0a638fdaf6828af7fd030124bec47ea00e4c6274
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.B85588DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/binutils: drop
 ARC-specific version
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a638fdaf6828af7fd030124bec47ea00e4c6274
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

A warning was sent to Synopsys ARC people in December 2025 that the
ARC support in Buildroot was poorly maintained and in particular the
ARC-pspecific toolchain components. Despite a reply that some effort
would be made [1], no contributions were actually done. Also, Alexey
Brodkin is no longer at Synopsys. Time to remove Synopsys ARC specific
toolchain and toolchain components.

This commit removes the ARC-specific binutils version.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 506830c40bccdc0b77fa6d1ada4f75724e1a4ce9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                                   |   7 +
 package/binutils/Config.in.host                    |   9 +-
 .../0001-poison-system-directories.patch           | 307 ---------------------
 package/binutils/binutils.hash                     |   3 -
 package/binutils/binutils.mk                       |  10 -
 5 files changed, 8 insertions(+), 328 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index abe92af765..04bb237d78 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05.2"
 
+config BR2_BINUTILS_VERSION_ARC
+	bool "ARC-specific binutils version removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARC-specific binutils version was removed,
+	  as it was no longer maintained in Buildroot.
+
 config BR2_GCC_VERSION_ARC
 	bool "ARC-specific gcc version removed"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8032bfe005..83eb965f46 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,15 +7,10 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_45_X if !BR2_arc
-	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_2_45_X
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_ARC
-	bool "binutils arc (2.43)"
-	depends on BR2_arc
-
 config BR2_BINUTILS_VERSION_2_44_X
 	bool "binutils 2.44"
 
@@ -29,14 +24,12 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2024.12-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
 	default "2.46.0"	if BR2_BINUTILS_VERSION_2_46_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
-	depends on !BR2_BINUTILS_VERSION_ARC
 	help
 	  This option enables support for gprofng, a new profiler.
 
diff --git a/package/binutils/arc-2024.12-release/0001-poison-system-directories.patch b/package/binutils/arc-2024.12-release/0001-poison-system-directories.patch
deleted file mode 100644
index 8da0ec31df..0000000000
--- a/package/binutils/arc-2024.12-release/0001-poison-system-directories.patch
+++ /dev/null
@@ -1,307 +0,0 @@
-From 00f6b0a7d31085831429834b2bc8f511b8fab6ce Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:45:38 +0100
-Subject: [PATCH] poison-system-directories
-
-Patch adapted to binutils 2.23.2 and extended to use
-BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
-
-[Waldemar: rebase on top of 2.43]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
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
-index f7c9da3d02a..e4fdbf6db5b 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -74,6 +74,9 @@
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
-index 44d79c2445d..e28cea11977 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -844,6 +844,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1535,6 +1536,8 @@ Optional Features:
-   --enable-checking       enable run-time checks
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15587,7 +15590,18 @@ else
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
-index bdf51a062fa..3d370ff92ce 100644
---- a/ld/configure.ac
-+++ b/ld/configure.ac
-@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
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
-index 0dee944cf2a..83bd82d2a2e 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -166,6 +166,14 @@ typedef struct
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
-index 89e3913317a..b80cf05617f 100644
---- a/ld/ld.texi
-+++ b/ld/ld.texi
-@@ -3234,6 +3234,18 @@ string identifying the original linked file does not change.
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
-index 87be885d31a..9bc7adca4bc 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -327,6 +327,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
-   else
-     new_dirs->name = xstrdup (name);
- 
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
-   /* Accumulate script and command line sourced
-      search paths at the end of the current list.  */
- #if BFD_SUPPORTS_PLUGINS
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index defe3fcbbb9..0ff12614926 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -170,6 +170,8 @@ enum option_values
-   OPTION_CTF_VARIABLES,
-   OPTION_NO_CTF_VARIABLES,
-   OPTION_CTF_SHARE_TYPES,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
-   OPTION_ERROR_EXECSTACK,
-   OPTION_NO_ERROR_EXECSTACK,
-   OPTION_WARN_EXECSTACK_OBJECTS,
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 037099b9d37..204feedc6e3 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -347,6 +347,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = true;
-   command_line.warn_search_mismatch = true;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = true;
-+  command_line.error_poison_system_directories = false;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4aa0124ce2f..c4d76943821 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =
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
-@@ -660,6 +668,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1785,6 +1794,14 @@ parse_args (unsigned argc, char **argv)
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
-@@ -1938,6 +1955,10 @@ parse_args (unsigned argc, char **argv)
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
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index dc78113dc8..0075452921 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -3,9 +3,6 @@ sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
-
 # locally computed
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f39d24e986..93a2e82834 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,19 +8,9 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2024.12-release
-else
 BINUTILS_VERSION = 2.45.1
-endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2024.12-release)
-BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
-BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
-BINUTILS_FROM_GIT = y
-endif
-
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
