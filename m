From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:03:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/flex
Message-ID: <20071129130357.793B730048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:03:56 -0800 (Thu, 29 Nov 2007)
New Revision: 20586

Log:
Use /usr/lib instead of /lib for flex

Modified:
   trunk/buildroot/package/flex/Config.in
   trunk/buildroot/package/flex/flex.mk


Changeset:
Modified: trunk/buildroot/package/flex/Config.in
===================================================================
--- trunk/buildroot/package/flex/Config.in	2007-11-29 13:02:58 UTC (rev 20585)
+++ trunk/buildroot/package/flex/Config.in	2007-11-29 13:03:56 UTC (rev 20586)
@@ -8,9 +8,9 @@
 	  http://www.gnu.org/software/flex/
 
 config BR2_PACKAGE_FLEX_LIBFL
-	bool "Install libfl.a under staging_dir/lib"
+	bool "Install libfl.a under staging_dir/usr/lib"
 	default y
 	depends on BR2_PACKAGE_FLEX
 	help
-	  Install libfl.a under staging_dir/lib for further development
+	  Install libfl.a under staging_dir/usr/lib for further development
 	  on a host machine.

Modified: trunk/buildroot/package/flex/flex.mk
===================================================================
--- trunk/buildroot/package/flex/flex.mk	2007-11-29 13:02:58 UTC (rev 20585)
+++ trunk/buildroot/package/flex/flex.mk	2007-11-29 13:03:56 UTC (rev 20586)
@@ -77,7 +77,7 @@
 	    includedir=$(TARGET_DIR)/usr/include \
 	    -C $(FLEX_DIR) install
 ifeq ($(strip $(BR2_PACKAGE_FLEX_LIBFL)),y)
-	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/lib/libfl.a
+	install -D $(FLEX_DIR)/libfl.a $(STAGING_DIR)/usr/lib/libfl.a
 endif
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/info
