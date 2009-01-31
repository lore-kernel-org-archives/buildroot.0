From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 20:38:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090131203857.2C7837621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 20:38:55 +0000 (Sat, 31 Jan 2009)
New Revision: 25186

Log:
make update shoudl save to PROJECT_defconfig

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-31 20:08:21 UTC (rev 25185)
+++ trunk/buildroot/Makefile	2009-01-31 20:38:55 UTC (rev 25186)
@@ -484,7 +484,7 @@
 	-@$(MAKE) oldconfig
 
 update:
-	cp .config $(BOARD_PATH)/$(BOARD_NAME)_defconfig
+	cp .config $(BOARD_PATH)/$(PROJECT)_defconfig
 
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
