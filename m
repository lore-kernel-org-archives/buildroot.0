From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 15:38:54 +0200
Subject: [Buildroot] [git commit] package/netsurf: bump to version 3.9
Message-ID: <20190720133738.BFB15814BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89267150fda2e38ea11dcc5b9f54c9544b17ff82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/0002-fix-freetype-detection.patch | 32 -----------------------
 package/netsurf/netsurf.hash                      |  2 +-
 package/netsurf/netsurf.mk                        |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/netsurf/0002-fix-freetype-detection.patch b/package/netsurf/0002-fix-freetype-detection.patch
deleted file mode 100644
index 27e3a6a1d5..0000000000
--- a/package/netsurf/0002-fix-freetype-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 85336f2404b9583267019650ea0112ebf1bb571a Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Wed, 28 Nov 2018 17:59:44 +0100
-Subject: [PATCH] fix freetype detection
-
-Using freetype-config doesn't work well, because it's going to use the
-system freetype-config instead of the one installed in the
-cross-compilation sysroot. So, let's use pkg-config instead.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- netsurf/frontends/framebuffer/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/netsurf/frontends/framebuffer/Makefile b/netsurf/frontends/framebuffer/Makefile
-index bdedd90..249c7c4 100644
---- a/netsurf/frontends/framebuffer/Makefile
-+++ b/netsurf/frontends/framebuffer/Makefile
-@@ -35,8 +35,8 @@ LDFLAGS += -Wl,--no-whole-archive
- 
- # freetype is optional but does not use pkg-config
- ifeq ($(NETSURF_FB_FONTLIB),freetype)
--  CFLAGS += -DFB_USE_FREETYPE $(shell freetype-config --cflags)
--  LDFLAGS += $(shell freetype-config --libs)
-+  CFLAGS += -DFB_USE_FREETYPE $(shell $(PKG_CONFIG) --cflags freetype2)
-+  LDFLAGS += $(shell $(PKG_CONFIG) --libs freetype2)
- endif
- 
- 
--- 
-2.17.1
-
diff --git a/package/netsurf/netsurf.hash b/package/netsurf/netsurf.hash
index 26e8c76f34..0f38ea2080 100644
--- a/package/netsurf/netsurf.hash
+++ b/package/netsurf/netsurf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 eb4864d4459d6f9958dd10a3301c272ea7f5df72667a7db0aad5bc5ae06c0e10  netsurf-all-3.8.tar.gz
+sha256 11e384eaf47e65c186da5001f1055a02f2d72ff17b50f403b8392546a2cf65ff  netsurf-all-3.9.tar.gz
 sha256 55c4a7ae3953d720a462e69d1f128a20004933d12538be5314a33f8821675378  netsurf/COPYING
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 31cf9e62b8..30e8dc8b4f 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSURF_VERSION = 3.8
+NETSURF_VERSION = 3.9
 NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
 NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
 NETSURF_LICENSE = GPL-2.0
