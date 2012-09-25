From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 20:25:17 +0200
Subject: [Buildroot] [git commit] x11vnc: bump version to fix build issue
	with newer libX11
Message-ID: <20120925195159.5316D99701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=198f0c911105dab7e06a5ded574e09f1b4c02c71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/2733c2c9fa7aacb355e0e0b184a5afe41cf35a3d

Old x11vnc defined a 'pointer' function, which collides with the libX11
pointer type. Fix it by bumping the version (upstream renamed it to
pointer_event()).

Fix the dependencies and help text while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11vnc/Config.in |    3 +++
 package/x11vnc/x11vnc.mk |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index fdb3bad..53895b0 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -2,5 +2,8 @@ config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  VNC server for X11 display
+
+	  http://www.karlrunge.com/x11vnc/
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index e96b665..444a839 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -3,12 +3,12 @@
 # X11VNC
 #
 #############################################################
-X11VNC_VERSION = 0.9.3
+X11VNC_VERSION = 0.9.13
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
 X11VNC_CONF_OPT = \
 	--without-avahi
 
-X11VNC_DEPENDENCIES = xserver_xorg-server xlib_libXt
+X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext
 
 $(eval $(autotools-package))
