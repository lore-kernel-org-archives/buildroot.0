From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 03:16:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20070923101659.817A73007A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 03:16:58 -0700 (Sun, 23 Sep 2007)
New Revision: 19962

Log:
Ensure project U-Boot dir exists before using it

Modified:
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-09-23 10:03:27 UTC (rev 19961)
+++ trunk/buildroot/project/project.mk	2007-09-23 10:16:58 UTC (rev 19962)
@@ -37,6 +37,7 @@
 		echo "BR2_UCLIBC_CONFIG:=$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >> $(PROJECT_FILE); \
 	fi
 	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ]; then \
+		mkdir -p $(LOCAL)/$(PROJECT)/u-boot; \
 		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h \
 			$(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h; \
 	fi
