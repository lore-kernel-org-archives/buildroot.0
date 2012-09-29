From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Sep 2012 20:40:39 +0200
Subject: [Buildroot] [git commit] x11vnc: add libXtst as a dependency
Message-ID: <20120929201756.9C3B59975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b86a86cfbbf72499b62e3b498001d97366bdb6d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

x11vnc CAN be built without XTEST support, but it isn't very useful as
noted by the warning printed by configure when it isn't found:

*** A working build environment for the XTEST extension was not found ***
(libXtst).  An x11vnc built this way will be *ONLY BARELY USABLE*.
You will be able to move the mouse but not click or type.  There can
also be deadlocks if an application grabs the X server.

It is recommended that you install the necessary development packages
for XTEST (perhaps it is named something like libxtst-dev) and run
configure again.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11vnc/Config.in |    1 +
 package/x11vnc/x11vnc.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 53895b0..5693754 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_X11VNC
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  VNC server for X11 display
 
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 51ae0a0..06afcac 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -9,7 +9,7 @@ X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11
 X11VNC_CONF_OPT = \
 	--without-avahi
 
-X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext
+X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 
 ifneq ($(BR2_INET_IPV6),y)
 # configure option only used for libvncserver
