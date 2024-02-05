Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA5C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A237A40BFB;
	Mon,  5 Feb 2024 21:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A237A40BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJW3ENGO1PtE; Mon,  5 Feb 2024 21:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0878240BFF;
	Mon,  5 Feb 2024 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0878240BFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F06A81BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD5560ECE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD5560ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnvmOcd5yci6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:23:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6667760E2E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6667760E2E
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40fccd09082so24750155e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 13:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707168197; x=1707772997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48YWAZkj9lJlp/hxiata73vcGhfJCByWhV9PKTMngyY=;
 b=eiT/cLk38rCwZEHSj6wXrGVXuwsH/M5naWr6Frx7mE7TpOw9EqzDNZgDVW4z2DUYuZ
 uXSXsbh3/K+EcLYa5CvjPnjq3WyzFyA2EU6xJBpW05MdjIOakvyX0qKQcjEidYWTj4YR
 JhkyPq/IZzsOtrG+WrtivAfSXYfWxRbqE9S8dES7QwhkR7/VJTtG/sTz5ZFo22g6kXha
 TsUR0dLye/0+P3K8/qN/4zuq60w7W82fVwIVLKtGS5wnaaEpjrtD928IHE4pzz2s8tDG
 VPp2WpcnpBboADJOcDuua4uJ4V2Mbx9kEhv5bWUfUwz6ahV5LmJvyZ1G8xHC7aPJNLgL
 mLyw==
X-Gm-Message-State: AOJu0Yyxg/G9WYkuPetoPpgclZUs92e2/Gsjw6ebWdP1xaM+4sxYcyW7
 +2Jwkm/UUHu0Tiu7s/Pg8Jl89++5O701+/oWONOJ9ssD2ju3d6se
X-Google-Smtp-Source: AGHT+IFXXhyna5VWgKtylzeqs31Vxyfu93JydwD2oS+dn5+gtmFXY34MYIT5NnVRzbZRXBPJ7C0yVA==
X-Received: by 2002:a05:600c:4fcd:b0:40e:d2da:fc6b with SMTP id
 o13-20020a05600c4fcd00b0040ed2dafc6bmr697376wmq.38.1707168196883; 
 Mon, 05 Feb 2024 13:23:16 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXa8OI+nnTCIDkMmMmPD4XiR1rfz6Vh2rvmXRZmdOnypbK2GO4gsA1AHF1yIHGJxMShJVwLDu3oAiOCApmFhdn4fKh751uCy7VM5NfixuxVuqiPqA+JUxcMKw/gnQldczM/dJ2yZr1eDgfv5AOKgatOsf9Xlxe2aZ1l40XB6ohMt0mXMe16nZy52F4huFtcW9HVnvZqnhtKnQlAM5e0NsJYeGlPHnN1yREoWiCcwpQAUehayIdKeyoUAVNmd2kraIJ8shfx6NSFjKXR
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:57d3:fa5a:150f:8385])
 by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b0040fe1ec1773sm56241wmb.47.2024.02.05.13.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 13:23:16 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: peter@korsgaard.com
Date: Mon,  5 Feb 2024 22:23:00 +0100
Message-Id: <20240205212300.3178519-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205212300.3178519-1-thomas@devoogdt.com>
References: <87zfwfrmoe.fsf@48ers.dk>
 <20240205212300.3178519-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/2] package/cairo: bump to 1.18.0
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
Cc: eric.le.bihan.dev@free.fr, thomas@devoogdt.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, aperez@igalia.com,
 fontaine.fabrice@gmail.com
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
 - xlib-xcb was added [1]

Patches:
 - drop 0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch, upstream: [2]
 - drop 0002-Fix-mask-usage-in-image-compositor.patch, upstream: [3]
 - drop 0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch, upstream: [4]

