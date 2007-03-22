From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 22 Mar 2007 10:21:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070322172119.15F2148078@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-22 10:21:18 -0700 (Thu, 22 Mar 2007)
New Revision: 18204

Log:
- see if the dir exists before trying to strip an empty list of files..


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-03-22 16:23:43 UTC (rev 18203)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-03-22 17:21:18 UTC (rev 18204)
@@ -412,11 +412,11 @@
 	#
 	# Ok... that's enough of that.
 	#
-	-(cd $(TARGET_DIR)/bin; find -type f | xargs $(STRIP) > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/bin; find -type f | xargs $(STRIP) > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR); $(STRIP) cc1 cc1plus collect2 > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/lib; $(STRIP) libstdc++.so.*.*.* > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/lib; $(STRIP) libgcc_s*.so.*.*.* > /dev/null 2>&1)
+	-(cd $(TARGET_DIR)/bin && find -type f | xargs $(STRIP) > /dev/null 2>&1)
+	-(cd $(TARGET_DIR)/usr/bin && find -type f | xargs $(STRIP) > /dev/null 2>&1)
+	-(cd $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR) && $(STRIP) cc1 cc1plus collect2 > /dev/null 2>&1)
+	-(cd $(TARGET_DIR)/usr/lib && $(STRIP) libstdc++.so.*.*.* > /dev/null 2>&1)
+	-(cd $(TARGET_DIR)/lib && $(STRIP) libgcc_s*.so.*.*.* > /dev/null 2>&1)
 	#
 	rm -f $(TARGET_DIR)/usr/lib/*.la*
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
