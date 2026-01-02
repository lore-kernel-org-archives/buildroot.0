Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3409FA374F
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC1D605F4;
	Fri,  2 Jan 2026 15:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSdP28uSb3jk; Fri,  2 Jan 2026 15:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 836CA6062A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368038;
	bh=WB7BA9zC1pRnCQUfs3RRh9ELQ9Tq5q/GYheTVZVggy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JgFquNQ7IEABeuAKLVZjwBcpypgZ0X+L0i3FB9Aukd4sibCWiOCTVdQNlAY+f3e4P
	 jSzordXAV/yb8EXQ/g7YWyeYf5I8E7SKwvhoS6JDSMQAMd+XS1EMYx/upCRdF1czx5
	 7s1aJukICb+ZzwVVQKj7tmJ6Q8k1y86bMFzcIsqv6J45mTf6VZ43dDOQMhK3knQ2N8
	 CDNxASrunq8dFOjDz3owPOh91knB/67AMoFK7GJYitSIyCkgs+ccX3Mi0ZHCsrGJRq
	 GmTilvqODBsBJQymF5yuMnHIqYmYCH8a3qpo/Nyl/Rypnkl+IlyLvt6iKfYqLSvwhd
	 74Q6/JGYpX+CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836CA6062A;
	Fri,  2 Jan 2026 15:33:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9580CD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86FA76062A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hw1jU97o8yrO for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F18605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F18605F4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:33:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D10B8877A4; Fri,  2 Jan 2026 15:33:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:32:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf655e8091007eb697e9516e16a93311c8085de0
X-Git-Newrev: cea219e5180e7117a6002c4a784995c9dad48176
X-Patchwork-Hint: ignore
Message-Id: <20260102153354.D10B8877A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeltrace2: bump to version 2.1.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cea219e5180e7117a6002c4a784995c9dad48176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch was merged in version v2.1.0 [1]. Its removal made
running autoreconf no longer necessary. Moreover, commit [2] also
changed the names of the license files and introduced new ones.

Release notes since 2.0.7:
https://github.com/efficios/babeltrace/releases

