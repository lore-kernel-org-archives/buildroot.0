Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E48C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D4142172;
	Sat,  6 Jan 2024 13:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D4142172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uox8fqMApCfI; Sat,  6 Jan 2024 13:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C34642121;
	Sat,  6 Jan 2024 13:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C34642121
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDB451BF322
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A701A608A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A701A608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pur1BVi7ddEl for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:48:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5753060706
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5753060706
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40e384404e7so6183955e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 05:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704548900; x=1705153700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3cZVOIv3Bgand+58Dh+3a3PcKnXbqTwsx9bpox04oU=;
 b=RzZeTlaFYshQJj3yvz5otC5s4/JjmDVjwt0+B/LhjrTmep4lKDSmjxoyPM61d83MX5
 VnHGKqMQ3tbt8iIeLtpsnh8tQqA/kG2JdLN6LbArSdVeMh0Ab2ybS11MQNfJD22mXUvg
 hNKWWZEF5zCuL/8X2xwVoKlyTOAdYYsUGH31AhCraP5W1peuWGO2kLVG/Ae6/EdTDfJI
 Il7nvDn3O8CwRRTowsXTlT8mysmbUYS4iFOLXzoRIJzsU0u88PbcE7gqGbW2O1UnAU28
 /gc35mJVsArk053NcY7i2nsWbUDAXezfDiDuo39+BoLfsv+c4Q0Tksh2D4NbUS8vC11F
 QVOQ==
X-Gm-Message-State: AOJu0YxLOrS0F3yBwTEf4VxXOM5nK4K3/yX6Cb6hS0g3DZduhx1/mFDa
 QHnYY9oVsKxFrbO73edm3wah3CU4VnVQbDKU
X-Google-Smtp-Source: AGHT+IENOljybFhDfVDpljJUTt9EvDyFylUwOnSfsJwmgw+W/E5vzc2IMMGVE3JqtW+Ihews9gtNmw==
X-Received: by 2002:a05:600c:3555:b0:40e:3cb4:54a1 with SMTP id
 i21-20020a05600c355500b0040e3cb454a1mr518110wmq.114.1704548899613; 
 Sat, 06 Jan 2024 05:48:19 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:bb38:d24b:f402:8043])
 by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b0040e426bd3dbsm268663wms.11.2024.01.06.05.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 05:48:19 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:48:00 +0100
Message-Id: <20240106134800.506782-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106134800.506782-1-thomas@devoogdt.com>
References: <20240105101105.6a181dcd@windsurf>
 <20240106134800.506782-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/3] package/cairo: bump to 1.18.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, aperez@igalia.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://www.cairographics.org/news/cairo-1.17.8/
 - https://www.cairographics.org/news/cairo-1.18.0/

Some options are renamed/dropped so fix that along.
 - GL and GLES drawing has been dropped in 1.17.8.
 - The XML surface has been removed in 1.18.0.

Patches:
 - drop 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch, upstream: [1]
 - drop 0002-Fix-mask-usage-in-image-compositor.patch, upstream: [2]
 - add 0002-meson.build-fix-x11-build.patch, upstream: [3]

[1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0
[2]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be
[3]: https://gitlab.freedesktop.org/cairo/cairo/-/issues/613

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
---
 ...or_tolerance_normalized-fix-infinite.patch | 39 -------------
 ...rivate.h-fix-missing-FT_Color-error.patch} |  0
 ...2-Fix-mask-usage-in-image-compositor.patch | 56 -------------------
 .../0002-meson.build-fix-x11-build.patch      | 29 ++++++++++
 package/cairo/cairo.hash                      |  6 +-
 package/cairo/cairo.mk                        | 20 ++++---
 6 files changed, 42 insertions(+), 108 deletions(-)
 delete mode 100644 package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 rename package/cairo/{0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch => 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch} (100%)
 delete mode 100644 package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
 create mode 100644 package/cairo/0002-meson.build-fix-x11-build.patch

