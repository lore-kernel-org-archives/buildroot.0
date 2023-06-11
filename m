Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E504C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E589F40383;
	Sun, 11 Jun 2023 13:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E589F40383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id se8ijRR1Qg-8; Sun, 11 Jun 2023 13:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99EDF405EC;
	Sun, 11 Jun 2023 13:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99EDF405EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75D371BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F4F683486
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4F683486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqW2910Cm1BH for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:16:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9541D8183D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9541D8183D
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:16:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30ae141785bso3168404f8f.3
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489402; x=1689081402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWGjjvs4CuEwXFZrmNF5I62N8Amxkua2dk33+NtB+kU=;
 b=Ex7ZxCnP6pC2ZsIAZ50v2bjxvbRLyHOCzP3xSco2G/WMewcE1KhAMu0pEm75Ej3zoR
 hCvp/E/R/pl1P8Pd1bHhEz36V9+Lf3UlWcv9xCWdkJmsHNIu7X24TrexLlEFfN3PPgZZ
 T91baFs9IIP4+yquxcpIICG6jNCgBMgRHRc3TXtXXhM3qiS4a2yxn65nMXQyA8u90/yG
 XtUvC4B3K2BUM6Nq842BtC/8r1vFUChR3NVQP1NHHgKsecTGEd8hsohbuisZf+hg/ttP
 P/JAFkfosT7R1YNFc+9AUz8mfw7rYtAGV8n5jrTq7ytb1jhKGJzU+28NZQkKvdmjgK5J
 LsQA==
X-Gm-Message-State: AC+VfDwNicadzIQEgV1BHY8XCvAeZMJuwcNi4ag5+GpK/H4bBfQnfHmu
 +8HBQ9FA11gASRqrGvl70Kvof7PV4m0=
X-Google-Smtp-Source: ACHHUZ6z0G8qLIzTozo+kERFsm1d7j90uptLsdFrl6lJj2MR/jTWQdxcqAlmeF/Tetee6aPXzSzHmg==
X-Received: by 2002:a5d:5612:0:b0:309:49e3:efaa with SMTP id
 l18-20020a5d5612000000b0030949e3efaamr3154914wrv.29.1686489401386; 
 Sun, 11 Jun 2023 06:16:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0030fc079b7f3sm747585wru.73.2023.06.11.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:16:40 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:16:31 +0200
Message-Id: <20230611131631.806432-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611131631.806432-1-romain.naour@gmail.com>
References: <20230611131631.806432-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489402; x=1689081402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWGjjvs4CuEwXFZrmNF5I62N8Amxkua2dk33+NtB+kU=;
 b=fhkqO+DPT5ueZeTTyYaUjqaPcykYcZh3109jlyaJew5thhPJxrlLccFNLBqm9hmtfJ
 j88Nl5gH35q5TTrMg/EvhFLxSd28pE4C+ps32MrZMBJusNAakh0IdTQDFGcLVG+xdomM
 BpHmc7ZKINk8FPSunbu4ve7f7XwrTfnR+hKP5jwqeh/dYMUpKMZqBq0hvnKrPJHEsyQ4
 U9oQQwmjBTI+n2amzMPx5dYxhwth3bnJuoEO3RovBEaTSaI1wSyvd30Jl8oxcH/uj3NU
 oopsxXu8u94ypb/uWNEzd9NdV97Cf1t/dvrof+ddV9/BU9zIaGQUSLTzMB9VYPCzBEm2
 ZWxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fhkqO+DP
Subject: [Buildroot] [PATCH 5/5] package/binutils: drop 2.37.x series
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that 2.40.x has been added, that 2.39.x is the default version,
drop support for 2.37.x.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .checkpackageignore                           |   7 -
 Config.in.legacy                              |   8 +
 package/binutils/2.37/0001-sh-conf.patch      |  48 ---
 .../2.37/0002-poison-system-directories.patch | 306 ------------------
 ...or1k-fix-building-with-gcc-version-5.patch |  50 ---
 ...tive-relocation-against-dynamic-on-P.patch |  59 ----
 ...K_GOT16-signed-overflow-by-using-spe.patch |  75 -----
 ...le-descriptor-if-there-is-no-archive.patch | 236 --------------
 ...OT32-relocations-against-ABS-symbols.patch |  47 ---
 package/binutils/Config.in.host               |   8 -
 package/binutils/binutils.hash                |   1 -
 11 files changed, 8 insertions(+), 837 deletions(-)
 delete mode 100644 package/binutils/2.37/0001-sh-conf.patch
 delete mode 100644 package/binutils/2.37/0002-poison-system-directories.patch
 delete mode 100644 package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
 delete mode 100644 package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
 delete mode 100644 package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
 delete mode 100644 package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
 delete mode 100644 package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index c2316d1d4e..1cbf664bcf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -214,13 +214,6 @@ package/berkeleydb/0001-cwd-db_config.patch Upstream
 package/berkeleydb/0002-atomic_compare_exchange.patch Upstream
 package/bind/0001-cross.patch Upstream
 package/bind/S81named Indent Shellcheck Variables
