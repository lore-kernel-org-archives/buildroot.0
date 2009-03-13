From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 13 Mar 2009 04:31:43 +0000 (UTC)
Subject: [Buildroot] svn commit: [25641] trunk/buildroot/target/linux
Message-ID: <20090313043143.8D1F07643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-13 04:31:43 +0000 (Fri, 13 Mar 2009)
New Revision: 25641

Log:
Fix build (dependency) with custom patch option

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-12 23:04:19 UTC (rev 25640)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-13 04:31:43 UTC (rev 25641)
@@ -71,7 +71,7 @@
 LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
 #"))
 
-LINUX_HEADERS_DEPENDS:=  $(LINUX26_BSP_PATCH)
+LINUX_HEADERS_DEPENDS:=  $(DL_DIR)/$(LINUX26_BSP_PATCH)
 
 ifneq ($(LINUX26_PATCH_SOURCE),)
 LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX26_PATCH_SOURCE)
