From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 13:29:59 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/mesa3d
Message-ID: <20090224133000.03CB07669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 13:29:59 +0000 (Tue, 24 Feb 2009)
New Revision: 25442

Log:
mesa: use correct config file for arch

Modified:
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:29:55 UTC (rev 25441)
+++ trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk	2009-02-24 13:29:59 UTC (rev 25442)
@@ -7,9 +7,23 @@
 MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mesa3d
 MESA3D_DIR:=$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)
-MESA_TARGET=linux-dri-x86
+MESA_TARGET:=linux-dri
+
+ifeq ($(BR2_i386),y)
+MESA_TARGET:=linux-dri-x86
+endif
+
+ifeq ($(BR2_x86_64),y)
+MESA_TARGET:=linux-dri-x86-64
+endif
+
+ifeq ($(BR2_ppc),y)
+MESA_TARGET:=linux-dri-ppc
+endif
+
 MESA_BUILD_ENV=$(TARGET_CONFIGURE_OPTS)
 MESA_CONFIG_FILE=$(MESA3D_DIR)/configs/$(MESA_TARGET)
+
 #MESA_DRIVERS= i810 i915 i965 mga mach64 r128 r200 r300 s3v savage sis ffb tdfx trident unichrome
 MESA_DRIVERS=
 