[1] https://github.com/efficios/babeltrace/commit/28ba44ad9ca14153e96c94a9100423ea224c1af3
[2] https://github.com/efficios/babeltrace/commit/0235b0db7de5bcacdb3650c92461f2ce5eb2143d
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...onfigure-simplify-warning-flags-detection.patch | 671 ---------------------
 package/babeltrace2/babeltrace2.hash               |  17 +-
 package/babeltrace2/babeltrace2.mk                 |  25 +-
 4 files changed, 31 insertions(+), 683 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a4585833f5..6a6f599311 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -220,7 +220,6 @@ package/automake/0001-noman.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_patch.Upstream
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch lib_patch.Upstream
diff --git a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch b/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
deleted file mode 100644
index bd61843acf..0000000000
--- a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
+++ /dev/null
@@ -1,671 +0,0 @@
-From 28ba44ad9ca14153e96c94a9100423ea224c1af3 Mon Sep 17 00:00:00 2001
-From: Simon Marchi <simon.marchi@efficios.com>
-Date: Tue, 18 Feb 2020 13:14:22 -0500
-Subject: [PATCH] configure: simplify warning flags detection
-
-We currently use the AX_COMPILER_FLAGS macro to detect the warning flags
-that the current compiler supports.  It works, but is quite invasive.
-It unconditionally enables a bunch of warnings we don't want, which
-forces us to disable them with many -Wno-foo switches.
-
-Instead of using AX_COMPILER_FLAGS, we can use the slightly lower lever
-macro AX_APPEND_COMPILE_FLAGS to achieve our goal of detecting which
-warning flags are supported.  This is what we ended up using in
-lttng-tools (a completely unrelated project, but that has a suspiciously
-high ratio of contributors in common with Babeltrace).
-
-I looked in our git history to see which warning flags were mentioned in
-commit messages.  I have added the flags that did find actual problems
-and are not enabled by default to the AX_APPEND_COMPILE_FLAGS invocation.
-I have also added the flags that AX_COMPILER_FLAGS did provide, which we
-didn't need to disable.
-
-The --{enable,disable}-Werror flag is added using an explicit
-AC_ARG_ENABLE.  In lttng-tools, it was decided to _not_ have -Werror by
-default, so I suggest we do the same in Babeltrace, for consistency
-(although it saddens me very much).  Developers who want to build with
--Werror will need to pass --enable-Werror.
-
-Note that with this patch, we lose the following configure switch, that
-is provided by AX_COMPILER_FLAGS:
-
-  --enable-compile-warnings=[no/yes/error]
-
-Change-Id: If968f7385a7f5c48d27f402c76bc26241a8f505a
-Signed-off-by: Simon Marchi <simon.marchi@efficios.com>
-Reviewed-on: https://review.lttng.org/c/babeltrace/+/3209
-Tested-by: jenkins <jenkins@lttng.org>
-Reviewed-by: Michael Jeanson <mjeanson@efficios.com>
-
-[Retrieved from:
-https://github.com/efficios/babeltrace/commit/28ba44ad9ca14153e96c94a9100423ea224c1af3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: adapt to 2.0.6]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- configure.ac                    |  74 +++++++++------
- m4/ax_compiler_flags.m4         | 158 -------------------------------
- m4/ax_compiler_flags_cflags.m4  | 161 --------------------------------
- m4/ax_compiler_flags_gir.m4     |  60 ------------
- m4/ax_compiler_flags_ldflags.m4 | 111 ----------------------
- 5 files changed, 46 insertions(+), 518 deletions(-)
- delete mode 100644 m4/ax_compiler_flags.m4
- delete mode 100644 m4/ax_compiler_flags_cflags.m4
- delete mode 100644 m4/ax_compiler_flags_gir.m4
- delete mode 100644 m4/ax_compiler_flags_ldflags.m4
-
-diff --git a/configure.ac b/configure.ac
-index 055fba101..7ebcf2ad4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -694,25 +694,35 @@
- CFLAGS=${save_CFLAGS}
- 
- # Detect C and LD warning flags supported by the compiler.
--AX_COMPILER_FLAGS(
--	[WARN_CFLAGS], dnl CFLAGS variable name
--	[WARN_LDFLAGS], dnl LDFLAGS variable name (unused for now)
--	[], dnl is-release
--	[], dnl Extra base CFLAGS
--	[ dnl Extra "yes" CFLAGS
--		dnl Disable these flags, either because we don't want them
--		dnl or because we want them but are not ready to enable them
--		dnl yet.
--		-Wno-sign-compare dnl
--		-Wno-inline dnl
--		-Wno-declaration-after-statement dnl
--		-Wno-switch-enum dnl
--		-Wno-switch-default dnl
--		-Wno-packed dnl
--		-Wno-pointer-arith dnl
-+
-+# Detect warning flags supported by the compiler, append them to WARN_CFLAGS.
-+#
-+# Pass -Werror as an extra flag during the test: this is needed to make the
-+# -Wunknown-warning-option diagnostic fatal with clang.
-+AX_APPEND_COMPILE_FLAGS([ dnl
-+		-Wall dnl
-+		-Wextra dnl
-+		-Wstrict-prototypes dnl
-+		-Wmissing-prototypes dnl
-+		-Wmissing-declarations dnl
-+		-Wnull-dereference dnl
-+		-Wundef dnl
-+		-Wredundant-decls dnl
-+		-Wshadow dnl
-+		-Wjump-misses-init dnl
-+		-Wtautological-constant-out-of-range-compare dnl
-+		-Wnested-externs dnl
-+		-Wwrite-strings dnl
-+		-Wformat=2 dnl
- 		-Wno-format-nonliteral dnl
--		-Wno-double-promotion dnl
--		-Wno-cast-align dnl
-+		-Wstrict-aliasing dnl
-+		-Wmissing-noreturn dnl
-+		-Winit-self dnl
-+		-Wduplicated-cond dnl
-+		-Wduplicated-branches dnl
-+		-Wlogical-op dnl
-+		-Wno-unused-parameter dnl
-+		-Wno-sign-compare dnl
- 		dnl
- 		dnl Some versions of SWIG (like 3.0.12) generate code that produces
- 		dnl -Wcast-function-type warnings.  This warning is present in gcc >= 8.  This
-@@ -727,24 +737,32 @@
- 		dnl Ref: https://github.com/swig/swig/issues/1259
- 		-Wno-cast-function-type dnl
- 		-Wno-suggest-attribute=format dnl
--	])
-+		-Wno-missing-field-initializers dnl
-+	],
-+	[WARN_CFLAGS],
-+	[-Werror])
-+
-+# When given, add -Werror to WARN_CFLAGS.
-+AC_ARG_ENABLE([Werror],
-+	[AS_HELP_STRING([--enable-Werror], [Treat compiler warnings as errors.])]
-+)
-+AS_IF([test "x$enable_Werror" = "xyes"],
-+	[WARN_CFLAGS="${WARN_CFLAGS} -Werror"]
-+)
- 
--# CFLAGS from AX_COMPILER_FLAGS.
--AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
--
--# The test used in AX_COMPILER_FLAGS, generated using AC_LANG_PROGRAM, is
-+# The test used in AX_APPEND_COMPILE_FLAGS, generated using AC_LANG_PROGRAM, is
- # written in such a way that it triggers a -Wold-style-definition warning.  So
--# if the user has -Werror in their CFLAGS, that warning flag will end up
--# disabled, because the test program will not build.
-+# this warning always ends up disabled if we put it there, because the test
-+# program does not build.
- #
- # Enable it here unconditionally.  It is supported by GCC >= 4.8 and by Clang
- # (it is accepted for compatibility although it has no effect), and there is
- # not reason to not want it.
- 
--AM_CFLAGS="${AM_CFLAGS} -Wold-style-definition"
-+WARN_CFLAGS="${WARN_CFLAGS} -Wold-style-definition"
- 
--# We want this one to always be an error.
--AM_CFLAGS="${AM_CFLAGS} -Werror=implicit-function-declaration"
-+# CFLAGS from AX_APPEND_COMPILE_FLAGS.
-+AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
- 
- # Done for AM_CFLAGS.
- AC_SUBST(AM_CFLAGS)
-diff --git a/m4/ax_compiler_flags.m4 b/m4/ax_compiler_flags.m4
-deleted file mode 100644
-index ddb0456c4..000000000
---- a/m4/ax_compiler_flags.m4
-+++ /dev/null
-@@ -1,158 +0,0 @@
--# ===========================================================================
--#    https://www.gnu.org/software/autoconf-archive/ax_compiler_flags.html
--# ===========================================================================
--#
--# SYNOPSIS
--#
--#   AX_COMPILER_FLAGS([CFLAGS-VARIABLE], [LDFLAGS-VARIABLE], [IS-RELEASE], [EXTRA-BASE-CFLAGS], [EXTRA-YES-CFLAGS], [UNUSED], [UNUSED], [UNUSED], [EXTRA-BASE-LDFLAGS], [EXTRA-YES-LDFLAGS], [UNUSED], [UNUSED], [UNUSED])
--#
--# DESCRIPTION
--#
--#   Check for the presence of an --enable-compile-warnings option to
--#   configure, defaulting to "error" in normal operation, or "yes" if
--#   IS-RELEASE is equal to "yes".  Return the value in the variable
--#   $ax_enable_compile_warnings.
--#
--#   Depending on the value of --enable-compile-warnings, different compiler
--#   warnings are checked to see if they work with the current compiler and,
--#   if so, are appended to CFLAGS-VARIABLE and LDFLAGS-VARIABLE.  This
--#   allows a consistent set of baseline compiler warnings to be used across
--#   a code base, irrespective of any warnings enabled locally by individual
--#   developers.  By standardising the warnings used by all developers of a
--#   project, the project can commit to a zero-warnings policy, using -Werror
--#   to prevent compilation if new warnings are introduced.  This makes
--#   catching bugs which are flagged by warnings a lot easier.
--#
--#   By providing a consistent --enable-compile-warnings argument across all
--#   projects using this macro, continuous integration systems can easily be
--#   configured the same for all projects.  Automated systems or build
--#   systems aimed at beginners may want to pass the --disable-Werror
--#   argument to unconditionally prevent warnings being fatal.
--#
--#   --enable-compile-warnings can take the values:
--#
--#    * no:      Base compiler warnings only; not even -Wall.
--#    * yes:     The above, plus a broad range of useful warnings.
--#    * error:   The above, plus -Werror so that all warnings are fatal.
--#               Use --disable-Werror to override this and disable fatal
--#               warnings.
--#
--#   The set of base and enabled flags can be augmented using the
--#   EXTRA-*-CFLAGS and EXTRA-*-LDFLAGS variables, which are tested and
--#   appended to the output variable if --enable-compile-warnings is not
--#   "no". Flags should not be disabled using these arguments, as the entire
--#   point of AX_COMPILER_FLAGS is to enforce a consistent set of useful
--#   compiler warnings on code, using warnings which have been chosen for low
--#   false positive rates.  If a compiler emits false positives for a
--#   warning, a #pragma should be used in the code to disable the warning
--#   locally. See:
--#
--#     https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/Diagnostic-Pragmas.html#Diagnostic-Pragmas
--#
--#   The EXTRA-* variables should only be used to supply extra warning flags,
--#   and not general purpose compiler flags, as they are controlled by
--#   configure options such as --disable-Werror.
--#
--#   IS-RELEASE can be used to disable -Werror when making a release, which
--#   is useful for those hairy moments when you just want to get the release
--#   done as quickly as possible.  Set it to "yes" to disable -Werror. By
--#   default, it uses the value of $ax_is_release, so if you are using the
--#   AX_IS_RELEASE macro, there is no need to pass this parameter. For
--#   example:
--#
--#     AX_IS_RELEASE([git-directory])
--#     AX_COMPILER_FLAGS()
--#
--#   CFLAGS-VARIABLE defaults to WARN_CFLAGS, and LDFLAGS-VARIABLE defaults
--#   to WARN_LDFLAGS.  Both variables are AC_SUBST-ed by this macro, but must
--#   be manually added to the CFLAGS and LDFLAGS variables for each target in
--#   the code base.
--#
--#   If C++ language support is enabled with AC_PROG_CXX, which must occur
--#   before this macro in configure.ac, warning flags for the C++ compiler
--#   are AC_SUBST-ed as WARN_CXXFLAGS, and must be manually added to the
--#   CXXFLAGS variables for each target in the code base.  EXTRA-*-CFLAGS can
--#   be used to augment the base and enabled flags.
--#
--#   Warning flags for g-ir-scanner (from GObject Introspection) are
--#   AC_SUBST-ed as WARN_SCANNERFLAGS.  This variable must be manually added
--#   to the SCANNERFLAGS variable for each GIR target in the code base.  If
--#   extra g-ir-scanner flags need to be enabled, the AX_COMPILER_FLAGS_GIR
--#   macro must be invoked manually.
--#
--#   AX_COMPILER_FLAGS may add support for other tools in future, in addition
--#   to the compiler and linker.  No extra EXTRA-* variables will be added
--#   for those tools, and all extra support will still use the single
--#   --enable-compile-warnings configure option.  For finer grained control
--#   over the flags for individual tools, use AX_COMPILER_FLAGS_CFLAGS,
--#   AX_COMPILER_FLAGS_LDFLAGS and AX_COMPILER_FLAGS_* for new tools.
--#
--#   The UNUSED variables date from a previous version of this macro, and are
--#   automatically appended to the preceding non-UNUSED variable. They should
--#   be left empty in new uses of the macro.
--#
--# LICENSE
--#
--#   Copyright (c) 2014, 2015 Philip Withnall <philip@tecnocode.co.uk>
--#   Copyright (c) 2015 David King <amigadave@amigadave.com>
--#
--#   Copying and distribution of this file, with or without modification, are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved.  This file is offered as-is, without any
--#   warranty.
--
--#serial 14
--
--# _AX_COMPILER_FLAGS_LANG([LANGNAME])
--m4_defun([_AX_COMPILER_FLAGS_LANG],
--[m4_ifdef([_AX_COMPILER_FLAGS_LANG_]$1[_enabled], [],
--          [m4_define([_AX_COMPILER_FLAGS_LANG_]$1[_enabled], [])dnl
--           AX_REQUIRE_DEFINED([AX_COMPILER_FLAGS_]$1[FLAGS])])dnl
--])
--
--AC_DEFUN([AX_COMPILER_FLAGS],[
--    # C support is enabled by default.
--    _AX_COMPILER_FLAGS_LANG([C])
--    # Only enable C++ support if AC_PROG_CXX is called. The redefinition of
--    # AC_PROG_CXX is so that a fatal error is emitted if this macro is called
--    # before AC_PROG_CXX, which would otherwise cause no C++ warnings to be
--    # checked.
--    AC_PROVIDE_IFELSE([AC_PROG_CXX],
--                      [_AX_COMPILER_FLAGS_LANG([CXX])],
--                      [m4_define([AC_PROG_CXX], defn([AC_PROG_CXX])[_AX_COMPILER_FLAGS_LANG([CXX])])])
--    AX_REQUIRE_DEFINED([AX_COMPILER_FLAGS_LDFLAGS])
--
--    # Default value for IS-RELEASE is $ax_is_release
--    ax_compiler_flags_is_release=m4_tolower(m4_normalize(ifelse([$3],,
--                                                                [$ax_is_release],
--                                                                [$3])))
--
--    AC_ARG_ENABLE([compile-warnings],
--                  AS_HELP_STRING([--enable-compile-warnings=@<:@no/yes/error@:>@],
--                                 [Enable compiler warnings and errors]),,
--                  [AS_IF([test "$ax_compiler_flags_is_release" = "yes"],
--                         [enable_compile_warnings="yes"],
--                         [enable_compile_warnings="error"])])
--    AC_ARG_ENABLE([Werror],
--                  AS_HELP_STRING([--disable-Werror],
--                                 [Unconditionally make all compiler warnings non-fatal]),,
--                  [enable_Werror=maybe])
--
--    # Return the user's chosen warning level
--    AS_IF([test "$enable_Werror" = "no" -a \
--                "$enable_compile_warnings" = "error"],[
--        enable_compile_warnings="yes"
--    ])
--
--    ax_enable_compile_warnings=$enable_compile_warnings
--
--    AX_COMPILER_FLAGS_CFLAGS([$1],[$ax_compiler_flags_is_release],
--                             [$4],[$5 $6 $7 $8])
--    m4_ifdef([_AX_COMPILER_FLAGS_LANG_CXX_enabled],
--             [AX_COMPILER_FLAGS_CXXFLAGS([WARN_CXXFLAGS],
--                                         [$ax_compiler_flags_is_release],
--                                         [$4],[$5 $6 $7 $8])])
--    AX_COMPILER_FLAGS_LDFLAGS([$2],[$ax_compiler_flags_is_release],
--                              [$9],[$10 $11 $12 $13])
--    AX_COMPILER_FLAGS_GIR([WARN_SCANNERFLAGS],[$ax_compiler_flags_is_release])
--])dnl AX_COMPILER_FLAGS
-diff --git a/m4/ax_compiler_flags_cflags.m4 b/m4/ax_compiler_flags_cflags.m4
-deleted file mode 100644
-index 916f91837..000000000
---- a/m4/ax_compiler_flags_cflags.m4
-+++ /dev/null
-@@ -1,161 +0,0 @@
--# =============================================================================
--#  https://www.gnu.org/software/autoconf-archive/ax_compiler_flags_cflags.html
--# =============================================================================
--#
--# SYNOPSIS
--#
--#   AX_COMPILER_FLAGS_CFLAGS([VARIABLE], [IS-RELEASE], [EXTRA-BASE-FLAGS], [EXTRA-YES-FLAGS])
--#
--# DESCRIPTION
--#
--#   Add warning flags for the C compiler to VARIABLE, which defaults to
--#   WARN_CFLAGS.  VARIABLE is AC_SUBST-ed by this macro, but must be
--#   manually added to the CFLAGS variable for each target in the code base.
--#
--#   This macro depends on the environment set up by AX_COMPILER_FLAGS.
--#   Specifically, it uses the value of $ax_enable_compile_warnings to decide
--#   which flags to enable.
--#
--# LICENSE
--#
--#   Copyright (c) 2014, 2015 Philip Withnall <philip@tecnocode.co.uk>
--#   Copyright (c) 2017, 2018 Reini Urban <rurban@cpan.org>
--#
--#   Copying and distribution of this file, with or without modification, are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved.  This file is offered as-is, without any
--#   warranty.
--
--#serial 17
--
--AC_DEFUN([AX_COMPILER_FLAGS_CFLAGS],[
--    AC_REQUIRE([AC_PROG_SED])
--    AX_REQUIRE_DEFINED([AX_APPEND_COMPILE_FLAGS])
--    AX_REQUIRE_DEFINED([AX_APPEND_FLAG])
--    AX_REQUIRE_DEFINED([AX_CHECK_COMPILE_FLAG])
--
--    # Variable names
--    m4_define([ax_warn_cflags_variable],
--              [m4_normalize(ifelse([$1],,[WARN_CFLAGS],[$1]))])
--
--    AC_LANG_PUSH([C])
--
--    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
--      [#ifndef __cplusplus
--       #error "no C++"
--       #endif]])],
--      [ax_compiler_cxx=yes;],
--      [ax_compiler_cxx=no;])
--
--    # Always pass -Werror=unknown-warning-option to get Clang to fail on bad
--    # flags, otherwise they are always appended to the warn_cflags variable, and
--    # Clang warns on them for every compilation unit.
--    # If this is passed to GCC, it will explode, so the flag must be enabled
--    # conditionally.
--    AX_CHECK_COMPILE_FLAG([-Werror=unknown-warning-option],[
--        ax_compiler_flags_test="-Werror=unknown-warning-option"
--    ],[
--        ax_compiler_flags_test=""
--    ])
--
--    # Check that -Wno-suggest-attribute=format is supported
--    AX_CHECK_COMPILE_FLAG([-Wno-suggest-attribute=format],[
--        ax_compiler_no_suggest_attribute_flags="-Wno-suggest-attribute=format"
--    ],[
--        ax_compiler_no_suggest_attribute_flags=""
--    ])
--
--    # Base flags
--    AX_APPEND_COMPILE_FLAGS([ dnl
--        -fno-strict-aliasing dnl
--        $3 dnl
--    ],ax_warn_cflags_variable,[$ax_compiler_flags_test])
--
--    AS_IF([test "$ax_enable_compile_warnings" != "no"],[
--        if test "$ax_compiler_cxx" = "no" ; then
--            # C-only flags. Warn in C++
--            AX_APPEND_COMPILE_FLAGS([ dnl
--                -Wnested-externs dnl
--                -Wmissing-prototypes dnl
--                -Wstrict-prototypes dnl
--                -Wdeclaration-after-statement dnl
--                -Wimplicit-function-declaration dnl
--                -Wold-style-definition dnl
--                -Wjump-misses-init dnl
--            ],ax_warn_cflags_variable,[$ax_compiler_flags_test])
--        fi
--
--        # "yes" flags
--        AX_APPEND_COMPILE_FLAGS([ dnl
--            -Wall dnl
--            -Wextra dnl
--            -Wundef dnl
--            -Wwrite-strings dnl
--            -Wpointer-arith dnl
--            -Wmissing-declarations dnl
--            -Wredundant-decls dnl
--            -Wno-unused-parameter dnl
--            -Wno-missing-field-initializers dnl
--            -Wformat=2 dnl
--            -Wcast-align dnl
--            -Wformat-nonliteral dnl
--            -Wformat-security dnl
--            -Wsign-compare dnl
--            -Wstrict-aliasing dnl
--            -Wshadow dnl
--            -Winline dnl
--            -Wpacked dnl
--            -Wmissing-format-attribute dnl
--            -Wmissing-noreturn dnl
--            -Winit-self dnl
--            -Wredundant-decls dnl
--            -Wmissing-include-dirs dnl
--            -Wunused-but-set-variable dnl
--            -Warray-bounds dnl
--            -Wreturn-type dnl
--            -Wswitch-enum dnl
--            -Wswitch-default dnl
--            -Wduplicated-cond dnl
--            -Wduplicated-branches dnl
--            -Wlogical-op dnl
--            -Wrestrict dnl
--            -Wnull-dereference dnl
--            -Wdouble-promotion dnl
--            $4 dnl
--            $5 dnl
--            $6 dnl
--            $7 dnl
--        ],ax_warn_cflags_variable,[$ax_compiler_flags_test])
--    ])
--    AS_IF([test "$ax_enable_compile_warnings" = "error"],[
--        # "error" flags; -Werror has to be appended unconditionally because
--        # it's not possible to test for
--        #
--        # suggest-attribute=format is disabled because it gives too many false
--        # positives
--        AX_APPEND_FLAG([-Werror],ax_warn_cflags_variable)
--
--        AX_APPEND_COMPILE_FLAGS([ dnl
--            [$ax_compiler_no_suggest_attribute_flags] dnl
--        ],ax_warn_cflags_variable,[$ax_compiler_flags_test])
--    ])
--
--    # In the flags below, when disabling specific flags, always add *both*
--    # -Wno-foo and -Wno-error=foo. This fixes the situation where (for example)
--    # we enable -Werror, disable a flag, and a build bot passes CFLAGS=-Wall,
--    # which effectively turns that flag back on again as an error.
--    for flag in $ax_warn_cflags_variable; do
--        AS_CASE([$flag],
--                [-Wno-*=*],[],
--                [-Wno-*],[
--                    AX_APPEND_COMPILE_FLAGS([-Wno-error=$(AS_ECHO([$flag]) | $SED 's/^-Wno-//')],
--                                            ax_warn_cflags_variable,
--                                            [$ax_compiler_flags_test])
--                ])
--    done
--
--    AC_LANG_POP([C])
--
--    # Substitute the variables
--    AC_SUBST(ax_warn_cflags_variable)
--])dnl AX_COMPILER_FLAGS
-diff --git a/m4/ax_compiler_flags_gir.m4 b/m4/ax_compiler_flags_gir.m4
-deleted file mode 100644
-index 5b4924a20..000000000
---- a/m4/ax_compiler_flags_gir.m4
-+++ /dev/null
-@@ -1,60 +0,0 @@
--# ===========================================================================
--#  https://www.gnu.org/software/autoconf-archive/ax_compiler_flags_gir.html
--# ===========================================================================
--#
--# SYNOPSIS
--#
--#   AX_COMPILER_FLAGS_GIR([VARIABLE], [IS-RELEASE], [EXTRA-BASE-FLAGS], [EXTRA-YES-FLAGS])
--#
--# DESCRIPTION
--#
--#   Add warning flags for the g-ir-scanner (from GObject Introspection) to
--#   VARIABLE, which defaults to WARN_SCANNERFLAGS.  VARIABLE is AC_SUBST-ed
--#   by this macro, but must be manually added to the SCANNERFLAGS variable
--#   for each GIR target in the code base.
--#
--#   This macro depends on the environment set up by AX_COMPILER_FLAGS.
--#   Specifically, it uses the value of $ax_enable_compile_warnings to decide
--#   which flags to enable.
--#
--# LICENSE
--#
--#   Copyright (c) 2015 Philip Withnall <philip@tecnocode.co.uk>
--#
--#   Copying and distribution of this file, with or without modification, are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved.  This file is offered as-is, without any
--#   warranty.
--
--#serial 6
--
--AC_DEFUN([AX_COMPILER_FLAGS_GIR],[
--    AX_REQUIRE_DEFINED([AX_APPEND_FLAG])
--
--    # Variable names
--    m4_define([ax_warn_scannerflags_variable],
--              [m4_normalize(ifelse([$1],,[WARN_SCANNERFLAGS],[$1]))])
--
--    # Base flags
--    AX_APPEND_FLAG([$3],ax_warn_scannerflags_variable)
--
--    AS_IF([test "$ax_enable_compile_warnings" != "no"],[
--        # "yes" flags
--        AX_APPEND_FLAG([ dnl
--            --warn-all dnl
--            $4 dnl
--            $5 dnl
--            $6 dnl
--            $7 dnl
--        ],ax_warn_scannerflags_variable)
--    ])
--    AS_IF([test "$ax_enable_compile_warnings" = "error"],[
--        # "error" flags
--        AX_APPEND_FLAG([ dnl
--            --warn-error dnl
--        ],ax_warn_scannerflags_variable)
--    ])
--
--    # Substitute the variables
--    AC_SUBST(ax_warn_scannerflags_variable)
--])dnl AX_COMPILER_FLAGS
-diff --git a/m4/ax_compiler_flags_ldflags.m4 b/m4/ax_compiler_flags_ldflags.m4
-deleted file mode 100644
-index 976d1198d..000000000
---- a/m4/ax_compiler_flags_ldflags.m4
-+++ /dev/null
-@@ -1,111 +0,0 @@
--# ==============================================================================
--#  https://www.gnu.org/software/autoconf-archive/ax_compiler_flags_ldflags.html
--# ==============================================================================
--#
--# SYNOPSIS
--#
--#   AX_COMPILER_FLAGS_LDFLAGS([VARIABLE], [IS-RELEASE], [EXTRA-BASE-FLAGS], [EXTRA-YES-FLAGS])
--#
--# DESCRIPTION
--#
--#   Add warning flags for the linker to VARIABLE, which defaults to
--#   WARN_LDFLAGS.  VARIABLE is AC_SUBST-ed by this macro, but must be
--#   manually added to the LDFLAGS variable for each target in the code base.
--#
--#   This macro depends on the environment set up by AX_COMPILER_FLAGS.
--#   Specifically, it uses the value of $ax_enable_compile_warnings to decide
--#   which flags to enable.
--#
--# LICENSE
--#
--#   Copyright (c) 2014, 2015 Philip Withnall <philip@tecnocode.co.uk>
--#   Copyright (c) 2017, 2018 Reini Urban <rurban@cpan.org>
--#
--#   Copying and distribution of this file, with or without modification, are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved.  This file is offered as-is, without any
--#   warranty.
--
--#serial 9
--
--AC_DEFUN([AX_COMPILER_FLAGS_LDFLAGS],[
--    AX_REQUIRE_DEFINED([AX_APPEND_LINK_FLAGS])
--    AX_REQUIRE_DEFINED([AX_APPEND_FLAG])
--    AX_REQUIRE_DEFINED([AX_CHECK_COMPILE_FLAG])
--    AX_REQUIRE_DEFINED([AX_CHECK_LINK_FLAG])
--
--    # Variable names
--    m4_define([ax_warn_ldflags_variable],
--              [m4_normalize(ifelse([$1],,[WARN_LDFLAGS],[$1]))])
--
--    # Always pass -Werror=unknown-warning-option to get Clang to fail on bad
--    # flags, otherwise they are always appended to the warn_ldflags variable,
--    # and Clang warns on them for every compilation unit.
--    # If this is passed to GCC, it will explode, so the flag must be enabled
--    # conditionally.
--    AX_CHECK_COMPILE_FLAG([-Werror=unknown-warning-option],[
--        ax_compiler_flags_test="-Werror=unknown-warning-option"
--    ],[
--        ax_compiler_flags_test=""
--    ])
--
--    AX_CHECK_LINK_FLAG([-Wl,--as-needed], [
--        AX_APPEND_LINK_FLAGS([-Wl,--as-needed],
--          [AM_LDFLAGS],[$ax_compiler_flags_test])
--    ])
--    AX_CHECK_LINK_FLAG([-Wl,-z,relro], [
--        AX_APPEND_LINK_FLAGS([-Wl,-z,relro],
--          [AM_LDFLAGS],[$ax_compiler_flags_test])
--    ])
--    AX_CHECK_LINK_FLAG([-Wl,-z,now], [
--        AX_APPEND_LINK_FLAGS([-Wl,-z,now],
--          [AM_LDFLAGS],[$ax_compiler_flags_test])
--    ])
--    AX_CHECK_LINK_FLAG([-Wl,-z,noexecstack], [
--        AX_APPEND_LINK_FLAGS([-Wl,-z,noexecstack],
--          [AM_LDFLAGS],[$ax_compiler_flags_test])
--    ])
--    # textonly, retpolineplt not yet
--
--    # macOS and cygwin linker do not have --as-needed
--    AX_CHECK_LINK_FLAG([-Wl,--no-as-needed], [
--        ax_compiler_flags_as_needed_option="-Wl,--no-as-needed"
--    ], [
--        ax_compiler_flags_as_needed_option=""
--    ])
--
--    # macOS linker speaks with a different accent
--    ax_compiler_flags_fatal_warnings_option=""
--    AX_CHECK_LINK_FLAG([-Wl,--fatal-warnings], [
--        ax_compiler_flags_fatal_warnings_option="-Wl,--fatal-warnings"
--    ])
--    AX_CHECK_LINK_FLAG([-Wl,-fatal_warnings], [
--        ax_compiler_flags_fatal_warnings_option="-Wl,-fatal_warnings"
--    ])
--
--    # Base flags
--    AX_APPEND_LINK_FLAGS([ dnl
--        $ax_compiler_flags_as_needed_option dnl
--        $3 dnl
--    ],ax_warn_ldflags_variable,[$ax_compiler_flags_test])
--
--    AS_IF([test "$ax_enable_compile_warnings" != "no"],[
--        # "yes" flags
--        AX_APPEND_LINK_FLAGS([$4 $5 $6 $7],
--                                ax_warn_ldflags_variable,
--                                [$ax_compiler_flags_test])
--    ])
--    AS_IF([test "$ax_enable_compile_warnings" = "error"],[
--        # "error" flags; -Werror has to be appended unconditionally because
--        # it's not possible to test for
--        #
--        # suggest-attribute=format is disabled because it gives too many false
--        # positives
--        AX_APPEND_LINK_FLAGS([ dnl
--            $ax_compiler_flags_fatal_warnings_option dnl
--        ],ax_warn_ldflags_variable,[$ax_compiler_flags_test])
--    ])
--
--    # Substitute the variables
--    AC_SUBST(ax_warn_ldflags_variable)
--])dnl AX_COMPILER_FLAGS
diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
index 3caf52a792..b72fb9a47a 100644
--- a/package/babeltrace2/babeltrace2.hash
+++ b/package/babeltrace2/babeltrace2.hash
@@ -1,8 +1,13 @@
-# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.4.tar.bz2.sha256
-sha256  a01c7e75e642de0b5b91f32cc706234c99eb556fcd52c9959045dc23a9ec52c9  babeltrace2-2.0.6.tar.bz2
+# From https://www.efficios.com/files/babeltrace/babeltrace2-2.1.2.tar.bz2.sha256
+sha256  12833fd234ad679b8bd42b28c07c9141b9f788b3b11ebedec33d2e6c3cb02c9c  babeltrace2-2.1.2.tar.bz2
 
 # Hash for license files
-sha256  d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256  c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
-sha256  2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
+sha256  897516be0468a348575a353b1ae1e88f323bcac671b9f9c9821f620dfa1e3172  LICENSE
+sha256  d41f641f1b4226c7fc8f6401eb194223057943799ff77b08ce3b703e4b24b074  LICENSES/BSD-2-Clause.txt
+sha256  5add2e59921fa776c7803c531a5775a5ce6a5e2291de35f55b4c61dbbcdaa39e  LICENSES/BSD-4-Clause.txt
+sha256  b4417c108b78a2a416c6f34af596f72954f9958db1962745e5f9967535da7fda  LICENSES/CC-BY-SA-4.0.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-only.txt
+sha256  fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0  LICENSES/GPL-3.0-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
+sha256  c7afb65e755707b9fb90487389a176d3ed3d0031d5131afde45c23715ff5e891  LICENSES/PSF-2.0.txt
diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index f3f1543c0e..fce78b1aba 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -5,12 +5,27 @@
 ################################################################################
 
 BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
-BABELTRACE2_VERSION = 2.0.6
+BABELTRACE2_VERSION = 2.1.2
 BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
-BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
-BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
-# We're patching configure.ac
-BABELTRACE2_AUTORECONF = YES
+BABELTRACE2_LICENSE = \
+	MIT, \
+	BSD-2-Clause (C and Python TAP test libraries), \
+	BSD-4-Clause (CRC32 code), \
+	CC-BY-SA-4.0 (doc), \
+	GPL-2.0 (test code), \
+	GPL-3.0+ (BASH TAP library), \
+	LGPL-2.1 (src/common/list.h), \
+	PSF-2.0 (typing Python module)
+BABELTRACE2_LICENSE_FILES = \
+	LICENSE \
+	LICENSES/MIT.txt \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-4-Clause.txt \
+	LICENSES/CC-BY-SA-4.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-or-later.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/PSF-2.0.txt
 BABELTRACE2_CONF_OPTS = --disable-man-pages
 BABELTRACE2_DEPENDENCIES = libglib2 host-pkgconf
 # The host-elfutils dependency is optional, but since we don't have
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
