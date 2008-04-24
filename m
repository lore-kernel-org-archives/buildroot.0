From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 09:52:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ng-spice-rework
Message-ID: <20080424165217.4167C3C7E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 09:52:16 -0700 (Thu, 24 Apr 2008)
New Revision: 21846

Log:
make ng-spice use the proper header directory

Modified:
   trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk


Changeset:
Modified: trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
===================================================================
--- trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-04-24 16:48:20 UTC (rev 21845)
+++ trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-04-24 16:52:16 UTC (rev 21846)
@@ -11,6 +11,8 @@
 NG_SPICE_REWORK_INSTALL_TARGET = YES
 NG_SPICE_REWORK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
+NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
+
 NG-SPICE-REWORK_DEPENDENCIES = uclibc 
 
 $(eval $(call AUTOTARGETS,package,ng-spice-rework))
