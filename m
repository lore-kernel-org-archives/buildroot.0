Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D201C46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 19:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B805E4002B;
	Sat,  7 Jan 2023 19:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B805E4002B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVKoFQFBvpwW; Sat,  7 Jan 2023 19:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B838E4055D;
	Sat,  7 Jan 2023 19:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B838E4055D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2E31BF421
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39DA410C0
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39DA410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9EHn1uEuU9h for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454C0410C5
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454C0410C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4300E8762D; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Jan 2023 20:28:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 658ece1afa84e916503e3e949c40b3c0d24c6335
X-Git-Newrev: 87ee360f3a18db33d50b5826590c55e37ee9f993
X-Patchwork-Hint: ignore
Message-Id: <20230107192932.4300E8762D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: bump to version
 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87ee360f3a18db33d50b5826590c55e37ee9f993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-MAKEFLAGS-assignment-for-upcoming-make.patch | 117 ---------------------
 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch |  48 ---------
 package/glibc/glibc.hash                           |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 package/localedef/localedef.mk                     |   2 +-
 5 files changed, 3 insertions(+), 168 deletions(-)

diff --git a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
deleted file mode 100644
index 0c82d7abbe..0000000000
--- a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 2d7ed98add14f75041499ac189696c9bd3d757fe Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Tue, 13 Sep 2022 13:39:13 -0400
-Subject: [PATCH] Makerules: fix MAKEFLAGS assignment for upcoming make-4.4
- [BZ# 29564]
-
-make-4.4 will add long flags to MAKEFLAGS variable:
-
-    * WARNING: Backward-incompatibility!
-      Previously only simple (one-letter) options were added to the MAKEFLAGS
-      variable that was visible while parsing makefiles.  Now, all options
-      are available in MAKEFLAGS.
-
-This causes locale builds to fail when long options are used:
-
-    $ make --shuffle
-    ...
-    make  -C localedata install-locales
-    make: invalid shuffle mode: '1662724426r'
-
-The change fixes it by passing eash option via whitespace and dashes.
-That way option is appended to both single-word form and whitespace
-separated form.
-
-While at it fixed --silent mode detection in $(MAKEFLAGS) by filtering
-out --long-options. Otherwise options like --shuffle flag enable silent
-mode unintentionally. $(silent-make) variable consolidates the checks.
-
-Resolves: BZ# 29564
-
-CC: Paul Smith <psmith@gnu.org>
-CC: Siddhesh Poyarekar <siddhesh@gotplt.org>
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-2d7ed98add14f75041499ac189696c9bd3d757fe]
----
- Makeconfig     | 18 +++++++++++++++++-
- Makerules      |  4 ++--
- elf/rtld-Rules |  2 +-
- 3 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/Makeconfig b/Makeconfig
-index f8164a0025..842f49eb58 100644
---- a/Makeconfig
-+++ b/Makeconfig
-@@ -43,6 +43,22 @@ else
- $(error objdir must be defined by the build-directory Makefile)
- endif
- 
-+# Did we request 'make -s' run? "yes" or "no".
-+# Starting from make-4.4 MAKEFLAGS now contains long
-+# options like '--shuffle'. To detect presence of 's'
-+# we pick first word with short options. Long options
-+# are guaranteed to come after whitespace. We use '-'
-+# prefix to always have a word before long options
-+# even if no short options were passed.
-+# Typical MAKEFLAGS values to watch for:
-+#   "rs --shuffle=42" (silent)
-+#   " --shuffle" (not silent)
-+ifeq ($(findstring s, $(firstword -$(MAKEFLAGS))),)
-+silent-make := no
-+else
-+silent-make := yes
-+endif
-+
- # Root of the sysdeps tree.
- sysdep_dir := $(..)sysdeps
- export sysdep_dir := $(sysdep_dir)
-@@ -917,7 +933,7 @@ endif
- # umpteen zillion filenames along with it (we use `...' instead)
- # but we don't want this echoing done when the user has said
- # he doesn't want to see commands echoed by using -s.
--ifneq	"$(findstring s,$(MAKEFLAGS))" ""	# if -s
-+ifeq ($(silent-make),yes)			# if -s
- +cmdecho	:= echo >/dev/null
- else						# not -s
- +cmdecho	:= echo
-diff --git a/Makerules b/Makerules
-index d1e139d03c..09c0cf8357 100644
---- a/Makerules
-+++ b/Makerules
-@@ -794,7 +794,7 @@ endif
- # Maximize efficiency by minimizing the number of rules.
- .SUFFIXES:	# Clear the suffix list.  We don't use suffix rules.
- # Don't define any builtin rules.
--MAKEFLAGS := $(MAKEFLAGS)r
-+MAKEFLAGS := $(MAKEFLAGS) -r
- 
- # Generic rule for making directories.
- %/:
-@@ -811,7 +811,7 @@ MAKEFLAGS := $(MAKEFLAGS)r
- .PRECIOUS: $(foreach l,$(libtypes),$(patsubst %,$(common-objpfx)$l,c))
- 
- # Use the verbose option of ar and tar when not running silently.
--ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
-+ifeq ($(silent-make),no)			# if not -s
- verbose := v
- else	   					# -s
- verbose	:=
-diff --git a/elf/rtld-Rules b/elf/rtld-Rules
-index ca00dd1fe2..3c5e273f2b 100644
---- a/elf/rtld-Rules
-+++ b/elf/rtld-Rules
-@@ -52,7 +52,7 @@ $(objpfx)rtld-libc.a: $(foreach dir,$(rtld-subdirs),\
- 	mv -f $@T $@
- 
- # Use the verbose option of ar and tar when not running silently.
--ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
-+ifeq ($(silent-make),no)			# if not -s
- verbose := v
- else						# -s
- verbose	:=
--- 
-2.34.1
-
diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
deleted file mode 100644
index 4470324f1c..0000000000
--- a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
-Date: Wed, 21 Sep 2022 10:51:08 -0300
-Subject: [PATCH] x86: Fix -Os build (BZ #29576)
-
-The compiler might transform __stpcpy calls (which are routed to
-__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
-multiarch implementation does not build any working symbol due
-ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
-
-Checked on x86_64-linux-gnu.
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Tested-by: Carlos O'Donell <carlos@redhat.com>
-
-(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
- create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
-
-diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
-new file mode 100644
-index 0000000000..19439c553d
---- /dev/null
-+++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
-@@ -0,0 +1,18 @@
-+/* Copyright (C) 2022 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include "../strcpy.S"
--- 
-2.34.3
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 16290461ac..4ce4c6f6d1 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  51b946f6c8dddd2b0c9902f7792ecf594497da6b0cc8fb9246fa30f108cbb422  glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca.tar.gz
+sha256  666482e657c319f7e139121121a0d97d303c65207b9f9730f42a3ee83c79f686  glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index bb7c9e9a05..354f035d33 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
+GLIBC_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 05db7fa423..6699840854 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
+LOCALEDEF_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
