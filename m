From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 13:14:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20071030201412.E4B66A5E1E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 13:14:12 -0700 (Tue, 30 Oct 2007)
New Revision: 20335

Log:
Fix saveconfig followed by menuconfig

Modified:
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-10-30 20:05:25 UTC (rev 20334)
+++ trunk/buildroot/project/project.mk	2007-10-30 20:14:12 UTC (rev 20335)
@@ -22,19 +22,19 @@
 		cp $(LINUX26_DIR)/.config \
 			$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config; \
 		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_PACKAGE_LINUX_KCONFIG:=$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config" >> $(PROJECT_FILE); \
+		echo "BR2_PACKAGE_LINUX_KCONFIG=\"$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config\"" >> $(PROJECT_FILE); \
 	fi
 	if [ -f $(BUSYBOX_DIR)/.config ]; then \
 		cp $(BUSYBOX_DIR)/.config \
 			$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config; \
 		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_PACKAGE_BUSYBOX_CONFIG:=$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config" >> $(PROJECT_FILE); \
+		echo "BR2_PACKAGE_BUSYBOX_CONFIG=\"$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config\"" >> $(PROJECT_FILE); \
 	fi
 	if [ -f $(UCLIBC_DIR)/.config ]; then \
 		cp $(UCLIBC_DIR)/.config \
 			$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config; \
 		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_UCLIBC_CONFIG:=$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >> $(PROJECT_FILE); \
+		echo "BR2_UCLIBC_CONFIG=\"$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config\"" >> $(PROJECT_FILE); \
 	fi
 	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ]; then \
 		mkdir -p $(LOCAL)/$(PROJECT)/u-boot; \
