Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B26C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4865400D3;
	Sun, 11 Jun 2023 13:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4865400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXGJoDzHA3CE; Sun, 11 Jun 2023 13:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62C7B40503;
	Sun, 11 Jun 2023 13:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C7B40503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59BB91BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4064860A6B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4064860A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRPas2cwYkib for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499DD608F5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 499DD608F5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:16:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2203476f8f.0
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489398; x=1689081398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zilidgx1GVa/t04iS4iamgdGEHJLGN8tGd6xprl7DjA=;
 b=IDKAXGS8t2tS3uFDGKA6voDsZhuk7Img//5HemEHPRL+pKZULcFk6G5cuKW/iA25w8
 8omSx8d6eoW4v5h+CVrVWiZXn/9d/t9p6Csk3KtoxwkXyjysA6/eoF8kQNc5N4bAYo00
 8R83FTRBypbkLNjz/5eDjDXl5JgSeWsHoNR9niPAgsFFifNnjvE52W6AP4z4TbAHH96w
 MzvrnULXuSrzcMv47QC2Abk/vR4+x9M6I+F0GpocwlhE2xZFhBTD6hnpw99gWbuRBtyU
 EOWQwi87jEGjX7L7C/rJCtYokVxjKtjgPlcI1vcTeMUJc4CvTmnuBISRFwrLyvWoGpTE
 EDXg==
X-Gm-Message-State: AC+VfDwtj2R4pNDuCzLhK2fXhpdbMDQuIV//HWfNNY0zGnRrEYHtkBpU
 N/3gIhd+qn0dOYPBNa/FxztiH5RGnRM=
X-Google-Smtp-Source: ACHHUZ4Xk01kRu12ZB8ABWjjI6FrumgmZVk685ezh2KDmgxrcrtxbH3mrIr30soGuSc21MtdGQl0kg==
X-Received: by 2002:a5d:42cc:0:b0:309:32d1:59d8 with SMTP id
 t12-20020a5d42cc000000b0030932d159d8mr2523975wrr.64.1686489398250; 
 Sun, 11 Jun 2023 06:16:38 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0030fc079b7f3sm747585wru.73.2023.06.11.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:16:37 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:16:29 +0200
Message-Id: <20230611131631.806432-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611131631.806432-1-romain.naour@gmail.com>
References: <20230611131631.806432-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489398; x=1689081398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zilidgx1GVa/t04iS4iamgdGEHJLGN8tGd6xprl7DjA=;
 b=ekhKZ6AfAmd6+qSyIsMtn7Do7tPZd15Cnd2wzPAi1xbIzlK/Wj4v5WLHEVxiHLXWqG
 2GpYCPhAb/6AdkzI7KfJnbGrE2Zb4Tn5fQk40bYmlLzL8yKOh9TA8NJbcC1oaj7mXtsT
 i1+GiN3JTSK3JHeLr0rtn2esoSkRkHSIvJ11vX7GlXCM2TueGSpeKUzRMvDVYGtisDAA
 pmgwGdwtly/g6zT4eIyHq3PCR4GGch1kliq7BT7LBKds2R77obQVlkyWQCL7XnxB6/rt
 kElGfoIj0y7yDrcXb/6BoNEBLf/s2wmPL5tsX5FRo/6nMLuCkSg4axuUTBmUTS5xvT62
 HAYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ekhKZ6Af
Subject: [Buildroot] [PATCH 3/5] package/binutils: add support for version
 2.40
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
https://sourceware.org/pipermail/binutils/2023-January/125671.html

Disable zstd support to avoid adding a new dependency.

Add Upstream tag on each binutils patches:
  0001-sh-conf.patch: Buildroot specific since we are carrying this patch for years.
  0002-poison-system-directories.patch: Add the Buildroot Upstream tag

Remove 0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch since
it was rejected by upstream [1] and actually only needed for binutils
< 2.37. Binutils 2.37 replaced AC_PROG_CC with AC_PROG_CC_C99 in top
level configure file [2].

[1] https://sourceware.org/pipermail/binutils/2021-June/116907.html
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a8d6316b67d52eaa1b7b311084ddff71a66f7cc0

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/895618463

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/binutils/2.40/0001-sh-conf.patch      |  50 +++
 .../2.40/0002-poison-system-directories.patch | 309 ++++++++++++++++++
 package/binutils/Config.in.host               |   4 +
 package/binutils/binutils.hash                |   1 +
 package/binutils/binutils.mk                  |   6 +-
 5 files changed, 368 insertions(+), 2 deletions(-)
 create mode 100644 package/binutils/2.40/0001-sh-conf.patch
 create mode 100644 package/binutils/2.40/0002-poison-system-directories.patch

