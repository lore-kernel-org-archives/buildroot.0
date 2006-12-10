From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 10 Dec 2006 05:53:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20061210135328.DFE11485BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-10 05:53:28 -0800 (Sun, 10 Dec 2006)
New Revision: 16835

Log:
- Add default udev.conf and fix a mkdir call.
  Thanks to Petr Stetiar.


Added:
   trunk/buildroot/package/udev/udev.conf

Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Added: trunk/buildroot/package/udev/udev.conf
===================================================================
--- trunk/buildroot/package/udev/udev.conf	2006-12-10 13:42:16 UTC (rev 16834)
+++ trunk/buildroot/package/udev/udev.conf	2006-12-10 13:53:28 UTC (rev 16835)
@@ -0,0 +1,7 @@
+# udev.conf
+
+# The initial syslog(3) priority: "err", "info", "debug" or its
+# numerical equivalent. For runtime debugging, the daemons internal
+# state can be changed with: "udevcontrol log_priority=<value>".
+udev_log="err"
+udev_root=/dev

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2006-12-10 13:42:16 UTC (rev 16834)
+++ trunk/buildroot/package/udev/udev.mk	2006-12-10 13:53:28 UTC (rev 16835)
@@ -49,7 +49,7 @@
 
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
 	-mkdir $(TARGET_DIR)/sys
-	-mkdir $(TARGET_DIR)/etc/udev/rules.d
+	-mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	$(INSTALL) -D -m 0644 $(UDEV_DIR)/$(UDEV_CONF) \
 		$(TARGET_DIR)/etc/udev/rules.d
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC)  LD=$(TARGET_CC) \
