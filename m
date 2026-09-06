Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3506CC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C5E80E48;
	Sun,  6 Sep 2026 12:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pea0wRForzd; Sun,  6 Sep 2026 12:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 45D5C80EB3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697142;
	b=pQhAeNXRoJNlR+tKAgtblaMM1THzf2tVqwRbbXdg5q0ZD/lbLweNkgqVVnotWTWdipGC
	 435Mn0p4VSLIepj1JZcmQkeg+tkitb/ia49JeYVV3eO2PwPwwUnkMYY8bijDrsn24fscd
	 M3IDyV86+xm8xPRfFZpi7gtzUxmdbXKaJQ0juUd0YVgRXagDd5BhFwYbKlcp2hz4p074t
	 QB3lRNIlQRXz1OzDexW4FY0JuJ5H1zoLMeFWQ3IztUAyYeJj+KycIKgkRzOk4Ewo2Vogc
	 QLA8iqLndRj8OlDbWchv4RBU1kzj1IJx2zgWP2xTVPsq66uCG87/YWkXNM2PiXGj6bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yU8QTmV58Y3WeLjTWV8VvGl+rQrav93mxjKB07LD0z4=;
	b=Q+2Rb9sahOhqNNMfZ0bJGE26WtnKheqPBqwJTlvcb9IP2VMe4vK2EOJ6T3w77J5+WMkv
	 EznTuL+sOWAEzWna8SEWe8pN8yGLfnN4UWQ0HGR5YReqWSaNGWwGId0oApbGb54ZQlvca
	 Sl4iFU6UnUuc7W37JT4jZBE5ZGaXORlU8ZJ4P2nVquSUaM0h+31A/ADxMdIq3UYkK0vXS
	 p2dEoUcgOz+izpVN5aDGOVKv7teTIro34sXNI+LefJHbvmHDhrG442YBXCvw7CpX7CW2/
	 JZgTlAACw/ExmgIk5rkBwG02PrDnhmbYcD1zP8iSEUsGMufp7bQYn49RvCUMGgxgOnw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697142;
	bh=yU8QTmV58Y3WeLjTWV8VvGl+rQrav93mxjKB07LD0z4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TS1KZNHsQ+X9T6BzFl+UmKtgTtpomxurYG5UtiYGyCC+EpezUEXYMv+yFayJmUAlA
	 /4xK6G1fIVNrzDS9pclfoJWqK6oaMB+JOWotnDljmT58SZUqizrpqM7PtNfY4bPs33
	 tTSsW+rhUsBKg0BLNvahWI2nIuy+evMX7bVmcr22av14yUk9PWSM/wRsRaPJmVV7S3
	 7BeP323L4LZddQzPihBfwSVSTDKQ7EJVhgJ4jQjZDve7o7Rvqq56vvfrOTJB/7o69l
	 9mGx0bPkQgwZvfRCW4S4y7CpCwdsHNjNDrUJW2KxeC/QGt3sthOPWNXwuBiG6LAtAw
	 ednrWXbebMhPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D5C80EB3;
	Sun,  6 Sep 2026 12:19:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0E7A58
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD96A405AE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eI-JTaQ00d9n for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2F0B24061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697128;
 b=eRAfgqQmxl6ASOTGndQNFHRil5m3o5y1S0hkJPnXsczB5CKye72dhe9dq8OYLVjcrRld
 nmWfONzGDfsqu+bVH2DJHa1+AcaIk+F5R1ViUDpQ0GZmA0LE8hnt1kdZn0YB9bJPHbFja
 HnDGFmSy20rs80YWR+5X1UyApqbKe/pG56lJF8A+VUFoezPN1rIkBAcKuHIgxsQEQyLKX
 iBRfMEs62VTIWhHfQlFWE29QZBFlIZ5Kv7ZYFQzW/ZPaCvJpF6O9x3Mra7uzOJ3aiaFiS
 DPLNw7URs7dQ2CfDNPYfRL9f/tVpmaACw3z7vsYeUlIqECi58W+pymhG/Sfqa1IR8/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=omIREqLiz0aMXiWdayvxReI6tZtS41Q7m6KOi7e67wc=;
 b=ZpPpjLXEjj/pBX9iJhjkBs0znckjOPWXC+lLJwa41TW0XveGCImvrTldGIPPpMcX5lZJ
 BOYcxP8eZpfLRd6rlwd1aIpYlAvvPEcboPwzHP3u7B8kd21rVOlnKiDkbKxIjJSNfucYZ
 V4hCpWXIQOVRZdmqEALGQyRyk3acgryKs0Dv6GsxvvWnF/pyzxJNzdTZ+JT8nrqfPnYup
 LeQB/3vRl3NE1+w/p94H6Qf2ATHNRXq7sg9VM1qjNqKSnI9weW9jf55/5wAfP1PGD4zTd
 6eEohYooVh4RH9qUoksDXjHKrgIkhP4uWhuL+fMRi6sbbGLJ3LUSLDW1KYEk0h1mQWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F0B24061B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADFA4953A9; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:56:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c70effd711ad70bfb0266328d24b9244359f74ff
