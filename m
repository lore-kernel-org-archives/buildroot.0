From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 15:41:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20070731224107.40167A4693@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 15:41:06 -0700 (Tue, 31 Jul 2007)
New Revision: 19370

Log:
Update config for module-init-tools

Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-07-31 22:40:13 UTC (rev 19369)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-07-31 22:41:06 UTC (rev 19370)
@@ -20,6 +20,7 @@
 $(MODULE_INIT_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
 	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR) package/module-init-tools \*.patch
+	$(CONFIG_UPDATE) $(MODULE_INIT_TOOLS_DIR)
 	touch $(MODULE_INIT_TOOLS_DIR)/.unpacked
 
 $(MODULE_INIT_TOOLS_DIR)/.configured: $(MODULE_INIT_TOOLS_DIR)/.unpacked
@@ -76,6 +77,7 @@
 $(MODULE_INIT_TOOLS_DIR2)/.source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
 	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(TOOL_BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR2) package/module-init-tools \*.patch
+	$(CONFIG_UPDATE) $(MODULE_INIT_TOOLS_DIR2)
 	touch $(MODULE_INIT_TOOLS_DIR2)/.source
 
 $(MODULE_INIT_TOOLS_DIR2)/.configured: $(MODULE_INIT_TOOLS_DIR2)/.source
