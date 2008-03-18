From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 04:41:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/mips
Message-ID: <20080318114103.E6E8B12CFB9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 04:41:03 -0700 (Tue, 18 Mar 2008)
New Revision: 21386

Log:
Use BOARD_PATH instead of BR2_BOARD_PATH for mips target

Modified:
   trunk/buildroot/target/device/mips/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/mips/Makefile.in
===================================================================
--- trunk/buildroot/target/device/mips/Makefile.in	2008-03-18 11:38:36 UTC (rev 21385)
+++ trunk/buildroot/target/device/mips/Makefile.in	2008-03-18 11:41:03 UTC (rev 21386)
@@ -1,9 +1,11 @@
 ifneq ($(findstring y,$(BR2_mips)$(BR2_mipsel)),)
 BR2_BOARD_PATH:=target/device/mips
+BOARD_PATH:=target/device/mips
 
+
 ifeq ($(strip $(BR2_PACKAGE_LINUX_KCONFIG)),)
 ifndef LINUX26_KCONFIG
-LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
+LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
 else
 LINUX26_KCONFIG=$(strip $(BR2_PACKAGE_LINUX_KCONFIG))
