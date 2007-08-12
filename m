From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:33:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hal
Message-ID: <20070812233345.ABB39A684A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:33:44 -0700 (Sun, 12 Aug 2007)
New Revision: 19476

Log:
Avoid killing /usr/include when cleaning 'hal'

Modified:
   trunk/buildroot/package/hal/hal.mk


Changeset:
Modified: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	2007-08-12 23:31:36 UTC (rev 19475)
+++ trunk/buildroot/package/hal/hal.mk	2007-08-12 23:33:44 UTC (rev 19476)
@@ -70,7 +70,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
 	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
 	# remove _everything_ in $(TARGET_DIR)/usr/include?
-	rm -rf $(TARGET_DIR)/usr/include
+	# rm -rf $(TARGET_DIR)/usr/include
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.la
 	rm -rf $(TARGET_DIR)/usr/lib/hal
