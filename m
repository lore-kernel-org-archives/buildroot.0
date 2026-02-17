Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD3EE9A04C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB6860871;
	Wed, 18 Feb 2026 20:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etFu9pk0xwOc; Wed, 18 Feb 2026 20:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9207A60AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771445309;
	bh=ALrVPPVTPtQDRtnZk9+75TNvmzkl3/OBp/C2mUx8HiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pKdtACht4CxWagukOC+QeEGHXaHG3N3JLEhWWUcdJNtW1ZZfKehFBQpum6ldPONOI
	 RJPEfWfU08CuHRzNbE9YDKcEx9lrKZtCtUJneVJ+vZ8b2BaTsmOLxwVit4IMgiRbr8
	 Lo6HHERLue2QvBFzXOftlIq5r1Aj853lZQCOd/ZVoNvCIcM9g8JlR+OEZAj+0Upb8y
	 d3GQbNKE88+VzEvQrR4hrWNuykXFqPGtiKKsIH54Ijjoq0LLjcwK4mU9wn69pMKDBK
	 t+Jy9vJP6chZk8Ge1Nz0R46ATzYy3r2rZ3+fV3PuQPBFUw7OVciRoQWeVOoXO2sWS0
	 XZy5A2s/cj9tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9207A60AB3;
	Wed, 18 Feb 2026 20:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A611CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D611160ABF
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPBlwSlsU7dj for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFFE60871
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AFFE60871
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62BD986FFC; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 22:40:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c97a7ad4aadffdc5e646021461847f8c3268f225
X-Git-Newrev: 101997e334efcbfd9bde3100ae75400177cfa56f
X-Patchwork-Hint: ignore
Message-Id: <20260218200826.62BD986FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: add support
 for binutils 2.46.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/101997e334efcbfd9bde3100ae75400177cfa56f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://sourceware.org/pipermail/binutils/2026-February/148149.html

" This release contains numerous bug fixes, and also the following new
  features:

    * Support for new instructions added to AMD, ARM and RISC-V
      architectures.

    * Support for version 3 of the SFrame standard.

    * The readelf program can now display the contents of Global Offset
      Tables.

    * Improved linker tagging support."

We bring and rebased patches 0001 and 0002 that we carry for binutils
2.45.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/2.46.0/0001-sh-conf.patch         |  52 ++++
 .../2.46.0/0002-poison-system-directories.patch    | 312 +++++++++++++++++++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 4 files changed, 369 insertions(+)

diff --git a/package/binutils/2.46.0/0001-sh-conf.patch b/package/binutils/2.46.0/0001-sh-conf.patch
new file mode 100644
index 0000000000..e24afb0850
--- /dev/null
+++ b/package/binutils/2.46.0/0001-sh-conf.patch
@@ -0,0 +1,52 @@
+From 0bf75276c392cac7794e78e1572abcd793d99e4e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:38:13 +0100
+Subject: [PATCH] sh-conf
+
+Likewise, binutils has no idea about any of these new targets either, so we
+fix that up too.. now we're able to actually build a real toolchain for
+sh2a_nofpu- and other more ineptly named toolchains (and yes, there are more
+inept targets than that one, really. Go look, I promise).
+
+Upstream: N/A [Buildroot specific]
+
+[Romain: rebase on top of 2.32]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: rebase on top of 2.29, in which sh64 support was removed.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for version 2.46.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bbfb5979546..bcd95684ae1 100755
+--- a/configure
++++ b/configure
+@@ -4196,7 +4196,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index f9694cdf901..d6a3623ba50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1365,7 +1365,7 @@
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.51.1
+
diff --git a/package/binutils/2.46.0/0002-poison-system-directories.patch b/package/binutils/2.46.0/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..584fa9498a
--- /dev/null
+++ b/package/binutils/2.46.0/0002-poison-system-directories.patch
@@ -0,0 +1,312 @@
+From 92f4bd0e1713577e30491e99a0226088eaeae740 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
+BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
+
+[Waldemar: rebase on top of 2.43]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Waldemar: rebase on top of 2.39]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: rebase on top of 2.33.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 2.46.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream: N/A [Buildroot specific]
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
+ ld/ldfile.c     | 16 ++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 88 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index 790efd336be..2b237bcda5e 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -86,6 +86,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+diff --git a/ld/configure b/ld/configure
+index cd410bd64d1..7e9913949d4 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -843,6 +843,7 @@ enable_checking
+ with_lib_path
+ enable_targets
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1537,6 +1538,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15768,7 +15771,18 @@ else
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
+diff --git a/ld/configure.ac b/ld/configure.ac
+index f528ae42ef7..dcf1e17fae6 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
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
+diff --git a/ld/ld.h b/ld/ld.h
+index c8688153bd4..0b16caf347a 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -166,6 +166,14 @@ typedef struct
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
+diff --git a/ld/ld.texi b/ld/ld.texi
+index cf750d15259..1acaa26f107 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -3375,6 +3375,18 @@ bit string identifying the original linked file does not change.
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
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 75fd360d5e3..3526ea8146c 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -326,6 +326,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
+ }
+ 
+ static void
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index c8d61478c60..4b175dca108 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -170,6 +170,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_ERROR_EXECSTACK,
+   OPTION_NO_ERROR_EXECSTACK,
+   OPTION_WARN_EXECSTACK_OBJECTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 67c60c3f80d..c2365e4006c 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -749,6 +749,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index bde20465835..422866f4ea9 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -643,6 +643,14 @@ static const struct ld_option ld_options[] =
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
+@@ -655,6 +663,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1789,6 +1798,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1933,6 +1950,10 @@ parse_args (unsigned argc, char **argv)
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
+2.51.1
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a043771339..db17df70bc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -25,6 +25,9 @@ config BR2_BINUTILS_VERSION_2_44_X
 config BR2_BINUTILS_VERSION_2_45_X
 	bool "binutils 2.45.1"
 
+config BR2_BINUTILS_VERSION_2_46_X
+	bool "binutils 2.46.0"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -33,6 +36,7 @@ config BR2_BINUTILS_VERSION
 	default "2.43.1"	if BR2_BINUTILS_VERSION_2_43_X
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
+	default "2.46.0"	if BR2_BINUTILS_VERSION_2_46_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 183b7c1f4e..45668d88ed 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  20977ad17729141a2c26d358628f44a0944b84dcfefdec2ba029c2d02f40dfc41cc91c0631044560d2bd6f9a51e1f15846b4b311befbe14f1239f14ff7d57824  binutils-2.43.1.tar.xz
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
+sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
