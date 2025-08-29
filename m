Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41080CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D5B844FF;
	Fri, 29 Aug 2025 15:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kxfZDZFsWU0; Fri, 29 Aug 2025 15:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48CCF844F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CCF844F8;
	Fri, 29 Aug 2025 15:34:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8580C69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D9E811A5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsuPAWqAzzq1 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1755C844FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1755C844FF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 092DE87DB3; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:30:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fdebc54b301ca4729789849c602aa4203bcfbe6
X-Git-Newrev: fdb0669e40d698a4851b8a1d0e19fc899994bd06
X-Patchwork-Hint: ignore
Message-Id: <20250829153357.092DE87DB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvgtiny: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdb0669e40d698a4851b8a1d0e19fc899994bd06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package hasn't been updated in years. It has new releases, such
as 1.0.8 from December 2023, but nobody updated to it.

Doing the version bump is not straightforward, and the original
package submitter, Peter Korsgaard, is no longer using it. This
package also had no reverse dependency, and no maintainer in the
DEVELOPERS file.

Therefore, let's drop this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: Add Config.in.legacy handling]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   4 -
 Config.in.legacy                                   |   6 +
 package/Config.in                                  |   1 -
 .../libsvgtiny/0001-disable-debug-printfs.patch    | 125 ---------------------
 package/libsvgtiny/0002-Remove-Werror.patch        |  44 --------
 ...about-inlines-and-non-inlines-calling-one.patch |  36 ------
 ...ild-Include-gperf-generated-code-directly.patch |  99 ----------------
 ..._gradient-svgtiny_list-.c-add-missing-std.patch |  42 -------
 package/libsvgtiny/Config.in                       |   9 --
 package/libsvgtiny/libsvgtiny.hash                 |   3 -
 package/libsvgtiny/libsvgtiny.mk                   |  47 --------
 11 files changed, 6 insertions(+), 410 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 31ca7cdcc1..e8d323d4dd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -657,10 +657,6 @@ package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch lib_patch.Upstream
 package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
-package/libsvgtiny/0001-disable-debug-printfs.patch lib_patch.Upstream
-package/libsvgtiny/0002-Remove-Werror.patch lib_patch.Upstream
-package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch lib_patch.Upstream
-package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index f761c9063a..c0d268aa5d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LIBSVGTINY
+	bool "libsvgtiny has been removed"
+	select BR2_LEGACY
+	help
+	  Libsvgtiny has been removed from Buildroot.
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c22978408c..efef49c28c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1783,7 +1783,6 @@ menu "Graphics"
 	source "package/librsvg/Config.in"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
