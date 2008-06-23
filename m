From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 04:53:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20080623115336.002A03C2B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-23 04:53:35 -0700 (Mon, 23 Jun 2008)
New Revision: 22475

Log:
lm-sensors: clean libsensors* from usr/lib, not lib


Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-06-23 01:52:30 UTC (rev 22474)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-06-23 11:53:35 UTC (rev 22475)
@@ -62,7 +62,7 @@
 lm-sensors-clean:
 	-$(MAKE) -C $(LM_SENSORS_DIR) clean
 	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY) \
-		$(TARGET_DIR)/lib/libsensors* \
+		$(TARGET_DIR)/usr/lib/libsensors* \
 		$(TARGET_DIR)/etc/sensors.conf
 
 lm-sensors-dirclean:
