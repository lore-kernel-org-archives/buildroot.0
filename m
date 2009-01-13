From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 13 Jan 2009 08:02:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20090113080254.4F42B76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-13 08:02:52 +0000 (Tue, 13 Jan 2009)
New Revision: 24811

Log:
samba: use proper BR variable to disable largefile while configuring


Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2009-01-13 07:29:35 UTC (rev 24810)
+++ trunk/buildroot/package/samba/samba.mk	2009-01-13 08:02:52 UTC (rev 24811)
@@ -11,10 +11,6 @@
 SAMBA_BINARY:=bin/smbd
 SAMBA_TARGET_BINARY:=usr/sbin/smbd
 
-ifneq ($(BR2_LARGEFILE),y)
-SAMBA_DISABLE_LARGEFILE:=--disable-largefile
-endif
-
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
 
@@ -59,7 +55,7 @@
 		--disable-shared-libs \
 		--disable-static \
 		--disable-cups \
-		$(SAMBA_DISABLE_LARGEFILE) \
+		$(DISABLE_LARGEFILE) \
 	)
 	touch $@
 
