From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 11:19:09 +0200
Subject: [Buildroot] [git commit master 1/1] xterm: should select libXaw and
	bump to latest version
Message-ID: <20101004091921.6B90D8B8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f4000e562040046aef1ec79e33abdeedbe33005
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/xterm/Config.in |    1 +
 package/xterm/xterm.mk  |    4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a1168d7..69ec5d0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -51,7 +51,7 @@
 	xdriver-xf86-video-{sis,sisusb,suncg3,suncg6,suncg14,sunffb},
 	xdriver-xf86-video-{sunleo,suntcx,tdfx,tga,trident,v4l,vesa},
 	xdriver-xf86-video-{vmware,voodeo,wsfb,xgi,xgixp},
-	xkeyboard-config, xlib_libX11, xstroke, xvkbd, zlib
+	xkeyboard-config, xlib_libX11, xstroke, xterm, xvkbd, zlib
 
 	Deprecated packages: hotplug, lzma
 
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index da3e9fe..9473fad 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XTERM
 	bool "xterm"
+	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	help
 	  xterm terminal emulator
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index b07eda4..8952e24 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-XTERM_VERSION:=259
+XTERM_VERSION:=262
 XTERM_SOURCE:=xterm-$(XTERM_VERSION).tgz
 XTERM_SITE:=ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = xserver_xorg-server
+XTERM_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,xterm))
-- 
1.7.1