diff --git a/package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch b/package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
deleted file mode 100644
index 078e90fa42..0000000000
--- a/package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
-
-[Retrieved from:
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
- 
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
- 
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
diff --git a/package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch b/package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
similarity index 100%
rename from package/cairo/0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch
rename to package/cairo/0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch
diff --git a/package/cairo/0002-Fix-mask-usage-in-image-compositor.patch b/package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
deleted file mode 100644
index 54a95593c5..0000000000
--- a/package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <heiko.lewin@worldiety.de>
-Date: Tue, 15 Dec 2020 16:48:19 +0100
-Subject: [PATCH] Fix mask usage in image-compositor
-
-[Retrieved from
-https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be]
-[Removed changes in test/ directory to remove binary diff so that the
-patch can be applied by `patch` tool]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/cairo-image-compositor.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
-index bbf4cf228..2352c478e 100644
---- a/src/cairo-image-compositor.c
-+++ b/src/cairo-image-compositor.c
-@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 		    unsigned num_spans)
- {
-     cairo_image_span_renderer_t *r = abstract_renderer;
--    uint8_t *m;
-+    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
-     int x0;
- 
-     if (num_spans == 0)
- 	return CAIRO_STATUS_SUCCESS;
- 
-     x0 = spans[0].x;
--    m = r->_buf;
-+    m = base;
-     do {
- 	int len = spans[1].x - spans[0].x;
- 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
-@@ -2646,7 +2646,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 				      spans[0].x, y,
- 				      spans[1].x - spans[0].x, h);
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else if (spans[0].coverage == 0x0) {
- 	    if (spans[0].x != x0) {
-@@ -2675,7 +2675,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- #endif
- 	    }
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else {
- 	    *m++ = spans[0].coverage;
--- 
-2.38.1
-
diff --git a/package/cairo/0002-meson.build-fix-x11-build.patch b/package/cairo/0002-meson.build-fix-x11-build.patch
new file mode 100644
index 0000000000..fd17397586
--- /dev/null
+++ b/package/cairo/0002-meson.build-fix-x11-build.patch
@@ -0,0 +1,29 @@
+From 840e3ad20f8536d9857876ca2f5161896b68ab9b Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 10:44:13 +0100
+Subject: [PATCH] meson.build: fix x11 build
+
+../../br-test-pkg/arm-aarch64/build/cairo-1.18.0/meson.build:381:13: ERROR: Can not run test applications in this cross environment.
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/613
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9efe91978..9864b8699 100644
+--- a/meson.build
++++ b/meson.build
+@@ -369,7 +369,7 @@ if x11_dep.found() and xext_dep.found()
+ 
+   # Can skip the run check by providing the result in a cross file or
+   # native file as bool property value.
+-  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
++  prop = meson.get_external_property('ipc_rmid_deferred_release', 'false')
+   # We don't know the type of prop (bool, string) but need to differentiate
+   # between a set value (bool) or the fallback value (string), so convert to
+   # a string and check the string value.
+-- 
+2.34.1
+
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index fca9ff678c..df9c693bad 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,7 +1,5 @@
-# From https://www.cairographics.org/snapshots/cairo-1.17.4.tar.xz.sha1
-sha1  68712ae1039b114347be3b7200bc1c901d47a636  cairo-1.17.4.tar.xz
-# Calculated based on the hash above
-sha256  74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705  cairo-1.17.4.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.0.tar.xz.sha256sum
+sha256  243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64  cairo-1.18.0.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 035eae525d..96b4d71f0f 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.17.4
+CAIRO_VERSION = 1.18.0
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_CPE_ID_VENDOR = cairographics
-CAIRO_SITE = http://cairographics.org/snapshots
+CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
-# 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
-CAIRO_IGNORE_CVES += CVE-2019-6462
-# 0002-Fix-mask-usage-in-image-compositor.patch
-CAIRO_IGNORE_CVES += CVE-2020-35492
-
 CAIRO_CFLAGS = $(TARGET_CFLAGS)
 CAIRO_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -32,9 +27,13 @@ CAIRO_LDFLAGS += -latomic
 endif
 
 CAIRO_CONF_OPTS = \
+	-Ddwrite=disabled \
 	-Dfontconfig=enabled \
+	-Dquartz=disabled \
 	-Dtests=disabled \
 	-Dspectre=disabled \
+	-Dsymbol-lookup=disabled \
+	-Dgtk_doc=false \
 	-Dc_std=gnu11
 CAIRO_DEPENDENCIES = \
 	host-pkgconf \
@@ -46,6 +45,7 @@ HOST_CAIRO_CONF_OPTS = \
 	-Dfontconfig=enabled \
 	-Dfreetype=enabled \
 	-Dpng=enabled \
+	-Dquartz=disabled \
 	-Dtee=disabled \
 	-Dxcb=disabled \
 	-Dxlib=disabled \
@@ -53,6 +53,8 @@ HOST_CAIRO_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dglib=enabled \
 	-Dspectre=disabled \
+	-Dsymbol-lookup=disabled \
+	-Dgtk_doc=false \
 	-Dc_std=gnu11
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
@@ -87,10 +89,10 @@ CAIRO_CONF_OPTS += -Dtee=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled
+CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled -Dxlib-xcb=enabled
 CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXrender
 else
-CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled
+CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled -Dxlib-xcb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_ZLIB),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