X-Git-Newrev: a07a17d00ebf2a3fdf8bc8531c1716f74d18e456
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.ADFA4953A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: remove support for
 binutils 2.44
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a07a17d00ebf2a3fdf8bc8531c1716f74d18e456
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that binutils 2.47 has been introduced and binutils 2.46.1 made
the default version, drop the oldest supported version, binutils 2.44,
keeping only the 3 last versions supported: 2.45.1, 2.46.1 and 2.47.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |   7 +
 package/binutils/2.44/0001-sh-conf.patch           |  50 ----
 .../2.44/0002-poison-system-directories.patch      | 310 ---------------------
 package/binutils/2.44/0003-objdump-memleak.patch   |  31 ---
 ...or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch |  61 ----
 ...g-protect-against-standard-library-macros.patch |  35 ---
 package/binutils/Config.in.host                    |   4 -
 package/binutils/binutils.hash                     |   1 -
 8 files changed, 7 insertions(+), 492 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e4824231fc..6c222c0e57 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_BINUTILS_VERSION_2_44_X
+	bool "binutils 2.44 has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.44 has been removed, select a newer version
+	  instead.
+
 config BR2_KERNEL_HEADERS_7_1
 	bool "kernel headers version 7.1.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/binutils/2.44/0001-sh-conf.patch b/package/binutils/2.44/0001-sh-conf.patch
