From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:43:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20080511064351.E765BF8005@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:43:50 -0700 (Sat, 10 May 2008)
New Revision: 21965

Log:
Bump lm-sensors version

Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-05-11 06:43:22 UTC (rev 21964)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-05-11 06:43:50 UTC (rev 21965)
@@ -3,9 +3,9 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION:=2.10.5
+LM_SENSORS_VERSION:=2.10.6
 LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
-LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-5.diff.gz
+LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-2.diff.gz
 LM_SENSORS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lm-sensors/
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
 LM_SENSORS_CAT:=$(ZCAT)
@@ -21,8 +21,6 @@
 	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_PATCH)
 endif
 
-lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(LM_SENSORS_PATCH_FILE)
-
 $(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(DL_DIR)/$(LM_SENSORS_PATCH)
 	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/ lm-sensors\*.patch
@@ -55,6 +53,10 @@
 	-$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libsensors.so*
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
+lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(LM_SENSORS_PATCH_FILE)
+
+lm-sensors-unpacked: $(LM_SENSORS_DIR)/.unpacked
+
 lm-sensors: uclibc libsysfs $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
 
 lm-sensors-clean:
