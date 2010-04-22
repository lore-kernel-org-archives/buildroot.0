From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Apr 2010 12:26:54 +0200
Subject: [Buildroot] [git commit master] libXaw: do not build docs (fails if
	missing host tools), also cleanup makefile
Message-ID: <20100422102800.9A98720324@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5b948a54ec74ccf35f9158e9eda240ca8ec6bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c4ee2c1..2eb5694 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,7 +19,7 @@
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
 	setserial, squashfs, usb_modeswith, wget,
 	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
-	xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
+	xlib_libXaw, xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
 	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
 	xproto_fontcacheproto, xproto_xf86miscproto, xserver_xorg-server
 
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 8684ac8..ac8c5f8 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -7,9 +7,8 @@
 XLIB_LIBXAW_VERSION = 1.0.7
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXAW_AUTORECONF = NO
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
-XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static
+XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static --disable-docs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXaw))
-- 
1.6.3.3
