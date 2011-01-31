From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Jan 2011 15:07:01 +0100
Subject: [Buildroot] [git commit master 1/1] x11vnc: needs libXt
Message-ID: <20110131140731.3E49E80779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5bc9f45dfbfa39e80622e9b482ce3a96b57d839a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11vnc/Config.in |    1 +
 package/x11vnc/x11vnc.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 5571c8a..fdb3bad 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  VNC server for X11 display
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index f71350d..9e1db05 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -12,6 +12,6 @@ X11VNC_INSTALL_TARGET = YES
 X11VNC_CONF_OPT = \
 	--without-avahi
 
-X11VNC_DEPENDENCIES = xserver_xorg-server
+X11VNC_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
 $(eval $(call AUTOTARGETS,package,x11vnc))
-- 
1.7.3.4