diff --git a/package/binutils/2.40/0001-sh-conf.patch b/package/binutils/2.40/0001-sh-conf.patch
new file mode 100644
index 0000000000..ffa23a88a7
--- /dev/null
+++ b/package/binutils/2.40/0001-sh-conf.patch
@@ -0,0 +1,50 @@
+From 87551ade276aa0db86c4567b3ac219c4f979b538 Mon Sep 17 00:00:00 2001
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
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 417fc5a970c..fa8ba331796 100755
+--- a/configure
++++ b/configure
+@@ -4067,7 +4067,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/configure.ac b/configure.ac
+index 3a1eb0357e5..d700c14ddf5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1300,7 +1300,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
+     ;;
+-  sh-*-*)
++  sh*-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+-- 
+2.40.1
+
diff --git a/package/binutils/2.40/0002-poison-system-directories.patch b/package/binutils/2.40/0002-poison-system-directories.patch
new file mode 100644
index 0000000000..4b927b630e
--- /dev/null
+++ b/package/binutils/2.40/0002-poison-system-directories.patch
@@ -0,0 +1,309 @@
+From a6d90a842e349545ceb27f022317618dd99378ce Mon Sep 17 00:00:00 2001
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
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
+
+diff --git a/ld/config.in b/ld/config.in
+index ad0dc6a106c..d21edaddce7 100644
+--- a/ld/config.in
++++ b/ld/config.in
+@@ -58,6 +58,9 @@
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
+index 43b44be1dc6..28f054ea3f8 100755
+--- a/ld/configure
++++ b/ld/configure
+@@ -839,6 +839,7 @@ with_lib_path
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_gold
+ enable_got
+ enable_compressed_debug_sections
+@@ -1521,6 +1522,8 @@ Optional Features:
+   --enable-checking       enable run-time checks
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+@@ -15504,7 +15507,18 @@ else
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
+index 77edac3258c..a74dac63038 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
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
+index 05649ff61b8..1818c227473 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -163,6 +163,14 @@ typedef struct
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
+index db3a9f09b45..9dacc934f80 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2949,6 +2949,18 @@ string identifying the original linked file does not change.
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
+index b8fd4e5d8e0..1f1d8e23bc9 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index 0538f0a06a1..d1de3aec23d 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -166,6 +166,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+   OPTION_WARN_EXECSTACK,
+   OPTION_NO_WARN_EXECSTACK,
+   OPTION_WARN_RWX_SEGMENTS,
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 9290a189b0d..e2e3074e872 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -321,6 +321,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = true;
+   command_line.warn_search_mismatch = true;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = true;
++  command_line.error_poison_system_directories = false;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index c5960385572..da0a7829914 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =
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
+@@ -625,6 +633,7 @@ parse_args (unsigned argc, char **argv)
+   int ingroup = 0;
+   char *default_dirlist = NULL;
+   char *shortopts;
++  char *BR_paranoid_env;
+   struct option *longopts;
+   struct option *really_longopts;
+   int last_optind;
+@@ -1692,6 +1701,14 @@ parse_args (unsigned argc, char **argv)
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
+@@ -1837,6 +1854,10 @@ parse_args (unsigned argc, char **argv)
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
+2.40.1
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6e93b65c3e..fe1755683c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -24,6 +24,9 @@ config BR2_BINUTILS_VERSION_2_38_X
 config BR2_BINUTILS_VERSION_2_39_X
 	bool "binutils 2.39"
 
+config BR2_BINUTILS_VERSION_2_40_X
+	bool "binutils 2.40"
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
@@ -36,6 +39,7 @@ config BR2_BINUTILS_VERSION
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
+	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 5d45813b5a..e831d31b8a 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
+sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1ef7ee57d2..e34dd79f6f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -54,7 +54,8 @@ BINUTILS_CONF_OPTS = \
 	--with-system-zlib \
 	--disable-gprofng \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
+	--without-zstd
 
 ifeq ($(BR2_STATIC_LIBS),y)
 BINUTILS_CONF_OPTS += --disable-plugins
@@ -90,7 +91,8 @@ HOST_BINUTILS_CONF_OPTS = \
 	--enable-plugins \
 	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
+	--without-zstd
 
 ifeq ($(BR2_BINUTILS_GPROFNG),y)
 HOST_BINUTILS_DEPENDENCIES += host-bison
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
