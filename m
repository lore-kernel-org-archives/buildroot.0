From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 03:08:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/mesa3d
Message-ID: <20070811100815.32D0CA605C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 03:08:13 -0700 (Sat, 11 Aug 2007)
New Revision: 19426

Log:
Correct mesa3d-source, use correct patch directory

Modified:
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2007-08-11 00:12:33 UTC (rev 19425)
+++ trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2007-08-11 10:08:13 UTC (rev 19426)
@@ -19,7 +19,7 @@
 
 $(MESA3D_DIR)/.extracted: $(DL_DIR)/$(MESA3D_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(MESA3D_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MESA3D_DIR) package/mesa3d/ mesa3d\*.patch
+	toolchain/patch-kernel.sh $(MESA3D_DIR) package/x11r7/mesa3d/ mesa3d\*.patch
 	touch $@
 
 $(MESA3D_DIR)/.configured: $(MESA3D_DIR)/.extracted
@@ -60,7 +60,7 @@
 	touch $@
 
 mesa3d-depends:   xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm
-mesa3d-source:    $(MESA3D_DIR)/.extracted
+mesa3d-source:    $(DL_DIR)/$(MESA3D_SOURCE)
 mesa3d-configure: $(MESA3D_DIR)/.configured
 mesa3d-build:     $(MESA3D_DIR)/.built
 mesa3d:           mesa3d-depends $(MESA3D_DIR)/.installed	
