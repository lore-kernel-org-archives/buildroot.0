From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 13:29:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/mesa3d
Message-ID: <20090224132956.513057669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 13:29:55 +0000 (Tue, 24 Feb 2009)
New Revision: 25441

Log:
mesa3d: use MAKE1 instead of playing around with BR2_JLEVEL

Modified:
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:29:50 UTC (rev 25440)
+++ trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:29:55 UTC (rev 25441)
@@ -36,11 +36,10 @@
 	) >> $(MESA_CONFIG_FILE)
 	touch $@
 
-$(MESA3D_DIR)/.built: BR2_JLEVEL=1
 $(MESA3D_DIR)/.built: $(MESA3D_DIR)/.configured
 	gccinc=$$($(TARGET_CC) -print-search-dirs | grep '^install:' | sed 's@^install: @@')include; \
 	rm -f $(MESA3D_DIR)/config/current
-	env $(MESA_BUILD_ENV) $(MAKE) \
+	env $(MESA_BUILD_ENV) $(MAKE1) \
 		MKDEP="makedepend -I$$gccinc" \
 		CC=$(TARGET_CC) CXX=$(TARGET_CXX) CC_FOR_BUILD=/usr/bin/gcc \
 		-C $(MESA3D_DIR) $(MESA_TARGET)
