From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] xlib_libXtst: depends on libXi
Message-ID: <20100502074442.01E778A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f421f557f52818ba835b1aa55f93682a76b0ee3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                    |    2 +-
 package/x11r7/xlib_libXtst/Config.in       |    1 +
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index d1372ad..8cb3c6e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 	samba, setserial, squashfs, tslib, usb_modeswith, wget,
 	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
 	xlib_libXaw, xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
-	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
+	xlib_libXtst, xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
 	xproto_fontcacheproto, xproto_xf86miscproto, xserver_xorg-server
 
 	Removed packages: xapp_xtrap, xlib_libXTrap, xlib_libXevie,
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index a8de203..8853bde 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXTST
 	bool "libXtst"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	help
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 7e6427e..e89cf11 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -7,10 +7,15 @@
 XLIB_LIBXTST_VERSION = 1.1.0
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXTST_AUTORECONF = NO
 XLIB_LIBXTST_LIBTOOL_PATCH = NO
 XLIB_LIBXTST_INSTALL_STAGING = YES
-XLIB_LIBXTST_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_recordproto
+
+XLIB_LIBXTST_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXi \
+	xproto_recordproto
+
 XLIB_LIBXTST_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXtst))
-- 
1.6.3.3
