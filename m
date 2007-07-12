From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 08:29:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070712152900.0116BA680B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 08:28:58 -0700 (Thu, 12 Jul 2007)
New Revision: 19073

Log:
Change HOSTNAME to TARGET_HOSTNAME to avoid superseeding build host HOSTNAME

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-12 14:46:03 UTC (rev 19072)
+++ trunk/buildroot/Makefile	2007-07-12 15:28:58 UTC (rev 19073)
@@ -156,9 +156,9 @@
 TARGETS:=uclibc
 endif
 
-PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
-HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
-BANNER:=$(strip $(subst ",, $(BR2_BANNER)))
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 
 
 include toolchain/Makefile.in
@@ -238,7 +238,7 @@
 	echo "$(BANNER)"	>> $(TARGET_DIR)/etc/issue
 
 $(TARGET_DIR)/etc/hostname:	$(TARGET_DIR) .config
-	echo "$(HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
