From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 09:20:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070904162031.49A62A688D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 09:20:28 -0700 (Tue, 04 Sep 2007)
New Revision: 19778

Log:
Update u-boot autoscript

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-09-04 07:35:19 UTC (rev 19777)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-09-04 16:20:28 UTC (rev 19778)
@@ -147,7 +147,7 @@
 ifneq ($(TARGET_UBOOT_NETMASK),)
 	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(UBOOT_SCR)
 endif
-	echo setenv linux $(LINUX26_KERNEL) >> $(UBOOT_SCR)
+	echo setenv linux $(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz >> $(UBOOT_SCR)
 	echo setenv kernel-version $(LINUX26_VERSION) >> $(UBOOT_SCR)
 	echo setenv kernel-date $(DATE) >> $(UBOOT_SCR)
 	echo setenv hostname $(TARGET_HOSTNAME) >> $(UBOOT_SCR)
