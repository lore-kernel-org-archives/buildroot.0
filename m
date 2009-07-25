From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] xorg server: beautify list of dependencies
Message-ID: <20090725071548.DC76D77713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d8153655cfc1671a731c68ac584d862ccc20e09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorganize the list of depencies with a sane indentation level, and
one dependency per line. Yes, the list is long, but is easier to read,
and future patches modifying this list will be easier to review.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |   66 ++++++++++++++++----
 1 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 77c8208..0c70441 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -12,19 +12,59 @@ XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
-XSERVER_XORG_SERVER_DEPENDENCIES =  xutil_util-macros xlib_libXfont libdrm xlib_libxkbui openssl \
-									xproto_compositeproto xproto_damageproto xproto_fixesproto \
-									xproto_glproto xproto_kbproto xproto_randrproto \
-									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
-									xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm \
-									xlib_libXrender xlib_libXres xlib_libXft xlib_libXcursor \
-									xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm \
-									xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto \
-									xproto_evieext xproto_fontsproto xproto_inputproto xproto_renderproto \
-									xproto_resourceproto xproto_videoproto xproto_xcmiscproto \
-									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
-									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
-									pixman mcookie
+XSERVER_XORG_SERVER_DEPENDENCIES = 	\
+	xutil_util-macros 		\
+	xlib_libXfont 			\
+	xlib_libxkbui 			\
+	xlib_libX11 			\
+	xlib_libXau 			\
+	xlib_libXaw 			\
+	xlib_libXdmcp 			\
+	xlib_libXScrnSaver 		\
+	xlib_libXext 			\
+	xlib_libXfixes 			\
+	xlib_libXi 			\
+	xlib_libXmu 			\
+	xlib_libXpm 			\
+	xlib_libXrender 		\
+	xlib_libXres 			\
+	xlib_libXft 			\
+	xlib_libXcursor 		\
+	xlib_libXinerama 		\
+	xlib_libXrandr 			\
+	xlib_libXdamage 		\
+	xlib_libXxf86misc 		\
+	xlib_libXxf86vm 		\
+	xlib_liblbxutil 		\
+	xlib_libxkbfile 		\
+	xlib_xtrans 			\
+	xdata_xbitmaps 			\
+	xproto_bigreqsproto 		\
+	xproto_compositeproto 		\
+	xproto_damageproto 		\
+	xproto_evieext 			\
+	xproto_fixesproto 		\
+	xproto_fontsproto 		\
+	xproto_glproto 			\
+	xproto_inputproto 		\
+	xproto_kbproto 			\
+	xproto_randrproto 		\
+	xproto_renderproto 		\
+	xproto_resourceproto 		\
+	xproto_videoproto 		\
+	xproto_xcmiscproto 		\
+	xproto_xextproto 		\
+	xproto_xf86bigfontproto 	\
+	xproto_xf86dgaproto 		\
+	xproto_xf86driproto	 	\
+	xproto_xf86miscproto 		\
+	xproto_xf86rushproto 		\
+	xproto_xf86vidmodeproto 	\
+	xproto_xproto 			\
+	libdrm 				\
+	pixman 				\
+	openssl 			\
+	mcookie
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
-- 
1.6.3.3