deleted file mode 100644
index e56f52b9d8..0000000000
--- a/package/binutils/2.44/0001-sh-conf.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From d5f66b0da8d1e0ed091bff65f8a4db10a82a5420 Mon Sep 17 00:00:00 2001
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
-index bbfb5979546..bcd95684ae1 100755
---- a/configure
-+++ b/configure
-@@ -4056,7 +4056,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index f9694cdf901..d6a3623ba50 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1278,7 +1278,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
--- 
-2.48.1
-
diff --git a/package/binutils/2.44/0002-poison-system-directories.patch b/package/binutils/2.44/0002-poison-system-directories.patch
deleted file mode 100644
index b8d6d15525..0000000000
--- a/package/binutils/2.44/0002-poison-system-directories.patch
+++ /dev/null
@@ -1,310 +0,0 @@
-From 947a56b4ba73ec3fbf9c1fcff46d65754ba12e27 Mon Sep 17 00:00:00 2001
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
- ld/ldfile.c     | 16 ++++++++++++++++
- ld/ldlex.h      |  2 ++
- ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 21 +++++++++++++++++++++
- 9 files changed, 88 insertions(+)
-
-diff --git a/ld/config.in b/ld/config.in
-index 2d7b6406d2b..37cd12d20fa 100644
---- a/ld/config.in
-+++ b/ld/config.in
-@@ -78,6 +78,9 @@
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
-index d3995b73c06..2317f06682e 100755
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
-@@ -1537,6 +1538,8 @@ Optional Features:
-   --enable-checking       enable run-time checks
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15592,7 +15595,18 @@ else
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
-index 228f2ee4089..50a4b0f4db1 100644
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
-index 254f0a097bb..daf777c65c8 100644
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
-index f6384ad82dd..9d972ec9725 100644
---- a/ld/ld.texi
-+++ b/ld/ld.texi
-@@ -3263,6 +3263,18 @@ bit string identifying the original linked file does not change.
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
-index 12551504ae6..c6bfb98e522 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -328,6 +328,22 @@ ldfile_add_library_path (const char *name, bool cmdline)
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
- }
- 
- static void
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index b8b7d6b6829..c4b91482452 100644
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -171,6 +171,8 @@ enum option_values
-   OPTION_CTF_VARIABLES,
-   OPTION_NO_CTF_VARIABLES,
-   OPTION_CTF_SHARE_TYPES,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
-   OPTION_ERROR_EXECSTACK,
-   OPTION_NO_ERROR_EXECSTACK,
-   OPTION_WARN_EXECSTACK_OBJECTS,
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index f1c5f7035c5..69dd2d89357 100644
---- a/ld/ldmain.c
-+++ b/ld/ldmain.c
-@@ -351,6 +351,8 @@ main (int argc, char **argv)
-   command_line.warn_mismatch = true;
-   command_line.warn_search_mismatch = true;
-   command_line.check_section_addresses = -1;
-+  command_line.poison_system_directories = true;
-+  command_line.error_poison_system_directories = false;
- 
-   /* We initialize DEMANGLING based on the environment variable
-      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 5399aa45b72..a04346bee58 100644
---- a/ld/lexsup.c
-+++ b/ld/lexsup.c
-@@ -650,6 +650,14 @@ static const struct ld_option ld_options[] =
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
-@@ -662,6 +670,7 @@ parse_args (unsigned argc, char **argv)
-   int ingroup = 0;
-   char *default_dirlist = NULL;
-   char *shortopts;
-+  char *BR_paranoid_env;
-   struct option *longopts;
-   struct option *really_longopts;
-   int last_optind;
-@@ -1789,6 +1798,14 @@ parse_args (unsigned argc, char **argv)
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
-@@ -1933,6 +1950,10 @@ parse_args (unsigned argc, char **argv)
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
-2.48.1
-
diff --git a/package/binutils/2.44/0003-objdump-memleak.patch b/package/binutils/2.44/0003-objdump-memleak.patch
deleted file mode 100644
index 1b1632093d..0000000000
--- a/package/binutils/2.44/0003-objdump-memleak.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 19 Feb 2025 07:58:54 +1030
-Subject: [PATCH] PR32716, objdump -i memory leak
-
-PR binutils/32716
-* bucomm.c (display_info): Free arg.info.
-
-Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
-
-CVE: CVE-2025-3198
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- binutils/bucomm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/binutils/bucomm.c b/binutils/bucomm.c
-index ccf54099154..d4554737db1 100644
---- a/binutils/bucomm.c
-+++ b/binutils/bucomm.c
-@@ -435,6 +435,7 @@ display_info (void)
-   if (!arg.error)
-     display_target_tables (&arg);
- 
-+  free (arg.info);
-   return arg.error;
- }
- 
--- 
-2.43.5
-
diff --git a/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch b/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
deleted file mode 100644
index f4121ee80f..0000000000
--- a/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From d320649e1805e5330a09b103d4ca890a12815f56 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Tue, 18 Nov 2025 12:09:54 +0800
-Subject: [PATCH] or1k: Mark undefined TLS symbol as STT_TLS
-
-Update or1k_apply_fix to handle all TLS relocations.
-
-	PR gas/33426
-	* config/tc-or1k.c (or1k_apply_fix): Handle all TLS relocations.
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-
-Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d320649e1805e5330a09b103d4ca890a12815f56
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gas/config/tc-or1k.c | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/gas/config/tc-or1k.c b/gas/config/tc-or1k.c
-index f5a20b94fa7..798cf6d6acc 100644
---- a/gas/config/tc-or1k.c
-+++ b/gas/config/tc-or1k.c
-@@ -354,22 +354,28 @@ or1k_apply_fix (struct fix *f, valueT *t, segT s)
- 
-   switch (f->fx_r_type)
-     {
-+    case BFD_RELOC_OR1K_TLS_DTPMOD:
-+    case BFD_RELOC_OR1K_TLS_DTPOFF:
-     case BFD_RELOC_OR1K_TLS_GD_HI16:
-+    case BFD_RELOC_OR1K_TLS_GD_LO13:
-     case BFD_RELOC_OR1K_TLS_GD_LO16:
-     case BFD_RELOC_OR1K_TLS_GD_PG21:
--    case BFD_RELOC_OR1K_TLS_GD_LO13:
-+    case BFD_RELOC_OR1K_TLS_IE_AHI16:
-+    case BFD_RELOC_OR1K_TLS_IE_HI16:
-+    case BFD_RELOC_OR1K_TLS_IE_LO13:
-+    case BFD_RELOC_OR1K_TLS_IE_LO16:
-+    case BFD_RELOC_OR1K_TLS_IE_PG21:
-     case BFD_RELOC_OR1K_TLS_LDM_HI16:
-+    case BFD_RELOC_OR1K_TLS_LDM_LO13:
-     case BFD_RELOC_OR1K_TLS_LDM_LO16:
-     case BFD_RELOC_OR1K_TLS_LDM_PG21:
--    case BFD_RELOC_OR1K_TLS_LDM_LO13:
-     case BFD_RELOC_OR1K_TLS_LDO_HI16:
-     case BFD_RELOC_OR1K_TLS_LDO_LO16:
--    case BFD_RELOC_OR1K_TLS_IE_HI16:
--    case BFD_RELOC_OR1K_TLS_IE_LO16:
--    case BFD_RELOC_OR1K_TLS_IE_PG21:
--    case BFD_RELOC_OR1K_TLS_IE_LO13:
-+    case BFD_RELOC_OR1K_TLS_LE_AHI16:
-     case BFD_RELOC_OR1K_TLS_LE_HI16:
-     case BFD_RELOC_OR1K_TLS_LE_LO16:
-+    case BFD_RELOC_OR1K_TLS_LE_SLO16:
-+    case BFD_RELOC_OR1K_TLS_TPOFF:
-       S_SET_THREAD_LOCAL (f->fx_addsy);
-       break;
-     default:
--- 
-2.43.7
-
diff --git a/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch b/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
deleted file mode 100644
index b344d7e2f6..0000000000
--- a/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Sat, 22 Nov 2025 11:29:43 +0100
-Subject: [PATCH] gprofng: protect against standard library macros
-
-The CALL_UTIL macro can expand to an unparsable expression of the argument
-is a macro, like with the new const-preserving standard library macros in
-C23.
-
-	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
-	expand its argument if it is a function-like macro.
-
-Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gprofng/src/collector_module.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
-index b64d69c45ab..859a6dd1f7d 100644
---- a/gprofng/src/collector_module.h
-+++ b/gprofng/src/collector_module.h
-@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
- extern CollectorUtilFuncs __collector_util_funcs;
- extern int __collector_dlsym_guard;
- 
--#define CALL_UTIL(x) __collector_util_funcs.x
-+#define CALL_UTIL(x) (__collector_util_funcs.x)
- 
- /* The following constants define the meaning of the "void *arg"
-  * argument of getFrameInfo().
--- 
-2.43.7
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index af00a10b9f..50bfc9b458 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -11,9 +11,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_44_X
-	bool "binutils 2.44"
-
 config BR2_BINUTILS_VERSION_2_45_X
 	bool "binutils 2.45.1"
 
@@ -27,7 +24,6 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
 	default "2.46.1"	if BR2_BINUTILS_VERSION_2_46_X
 	default "2.47"		if BR2_BINUTILS_VERSION_2_47_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 214a0db791..8e02869372 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263b19d25302c37759784e14fcb4b9421b29e0e2c7f450bd99f6bb4595c  binutils-2.46.1.tar.xz
 sha512  3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98  binutils-2.47.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
