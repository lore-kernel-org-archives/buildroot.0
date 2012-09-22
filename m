From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:58 +0200
Subject: [Buildroot] [git commit] xapp_xrandr: bump version
Message-ID: <20120922194206.A78999963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f578eca838e460bdfa845da57ea9f815990c60a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xapp_xrandr-1.2.3-clone-redef.patch            |   29 --------------------
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 2 files changed, 1 insertions(+), 30 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch b/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
deleted file mode 100644
index 6dc3534..0000000
--- a/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/xrandr.c.orig	2008-02-02 17:09:45.000000000 -0500
-+++ b/xrandr.c	2008-02-02 17:04:51.000000000 -0500
-@@ -189,7 +189,7 @@ reflection_name (Rotation rotation)
- 
- #if HAS_RANDR_1_2
- typedef enum _policy {
--    clone, extend
-+    clone1, extend
- } policy_t;
- 
- typedef enum _relation {
-@@ -1602,7 +1602,7 @@ main (int argc, char **argv)
-     int		ret = 0;
- #if HAS_RANDR_1_2
-     output_t	*output = NULL;
--    policy_t	policy = clone;
-+    policy_t	policy = clone1;
-     Bool    	setit_1_2 = False;
-     Bool    	query_1_2 = False;
-     Bool	modeit = False;
-@@ -1863,7 +1863,7 @@ main (int argc, char **argv)
- 	    continue;
- 	}
- 	if (!strcmp ("--clone", argv[i])) {
--	    policy = clone;
-+	    policy = clone1;
- 	    setit_1_2 = True;
- 	    continue;
- 	}
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 5c6c756..5a1b363 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.3.2
+XAPP_XRANDR_VERSION = 1.3.4
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
