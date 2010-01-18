From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 17:18:49 +0100
Subject: [Buildroot] [git commit master] mesa3d/makedepend: correct host
	package names after autotools change
Message-ID: <20100118162039.BDA1C776BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c68bef7c006e4e21af643e9639ad7d1e7e305f52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: William Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk                     |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index fa98bf6..a72670e 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -73,7 +73,7 @@ $(MESA3D_DIR)/.installed: $(MESA3D_DIR)/.built
 	rm -Rf $(TARGET_DIR)/usr/include/GL
 	touch $@
 
-mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-makedepend
+mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-xutil_makedepend
 mesa3d-source: $(DL_DIR)/$(MESA3D_SOURCE)
 mesa3d-configure: $(MESA3D_DIR)/.configured
 mesa3d-build: $(MESA3D_DIR)/.built
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index b0bbafd..cd6801d 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -11,7 +11,7 @@ XUTIL_MAKEDEPEND_AUTORECONF = NO
 XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
 XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto-xproto
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
 $(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend,host))
-- 
1.6.3.3
