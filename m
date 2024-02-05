Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B3AC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B418241802;
	Mon,  5 Feb 2024 14:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B418241802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYqfXbfHVYDD; Mon,  5 Feb 2024 14:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A236B41828;
	Mon,  5 Feb 2024 14:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A236B41828
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35A0C1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C598810CD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C598810CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xi42B-JMp41D for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:49:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00DAE80E53
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00DAE80E53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E11BD86CB1; Mon,  5 Feb 2024 14:49:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:49:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bce4fe6d1bc8a71918e3d862ebf85d342bf535b0
X-Git-Newrev: b392d656c7f3ecb1e36945615c543e5ee230315b
X-Patchwork-Hint: ignore
Message-Id: <20240205144949.E11BD86CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: bump to 1.17.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b392d656c7f3ecb1e36945615c543e5ee230315b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://www.cairographics.org/news/cairo-1.17.2/
 - https://www.cairographics.org/news/cairo-1.17.4/

!! This is a bump to a snapshot release: 1.17.4.

But it is the first version that supports meson,
and the only version that supports both meson and autotools.

This is just an intermediate bump in order to
switch over to meson in a later commit.

Patches:
 - drop 0001-fix-nofork-build.patch, upstream: [1]
 - drop 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch, upstream: [2]
 - add 0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch, upstream: [3]

[1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/cb2357f481396820ec954dc4b69eafc01a8d162a
[2]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
[3]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  6 ++--
 ...le_for_tolerance_normalized-fix-infinite.patch} |  0
 package/cairo/0001-fix-nofork-build.patch          | 29 -------------------
 ... 0002-Fix-mask-usage-in-image-compositor.patch} |  0
 ...hen-available-in-cairo_ft_apply_variation.patch | 33 ----------------------
 ...o-ft-private.h-fix-missing-FT_Color-error.patch | 32 +++++++++++++++++++++
 package/cairo/cairo.hash                           |  6 ++--
 package/cairo/cairo.mk                             | 10 +++----
 8 files changed, 41 insertions(+), 75 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 095fa5b283..348cf3d289 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -227,10 +227,8 @@ package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch Upstrea
 package/c-icap/S96cicap Indent Shellcheck Variables
 package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch Upstream
 package/cache-calibrator/0001-Fix-conflicting-round-function.patch Upstream
-package/cairo/0001-fix-nofork-build.patch Upstream
-package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch Upstream
-package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch Upstream
-package/cairo/0004-Fix-mask-usage-in-image-compositor.patch Upstream
+package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch Upstream
+package/cairo/0002-Fix-mask-usage-in-image-compositor.patch Upstream
 package/caps/0001-Fix-stdint-types-with-musl.patch Upstream
 package/cdrkit/0001-no-rcmd.patch Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch Upstream
diff --git a/package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch b/package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
similarity index 100%
rename from package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
rename to package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
diff --git a/package/cairo/0001-fix-nofork-build.patch b/package/cairo/0001-fix-nofork-build.patch
deleted file mode 100644
index 702e9910a5..0000000000
--- a/package/cairo/0001-fix-nofork-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-test: fix build when SHOULD_FORK is false
-
-The code in test/cairo-test-runner.c properly takes into account
-platforms that do have fork() support, and uses the SHOULD_FORK define
-to know whether fork is available or not.
-
-However, this SHOULD_FORK macro is used to guard the inclusion of
-<unistd.h>, which is needed to get the prototype of other functions
-(namely readlink and getppid), that are used in portions of this file
-not guarded by SHOULD_FORK.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/test/cairo-test-runner.c
-===================================================================
---- a/test/cairo-test-runner.c
-+++ b/test/cairo-test-runner.c
-@@ -36,10 +36,10 @@
- #include <pixman.h> /* for version information */
- 
- #define SHOULD_FORK HAVE_FORK && HAVE_WAITPID
--#if SHOULD_FORK
- #if HAVE_UNISTD_H
- #include <unistd.h>
- #endif
-+#if SHOULD_FORK
- #if HAVE_SIGNAL_H
- #include <signal.h>
- #endif
diff --git a/package/cairo/0004-Fix-mask-usage-in-image-compositor.patch b/package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
similarity index 100%
rename from package/cairo/0004-Fix-mask-usage-in-image-compositor.patch
rename to package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
diff --git a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
deleted file mode 100644
index 10e000d16f..0000000000
--- a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
-[Retrieved from:
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
- 
--- 
-2.24.1
-
diff --git a/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch
new file mode 100644
index 0000000000..3b18d8077b
--- /dev/null
+++ b/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch
@@ -0,0 +1,32 @@
+From da698db0c20507f0e07492cbe40dbaf1c9053f71 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 09:58:05 +0100
+Subject: [PATCH] cairo-ft-private.h: fix missing FT_Color error
+
+In file included from ../src/cairo-colr-glyph-render.c:37:
+../src/cairo-ft-private.h:87:30: error: unknown type name 'FT_Color'
+   87 |                              FT_Color               *palette,
+      |                              ^~~~~~~~
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/792
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/cairo-ft-private.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cairo-ft-private.h b/src/cairo-ft-private.h
+index 836f7e523..6b0e30223 100644
+--- a/src/cairo-ft-private.h
++++ b/src/cairo-ft-private.h
+@@ -43,6 +43,8 @@
+ 
+ #if CAIRO_HAS_FT_FONT
+ 
++#include FT_COLOR_H
++
+ CAIRO_BEGIN_DECLS
+ 
+ typedef struct _cairo_ft_unscaled_font cairo_ft_unscaled_font_t;
+-- 
+2.34.1
+
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 3b93e24a22..fca9ff678c 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,7 @@
-# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
-sha1  00e81842ae5e81bb0343108884eb5205be0eac14  cairo-1.16.0.tar.xz
+# From https://www.cairographics.org/snapshots/cairo-1.17.4.tar.xz.sha1
+sha1  68712ae1039b114347be3b7200bc1c901d47a636  cairo-1.17.4.tar.xz
 # Calculated based on the hash above
-sha256  5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331  cairo-1.16.0.tar.xz
+sha256  74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705  cairo-1.17.4.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7bc8f92deb..4515b76075 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,19 +4,17 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.16.0
+CAIRO_VERSION = 1.17.4
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_CPE_ID_VENDOR = cairographics
-CAIRO_SITE = http://cairographics.org/releases
+CAIRO_SITE = http://cairographics.org/snapshots
 CAIRO_INSTALL_STAGING = YES
 
-# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
-CAIRO_IGNORE_CVES += CVE-2018-19876
-# 0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
+# 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 CAIRO_IGNORE_CVES += CVE-2019-6462
-# 0004-Fix-mask-usage-in-image-compositor.patch
+# 0002-Fix-mask-usage-in-image-compositor.patch
 CAIRO_IGNORE_CVES += CVE-2020-35492
 
 CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
