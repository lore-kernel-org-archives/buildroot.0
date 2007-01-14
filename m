From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 16:57:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20070114005750.CB72D48594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 16:57:50 -0800 (Sat, 13 Jan 2007)
New Revision: 17270

Log:
I'm sure opinions will vary on this, but at least when I'm using these tools, I don't want the static or an extra config file. Small filesystem please.


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-01-14 00:56:52 UTC (rev 17269)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-01-14 00:57:50 UTC (rev 17270)
@@ -54,6 +54,8 @@
 	STRIPPROG='$(STRIPPROG)' \
 	$(MAKE) prefix=$(TARGET_DIR) -C $(MODULE_INIT_TOOLS_DIR) install-exec
 	rm -Rf $(TARGET_DIR)/usr/man
+	rm -f $(TARGET_DIR)/sbin/generate-modprobe.conf
+	rm -f $(TARGET_DIR)/sbin/insmod.static
 	touch -c $(MODULE_INIT_TOOLS_TARGET_BINARY)
 
 module-init-tools: uclibc $(MODULE_INIT_TOOLS_TARGET_BINARY)
