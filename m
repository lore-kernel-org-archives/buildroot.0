From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 02:51:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/java/concierge
Message-ID: <20080331095159.DA6453C4FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 02:51:59 -0700 (Mon, 31 Mar 2008)
New Revision: 21593

Log:
concierge: cleanup (white space + unneeded mkdir)


Modified:
   trunk/buildroot/package/java/concierge/concierge.mk


Changeset:
Modified: trunk/buildroot/package/java/concierge/concierge.mk
===================================================================
--- trunk/buildroot/package/java/concierge/concierge.mk	2008-03-31 09:06:26 UTC (rev 21592)
+++ trunk/buildroot/package/java/concierge/concierge.mk	2008-03-31 09:51:59 UTC (rev 21593)
@@ -10,20 +10,19 @@
 CONCIERGE_SITE_BUNDLES = http://concierge.sourceforge.net/bundles/
 
 $(DL_DIR)/concierge:
-	 mkdir -p $(DL_DIR)/concierge/
-	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
-	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
-	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
-	 $(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
+	mkdir -p $(DL_DIR)/concierge/
+	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE)/concierge-$(CONCIERGE_VERSION).jar
+	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)shell-1.0.0.RC2.jar
+	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)service-tracker-1.0.0.RC2.jar
+	$(WGET) -P $(DL_DIR)/concierge/ $(CONCIERGE_SITE_BUNDLES)event-admin-1.0.0.RC2.jar
 
 $(TARGET_DIR)/usr/lib/concierge/: $(DL_DIR)/concierge
-	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/lib/concierge
 	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
 	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/concierge: 
+$(TARGET_DIR)/usr/bin/concierge:
 	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
 	chmod +x $(TARGET_DIR)/usr/bin/concierge
 	touch -c $@
