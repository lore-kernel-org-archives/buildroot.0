From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:45 +0100
Subject: [Buildroot] [PATCH 03/14] directfb: bump to 1.4.3
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 ...rectfb-gfxcard-fix-build-error-with-debug.patch |   33 --------------------
 package/directfb/directfb.mk                       |    2 +-
 2 files changed, 1 insertions(+), 34 deletions(-)
 delete mode 100644 package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch

diff --git a/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch b/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch
deleted file mode 100644
index 2c1d459..0000000
--- a/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fab69ff2e063f0b6a4b13139f100ff01aa4cae84 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 2 Oct 2009 12:20:31 +0200
-Subject: [PATCH] gfxcard: fix build error with --enable-debug
-
-Commit fdc611ea (Added support for colors and multiple layers in a
-glyph implementing outlines) changed dfb_gfxcard_drawglyph() to take
-a layers argument instead of index, but the D_DEBUG_AT call wasn't
-changed to match.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/core/gfxcard.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/core/gfxcard.c b/src/core/gfxcard.c
-index 127e30e..0020103 100644
---- a/src/core/gfxcard.c
-+++ b/src/core/gfxcard.c
-@@ -2335,8 +2335,8 @@ void dfb_gfxcard_drawglyph( CoreGlyphData **glyph, int x, int y,
-      DFBSurfaceBlendFunction  orig_srcblend;
-      DFBSurfaceBlendFunction  orig_dstblend;
- 
--     D_DEBUG_AT( Core_GraphicsOps, "%s( %u, %d,%d, %p, %p )\n",
--                 __FUNCTION__, index, x, y, font, state );
-+     D_DEBUG_AT( Core_GraphicsOps, "%s( %d,%d, %u, %p, %p )\n",
-+                 __FUNCTION__, x, y, layers, font, state );
- 
-      D_ASSERT( card != NULL );
-      D_ASSERT( card->shared != NULL );
--- 
-1.6.3.3
-
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a4ee3bc..2f095ee 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=1.4.2
+DIRECTFB_VERSION:=1.4.3
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
-- 
1.6.6
