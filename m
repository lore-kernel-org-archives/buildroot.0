From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:21:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 2.5.3
Message-ID: <20190803192105.29076-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed backported patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...airo-svg-dependency-to-test-ot-color.patch | 38 -------------------
 package/harfbuzz/harfbuzz.hash                |  4 +-
 package/harfbuzz/harfbuzz.mk                  |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch

diff --git a/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch b/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch
deleted file mode 100644
index ea759e5afc..0000000000
--- a/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c2d7dfc68ffcb389c9f73b5ef94da7b270bdcf9e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 22 Jun 2019 19:38:48 -0600
-Subject: [PATCH] Add missing cairo-svg dependency to test-ot-color
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-c2d7dfc68ffcb389c9f73b5ef94da7b270bdcf9e]
----
- src/test-ot-color.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/test-ot-color.cc b/src/test-ot-color.cc
-index 44bd2eb6..e9126c06 100644
---- a/src/test-ot-color.cc
-+++ b/src/test-ot-color.cc
-@@ -25,7 +25,9 @@
- 
- #include "hb.hh"
- 
--#ifndef HB_NO_COLOR
-+#include <cairo.h>
-+
-+#if !defined(HB_NO_COLOR) && defined(CAIRO_HAS_SVG_SURFACE)
- 
- #include "hb-ot.h"
- 
-@@ -35,7 +37,6 @@
- #include FT_FREETYPE_H
- #include FT_GLYPH_H
- 
--#include <cairo.h>
- #include <cairo-ft.h>
- #include <cairo-svg.h>
- 
--- 
-2.20.1
-
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a2b51bbc0a..8aa4265e8a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,5 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.5.2.tar.xz.sha256
-sha256 7c8fcf9a2bbe3df5ed9650060d89f9b7cfd40ec5729671447ace8b0505527e8b  harfbuzz-2.5.2.tar.xz
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.5.3.tar.xz.sha256
+sha256 fed00dc797b7ba3ca943225f0a854baaed4c1640fff8a31d455cd3b5caec855c  harfbuzz-2.5.3.tar.xz
 
 # Locally computed
 sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index ded5e554e6..3f12a4563d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.5.2
+HARFBUZZ_VERSION = 2.5.3
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.20.1