-package/binutils/2.37/0001-sh-conf.patch Upstream
-package/binutils/2.37/0002-poison-system-directories.patch Upstream
-package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch Upstream
-package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch Upstream
-package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch Upstream
-package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch Upstream
-package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch Upstream
 package/binutils/2.38/0001-sh-conf.patch Upstream
 package/binutils/2.38/0002-poison-system-directories.patch Upstream
 package/binutils/2.38/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ac2e302a6b..d3a67aba83 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2023.08"
+
+config BR2_BINUTILS_VERSION_2_37_X
+	bool "binutils 2.37.x has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.37 has been removed, use a newer version.
+
 comment "Legacy options removed in 2023.05"
 
 config BR2_KERNEL_HEADERS_6_2
diff --git a/package/binutils/2.37/0001-sh-conf.patch b/package/binutils/2.37/0001-sh-conf.patch
deleted file mode 100644
index fcc597e4d9..0000000000
--- a/package/binutils/2.37/0001-sh-conf.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 33f3c1f804efc2e4f97849081589efb70cda31e5 Mon Sep 17 00:00:00 2001
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
-index 3dd206525a7..6881ce632f5 100755
---- a/configure
-+++ b/configure
-@@ -3892,7 +3892,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index 797a624621e..1f9256bbf18 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1175,7 +1175,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.31.1
-
diff --git a/package/binutils/2.37/0002-poison-system-directories.patch b/package/binutils/2.37/0002-poison-system-directories.patch
deleted file mode 100644
index 1a5fe46575..0000000000
--- a/package/binutils/2.37/0002-poison-system-directories.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From 4d8705ddb55897e8a74b617ab95736d520d9e1ea Mon Sep 17 00:00:00 2001
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
-index 26d55a00d47..ffad464783c 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -43,6 +43,9 @@
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
-index c197aaef3cb..882263aa43f 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -829,6 +829,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1498,6 +1499,8 @@ Optional Features:
-   --enable-checking       enable run-time checks
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15236,7 +15239,18 @@ else
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
-index 8ea97c43cd4..0f246db67d8 100644
---- a/ld/configure.ac
-+++ b/ld/configure.ac
-@@ -106,6 +106,16 @@ AC_SUBST(use_sysroot)
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
-index 35fafebfaed..74e66405de6 100644
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -162,6 +162,14 @@ typedef struct
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
-index dd8f571d4e4..3ab210b41b9 100644
---- a/ld/ld.texi
-+++ b/ld/ld.texi
-@@ -2863,6 +2863,18 @@ string identifying the original linked file does not change.
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
-index 9d0af06f1f6..7cdd3b1c1b1 100644
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
-index 9e8bf5fb835..2f0fadfe0a3 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -163,6 +163,8 @@ enum option_values
-   OPTION_CTF_VARIABLES,
-   OPTION_NO_CTF_VARIABLES,
-   OPTION_CTF_SHARE_TYPES,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 42660eb9a3c..1aef9387f93 100644
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
-index 00274c500d0..4f23b3a2da2 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -595,6 +595,14 @@ static const struct ld_option ld_options[] =
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
-@@ -607,6 +615,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1643,6 +1652,14 @@ parse_args (unsigned argc, char **argv)
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
-@@ -1788,6 +1805,10 @@ parse_args (unsigned argc, char **argv)
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
-2.31.1
-
diff --git a/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
deleted file mode 100644
index bfd531b818..0000000000
--- a/package/binutils/2.37/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ef4ba1da823e8366ea4f126f50885a44ebf4dcf0 Mon Sep 17 00:00:00 2001
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
-2.31.1
-
diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
deleted file mode 100644
index 0d18321ee1..0000000000
--- a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 203b80f8dbdd3ddb860114b03351a0dea28c978f Mon Sep 17 00:00:00 2001
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
-index 32063ab0289..67252394173 100644
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
-+	      ret_val = false;
-+	      bfd_set_error (bfd_error_bad_value);
-+	    }
-+	  break;
-+
- 	case R_OR1K_PCREL_PG21:
- 	case R_OR1K_LO13:
- 	case R_OR1K_SLO13:
--- 
-2.31.1
-
diff --git a/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
deleted file mode 100644
index 8609db95b7..0000000000
--- a/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 362a20108782b87cd780a989c0dbd014fc2def8b Mon Sep 17 00:00:00 2001
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
-index 4ae7f324d33..7fd88d72442 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
- 	 false),		/* pcrel_offset */
- };
- 
-+/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
-+   relocations when we know we can ignore overflows.  */
-+static reloc_howto_type or1k_elf_got16_no_overflow_howto =
-+  HOWTO (R_OR1K_GOT16,		/* type */
-+	 0,			/* rightshift */
-+	 2,			/* size (0 = byte, 1 = short, 2 = long) */
-+	 16,			/* bitsize */
-+	 false,			/* pc_relative */
-+	 0,			/* bitpos */
-+	 complain_overflow_dont, /* complain_on_overflow */
-+	 bfd_elf_generic_reloc, /* special_function */
-+	 "R_OR1K_GOT16",	/* name */
-+	 false,			/* partial_inplace */
-+	 0,			/* src_mask */
-+	 0xffff,		/* dst_mask */
-+	 false);		/* pcrel_offset */
-+
- /* Map BFD reloc types to Or1k ELF reloc types.  */
- 
- struct or1k_reloc_map
-@@ -1506,12 +1523,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
- 	    if (r_type == R_OR1K_GOT_AHI16)
- 	      saw_gotha = true;
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
diff --git a/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
deleted file mode 100644
index 46697cc5c8..0000000000
--- a/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Mon, 26 Jul 2021 05:59:55 -0700
-Subject: [PATCH] bfd: Close the file descriptor if there is no archive fd
-
-Close the file descriptor if there is no archive plugin file descriptor
-to avoid running out of file descriptors on thin archives with many
-archive members.
-
-bfd/
-
-	PR ld/28138
-	* plugin.c (bfd_plugin_close_file_descriptor): Close the file
-	descriptor there is no archive plugin file descriptor.
-
-ld/
-
-	PR ld/28138
-	* testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
-	native build.
-
-	PR ld/28138
-	* testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
-	* testsuite/ld-plugin/pr28138.c: New file.
-	* testsuite/ld-plugin/pr28138-1.c: Likewise.
-	* testsuite/ld-plugin/pr28138-2.c: Likewise.
-	* testsuite/ld-plugin/pr28138-3.c: Likewise.
-	* testsuite/ld-plugin/pr28138-4.c: Likewise.
-	* testsuite/ld-plugin/pr28138-5.c: Likewise.
-	* testsuite/ld-plugin/pr28138-6.c: Likewise.
-	* testsuite/ld-plugin/pr28138-7.c: Likewise.
-
-(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
-(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
-
-[Upstream:
- https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- bfd/plugin.c                       |  8 +++++++
- ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
- ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
- ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
- 10 files changed, 104 insertions(+)
- create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
- create mode 100644 ld/testsuite/ld-plugin/pr28138.c
-
-diff --git a/bfd/plugin.c b/bfd/plugin.c
-index 6cfa2b66470..3bab8febe88 100644
---- a/bfd/plugin.c
-+++ b/bfd/plugin.c
-@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd)
- 	     && !bfd_is_thin_archive (abfd->my_archive))
- 	abfd = abfd->my_archive;
- 
-+      /* Close the file descriptor if there is no archive plugin file
-+	 descriptor.  */
-+      if (abfd->archive_plugin_fd == -1)
-+	{
-+	  close (fd);
-+	  return;
-+	}
-+
-       abfd->archive_plugin_fd_open_count--;
-       /* Dup the archive plugin file descriptor for later use, which
- 	 will be closed by _bfd_archive_close_and_cleanup.  */
-diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto.exp
-index def69e43ab3..999d911ce6a 100644
---- a/ld/testsuite/ld-plugin/lto.exp
-+++ b/ld/testsuite/ld-plugin/lto.exp
-@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available] } {
-     }
- }
- 
-+run_cc_link_tests [list \
-+    [list \
-+	"Build pr28138.a" \
-+	"-T" "" \
-+	{pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
-+	 pr28138-6.c pr28138-7.c} {} "pr28138.a" \
-+    ] \
-+    [list \
-+	"Build pr28138.o" \
-+	"" "" \
-+	{pr28138.c} {} \
-+    ] \
-+]
-+
-+set exec_output [run_host_cmd "sh" \
-+			      "-c \"ulimit -n 20; \
-+			      $CC -Btmpdir/ld -o tmpdir/pr28138 \
-+			      tmpdir/pr28138.o tmpdir/pr28138.a\""]
-+set exec_output [prune_warnings $exec_output]
-+if [string match "" $exec_output] then {
-+    if { [isnative] } {
-+	set exec_output [run_host_cmd "tmpdir/pr28138" ""]
-+	if [string match "PASS" $exec_output] then {
-+	    pass "PR ld/28138"
-+	} else {
-+	    fail "PR ld/28138"
-+	}
-+    } else {
-+	pass "PR ld/28138"
-+    }
-+} else {
-+    fail "PR ld/28138"
-+}
-+
- set testname "Build liblto-11.a"
- remote_file host delete "tmpdir/liblto-11.a"
- set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a tmpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
-diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin/pr28138-1.c
-new file mode 100644
-index 00000000000..51d119e1642
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-1.c
-@@ -0,0 +1,6 @@
-+extern int a0(void);
-+int
-+a1(void)
-+{
-+  return 1 + a0();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin/pr28138-2.c
-new file mode 100644
-index 00000000000..1120cd797e9
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-2.c
-@@ -0,0 +1,6 @@
-+extern int a1(void);
-+int
-+a2(void)
-+{
-+  return 1 + a1();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin/pr28138-3.c
-new file mode 100644
-index 00000000000..ec464947ee6
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-3.c
-@@ -0,0 +1,6 @@
-+extern int a2(void);
-+int
-+a3(void)
-+{
-+  return 1 + a2();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin/pr28138-4.c
-new file mode 100644
-index 00000000000..475701b2c5c
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-4.c
-@@ -0,0 +1,6 @@
-+extern int a3(void);
-+int
-+a4(void)
-+{
-+  return 1 + a3();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin/pr28138-5.c
-new file mode 100644
-index 00000000000..e24f86c363e
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-5.c
-@@ -0,0 +1,6 @@
-+extern int a4(void);
-+int
-+a5(void)
-+{
-+  return 1 + a4();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin/pr28138-6.c
-new file mode 100644
-index 00000000000..b5b938bdb21
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-6.c
-@@ -0,0 +1,6 @@
-+extern int a5(void);
-+int
-+a6(void)
-+{
-+  return 1 + a5();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin/pr28138-7.c
-new file mode 100644
-index 00000000000..4ef75bf0f0c
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138-7.c
-@@ -0,0 +1,6 @@
-+extern int a6(void);
-+int
-+a7(void)
-+{
-+  return 1 + a6();
-+}
-diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/pr28138.c
-new file mode 100644
-index 00000000000..68252c9f382
---- /dev/null
-+++ b/ld/testsuite/ld-plugin/pr28138.c
-@@ -0,0 +1,20 @@
-+#include <stdio.h>
-+
-+extern int a7(void);
-+
-+int
-+a0(void)
-+{
-+  return 0;
-+}
-+
-+int
-+main()
-+{
-+  if (a7() == 7)
-+    {
-+      printf ("PASS\n");
-+      return 0;
-+    }
-+  return 1;
-+}
--- 
-2.34.1
-
diff --git a/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
deleted file mode 100644
index 3e29282261..0000000000
--- a/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
+++ /dev/null
@@ -1,47 +0,0 @@
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
index a1800e49e2..de5ca866e5 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,12 +12,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_37_X
-	bool "binutils 2.37"
-	# AVX512FP16 instructions were not supported before binutils
-	# 2.38
-	depends on !BR2_X86_CPU_HAS_AVX512
-
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38"
 
@@ -36,7 +30,6 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
 	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
@@ -44,7 +37,6 @@ config BR2_BINUTILS_VERSION
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
 	depends on !BR2_BINUTILS_VERSION_ARC
-	depends on !BR2_BINUTILS_VERSION_2_37_X
 	depends on !BR2_BINUTILS_VERSION_2_38_X
 	help
 	  This option enables support for gprofng, a new profiler.
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index e831d31b8a..1a24c2f4bd 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
 sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
-- 
2.40.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

