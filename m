From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 09:50:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20090130095003.69EC8765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 09:50:02 +0000 (Fri, 30 Jan 2009)
New Revision: 25158

Log:
readline: remove redundant BR2_PACKAGE_READLINE_HEADERS configuration

Header files on target is globally controlled by BR2_HAVE_DEVFILES.

Modified:
   trunk/buildroot/package/readline/Config.in
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/Config.in
===================================================================
--- trunk/buildroot/package/readline/Config.in	2009-01-30 08:53:08 UTC (rev 25157)
+++ trunk/buildroot/package/readline/Config.in	2009-01-30 09:50:02 UTC (rev 25158)
@@ -9,10 +9,3 @@
 	depends on BR2_READLINE
 	help
 	  Say yes here to install the readline libraries on the target.
-
-config BR2_PACKAGE_READLINE_HEADERS
-	bool "readline headers for the target"
-	depends on BR2_PACKAGE_READLINE_TARGET
-	help
-	  Say yes here to install the readline headers and documentation
-	  on the target.

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2009-01-30 08:53:08 UTC (rev 25157)
+++ trunk/buildroot/package/readline/readline.mk	2009-01-30 09:50:02 UTC (rev 25158)
@@ -75,9 +75,6 @@
 		-C $(READLINE_DIR) install-shared uninstall-doc
 	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
-ifneq ($(BR2_PACKAGE_READLINE_HEADERS),y)
-	rm -rf $(TARGET_DIR)/usr/include/readline
-endif
 
 readline: ncurses $(STAGING_DIR)/usr/include/readline/readline.h
 
