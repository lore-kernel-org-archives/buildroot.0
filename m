From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 23:53:21 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ttcp
Message-ID: <20090114235321.3ED3D7697C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 23:53:20 +0000 (Wed, 14 Jan 2009)
New Revision: 24850

Log:
Change TTCP_BUILD_DIR to TTCP_DIR

Modified:
   trunk/buildroot/package/ttcp/ttcp.mk


Changeset:
Modified: trunk/buildroot/package/ttcp/ttcp.mk
===================================================================
--- trunk/buildroot/package/ttcp/ttcp.mk	2009-01-14 23:51:32 UTC (rev 24849)
+++ trunk/buildroot/package/ttcp/ttcp.mk	2009-01-14 23:53:20 UTC (rev 24850)
@@ -7,35 +7,35 @@
 TTCP_VERSION:=
 TTCP_SOURCE_URL=http://ftp.sunet.se/pub/network/monitoring/ttcp
 TTCP_SOURCE=ttcp$(TTCP_VERSION).c
-TTCP_BUILD_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
+TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
 
 $(DL_DIR)/$(TTCP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(TTCP_SOURCE_URL)/$(TTCP_SOURCE)
 
-$(TTCP_BUILD_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
-	-mkdir $(TTCP_BUILD_DIR)
-	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_BUILD_DIR)
+$(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
+	-mkdir $(TTCP_DIR)
+	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
 	toolchain/patch-kernel.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
-	touch $(TTCP_BUILD_DIR)/.unpacked
+	touch $(TTCP_DIR)/.unpacked
 
-$(TTCP_BUILD_DIR)/.configured: $(TTCP_BUILD_DIR)/.unpacked
-	touch $(TTCP_BUILD_DIR)/.configured
+$(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
+	touch $(TTCP_DIR)/.configured
 
-$(TTCP_BUILD_DIR)/ttcp: $(TTCP_BUILD_DIR)/.configured
-	$(TARGET_CC) -O2 -o $(TTCP_BUILD_DIR)/ttcp $(TTCP_BUILD_DIR)/$(TTCP_SOURCE)
+$(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
+	$(TARGET_CC) -O2 -o $(TTCP_DIR)/ttcp $(TTCP_DIR)/$(TTCP_SOURCE)
 
-$(TARGET_DIR)/usr/bin/ttcp: $(TTCP_BUILD_DIR)/ttcp
-	cp -af $(TTCP_BUILD_DIR)/ttcp $(TARGET_DIR)/usr/bin/
+$(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
+	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
 
 ttcp: $(TARGET_DIR)/usr/bin/ttcp
 
 ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
 
 ttcp-clean:
-	rm -f $(TTCP_BUILD_DIR)/*.o $(TTCP_BUILD_DIR)/ttcp
+	rm -f $(TTCP_DIR)/*.o $(TTCP_DIR)/ttcp
 
 ttcp-dirclean:
-	rm -rf $(TTCP_BUILD_DIR)
+	rm -rf $(TTCP_DIR)
 
 #############################################################
 #
