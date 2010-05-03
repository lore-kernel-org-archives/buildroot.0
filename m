From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 3 May 2010 12:01:19 +0200
Subject: [Buildroot] [git commit master] directfb: bump to 1.4.3
Message-ID: <20100503100232.D73A38F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=38b915c18523647cbfeee9bbb814ea612c28bf62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 ...rectfb-gfxcard-fix-build-error-with-debug.patch |   33 --------------------
 package/directfb/directfb.mk                       |    2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/directfb/directfb-gfxcard-fix-build-error-with-debug.patch

diff --git a/CHANGES b/CHANGES
index b1eca30..11e1997 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
 	netperf, squid
 
-	Updated/fixed packages: alsa-utils, busybox, dnsmasq,
+	Updated/fixed packages: alsa-utils, busybox, directfb, dnsmasq,
 	dosfstools, e2fsprogs, eeprog, fbv, freetype, haserl, hostapd,
 	iperf, iptables, iw, less, libaio,libdrm, libgcrypt, libglib2,
 	libpng, libxml2, libxslt, lua, matchbox, mdadm, memstat, mesa3d,
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
index 57b2e17..c5d9c2b 100644
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
1.6.3.3
