From: correa at uclibc.org <correa@uclibc.org>
Date: Mon, 16 Mar 2009 11:38:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [25672] trunk/buildroot/target/linux
Message-ID: <20090316113834.272EA7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-16 11:38:33 +0000 (Mon, 16 Mar 2009)
New Revision: 25672

Log:
Fix dependency for custom patches when custom patch is empty.

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-16 06:52:00 UTC (rev 25671)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-16 11:38:33 UTC (rev 25672)
@@ -71,7 +71,9 @@
 LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
 #"))
 
+ifneq ($(LINUX26_BSP_PATCH),)
 LINUX_HEADERS_DEPENDS:=  $(DL_DIR)/$(LINUX26_BSP_PATCH)
+endif
 
 ifneq ($(LINUX26_PATCH_SOURCE),)
 LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX26_PATCH_SOURCE)
