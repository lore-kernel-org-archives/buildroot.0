From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 12:55:39 +0200
Subject: [Buildroot] [git commit master] directfb: fix build with
	BR2_PACKAGE_DIRECTFB_DEBUG
Message-ID: <20091002105811.23BFE77762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96da2dfff935b7a91d9722b111ff1816ca8869de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...rectfb-gfxcard-fix-build-error-with-debug.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch

diff --git a/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch b/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch
new file mode 100644
index 0000000..2c1d459
--- /dev/null
+++ b/package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch
@@ -0,0 +1,33 @@
+From fab69ff2e063f0b6a4b13139f100ff01aa4cae84 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Fri, 2 Oct 2009 12:20:31 +0200
+Subject: [PATCH] gfxcard: fix build error with --enable-debug
+
+Commit fdc611ea (Added support for colors and multiple layers in a
+glyph implementing outlines) changed dfb_gfxcard_drawglyph() to take
+a layers argument instead of index, but the D_DEBUG_AT call wasn't
+changed to match.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/core/gfxcard.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/gfxcard.c b/src/core/gfxcard.c
+index 127e30e..0020103 100644
+--- a/src/core/gfxcard.c
++++ b/src/core/gfxcard.c
+@@ -2335,8 +2335,8 @@ void dfb_gfxcard_drawglyph( CoreGlyphData **glyph, int x, int y,
+      DFBSurfaceBlendFunction  orig_srcblend;
+      DFBSurfaceBlendFunction  orig_dstblend;
+ 
+-     D_DEBUG_AT( Core_GraphicsOps, "%s( %u, %d,%d, %p, %p )\n",
+-                 __FUNCTION__, index, x, y, font, state );
++     D_DEBUG_AT( Core_GraphicsOps, "%s( %d,%d, %u, %p, %p )\n",
++                 __FUNCTION__, x, y, layers, font, state );
+ 
+      D_ASSERT( card != NULL );
+      D_ASSERT( card->shared != NULL );
+-- 
+1.6.3.3
+
-- 
1.6.3.3
