Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9055C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE10827AF;
	Sat, 23 Apr 2022 16:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqyCa-jNvjF1; Sat, 23 Apr 2022 16:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182E981BA9;
	Sat, 23 Apr 2022 16:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A86B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE2F8284B
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aatoemreqSID for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED19F82EA1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 95B177FB06; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68ef4e546dcdade5fc768fbebf9e064f5240db2d
X-Git-Newrev: 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.95B177FB06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/argp-standalone: bump to version
 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to an up-to-date fork
- Drop first and second patches (not needed since:
  https://github.com/ericonr/argp-standalone/commit/c474ac2af74a8ba336b5480927741c13950ea01b
  https://github.com/ericonr/argp-standalone/commit/80691135993109ec0c8a41327418195fc6d82694
- Drop third patch (not needed since:
  https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043)
- License is LGPL-2.1+ since
  https://github.com/ericonr/argp-standalone/commit/c474ac2af74a8ba336b5480927741c13950ea01b
- README.md can be used as the license file since
  https://github.com/ericonr/argp-standalone/commit/da0206414df4fe55f70b6dfba86ec232acf5d444
- This bump will also fix the following build failure with
  BR2_OPTIMIZE_0 thanks to
  https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:

  /nvmedata/autobuild/instance-27/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: libargp.a(argp-help.o): in function `indent_to':
  /nvmedata/autobuild/instance-27/output-1/build/argp-standalone-1.3/argp-help.c:930: undefined reference to `argp_fmtstream_point'

Fixes:
 - http://autobuild.buildroot.org/results/8e2cd69356f40bae534847ad58f4aa0dabb4c791

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../argp-standalone/0001-throw-in-funcdef.patch    | 79 ----------------------
 package/argp-standalone/0002-isprint.patch         | 45 ------------
 .../0003-fix_build_with_c99_compilers.patch        | 68 -------------------
 package/argp-standalone/Config.in                  |  2 +-
 package/argp-standalone/argp-standalone.hash       |  4 +-
 package/argp-standalone/argp-standalone.mk         | 11 +--
 6 files changed, 10 insertions(+), 199 deletions(-)

diff --git a/package/argp-standalone/0001-throw-in-funcdef.patch b/package/argp-standalone/0001-throw-in-funcdef.patch
deleted file mode 100644
index 4a90751e1e..0000000000
--- a/package/argp-standalone/0001-throw-in-funcdef.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-# --- T2-COPYRIGHT-NOTE-BEGIN ---
-# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
-# 
-# T2 SDE: package/.../rng-tools/throw-in-funcdef.patch.argp-standalone
-# Copyright (C) 2006 The T2 SDE Project
-# 
-# More information can be found in the files COPYING and README.
-# 
-# This patch file is dual-licensed. It is available under the license the
-# patched project is licensed under, as long as it is an OpenSource license
-# as defined at http://www.opensource.org/ (e.g. BSD, X11) or under the terms
-# of the GNU General Public License as published by the Free Software
-# Foundation; either version 2 of the License, or (at your option) any later
-# version.
-# --- T2-COPYRIGHT-NOTE-END ---
-
-
-No __THROW in function implementation.
-	--jsaw
-
---- argp-standalone-1.4-test2/argp.h.orig	2006-01-06 02:29:59.000000000 +0100
-+++ argp-standalone-1.4-test2/argp.h	2006-01-06 02:41:10.000000000 +0100
-@@ -560,17 +560,17 @@
- # endif
- 
- # ifndef ARGP_EI
--#  define ARGP_EI extern __inline__
-+#  define ARGP_EI extern inline
- # endif
- 
- ARGP_EI void
--__argp_usage (__const struct argp_state *__state) __THROW
-+__argp_usage (__const struct argp_state *__state)
- {
-   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
- }
- 
- ARGP_EI int
--__option_is_short (__const struct argp_option *__opt) __THROW
-+__option_is_short (__const struct argp_option *__opt)
- {
-   if (__opt->flags & OPTION_DOC)
-     return 0;
-@@ -582,7 +582,7 @@
- }
- 
- ARGP_EI int
--__option_is_end (__const struct argp_option *__opt) __THROW
-+__option_is_end (__const struct argp_option *__opt)
- {
-   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
- }
---- argp-standalone-1.4-test2/argp-parse.c.orig	2006-01-06 02:47:48.000000000 +0100
-+++ argp-standalone-1.4-test2/argp-parse.c	2006-01-06 02:48:16.000000000 +0100
-@@ -1290,13 +1290,13 @@
- /* Defined here, in case a user is not inlining the definitions in
-  * argp.h */
- void
--__argp_usage (__const struct argp_state *__state) __THROW
-+__argp_usage (__const struct argp_state *__state)
- {
-   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
- }
- 
- int
--__option_is_short (__const struct argp_option *__opt) __THROW
-+__option_is_short (__const struct argp_option *__opt) 
- {
-   if (__opt->flags & OPTION_DOC)
-     return 0;
-@@ -1310,7 +1310,7 @@
- }
- 
- int
--__option_is_end (__const struct argp_option *__opt) __THROW
-+__option_is_end (__const struct argp_option *__opt) 
- {
-   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
- }
diff --git a/package/argp-standalone/0002-isprint.patch b/package/argp-standalone/0002-isprint.patch
deleted file mode 100644
index 9c08366f68..0000000000
--- a/package/argp-standalone/0002-isprint.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Subject: restrict value range passed to isprint function
-
-According to C standards isprint argument shall be representable as an
-unsigned char or be equal to EOF, otherwise the behaviour is undefined.
-
-Passing arbitrary ints leads to segfault in nm program from elfutils.
-
-Restrict isprint argument range to values representable by unsigned char.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Index: b/argp.h
-===================================================================
---- a/argp.h
-+++ b/argp.h
-@@ -23,6 +23,7 @@
- 
- #include <stdio.h>
- #include <ctype.h>
-+#include <limits.h>
- 
- #define __need_error_t
- #include <errno.h>
-@@ -577,7 +578,7 @@
-   else
-     {
-       int __key = __opt->key;
--      return __key > 0 && isprint (__key);
-+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
-     }
- }
- 
-Index: b/argp-parse.c
-===================================================================
---- a/argp-parse.c
-+++ b/argp-parse.c
-@@ -1292,7 +1292,7 @@
-       int __key = __opt->key;
-       /* FIXME: whether or not a particular key implies a short option
-        * ought not to be locale dependent. */
--      return __key > 0 && isprint (__key);
-+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
-     }
- }
- 
diff --git a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
deleted file mode 100644
index 56b753b607..0000000000
--- a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From b2dfa011a3fdcb7d22764d143517d0fbd1c2a201 Mon Sep 17 00:00:00 2001
-From: Emmanuel Dreyfus <manu@netbsd.org>
-Date: Wed, 22 Jan 2014 14:47:23 +0100
-Subject: [PATCH] Fix build with c99 compilers
-
-BUG: 764655
-Change-Id: If5dfdc9c7427bd3d39d8da8f79e33ae2da6a3137
-Signed-off-by: Emmanuel Dreyfus <manu@netbsd.org>
-Reviewed-on: http://review.gluster.org/6034
-Reviewed-by: Harshavardhana <harsha@harshavardhana.net>
-Tested-by: Gluster Build System <jenkins@build.gluster.com>
----
-
-diff --git a/argp-fmtstream.c b/argp-fmtstream.c
-index 7f79285..494b6b3 100644
---- a/argp-fmtstream.c
-+++ b/argp-fmtstream.c
-@@ -389,6 +389,7 @@
- weak_alias (__argp_fmtstream_printf, argp_fmtstream_printf)
- #endif
- 
-+#if __STDC_VERSION__ - 199900L < 1
- /* Duplicate the inline definitions in argp-fmtstream.h, for compilers
-  * that don't do inlining. */
- size_t
-@@ -471,5 +472,6 @@
-     __argp_fmtstream_update (__fs);
-   return __fs->point_col >= 0 ? __fs->point_col : 0;
- }
-+#endif /* __STDC_VERSION__ - 199900L < 1 */
- 
- #endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
-diff --git a/argp-fmtstream.h b/argp-fmtstream.h
-index e797b11..828f435 100644
---- a/argp-fmtstream.h
-+++ b/argp-fmtstream.h
-@@ -153,6 +153,7 @@
- 				      __const char *__fmt, ...)
-      PRINTF_STYLE(2,3);
- 
-+#if __STDC_VERSION__ - 199900L < 1
- extern int __argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
- extern int argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
- 
-@@ -163,6 +164,7 @@
- 				      __const char *__str, size_t __len);
- extern size_t argp_fmtstream_write (argp_fmtstream_t __fs,
- 				    __const char *__str, size_t __len);
-+#endif /* __STDC_VERSION__ - 199900L < 1 */
- 
- /* Access macros for various bits of state.  */
- #define argp_fmtstream_lmargin(__fs) ((__fs)->lmargin)
-@@ -172,6 +174,7 @@
- #define __argp_fmtstream_rmargin argp_fmtstream_rmargin
- #define __argp_fmtstream_wmargin argp_fmtstream_wmargin
- 
-+#if __STDC_VERSION__ - 199900L < 1
- /* Set __FS's left margin to LMARGIN and return the old value.  */
- extern size_t argp_fmtstream_set_lmargin (argp_fmtstream_t __fs,
- 					  size_t __lmargin);
-@@ -193,6 +196,7 @@
- /* Return the column number of the current output point in __FS.  */
- extern size_t argp_fmtstream_point (argp_fmtstream_t __fs);
- extern size_t __argp_fmtstream_point (argp_fmtstream_t __fs);
-+#endif /* __STDC_VERSION__ - 199900L < 1 */
- 
- /* Internal routines.  */
- extern void _argp_fmtstream_update (argp_fmtstream_t __fs);
diff --git a/package/argp-standalone/Config.in b/package/argp-standalone/Config.in
index 3319dd945c..891d4aedaa 100644
--- a/package/argp-standalone/Config.in
+++ b/package/argp-standalone/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_ARGP_STANDALONE
 	help
 	  Glibc hierarchical argument parsing standalone library.
 
