From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 03:54:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070901105451.44E93A60CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 03:54:50 -0700 (Sat, 01 Sep 2007)
New Revision: 19743

Log:
- fix glitch introduced in my whitespace removal (brm)


Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-31 21:45:52 UTC (rev 19742)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-09-01 10:54:50 UTC (rev 19743)
@@ -112,10 +112,10 @@
 	echo "/* Automatically generated file, do not edit */" \
 	> $(UBOOT_CUSTOM).test
 ifneq ($(TARGET_HOSTNAME),)
-	echo "#if defined(CONFIG_HOSTNAME)">> $(UBOOT_CUSTOM).test
-	echo "#undef CONFIG_HOSTNAME">> $(UBOOT_CUSTOM).test
+	echo "#if defined(CONFIG_HOSTNAME)" >> $(UBOOT_CUSTOM).test
+	echo "#undef CONFIG_HOSTNAME" >> $(UBOOT_CUSTOM).test
 	echo "#define CONFIG_HOSTNAME $(TARGET_HOSTNAME)">> $(UBOOT_CUSTOM).test
-	echo "#endif">> $(UBOOT_CUSTOM).test
+	echo "#endif" >> $(UBOOT_CUSTOM).test
 endif
 ifneq ($(TARGET_UBOOT_IPADDR),)
 	echo "#define CONFIG_IPADDR $(TARGET_UBOOT_IPADDR)">> $(UBOOT_CUSTOM).test
@@ -136,34 +136,34 @@
 
 $(UBOOT_SCR): .config
 ifneq ($(TARGET_UBOOT_IPADDR),)
-	echo setenv ipaddr $(TARGET_UBOOT_IPADDR)> $(UBOOT_SCR)
+	echo setenv ipaddr $(TARGET_UBOOT_IPADDR) > $(UBOOT_SCR)
 endif
 ifneq ($(TARGET_UBOOT_SERVERIP),)
-	echo setenv serverip $(TARGET_UBOOT_SERVERIP)>> $(UBOOT_SCR)
+	echo setenv serverip $(TARGET_UBOOT_SERVERIP) >> $(UBOOT_SCR)
 endif
 ifneq ($(TARGET_UBOOT_GATEWAY),)
-	echo setenv gatewayip $(TARGET_UBOOT_GATEWAY)>> $(UBOOT_SCR)
+	echo setenv gatewayip $(TARGET_UBOOT_GATEWAY) >> $(UBOOT_SCR)
 endif
 ifneq ($(TARGET_UBOOT_NETMASK),)
-	echo setenv netmask $(TARGET_UBOOT_NETMASK)>> $(UBOOT_SCR)
+	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(UBOOT_SCR)
 endif
-	echo setenv linux $(LINUX26_KERNEL)>> $(UBOOT_SCR)
-	echo setenv kernel-version $(LINUX26_VERSION)>> $(UBOOT_SCR)
-	echo setenv kernel-date $(DATE)>> $(UBOOT_SCR)
+	echo setenv linux $(LINUX26_KERNEL) >> $(UBOOT_SCR)
+	echo setenv kernel-version $(LINUX26_VERSION) >> $(UBOOT_SCR)
+	echo setenv kernel-date $(DATE) >> $(UBOOT_SCR)
 	echo setenv hostname $(TARGET_HOSTNAME) >> $(UBOOT_SCR)
-	echo setenv fs-date $(DATE)>> $(UBOOT_SCR)
-	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
-	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2>> $(UBOOT_SCR)
-	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
-	echo setenv ver 1>> $(UBOOT_SCR)
+	echo setenv fs-date $(DATE) >> $(UBOOT_SCR)
+	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(UBOOT_SCR)
+	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2 >> $(UBOOT_SCR)
+	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(UBOOT_SCR)
+	echo setenv ver 1 >> $(UBOOT_SCR)
 ifneq ($(TARGET_UBOOT_ETHADDR),)
-	echo setenv ethaddr $(TARGET_UBOOT_ETHADDR)>> $(UBOOT_SCR)
+	echo setenv ethaddr $(TARGET_UBOOT_ETHADDR) >> $(UBOOT_SCR)
 endif
-	echo setenv fstype ram>> $(UBOOT_SCR)
+	echo setenv fstype ram >> $(UBOOT_SCR)
 	echo fs >> $(UBOOT_SCR)
 	echo os >> $(UBOOT_SCR)
-	echo setargs>> $(UBOOT_SCR)
-	echo saveenv>> $(UBOOT_SCR)
+	echo setargs >> $(UBOOT_SCR)
+	echo saveenv >> $(UBOOT_SCR)
 
 $(UBOOT_SCR).$(PROJECT): $(UBOOT_SCR) $(MKIMAGE)
 	$(MKIMAGE) -A arm \
