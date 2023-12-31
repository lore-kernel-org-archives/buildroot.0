Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC7C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 20:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4257402E5;
	Sun, 31 Dec 2023 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4257402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMDDQfbmu0xG; Sun, 31 Dec 2023 20:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D814016B;
	Sun, 31 Dec 2023 20:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D814016B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF7E1BF3FC
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6021460A5F
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6021460A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yt1Gy_GbPpPM for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 20:10:46 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97350607F1
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 20:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97350607F1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 47A7E5FFB4;
 Sun, 31 Dec 2023 21:10:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 21:10:37 +0100
Date: Sun, 31 Dec 2023 21:10:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZZHKvQev5syFO4jc@landeda>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-3-wbx@openadk.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231172538.1279608-3-wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704053443;
 bh=2zyuhlM+oYTtXlgpHF78RN6nYn4D4sNzrnYrdT5T2jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2weNEw95Ixqg7Ty/QQ6OznO8sKsxRNtT4wjotlHqyLfgSJRXf2z9Bft8AumRh+XT
 5gtHyfaWjYDQ3lzWIMX5rndvasYsNKwitzaUtKVAmWGxRcQgH6qqzXp8fkTsfDX3lq
 EycO7KmHtLlmk1ASCGlHWLNERQUWuhcT+ndHvVnno96OWCS4oqX/ReN0aug85mhISS
 rlvEjetBzoJ6TFGMs3suQ5yFnmZ8Q6gf1M3Do3J2HbZWES3GcPCMZ+7H7a7NA5GhBh
 TSli9Mw3L7HnRZSImkMARGc5oO9rlPvQSFW42n1kRW6h/RMEKyp+HwwNYoG4VSPuig
 OlBN4XalLWb0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K2weNEw9
Subject: Re: [Buildroot] [PATCH 2/6] package/binutils: remove special arc
 version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemnar, All,

On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/Config.in.host               |   9 +-
>  .../0001-poison-system-directories.patch      | 310 ------------------

This removed patch had a check-package exclusion, so that needs to be
removed as well:

    $ ./utils/docker-run make check-package
    .checkpackageignore:205: ignored file package/binutils/arc-2020.09-release/0001-poison-system-directories.patch is missing

Regards,
Yann E. MORIN.

