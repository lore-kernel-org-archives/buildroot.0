From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 07:43:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20070727144339.2FEA2A470E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 07:43:36 -0700 (Fri, 27 Jul 2007)
New Revision: 19279

Log:
- for cross-depmod26 we need to add module-init-tools to the HOST_SOURCE for the 'source' target


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-07-27 14:16:00 UTC (rev 19278)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-07-27 14:43:36 UTC (rev 19279)
@@ -109,6 +109,10 @@
 cross-depmod26-dirclean:
 	rm -rf $(MODULE_INIT_TOOLS_DIR2)
 
+ifeq ($(strip $(CONFIG_BR2_PACKAGE_LINUX)),y)
+HOST_SOURCE+=module-init-tools-source
+endif
+
 #############################################################
 #
 ## Toplevel Makefile options
