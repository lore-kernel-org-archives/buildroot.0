From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 16:06:39 +0100
Subject: [Buildroot] [git commit] xapp_xf86dga: fix dependencies
Message-ID: <20111118182052.7C47D8F587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c94b24a85184134fb38ab8f31969978ea695bdfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index 9975916..726d5ed 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -7,6 +7,12 @@
 XAPP_XF86DGA_VERSION = 1.0.2
 XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
 XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXxf86dga
+XAPP_XF86DGA_DEPENDENCIES = \
+	host-pkg-config \
+	xlib_libX11 \
+	xlib_libXxf86dga \
+	xlib_libXt \
+	xlib_libXaw \
+	xlib_libXmu
 
 $(eval $(call AUTOTARGETS))
