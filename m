From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 21:33:36 +0100
Subject: [Buildroot] [git commit] xapp_xev: add missing dependencies on
	xlib_libXrandr
Message-ID: <20130325203314.7FE3D9B2D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e68c544ef89144f73b7d814e439476dac3c4d1bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/ec1855d3d96cf01409999492c77a2709be8c4d01/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xev/Config.in   |    1 +
 package/x11r7/xapp_xev/xapp_xev.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xev/Config.in b/package/x11r7/xapp_xev/Config.in
index e2e05b3..864d642 100644
--- a/package/x11r7/xapp_xev/Config.in
+++ b/package/x11r7/xapp_xev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XEV
 	bool "xev"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
 	  print contents of X events
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index bf4cd30..dd7c798 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -7,6 +7,6 @@
 XAPP_XEV_VERSION = 1.2.0
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEV_DEPENDENCIES = xlib_libX11
+XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
 $(eval $(autotools-package))
