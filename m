From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 12:21:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
Message-ID: <20061122202125.8D01C485EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 12:21:24 -0800 (Wed, 22 Nov 2006)
New Revision: 16634

Log:
- fix indentation, second take :(


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 19:58:35 UTC (rev 16633)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 20:21:24 UTC (rev 16634)
@@ -10,24 +10,24 @@
 	ln -s sbin/init $(TARGET_DIR)/init
 
 cpioroot: host-fakeroot makedevs cpioroot-init
-       - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
-       @rm -rf $(TARGET_DIR)/usr/man
-       @rm -rf $(TARGET_DIR)/usr/info
-       -/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
-       # Use fakeroot to pretend all target binaries are owned by root
-       rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-       touch $(STAGING_DIR)/.fakeroot.00000
-       cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       # Use fakeroot to pretend to create all needed device nodes
-       echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       # Use fakeroot so tar believes the previous fakery
-       echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
-               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       $(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-       #- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+	@rm -rf $(TARGET_DIR)/usr/man
+	@rm -rf $(TARGET_DIR)/usr/info
+	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	# Use fakeroot to pretend all target binaries are owned by root
+	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(STAGING_DIR)/.fakeroot.00000
+	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	# Use fakeroot to pretend to create all needed device nodes
+	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	# Use fakeroot so tar believes the previous fakery
+	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	#- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
 
 cpioroot-source:
 
