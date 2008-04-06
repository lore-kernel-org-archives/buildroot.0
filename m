From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  6 Apr 2008 01:08:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/ARM
Message-ID: <20080406080807.D52B23C3A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-06 01:08:07 -0700 (Sun, 06 Apr 2008)
New Revision: 21647

Log:
target/device/ARM: Don't override Config settings

Don't override board name/path with hardcoded values in Makefile.


Modified:
   trunk/buildroot/target/device/ARM/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/ARM/Makefile.in
===================================================================
--- trunk/buildroot/target/device/ARM/Makefile.in	2008-04-06 07:17:02 UTC (rev 21646)
+++ trunk/buildroot/target/device/ARM/Makefile.in	2008-04-06 08:08:07 UTC (rev 21647)
@@ -1,8 +1,7 @@
 ifeq ($(BR2_TARGET_ARM),y)
 
-BOARD_NAME=arm
-BR2_BOARD_PATH:=target/device/ARM
-BOARD_PATH:=target/device/ARM
+BOARD_NAME:=$(strip  $(subst ",, $(BR2_BOARD_NAME)))
+BOARD_PATH:=$(strip  $(subst ",, $(BR2_BOARD_PATH)))
 
 # These are set by Config.in
 DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
