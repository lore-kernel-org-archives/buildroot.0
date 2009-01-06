From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 23:38:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20090106233834.9813E76CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 23:38:33 +0000 (Tue, 06 Jan 2009)
New Revision: 24715

Log:
Fix BOARD_PATH for local projects

Modified:
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2009-01-06 23:02:50 UTC (rev 24714)
+++ trunk/buildroot/project/project.mk	2009-01-06 23:38:33 UTC (rev 24715)
@@ -27,6 +27,8 @@
 			$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config; \
 		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE); \
 		echo "BR2_PACKAGE_LINUX_KCONFIG=\"$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config\"" >> $(PROJECT_FILE); \
+		$(SED) '/BR2_BOARD_PATH/d' $(PROJECT_FILE); \
+		echo "BR2_BOARD_PATH=\"$(LOCAL)/$(PROJECT)\"" >> $(PROJECT_FILE); \
 	fi
 	if [ -f $(BUSYBOX_DIR)/.config ]; then \
 		cp $(BUSYBOX_DIR)/.config \