-	  http://www.lysator.liu.se/~nisse/misc/
+	  https://github.com/ericonr/argp-standalone/
diff --git a/package/argp-standalone/argp-standalone.hash b/package/argp-standalone/argp-standalone.hash
index c780f9e53f..1e56c663d4 100644
--- a/package/argp-standalone/argp-standalone.hash
+++ b/package/argp-standalone/argp-standalone.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be  argp-standalone-1.3.tar.gz
+sha256  879d76374424dce051b812f16f43c6d16de8dbaddd76002f83fd1b6e57d39e0b  argp-standalone-1.4.1.tar.gz
 
 # License file
-sha256  bbb8919aa520069b0234faf5e83a94052d278419ffe97ca8e843ecc9b212d1ab  argp.h
+sha256  b5db0353a5b1902fc8a2e055d8899dd0c189ce73a31e67af9a0ffc24711b63f0  README.md
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 651bc400f4..80ca04046d 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-ARGP_STANDALONE_VERSION = 1.3
-ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
+ARGP_STANDALONE_VERSION = 1.4.1
+ARGP_STANDALONE_SITE = \
+	$(call github,ericonr,argp-standalone,$(ARGP_STANDALONE_VERSION))
 ARGP_STANDALONE_INSTALL_STAGING = YES
-ARGP_STANDALONE_LICENSE = LGPL-2.0+
-ARGP_STANDALONE_LICENSE_FILES = argp.h
+ARGP_STANDALONE_LICENSE = LGPL-2.1+
+ARGP_STANDALONE_LICENSE_FILES = README.md
+# From git
+ARGP_STANDALONE_AUTORECONF = YES
 
 ARGP_STANDALONE_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
