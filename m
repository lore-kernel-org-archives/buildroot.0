From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 30 Jul 2007 11:17:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: bsdiff madplay
	mpg123 qte xerces zlib
Message-ID: <20070730181714.C5575A4669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-30 11:17:13 -0700 (Mon, 30 Jul 2007)
New Revision: 19348

Log:
Use TARGET_CONFIGURE_ARGS in some packages lacking

Modified:
   trunk/buildroot/package/bsdiff/bsdiff.mk
   trunk/buildroot/package/madplay/madplay.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/bsdiff/bsdiff.mk
===================================================================
--- trunk/buildroot/package/bsdiff/bsdiff.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/bsdiff/bsdiff.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -20,6 +20,7 @@
 
 $(BSDIFF_DIR)/$(BSDIFF_BINARY): $(BSDIFF_DIR)/.source
 	(cd $(BSDIFF_DIR) ; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
 			$(TARGET_CFLAGS) bsdiff.c -o bsdiff ; \

Modified: trunk/buildroot/package/madplay/madplay.mk
===================================================================
--- trunk/buildroot/package/madplay/madplay.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/madplay/madplay.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -29,6 +29,7 @@
 
 $(MADPLAY_DIR)/.configured: $(MADPLAY_DIR)/.unpacked
 	(cd $(MADPLAY_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(BR2_MADPLAY_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \

Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -29,6 +29,7 @@
 
 $(MPG123_DIR)/.configured: $(MPG123_DIR)/.unpacked
 	(cd $(MPG123_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \

Modified: trunk/buildroot/package/qte/qte.mk
===================================================================
--- trunk/buildroot/package/qte/qte.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/qte/qte.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -136,8 +136,8 @@
 $(QTE_QTE_DIR)/.configured: $(QTE_QTE_DIR)/.unpacked $(QTE_TMAKE_DIR)/.unpacked $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY) $(QTE_QTOPIA_DIR)/.unpacked
 	cp $(QTE_QTOPIA_DIR)/src/qt/qconfig-qpe.h $(QTE_QTE_DIR)/src/tools/
 	(cd $(@D); export QTDIR=`pwd`; export TMAKEPATH=$(QTE_TMAKE_DIR)/lib/qws/linux-x86-g++; export PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; export LD_LIBRARY_PATH=$$QTDIR/lib:$$LD_LIBRARY_PATH; echo 'yes' | \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		$(QTE_QTE_CONFIGURE) -qconfig qpe -keypad-mode -qvfb -depths 4,8,16,32 -xplatform $(BR2_QTE_CROSS_PLATFORM) \
 	);

Modified: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/xerces/xerces.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -22,6 +22,7 @@
 
 $(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
 	(cd $(XERCES_DIR)/src/xercesc; rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		XERCESCROOT=$(XERCES_DIR) \
 		./runConfigure -plinux -minmem \

Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-07-30 17:02:06 UTC (rev 19347)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-07-30 18:17:13 UTC (rev 19348)
@@ -24,6 +24,7 @@
 
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
 	(cd $(ZLIB_DIR); rm -rf config.cache ; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(ZLIB_CFLAGS)" \
 		./configure \