-	source "package/libsvgtiny/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvdpau/Config.in"
diff --git a/package/libsvgtiny/0001-disable-debug-printfs.patch b/package/libsvgtiny/0001-disable-debug-printfs.patch
deleted file mode 100644
index 72ed21ccfa..0000000000
--- a/package/libsvgtiny/0001-disable-debug-printfs.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-svntiny: svntiny_gradient.c: only print debugging if GRADIENT_DEBUG is enabled
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/svgtiny_gradient.c |   23 ++++++++++++++++++++++-
- 1 file changed, 22 insertions(+), 1 deletion(-)
-
-Index: libsvgtiny/src/svgtiny_gradient.c
-===================================================================
---- libsvgtiny.orig/src/svgtiny_gradient.c
-+++ libsvgtiny/src/svgtiny_gradient.c
-@@ -30,8 +30,9 @@ void svgtiny_find_gradient(const char *i
- {
- 	xmlNode *gradient;
- 
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "svgtiny_find_gradient: id \"%s\"\n", id);
--
-+#endif
- 	state->linear_gradient_stop_count = 0;
- 	state->gradient_x1 = "0%";
- 	state->gradient_y1 = "0%";
-@@ -47,13 +48,17 @@ void svgtiny_find_gradient(const char *i
- 
- 	gradient = svgtiny_find_element_by_id(
- 			(xmlNode *) state->document, id);
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "gradient %p\n", (void *) gradient);
-+#endif
- 	if (!gradient) {
- 		fprintf(stderr, "gradient \"%s\" not found\n", id);
- 		return;
- 	}
- 
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "gradient name \"%s\"\n", gradient->name);
-+#endif
- 	if (strcmp((const char *) gradient->name, "linearGradient") == 0) {
- 		svgtiny_parse_linear_gradient(gradient, state);
- 	}
-@@ -98,8 +103,10 @@ svgtiny_code svgtiny_parse_linear_gradie
- 				return svgtiny_OUT_OF_MEMORY;
- 			svgtiny_parse_transform(s, &a, &b, &c, &d, &e, &f);
- 			free(s);
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "transform %g %g %g %g %g %g\n",
- 					a, b, c, d, e, f);
-+#endif
- 			state->gradient_transform.a = a;
- 			state->gradient_transform.b = b;
- 			state->gradient_transform.c = c;
-@@ -143,7 +150,9 @@ svgtiny_code svgtiny_parse_linear_gradie
- 		}
- 
- 		if (offset != -1 && color != svgtiny_TRANSPARENT) {
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "stop %g %x\n", offset, color);
-+#endif
- 			state->gradient_stop[i].offset = offset;
- 			state->gradient_stop[i].color = color;
- 			i++;
-@@ -220,9 +229,11 @@ svgtiny_code svgtiny_add_path_linear_gra
- 	#endif
- 
- 	/* compute gradient vector */
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "x1 %s, y1 %s, x2 %s, y2 %s\n",
- 			state->gradient_x1, state->gradient_y1,
- 			state->gradient_x2, state->gradient_y2);
-+#endif
- 	if (!state->gradient_user_space_on_use) {
- 		gradient_x0 = object_x0 +
- 				svgtiny_parse_length(state->gradient_x1,
-@@ -297,9 +308,11 @@ svgtiny_code svgtiny_add_path_linear_gra
- 
- 	/* invert gradient transform for applying to vertices */
- 	svgtiny_invert_matrix(&state->gradient_transform.a, trans);
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "inverse transform %g %g %g %g %g %g\n",
- 			trans[0], trans[1], trans[2], trans[3],
- 			trans[4], trans[5]);
-+#endif
- 
- 	/* compute points on the path for triangle vertices */
- 	/* r, r0, r1 are distance along gradient vector */
-@@ -372,8 +385,10 @@ svgtiny_code svgtiny_add_path_linear_gra
- 		steps = ceilf(fabsf(r1 - r0) / 0.05);
- 		if (steps == 0)
- 			steps = 1;
-+#ifdef GRADIENT_DEBUG
- 		fprintf(stderr, "r0 %g, r1 %g, steps %i\n",
- 				r0, r1, steps);
-+#endif
- 
- 		/* loop through intermediate points */
- 		for (z = 1; z != steps; z++) {
-@@ -398,7 +413,9 @@ svgtiny_code svgtiny_add_path_linear_gra
- 			r = ((x_trans - gradient_x0) * gradient_dx +
- 					(y_trans - gradient_y0) * gradient_dy) /
- 					gradient_norm_squared;
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "(%g %g [%g]) ", x, y, r);
-+#endif
- 			point = svgtiny_list_push(pts);
- 			if (!point) {
- 				svgtiny_list_free(pts);
-@@ -412,14 +429,18 @@ svgtiny_code svgtiny_add_path_linear_gra
- 				min_pt = svgtiny_list_size(pts) - 1;
- 			}
- 		}
-+#ifdef GRADIENT_DEBUG
- 		fprintf(stderr, "\n");
-+#endif
- 
- 		/* next segment start point is this segment end point */
- 		x0 = x1;
- 		y0 = y1;
- 	}
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "pts size %i, min_pt %i, min_r %.3f\n",
- 			svgtiny_list_size(pts), min_pt, min_r);
-+#endif
- 
- 	/* render triangles */
- 	stop_count = state->linear_gradient_stop_count;
diff --git a/package/libsvgtiny/0002-Remove-Werror.patch b/package/libsvgtiny/0002-Remove-Werror.patch
deleted file mode 100644
index c8b0c0b9ef..0000000000
--- a/package/libsvgtiny/0002-Remove-Werror.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Remove -Werror from Makefile
-
-glibc-2.20 includes some changes to the include/features.h file
-introduced by this commit:
-
-  https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78
-
-Those changes make libsvgtiny fail because some warnings are thrown and
-the build system is using the -Werror option. We disable this to be able
-to build it, or otherwise we will see errors like this one:
-
-GPERF: src/colors.gperf
-COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
-In file included from
-/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
-		 from src/colors.gperf:16:
-/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
-error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
-_DEFAULT_SOURCE" [-Werror=cpp]
-
-and this one:
-
-In file included from src/colors.gperf:18:0:
-/home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
-error: "strndup" redefined [-Werror]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/Makefile b/Makefile
---- a/Makefile	2010-01-03 23:37:39.000000000 +0000
-+++ b/Makefile	2014-12-11 11:35:37.241903884 +0000
-@@ -13,12 +13,6 @@ TESTRUNNER := $(ECHO)
- WARNFLAGS := -Wall -W -Wundef -Wpointer-arith -Wcast-align \
- 	-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes \
- 	-Wmissing-declarations -Wnested-externs -pedantic
--# BeOS/Haiku/AmigaOS4 standard library headers create warnings
--ifneq ($(TARGET),beos)
--  ifneq ($(TARGET),AmigaOS)
--    WARNFLAGS := $(WARNFLAGS) -Werror
--  endif
--endif
- CFLAGS := -D_BSD_SOURCE -I$(CURDIR)/include/ \
- 	-I$(CURDIR)/src $(WARNFLAGS) $(CFLAGS)
- ifneq ($(GCCVER),2)
diff --git a/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch b/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
deleted file mode 100644
index 9285477d25..0000000000
--- a/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 21b4836ac9d6c6725590a925daa5d17eda9843e9 Mon Sep 17 00:00:00 2001
-From: Daniel Silverstone <dsilvers@digital-scurf.org>
-Date: Sat, 26 Apr 2014 16:24:54 +0100
-Subject: Hopefully silence warnings about inlines and non inlines calling one
- another.
-
-[Retrieved from:
-https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=21b4836ac9d6c6725590a925daa5d17eda9843e9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/colors.gperf | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/src/colors.gperf b/src/colors.gperf
-index 89152d2..96d5b9e 100644
---- a/src/colors.gperf
-+++ b/src/colors.gperf
-@@ -16,6 +16,15 @@
- #include <string.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
-+
-+/* This unusual define shennanigan is to try and prevent the gperf
-+ * generated function from being inlined.  This is pointless given
-+ * it (a) is in a separate .c file and (b) has external linkage.
-+ */
-+#ifdef __inline
-+#undef __inline
-+#define __inline
-+#endif
- %}
- 
- struct svgtiny_named_color;
--- 
-cgit v1.2.1
-
diff --git a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
deleted file mode 100644
index b5443e9912..0000000000
--- a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 4390f1c84e8fee51fc22468821e6fc158e783053 Mon Sep 17 00:00:00 2001
-From: Michael Drake <michael.drake@codethink.co.uk>
-Date: Thu, 20 Apr 2017 10:51:07 +0100
-Subject: Build: Include gperf-generated code directly.
-
-Previously we built the generated code separatly and then linked to
-it.  However, this caused problems with certain compilers and gperf
-versions.  This change includes the generated code directly in
-svgtiny.c instead, which is the only place its used.
-
-[Retrieved from:
-https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=4390f1c84e8fee51fc22468821e6fc158e783053]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/Makefile           | 13 +++++++------
- src/colors.gperf       |  8 --------
- src/svgtiny.c          |  3 +++
- src/svgtiny_internal.h |  5 -----
- 4 files changed, 10 insertions(+), 19 deletions(-)
-
-(limited to 'src')
-
-diff --git a/src/Makefile b/src/Makefile
-index a979720..fb8a72f 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -1,13 +1,14 @@
- # Sources
- DIR_SOURCES := svgtiny.c svgtiny_gradient.c svgtiny_list.c
- 
--SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c
-+SOURCES := $(SOURCES)
- 
--$(BUILDDIR)/src_colors.c: src/colors.gperf
-+$(DIR)autogenerated_colors.c: src/colors.gperf
- 	$(VQ)$(ECHO) "   GPERF: $<"
--	$(Q)gperf --output-file=$@.tmp $<
--# Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)
--	$(Q)$(SED) -e 's/#ifdef __GNUC_STDC_INLINE__/#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__/' $@.tmp >$@
--	$(Q)$(RM) $@.tmp
-+	$(Q)gperf --output-file=$@ $<
-+
-+PRE_TARGETS := $(DIR)autogenerated_colors.c
-+
-+CLEAN_ITEMS := $(DIR)autogenerated_colors.c
- 
- include build/makefiles/Makefile.subdir
-diff --git a/src/colors.gperf b/src/colors.gperf
-index 96d5b9e..a836787 100644
---- a/src/colors.gperf
-+++ b/src/colors.gperf
-@@ -17,14 +17,6 @@
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
--/* This unusual define shennanigan is to try and prevent the gperf
-- * generated function from being inlined.  This is pointless given
-- * it (a) is in a separate .c file and (b) has external linkage.
-- */
--#ifdef __inline
--#undef __inline
--#define __inline
--#endif
- %}
- 
- struct svgtiny_named_color;
-diff --git a/src/svgtiny.c b/src/svgtiny.c
-index 4661a58..bbefb88 100644
---- a/src/svgtiny.c
-+++ b/src/svgtiny.c
-@@ -17,6 +17,9 @@
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
-+/* Source file generated by `gperf`. */
-+#include "autogenerated_colors.c"
-+
- #ifndef M_PI
- #define M_PI		3.14159265358979323846
- #endif
-diff --git a/src/svgtiny_internal.h b/src/svgtiny_internal.h
-index 158d230..6bf5d64 100644
---- a/src/svgtiny_internal.h
-+++ b/src/svgtiny_internal.h
-@@ -87,9 +87,4 @@
- void *svgtiny_list_push(struct svgtiny_list *list);
- void svgtiny_list_free(struct svgtiny_list *list);
- 
--/* colors.gperf */
--const struct svgtiny_named_color *
--		svgtiny_color_lookup(register const char *str,
--				register unsigned int len);
--
- #endif
--- 
-cgit v1.2.1
-
diff --git a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
deleted file mode 100644
index 17e63ba541..0000000000
--- a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1d86ce7e6ea9fae8285eed23d838f87ab3ac083c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 19 Aug 2025 23:28:35 +0200
-Subject: [PATCH] src/{svgtiny_gradient,svgtiny_list}.c: add missing <stdlib.h>
-
-Needed to get the prototype for malloc()/free().
-
-Upstream: N/A, already fixed upstream in a later release (but as part
-of a larger commit)
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/svgtiny_gradient.c | 1 +
- src/svgtiny_list.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/svgtiny_gradient.c b/src/svgtiny_gradient.c
-index 3a8db73..5172223 100644
---- a/src/svgtiny_gradient.c
-+++ b/src/svgtiny_gradient.c
-@@ -8,6 +8,7 @@
- #include <assert.h>
- #include <math.h>
- #include <string.h>
-+#include <stdlib.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
-diff --git a/src/svgtiny_list.c b/src/svgtiny_list.c
-index 53cfb34..91e2c98 100644
---- a/src/svgtiny_list.c
-+++ b/src/svgtiny_list.c
-@@ -11,6 +11,7 @@
-  */
- 
- #include <assert.h>
-+#include <stdlib.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
--- 
-2.50.1
-
diff --git a/package/libsvgtiny/Config.in b/package/libsvgtiny/Config.in
deleted file mode 100644
index 836dec210e..0000000000
--- a/package/libsvgtiny/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_LIBSVGTINY
-	bool "libsvgtiny"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  Libsvgtiny is an implementation of SVG Tiny, written in C.
-	  It is currently in development for use with NetSurf and is
-	  intended to be suitable for use in other projects too.
-
-	  http://www.netsurf-browser.org/projects/libsvgtiny/
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
deleted file mode 100644
index 55f4093e19..0000000000
--- a/package/libsvgtiny/libsvgtiny.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  758641d339b324a76294ef08e323faa2cefb557793f437c08af7deb3b73a453e  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-git4.tar.gz
-sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
deleted file mode 100644
index 55ce4327fe..0000000000
--- a/package/libsvgtiny/libsvgtiny.mk
+++ /dev/null
@@ -1,47 +0,0 @@
-################################################################################
-#
-# libsvgtiny
-#
-################################################################################
-
-LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
-LIBSVGTINY_SITE_METHOD = git
-LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
-LIBSVGTINY_INSTALL_STAGING = YES
-LIBSVGTINY_DEPENDENCIES = \
-	libxml2 host-gperf host-pkgconf host-netsurf-buildsystem
-LIBSVGTINY_LICENSE = MIT
-LIBSVGTINY_LICENSE_FILES = README
-
-# The libsvgtiny build system cannot build both the shared and static
-# libraries. So when the Buildroot configuration requests to build
-# both the shared and static variants, we build only the shared one.
-ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-LIBSVGTINY_COMPONENT_TYPE = lib-shared
-else
-LIBSVGTINY_COMPONENT_TYPE = lib-static
-endif
-
-define LIBSVGTINY_CONFIGURE_CMDS
-	ln -sf $(HOST_DIR)/share/netsurf-buildsystem $(@D)/build
-endef
-
-# Use $(MAKE1) since parallel build fails
-define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=/usr \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
-endef
-
-define LIBSVGTINY_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
-endef
-
-define LIBSVGTINY_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