>  package/binutils/binutils.hash                |   3 -
>  package/binutils/binutils.mk                  |  10 -
>  4 files changed, 1 insertion(+), 331 deletions(-)
>  delete mode 100644 package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index bc7dc4443c..7f76e45a70 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -10,8 +10,7 @@ config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
>  
>  choice
>  	prompt "Binutils Version"
> -	default BR2_BINUTILS_VERSION_2_40_X if !BR2_arc
> -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
> +	default BR2_BINUTILS_VERSION_2_40_X
>  	help
>  	  Select the version of binutils you wish to use.
>  
> @@ -25,16 +24,10 @@ config BR2_BINUTILS_VERSION_2_40_X
>  config BR2_BINUTILS_VERSION_2_41_X
>  	bool "binutils 2.41"
>  
> -config BR2_BINUTILS_VERSION_ARC
> -	bool "binutils arc (2.34.50)"
> -	depends on BR2_arc
> -	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
> -
>  endchoice
>  
>  config BR2_BINUTILS_VERSION
>  	string
> -	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
>  	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
>  	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
>  	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
> diff --git a/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch b/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
> deleted file mode 100644
> index 7a76ef2963..0000000000
> --- a/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
> +++ /dev/null
> @@ -1,310 +0,0 @@
> -From 5f62ad7ce534e3384d6ed8892614979da297bd70 Mon Sep 17 00:00:00 2001
> -From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> -Date: Mon, 14 Oct 2019 16:45:15 +0300
> -Subject: [PATCH] [PATCH] poison-system-directories
> -
> -Patch adapted to arc-binutils-gdb-2019.09
> -Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> -
> -Patch adapted to binutils 2.23.2 and extended to use
> -BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
> -
> -[Romain: rebase on top of 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -[Gustavo: adapt to binutils 2.25]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -Upstream-Status: Inappropriate [distribution: codesourcery]
> -
> -Patch originally created by Mark Hatle, forward-ported to
> -binutils 2.21 by Scott Garman.
> -
> -purpose:  warn for uses of system directories when cross linking
> -
> -Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
> -
> -2008-07-02  Joseph Myers  <joseph@codesourcery.com>
> -
> -    ld/
> -    * ld.h (args_type): Add error_poison_system_directories.
> -    * ld.texinfo (--error-poison-system-directories): Document.
> -    * ldfile.c (ldfile_add_library_path): Check
> -    command_line.error_poison_system_directories.
> -    * ldmain.c (main): Initialize
> -    command_line.error_poison_system_directories.
> -    * lexsup.c (enum option_values): Add
> -    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
> -    (ld_options): Add --error-poison-system-directories.
> -    (parse_args): Handle new option.
> -
> -2007-06-13  Joseph Myers  <joseph@codesourcery.com>
> -
> -    ld/
> -    * config.in: Regenerate.
> -    * ld.h (args_type): Add poison_system_directories.
> -    * ld.texinfo (--no-poison-system-directories): Document.
> -    * ldfile.c (ldfile_add_library_path): Check
> -    command_line.poison_system_directories.
> -    * ldmain.c (main): Initialize
> -    command_line.poison_system_directories.
> -    * lexsup.c (enum option_values): Add
> -    OPTION_NO_POISON_SYSTEM_DIRECTORIES.
> -    (ld_options): Add --no-poison-system-directories.
> -    (parse_args): Handle new option.
> -
> -2007-04-20  Joseph Myers  <joseph@codesourcery.com>
> -
> -    Merge from Sourcery G++ binutils 2.17:
> -
> -    2007-03-20  Joseph Myers  <joseph@codesourcery.com>
> -    Based on patch by Mark Hatle <mark.hatle@windriver.com>.
> -    ld/
> -    * configure.ac (--enable-poison-system-directories): New option.
> -    * configure, config.in: Regenerate.
> -    * ldfile.c (ldfile_add_library_path): If
> -    ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
> -    /usr/lib, /usr/local/lib or /usr/X11R6/lib.
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ----
> - ld/config.in    |  3 +++
> - ld/configure    | 14 ++++++++++++++
> - ld/configure.ac | 10 ++++++++++
> - ld/ld.h         |  8 ++++++++
> - ld/ld.texi      | 12 ++++++++++++
> - ld/ldfile.c     | 17 +++++++++++++++++
> - ld/ldlex.h      |  2 ++
> - ld/ldmain.c     |  2 ++
> - ld/lexsup.c     | 21 +++++++++++++++++++++
> - 9 files changed, 89 insertions(+)
> -
> -diff --git a/ld/config.in b/ld/config.in
> -index d93c9b08300..5da2742beac 100644
> ---- a/ld/config.in
> -+++ b/ld/config.in
> -@@ -31,6 +31,9 @@
> -    language is requested. */
> - #undef ENABLE_NLS
> - 
> -+/* Define to warn for use of native system library directories */
> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+
> - /* Additional extension a shared object might have. */
> - #undef EXTRA_SHLIB_EXTENSION
> - 
> -diff --git a/ld/configure b/ld/configure
> -index 2d6ca5c0445..563f9921f7f 100755
> ---- a/ld/configure
> -+++ b/ld/configure
> -@@ -823,6 +823,7 @@ with_lib_path
> - enable_targets
> - enable_64_bit_bfd
> - with_sysroot
> -+enable_poison_system_directories
> - enable_gold
> - enable_got
> - enable_compressed_debug_sections
> -@@ -1487,6 +1488,8 @@ Optional Features:
> -   --disable-largefile     omit support for large files
> -   --enable-targets        alternative target configurations
> -   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> -+  --enable-poison-system-directories
> -+                          warn for use of native system library directories
> -   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
> -   --enable-got=<type>     GOT handling scheme (target, single, negative,
> -                           multigot)
> -@@ -15804,7 +15807,18 @@ else
> - fi
> - 
> - 
> -+# Check whether --enable-poison-system-directories was given.
> -+if test "${enable_poison_system_directories+set}" = set; then :
> -+  enableval=$enable_poison_system_directories;
> -+else
> -+  enable_poison_system_directories=no
> -+fi
> -+
> -+if test "x${enable_poison_system_directories}" = "xyes"; then
> - 
> -+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> -+
> -+fi
> - 
> - # Check whether --enable-got was given.
> - if test "${enable_got+set}" = set; then :
> -diff --git a/ld/configure.ac b/ld/configure.ac
> -index 41a51bbb7e9..dbaa98a9e17 100644
> ---- a/ld/configure.ac
> -+++ b/ld/configure.ac
> -@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
> - AC_SUBST(TARGET_SYSTEM_ROOT)
> - AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
> - 
> -+AC_ARG_ENABLE([poison-system-directories],
> -+         AS_HELP_STRING([--enable-poison-system-directories],
> -+                [warn for use of native system library directories]),,
> -+         [enable_poison_system_directories=no])
> -+if test "x${enable_poison_system_directories}" = "xyes"; then
> -+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> -+       [1],
> -+       [Define to warn for use of native system library directories])
> -+fi
> -+
> - dnl Use --enable-gold to decide if this linker should be the default.
> - dnl "install_as_default" is set to false if gold is the default linker.
> - dnl "installed_linker" is the installed BFD linker name.
> -diff --git a/ld/ld.h b/ld/ld.h
> -index 55078a9637b..511e9bc34b7 100644
> ---- a/ld/ld.h
> -+++ b/ld/ld.h
> -@@ -180,6 +180,14 @@ typedef struct
> -      in the linker script.  */
> -   bfd_boolean force_group_allocation;
> - 
> -+  /* If TRUE (the default) warn for uses of system directories when
> -+     cross linking.  */
> -+  bfd_boolean poison_system_directories;
> -+
> -+  /* If TRUE (default FALSE) give an error for uses of system
> -+     directories when cross linking instead of a warning.  */
> -+  bfd_boolean error_poison_system_directories;
> -+
> -   /* Big or little endian as set on command line.  */
> -   enum endian_enum endian;
> - 
> -diff --git a/ld/ld.texi b/ld/ld.texi
> -index fcbc335c95e..6ba7ebdb32a 100644
> ---- a/ld/ld.texi
> -+++ b/ld/ld.texi
> -@@ -2557,6 +2557,18 @@ string identifying the original linked file does not change.
> - 
> - Passing @code{none} for @var{style} disables the setting from any
> - @code{--build-id} options earlier on the command line.
> -+
> -+@kindex --no-poison-system-directories
> -+@item --no-poison-system-directories
> -+Do not warn for @option{-L} options using system directories such as
> -+@file{/usr/lib} when cross linking.  This option is intended for use
> -+in chroot environments when such directories contain the correct
> -+libraries for the target system rather than the host.
> -+
> -+@kindex --error-poison-system-directories
> -+@item --error-poison-system-directories
> -+Give an error instead of a warning for @option{-L} options using
> -+system directories when cross linking.
> - @end table
> - 
> - @c man end
> -diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index 7f60319390e..0bcc06db964 100644
> ---- a/ld/ldfile.c
> -+++ b/ld/ldfile.c
> -@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
> -     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
> -   else
> -     new_dirs->name = xstrdup (name);
> -+
> -+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+  if (command_line.poison_system_directories
> -+  && ((!strncmp (name, "/lib", 4))
> -+      || (!strncmp (name, "/usr/lib", 8))
> -+      || (!strncmp (name, "/usr/local/lib", 14))
> -+      || (!strncmp (name, "/usr/X11R6/lib", 14))))
> -+   {
> -+     if (command_line.error_poison_system_directories)
> -+       einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
> -+            "cross-compilation\n"), name);
> -+     else
> -+       einfo (_("%P: warning: library search path \"%s\" is unsafe for "
> -+            "cross-compilation\n"), name);
> -+   }
> -+#endif
> -+
> - }
> - 
> - /* Try to open a BFD for a lang_input_statement.  */
> -diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index 32a7a6409e8..c02b64bf92f 100644
> ---- a/ld/ldlex.h
> -+++ b/ld/ldlex.h
> -@@ -152,6 +152,8 @@ enum option_values
> -   OPTION_NO_PRINT_MAP_DISCARDED,
> -   OPTION_NON_CONTIGUOUS_REGIONS,
> -   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
> -+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> -+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> - };
> -
> - 
> - /* The initial parser states.  */
> -diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 34c19223137..66d2c3f4bcf 100644
> ---- a/ld/ldmain.c
> -+++ b/ld/ldmain.c
> -@@ -270,6 +270,8 @@ main (int argc, char **argv)
> -   command_line.warn_mismatch = TRUE;
> -   command_line.warn_search_mismatch = TRUE;
> -   command_line.check_section_addresses = -1;
> -+  command_line.poison_system_directories = TRUE;
> -+  command_line.error_poison_system_directories = FALSE;
> - 
> -   /* We initialize DEMANGLING based on the environment variable
> -      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index 1c15ac29c0c..8b714e10a40 100644
> ---- a/ld/lexsup.c
> -+++ b/ld/lexsup.c
> -@@ -549,6 +549,14 @@ static const struct ld_option ld_options[] =
> -   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
> -     '\0', NULL, N_("Do not show discarded sections in map file output"),
> -     TWO_DASHES },
> -+  { {"no-poison-system-directories", no_argument, NULL,
> -+    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
> -+    '\0', NULL, N_("Do not warn for -L options using system directories"),
> -+    TWO_DASHES },
> -+  { {"error-poison-system-directories", no_argument, NULL,
> -+    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
> -+    '\0', NULL, N_("Give an error for -L options using system directories"),
> -+    TWO_DASHES },
> - };
> - 
> - #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -561,6 +569,7 @@ parse_args (unsigned argc, char **argv)
> -   int ingroup = 0;
> -   char *default_dirlist = NULL;
> -   char *shortopts;
> -+  char *BR_paranoid_env;
> -   struct option *longopts;
> -   struct option *really_longopts;
> -   int last_optind;
> -@@ -1549,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
> - 	  }
> - 	  break;
> - 
> -+	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.poison_system_directories = FALSE;
> -+	  break;
> -+
> -+	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> -+	  command_line.error_poison_system_directories = TRUE;
> -+	  break;
> -+
> - 	case OPTION_PUSH_STATE:
> - 	  input_flags.pushed = xmemdup (&input_flags,
> - 					sizeof (input_flags),
> -@@ -1600,6 +1617,10 @@ parse_args (unsigned argc, char **argv)
> -       command_line.soname = NULL;
> -     }
> - 
> -+  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> -+  if (BR_paranoid_env && strlen(BR_paranoid_env) > 0)
> -+    command_line.error_poison_system_directories = TRUE;
> -+
> -   while (ingroup)
> -     {
> -       einfo (_("%P: missing --end-group; added as last command line option\n"));
> --- 
> -2.16.2
> -
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 564a4c3bd7..f71a238517 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -3,9 +3,6 @@ sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d536
>  sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
>  sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
>  
> -# Locally calculated (fetched from Github)
> -sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
> -
>  # locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
>  sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 4bc1b69fa0..73d15b6102 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -8,19 +8,9 @@
>  # If not, we do like other packages
>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>  ifeq ($(BINUTILS_VERSION),)
> -ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2020.09-release
> -else
>  BINUTILS_VERSION = 2.40
> -endif
>  endif # BINUTILS_VERSION
>  
> -ifeq ($(BINUTILS_VERSION),arc-2020.09-release)
> -BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
> -BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
> -BINUTILS_FROM_GIT = y
> -endif
> -
>  BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
>  BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
>  BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
