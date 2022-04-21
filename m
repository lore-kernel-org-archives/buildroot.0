Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2524E81B23;
	Thu, 21 Apr 2022 10:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvT79_FnP2Qx; Thu, 21 Apr 2022 10:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C348681AF6;
	Thu, 21 Apr 2022 10:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 223081BF487
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 10:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E31D40556
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 10:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lg8JzZqNptql for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 10:04:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A200D400BA
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:04:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t6so2495230wra.4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yl5eXkyXwuR2c4l/ZUz+WNMdPFfCRj4+aN+ft64H7gE=;
 b=KcGJ0tVIP8n93ShaopCK986lEGG3dgASAJ3u7VaFGrzf2S8YqqxQol6WCVS9F2V9Cr
 umcvVpkxD+PcbwO2XOoW3lbq/T3jasOZg6c+wljHWHwnn8JJnLHgiQupQoRamp1n5HTK
 si9f2zVlmpDg2K2txRaM89Tg9GVUclUSB0tfJ5R7irkxMTyz8+gS+1KjlbHUptS7nJVf
 zHVvZSc2wjyYB3jtLuL1tjyd93J6qVvwuwyKFyFsRXPYUSAL4wqBNWhWVbKaE7e3m9oa
 b7j3hKU9yMgh3FkfkRMRihnKQM8+L78P79gTjje0DPtIio9QfHxTjzYDCl3NIsf0guz+
 qYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yl5eXkyXwuR2c4l/ZUz+WNMdPFfCRj4+aN+ft64H7gE=;
 b=irWL3eB1OgXZQ/XMKBw/V9OvCXSt2srWDPCoN4iJM7a4F9VlmvM1f4sA5OSQFuz34j
 cf9VqWM2uNMq+j4/ylreSkEyRaLOHKKOJqhOBz80EHIymyrmxcq7mBJwdilwu8vMCvgk
 L6t0s9j7EBsnPFlVHsLTB0euWTOR2YuRo9wHEYFsZ7hWdyRNjtbSqi+PcSfDKFGxG7rl
 yBURstjhz7ALQapn+Q0TrVKuvdXEpNMECxzYVtfizPKFwCFNWMNI9XCtiWriYv8JpNAj
 3pGJJUy0qdDsR2w8UsI+tFNZfLh+wZglagLzQQGHZh5wiLp6218bXjOhsqERYjsLZ6L5
 nowA==
X-Gm-Message-State: AOAM532pndem/6P+FG4+BQjAShWhvr9Mf8yTNkkHnd9f4UC/xyveef5t
 bwsB3QANt4WDyW6jgOw2Kp3ymNb+jgA=
X-Google-Smtp-Source: ABdhPJxOeduGObxu6UoAgx3u6hS5Pzcq7yLAtCPQ8S/rPlZMeM29LQYzU0uqAFft/mFXB6hucz7zcQ==
X-Received: by 2002:adf:ed8f:0:b0:207:ac33:801f with SMTP id
 c15-20020adfed8f000000b00207ac33801fmr18486273wro.453.1650535469560; 
 Thu, 21 Apr 2022 03:04:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a1ca301000000b003929c4bf250sm1745797wme.13.2022.04.21.03.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 03:04:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 12:02:33 +0200
Message-Id: <20220421100233.3845088-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/argp-standalone: bump to version
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../0001-throw-in-funcdef.patch               | 79 -------------------
 package/argp-standalone/0002-isprint.patch    | 45 -----------
 .../0003-fix_build_with_c99_compilers.patch   | 68 ----------------
 package/argp-standalone/Config.in             |  2 +-
 package/argp-standalone/argp-standalone.hash  |  4 +-
 package/argp-standalone/argp-standalone.mk    | 11 ++-
 6 files changed, 10 insertions(+), 199 deletions(-)
 delete mode 100644 package/argp-standalone/0001-throw-in-funcdef.patch
 delete mode 100644 package/argp-standalone/0002-isprint.patch
 delete mode 100644 package/argp-standalone/0003-fix_build_with_c99_compilers.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
