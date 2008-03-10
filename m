From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon, 10 Mar 2008 09:34:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080310163419.CA43B12015C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-10 09:34:19 -0700 (Mon, 10 Mar 2008)
New Revision: 21284

Log:
renamed variable, removed uppercase config text

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-10 16:17:26 UTC (rev 21283)
+++ trunk/buildroot/Config.in	2008-03-10 16:34:19 UTC (rev 21284)
@@ -239,8 +239,8 @@
 	  If you say n here, your target will not contain any
 	  infopage.
 
-config BR2_TARGET_DEV_FILES
-	bool "Development files in target filesystem"
+config BR2_HAVE_DEVFILES
+	bool "development files in target filesystem"
 	default n
 	help
 	  Install headers and static libraries in the

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-10 16:17:26 UTC (rev 21283)
+++ trunk/buildroot/Makefile	2008-03-10 16:34:19 UTC (rev 21284)
@@ -318,7 +318,7 @@
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
 target-devfiles:
-ifeq ($(strip $(BR2_TARGET_DEV_FILES)),y)
+ifeq ($(strip $(BR2_HAVE_DEVFILES)),y)
 	cp -a $(STAGING_DIR)/usr/include $(TARGET_DIR)/usr
 	cp $(STAGING_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib
 	cp $(STAGING_DIR)/lib/*.a $(TARGET_DIR)/lib
