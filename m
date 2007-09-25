From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 05:34:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: alsa-utils dialog
	directfb fbv freetype etc...
Message-ID: <20070925123411.EA7E03006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 05:34:09 -0700 (Tue, 25 Sep 2007)
New Revision: 20016

Log:
- make sure that configure doesn't see a wrong cache


Modified:
   trunk/buildroot/package/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/dialog/dialog.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/fbv/fbv.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/less/less.mk
   trunk/buildroot/package/libcgi/libcgi.mk
   trunk/buildroot/package/libcgicc/libcgicc.mk
   trunk/buildroot/package/libgpg-error/libgpg-error.mk
   trunk/buildroot/package/libsndfile/libsndfile.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/netkitbase/netkitbase.mk
   trunk/buildroot/package/netkittelnet/netkittelnet.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/openntpd/openntpd.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk


Changeset:
Modified: trunk/buildroot/package/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -21,7 +21,7 @@
 	touch $@
 
 $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
-	(cd $(ALSA_UTILS_DIR); \
+	(cd $(ALSA_UTILS_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \

Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/dialog/dialog.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -18,7 +18,7 @@
 	touch $@
 
 $(DIALOG_DIR)/.configured: $(DIALOG_DIR)/.source
-	(cd $(DIALOG_DIR); \
+	(cd $(DIALOG_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -35,7 +35,7 @@
 	touch $@
 
 $(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
-	(cd $(DIRECTFB_DIR); \
+	(cd $(DIRECTFB_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 	ac_cv_header_linux_wm97xx_h=no \

Modified: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/fbv/fbv.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -22,7 +22,7 @@
 	touch $@
 
 $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
-	(cd $(FBV_DIR); \
+	(cd $(FBV_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -21,7 +21,7 @@
 
 # freetype for the target
 $(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
-	(cd $(FREETYPE_DIR); \
+	(cd $(FREETYPE_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -33,7 +33,7 @@
 	touch $@
 
 $(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
-	(cd $(IMAGEMAGICK_DIR); \
+	(cd $(IMAGEMAGICK_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/less/less.mk
===================================================================
--- trunk/buildroot/package/less/less.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/less/less.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -18,7 +18,7 @@
 	touch $@
 
 $(LESS_DIR)/.configured: $(LESS_DIR)/.source
-	(cd $(LESS_DIR); \
+	(cd $(LESS_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/libcgi/libcgi.mk
===================================================================
--- trunk/buildroot/package/libcgi/libcgi.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/libcgi/libcgi.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -20,25 +20,25 @@
 	touch $(LIBCGI_DIR)/.source
 
 $(LIBCGI_DIR)/.configured: $(LIBCGI_DIR)/.source
-	(cd $(LIBCGI_DIR); \
+	(cd $(LIBCGI_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-			--target=$(GNU_TARGET_NAME) \
-			--host=$(GNU_TARGET_NAME) \
-			--build=$(GNU_HOST_NAME) \
-			--prefix=/usr \
-			--exec-prefix=/usr \
-			--bindir=/usr/bin \
-			--sbindir=/usr/sbin \
-			--libdir=/lib \
-			--libexecdir=/$(LIBCGI_DESTDIR) \
-			--sysconfdir=/etc \
-			--datadir=/usr/share \
-			--localstatedir=/var \
-			--includedir=/include \
-			--mandir=/usr/man \
-			--infodir=/usr/info \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/$(LIBCGI_DESTDIR) \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/include \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
 	)
 	touch $(LIBCGI_DIR)/.configured
 

Modified: trunk/buildroot/package/libcgicc/libcgicc.mk
===================================================================
--- trunk/buildroot/package/libcgicc/libcgicc.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/libcgicc/libcgicc.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -20,7 +20,7 @@
 	touch $(LIBCGICC_DIR)/.unpacked
 
 $(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
-	(cd $(LIBCGICC_DIR); \
+	(cd $(LIBCGICC_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/libgpg-error/libgpg-error.mk
===================================================================
--- trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -21,7 +21,7 @@
 	touch $(LIBGPG_ERROR_DIR)/.source
 
 $(LIBGPG_ERROR_DIR)/.configured: $(LIBGPG_ERROR_DIR)/.source
-	(cd $(LIBGPG_ERROR_DIR); \
+	(cd $(LIBGPG_ERROR_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/libsndfile/libsndfile.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/libsndfile/libsndfile.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -20,7 +20,7 @@
 	touch $@
 
 $(LIBSNDFILE_DIR)/.configured: $(LIBSNDFILE_DIR)/.unpacked
-	(cd $(LIBSNDFILE_DIR); \
+	(cd $(LIBSNDFILE_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -212,7 +212,7 @@
 
 
 $(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked
-	(cd $(MATCHBOX_LIB_DIR); \
+	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -239,7 +239,7 @@
 	touch $(MATCHBOX_LIB_DIR)/.configured
 
 $(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
-	(cd $(MATCHBOX_SNOTIFY_DIR); \
+	(cd $(MATCHBOX_SNOTIFY_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -262,7 +262,7 @@
 	touch $(MATCHBOX_SNOTIFY_DIR)/.configured
 
 $(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
-	(cd $(MATCHBOX_WM_DIR); \
+	(cd $(MATCHBOX_WM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -289,7 +289,7 @@
 	touch $(MATCHBOX_WM_DIR)/.configured
 
 $(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
-	(cd $(MATCHBOX_SM_DIR); \
+	(cd $(MATCHBOX_SM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -315,7 +315,7 @@
 	touch $(MATCHBOX_SM_DIR)/.configured
 
 $(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
-	(cd $(MATCHBOX_CN_DIR); \
+	(cd $(MATCHBOX_CN_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -340,7 +340,7 @@
 	touch $(MATCHBOX_CN_DIR)/.configured
 
 $(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
-	(cd $(MATCHBOX_PL_DIR); \
+	(cd $(MATCHBOX_PL_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -366,7 +366,7 @@
 	touch $(MATCHBOX_PL_DIR)/.configured
 
 $(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
-	(cd $(MATCHBOX_DP_DIR); \
+	(cd $(MATCHBOX_DP_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -392,7 +392,7 @@
 	touch $(MATCHBOX_DP_DIR)/.configured
 
 $(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
-	(cd $(MATCHBOX_FK_DIR); \
+	(cd $(MATCHBOX_FK_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
@@ -418,7 +418,7 @@
 	touch $(MATCHBOX_FK_DIR)/.configured
 
 $(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
-	(cd $(MATCHBOX_KB_DIR); \
+	(cd $(MATCHBOX_KB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \

Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -24,7 +24,7 @@
 	touch $(MODULE_INIT_TOOLS_DIR)/.unpacked
 
 $(MODULE_INIT_TOOLS_DIR)/.configured: $(MODULE_INIT_TOOLS_DIR)/.unpacked
-	(cd $(MODULE_INIT_TOOLS_DIR); \
+	(cd $(MODULE_INIT_TOOLS_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		INSTALL=$(MODULE_INIT_TOOLS_DIR)/install-sh \

Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/modutils/modutils.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -29,7 +29,7 @@
 	touch $(MODUTILS_DIR1)/.source
 
 $(MODUTILS_DIR1)/.configured: $(MODUTILS_DIR1)/.source
-	(cd $(MODUTILS_DIR1); \
+	(cd $(MODUTILS_DIR1); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		INSTALL=$(MODUTILS_DIR1)/install-sh \

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -24,7 +24,7 @@
 	touch $@
 
 $(NCFTP_DIR)/.configured: $(NCFTP_DIR)/.source
-	(cd $(NCFTP_DIR); \
+	(cd $(NCFTP_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/netkitbase/netkitbase.mk
===================================================================
--- trunk/buildroot/package/netkitbase/netkitbase.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/netkitbase/netkitbase.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -26,8 +26,9 @@
 	touch $(NETKITBASE_DIR)/.unpacked
 
 $(NETKITBASE_DIR)/.configured: $(NETKITBASE_DIR)/.unpacked
-	(cd $(NETKITBASE_DIR); PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
-		./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
+	(cd $(NETKITBASE_DIR); rm -f config.cache; \
+	 PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
+	./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
 	)
 	touch $(NETKITBASE_DIR)/.configured
 

Modified: trunk/buildroot/package/netkittelnet/netkittelnet.mk
===================================================================
--- trunk/buildroot/package/netkittelnet/netkittelnet.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/netkittelnet/netkittelnet.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -27,8 +27,9 @@
 	touch $(NETKITTELNET_DIR)/.unpacked
 
 $(NETKITTELNET_DIR)/.configured: $(NETKITTELNET_DIR)/.unpacked
-	(cd $(NETKITTELNET_DIR); PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
-		./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
+	(cd $(NETKITTELNET_DIR); rm -f config.cache; \
+	 PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
+	./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
 	)
 	touch $(NETKITTELNET_DIR)/.configured
 

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -33,7 +33,8 @@
 # sysctl code in this thing is apparently intended for
 # freebsd or some such thing...
 $(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
-	(cd $(NETSNMP_DIR); autoconf; \
+	(cd $(NETSNMP_DIR); rm -f config.cache; \
+		autoconf && \
 		ac_cv_CAN_USE_SYSCTL=no \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \

Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -20,7 +20,7 @@
 	touch $@
 
 $(OPENNTPD_DIR)/.configured: $(OPENNTPD_DIR)/.source
-	(cd $(OPENNTPD_DIR); \
+	(cd $(OPENNTPD_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/qte/qte.mk
===================================================================
--- trunk/buildroot/package/qte/qte.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/qte/qte.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -135,7 +135,7 @@
 # I'll fix that later.
 $(QTE_QTE_DIR)/.configured: $(QTE_QTE_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY) $(QTE_QTOPIA_DIR)/.unpacked
 	cp $(QTE_QTOPIA_DIR)/src/qt/qconfig-qpe.h $(QTE_QTE_DIR)/src/tools/
-	(cd $(@D); export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/qws/linux-x86-g++; export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
+	(cd $(@D); rm -f config.cache;  export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/qws/linux-x86-g++; export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
@@ -146,7 +146,7 @@
 ifneq ($(BR2_QTE_C_QTE_VERSION),$(BR2_QTE_C_QT3_VERSION))
 # this is a host-side build, so we don't use any staging dir stuff, nor any TARGET_CONFIGURE_OPTS
 $(QTE_QT3_DIR)/.configured: $(QTE_QT3_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked
-	(cd $(@D); export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/qws/linux-x86-g++; export PATH=$$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
+	(cd $(@D); rm -f config.cache;  export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/qws/linux-x86-g++; export PATH=$$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		./configure \
 		-fast $(QTE_QT3_CONFIGURE) \
@@ -155,7 +155,7 @@
 endif
 
 $(QTE_QVFB_DIR)/.configured: $(QTE_QVFB_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked
-	(cd $(@D); export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/linux-g++; export $$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
+	(cd $(@D); rm -f config.cache;  export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/linux-g++; export $$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		$(QTE_QVFB_CONFIGURE) \
@@ -169,7 +169,7 @@
 # then BR2_QTE_C_QTE_VERSION != BR2_QTE_C_QT3_VERSION, then we need to unpack the other Qt/E, so this dependency is not redundant.
 
 $(QTE_QTOPIA_DIR)/.configured: $(QTE_QTOPIA_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY) $(QTE_QT3_DIR)/.configured
-	(cd $(@D); export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; QT3DIR=$(QTE_QTE_DIR); echo 'yes' | \
+	(cd $(@D); rm -f config.cache;  export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; QT3DIR=$(QTE_QTE_DIR); echo 'yes' | \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		$(QTE_QTOPIA_CONFIGURE) --edition phone -no-qtopiadesktop -dqt $(QTE_QT3_DIR) -arch generic -displaysize 160-240 -languages en_US \

Modified: trunk/buildroot/package/tcl/tcl.mk
===================================================================
--- trunk/buildroot/package/tcl/tcl.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/tcl/tcl.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -17,7 +17,7 @@
 	touch $(TCL_DIR)/.source
 
 $(TCL_DIR)/.configured: $(TCL_DIR)/.source
-	(cd $(TCL_DIR)/unix; \
+	(cd $(TCL_DIR)/unix; rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \

Modified: trunk/buildroot/package/tcpdump/dhcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -22,8 +22,7 @@
 	touch $@
 
 $(DHCPDUMP_DIR)/.configured: $(DHCPDUMP_DIR)/.unpacked
-	( \
-		cd $(DHCPDUMP_DIR); \
+	(cd $(DHCPDUMP_DIR); rm -f config.cache; \
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-09-25 12:20:37 UTC (rev 20015)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-09-25 12:34:09 UTC (rev 20016)
@@ -29,8 +29,7 @@
 	touch $@
 
 $(TCPDUMP_DIR)/.configured: $(TCPDUMP_DIR)/.unpacked
-	( \
-		cd $(TCPDUMP_DIR); \
+	(cd $(TCPDUMP_DIR); rm -f config.cache; \
 		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