[1]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/3468c67fe91f0c37e0ec5d335082653a6fa609b6
[2]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0
[3]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be
[4]: https://gitlab.freedesktop.org/cairo/cairo/-/commit/1bec56ea8a931e1ae1c74cc740134497ec365267

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v5: split in 3 commits: https://lore.kernel.org/buildroot/20240105101105.6a181dcd@windsurf/
v7: rebased on v7-0001-package-cairo-move-to-the-meson-build-system
---
 ...or_tolerance_normalized-fix-infinite.patch | 39 ------------
 ...rivate.h-fix-missing-FT_Color-error.patch} |  0
 ...2-Fix-mask-usage-in-image-compositor.patch | 56 -----------------
 ...-IPC_RMID_DEFERRED_RELEASE-check-wh.patch} |  0
 ...ping-of-run-check-for-IPC_RMID_DEFER.patch | 62 -------------------
 package/cairo/cairo.hash                      |  6 +-
 package/cairo/cairo.mk                        | 21 ++++---
 7 files changed, 14 insertions(+), 170 deletions(-)
 delete mode 100644 package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch
 rename package/cairo/{0003-cairo-ft-private.h-fix-missing-FT_Color-error.patch => 0001-cairo-ft-private.h-fix-missing-FT_Color-error.patch} (100%)
 delete mode 100644 package/cairo/0002-Fix-mask-usage-in-image-compositor.patch
 rename package/cairo/{0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch => 0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch} (100%)
 delete mode 100644 package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch

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
diff --git a/package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch b/package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
similarity index 100%
rename from package/cairo/0005-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
rename to package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
diff --git a/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch b/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch
deleted file mode 100644
index 193a210391..0000000000
--- a/package/cairo/0004-meson-allow-skipping-of-run-check-for-IPC_RMID_DEFER.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 39cbc3c1f1caf558188bd2203c976bae8de2f6a7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Thu, 25 Feb 2021 10:52:45 +0000
-Subject: [PATCH] meson: allow skipping of run check for
- IPC_RMID_DEFERRED_RELEASE
-
-The run check is particularly annoying in cross-compile scenarios,
-so allow bypassing the check by having the user provide the value
-via a cross file or native file:
-
-  [properties]
-  ipc_rmid_deferred_release = true
-
-Closes #408
-
-Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/commit/1bec56ea8a931e1ae1c74cc740134497ec365267
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- meson.build | 25 ++++++++++++++++++++-----
- 1 file changed, 20 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index b159b4071..5f593e54d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -264,13 +264,28 @@ if x11_dep.found() and xext_dep.found()
-     ['X11/extensions/shmstr.h', {'extra-headers': extra_headers}],
-   ]
-   deps += [x11_dep, xext_dep]
--  res = cc.run(files('meson-cc-tests/ipc_rmid_deferred_release.c'),
--    dependencies: [x11_dep, xext_dep],
--    name: 'shmctl IPC_RMID allowes subsequent attaches')
- 
--  if res.returncode() == 0
--    conf.set('IPC_RMID_DEFERRED_RELEASE', 1)
-+  # Can skip the run check by providing the result in a cross file or
-+  # native file as bool property value.
-+  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
-+  # We don't know the type of prop (bool, string) but need to differentiate
-+  # between a set value (bool) or the fallback value (string), so convert to
-+  # a string and chec the string value.
-+  prop_str = '@0@'.format(prop)
-+  if prop_str in ['true', 'false']
-+    ipc_rmid_deferred_release = (prop_str == 'true')
-+    message('IPC_RMID_DEFERRED_RELEASE:', ipc_rmid_deferred_release)
-+  elif prop_str == 'auto'
-+    res = cc.run(files('meson-cc-tests/ipc_rmid_deferred_release.c'),
-+      dependencies: [x11_dep, xext_dep],
-+      name: 'shmctl IPC_RMID allowes subsequent attaches')
-+
-+    ipc_rmid_deferred_release = (res.returncode() == 0)
-+  else
-+    error('Unexpected value for external property ipc_rmid_deferred_release: @0@'.format(prop_str))
-   endif
-+
-+  conf.set10('IPC_RMID_DEFERRED_RELEASE', ipc_rmid_deferred_release)
- endif
- 
- if feature_conf.get('CAIRO_HAS_XLIB_SURFACE', 0) == 1
--- 
-2.34.1
-
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
index 3d2a67a6c5..4ace04ebbe 100644
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
@@ -43,9 +42,11 @@ CAIRO_DEPENDENCIES = \
 
 # Just the bare minimum to make other host-* packages happy
 HOST_CAIRO_CONF_OPTS = \
+	-Ddwrite=disabled \
 	-Dfontconfig=enabled \
 	-Dfreetype=enabled \
 	-Dpng=enabled \
+	-Dquartz=disabled \
 	-Dtee=disabled \
 	-Dxcb=disabled \
 	-Dxlib=disabled \
@@ -53,6 +54,8 @@ HOST_CAIRO_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dglib=enabled \
 	-Dspectre=disabled \
+	-Dsymbol-lookup=disabled \
+	-Dgtk_doc=false \
 	-Dc_std=gnu11
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
@@ -82,10 +85,10 @@ CAIRO_CONF_OPTS += -Dglib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled
+CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled -Dxlib-xcb=enabled
 CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXrender
 else
-CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled
+CAIRO_CONF_OPTS += -Dxcb=disabled -Dxlib=disabled -Dxlib-xcb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
