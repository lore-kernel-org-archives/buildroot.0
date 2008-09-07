From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 11:58:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20080907185823.1DBE23C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 11:58:22 -0700 (Sun, 07 Sep 2008)
New Revision: 23357

Log:
module-init-tools: check correct symbol for cross-depmod

Reported by Markus Heidelberg

Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2008-09-07 14:31:45 UTC (rev 23356)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2008-09-07 18:58:22 UTC (rev 23357)
@@ -109,7 +109,7 @@
 cross-depmod26-dirclean:
 	rm -rf $(MODULE_INIT_TOOLS_DIR2)
 
-ifeq ($(strip $(CONFIG_BR2_PACKAGE_LINUX)),y)
+ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
 HOST_SOURCE+=module-init-tools-source
 endif
 
