From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 06:32:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20061214143233.2B64E48590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 06:32:32 -0800 (Thu, 14 Dec 2006)
New Revision: 16921

Log:
- pass the correct compiler in


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2006-12-14 14:23:50 UTC (rev 16920)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2006-12-14 14:32:32 UTC (rev 16921)
@@ -77,6 +77,7 @@
 
 $(MODULE_INIT_TOOLS_DIR2)/.configured: $(MODULE_INIT_TOOLS_DIR2)/.source
 	(cd $(MODULE_INIT_TOOLS_DIR2); \
+		CC="$(HOSTCC)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_HOST_NAME) \
