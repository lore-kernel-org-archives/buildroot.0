From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 25 Apr 2008 06:43:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dummy oprofile
	qtopia4 webif
Message-ID: <20080425134300.D5F1A3C76B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-25 06:43:00 -0700 (Fri, 25 Apr 2008)
New Revision: 21859

Log:
package: s/$(STRIP)/$(STRIPCMD)/


Modified:
   trunk/buildroot/package/dummy/dummy.mk
   trunk/buildroot/package/oprofile/oprofile.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/package/webif/webif.mk


Changeset:
Modified: trunk/buildroot/package/dummy/dummy.mk
===================================================================
--- trunk/buildroot/package/dummy/dummy.mk	2008-04-25 12:04:04 UTC (rev 21858)
+++ trunk/buildroot/package/dummy/dummy.mk	2008-04-25 13:43:00 UTC (rev 21859)
@@ -60,7 +60,7 @@
 # target root directory, to not waste valuable flash space.
 $(TARGET_DIR)/$(DUMMY_TARGET_BINARY): $(DUMMY_DIR)/$(DUMMY_BINARY)
 	cp -dpf $(DUMMY_DIR)/dummy $@
-	$(STRIP) --strip-unneeded $@
+	$(STRIPCMD) --strip-unneeded $@
 
 # Main rule which shows which other packages must be installed before the dummy
 # package is installed. This to ensure that all depending libraries are

Modified: trunk/buildroot/package/oprofile/oprofile.mk
===================================================================
--- trunk/buildroot/package/oprofile/oprofile.mk	2008-04-25 12:04:04 UTC (rev 21858)
+++ trunk/buildroot/package/oprofile/oprofile.mk	2008-04-25 13:43:00 UTC (rev 21859)
@@ -50,7 +50,7 @@
 	$(INSTALL) -m 644 $(OPROFILE_DIR)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
 	$(INSTALL) -m 755 $(OPROFILE_DIR)/utils/opcontrol $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 755 $(addprefix $(OPROFILE_DIR)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
-	$(STRIP) --strip-unneeded $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
+	$(STRIPCMD) --strip-unneeded $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
 	touch -c $@
 
 oprofile: uclibc popt binutils_target $(TARGET_DIR)/usr/bin/oprofiled

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-25 12:04:04 UTC (rev 21858)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-25 13:43:00 UTC (rev 21859)
@@ -260,13 +260,13 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
 endif
 	# Install image plugins if they are built
 	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
 		mkdir -p $(TARGET_DIR)/usr/plugins; \
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
-		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
+		$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
 ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
 	# Remove Sql libraries, not needed

Modified: trunk/buildroot/package/webif/webif.mk
===================================================================
--- trunk/buildroot/package/webif/webif.mk	2008-04-25 12:04:04 UTC (rev 21858)
+++ trunk/buildroot/package/webif/webif.mk	2008-04-25 13:43:00 UTC (rev 21859)
@@ -15,7 +15,7 @@
 $(WEBIF_DIR)/.built: $(WEBIF_DIR)/.unpacked
 	$(TARGET_CC) $(TARGET_CFLAGS) -o $(WEBIF_DIR)/webif-page $(WEBIF_SOURCE)/src/webif-page.c
 	$(TARGET_CC) $(TARGET_CFLAGS) -o $(WEBIF_DIR)/bstrip $(WEBIF_SOURCE)/src/bstrip.c
-	$(STRIP) --strip-unneeded $(WEBIF_DIR)/webif-page $(WEBIF_DIR)/bstrip
+	$(STRIPCMD) --strip-unneeded $(WEBIF_DIR)/webif-page $(WEBIF_DIR)/bstrip
 	touch $@
 
 $(TARGET_DIR)/www/webif.css: $(WEBIF_DIR)/.built
