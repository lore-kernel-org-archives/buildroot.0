From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 14:51:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	target/device/x86/i386
Message-ID: <20061213225138.037A248567@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 14:51:37 -0800 (Wed, 13 Dec 2006)
New Revision: 16907

Log:
- make sure to agree on the installation CONFIG_PREFIX


Modified:
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/target/device/x86/i386/busybox.config


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-12-13 20:26:27 UTC (rev 16906)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-12-13 22:51:37 UTC (rev 16907)
@@ -71,6 +71,8 @@
 		$(BUSYBOX_DIR)/.config ;
 endif
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
+	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
+		$(BUSYBOX_DIR)/.config ;
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config ;
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \

Modified: trunk/buildroot/target/device/x86/i386/busybox.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/busybox.config	2006-12-13 20:26:27 UTC (rev 16906)
+++ trunk/buildroot/target/device/x86/i386/busybox.config	2006-12-13 22:51:37 UTC (rev 16907)
@@ -57,7 +57,7 @@
 CONFIG_INSTALL_APPLET_SYMLINKS=y
 # CONFIG_INSTALL_APPLET_HARDLINKS is not set
 # CONFIG_INSTALL_APPLET_DONT is not set
-PREFIX="./_install"
+CONFIG_PREFIX="./_install"
 
 #
 # Busybox Library Tuning
