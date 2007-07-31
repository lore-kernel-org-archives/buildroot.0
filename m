From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 11:31:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20070731183158.CC4C9A60A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 11:31:58 -0700 (Tue, 31 Jul 2007)
New Revision: 19364

Log:
Use TARGET_CONFIGURE_OPTS in tinyX

Modified:
   trunk/buildroot/package/tinyx/tinyx.mk


Changeset:
Modified: trunk/buildroot/package/tinyx/tinyx.mk
===================================================================
--- trunk/buildroot/package/tinyx/tinyx.mk	2007-07-31 18:25:29 UTC (rev 19363)
+++ trunk/buildroot/package/tinyx/tinyx.mk	2007-07-31 18:31:58 UTC (rev 19364)
@@ -97,7 +97,7 @@
 	#echo "RANLIB=$(TARGET_CROSS)ranlib" >> $(TINYX_DIR)/Makefile
 	#echo "OBJCOPY=$(TARGET_CROSS)objcopy" >> $(TINYX_DIR)/Makefile
 	#cat $(TINYX_DIR)/Makefile.xxxx >> $(TINYX_DIR)/Makefile
-	( cd $(TINYX_DIR) ; $(MAKE) World )
+	( cd $(TINYX_DIR) ; $(MAKE) $(TARGET_CONFIGURE_OPTS) World )
 
 #
 # Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
