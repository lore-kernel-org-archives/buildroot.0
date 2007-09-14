From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 14 Sep 2007 04:25:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20070914112530.764B1A6ABD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-14 04:25:29 -0700 (Fri, 14 Sep 2007)
New Revision: 19830

Log:
- also copy the needed libs


Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-13 20:20:44 UTC (rev 19829)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-14 11:25:29 UTC (rev 19830)
@@ -39,6 +39,9 @@
 
 $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
 	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
+	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so* \
+		$(LM_SENSORS_DIR)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
+	-$(STRIP) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libsensors.so*
 	$(STRIP) $(STRIP_STRIP_ALL) $@
 
 lm-sensors: uclibc libsysfs $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
