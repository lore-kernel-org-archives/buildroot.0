From: William Wagner <will_wagner@carallon.com>
Date: Mon, 04 Jan 2010 19:54:21 +0000
Subject: [Buildroot] [PATCH] Fix for mesa3d
Message-ID: <4B42476D.4040307@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the changes to autotargets mesa3d no longer compiles.

Patch below fixes typos:

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index fa98bf6..a72670e
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -73,7 +73,7 @@ $(MESA3D_DIR)/.installed: $(MESA3D_DIR)/.built
      rm -Rf $(TARGET_DIR)/usr/include/GL
      touch $@

-mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm 
xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-makedepend
+mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm 
xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-xutil_makedepend
  mesa3d-source: $(DL_DIR)/$(MESA3D_SOURCE)
  mesa3d-configure: $(MESA3D_DIR)/.configured
  mesa3d-build: $(MESA3D_DIR)/.built
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk 
b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index b0bbafd..cd6801d
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
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
