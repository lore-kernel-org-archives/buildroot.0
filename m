From: correa at uclibc.org <correa@uclibc.org>
Date: Mon,  6 Apr 2009 22:56:20 +0000 (UTC)
Subject: [Buildroot] svn commit: [26000] trunk/buildroot/package/qtopia4
Message-ID: <20090406225621.5A8DB771E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-06 22:56:20 +0000 (Mon, 06 Apr 2009)
New Revision: 26000

Log:
Fix compile for Qt Embedded (qtopia4) based packages

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-06 21:44:52 UTC (rev 25999)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-06 22:56:20 UTC (rev 26000)
@@ -324,6 +324,8 @@
 
 QTOPIA4_QMAKE_CONF:=$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 
+QTOPIA4_QMAKE_AR:=$(TARGET_AR) cqs
+
 # Variable for other Qt applications to use
 QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
 
@@ -366,7 +368,7 @@
 	$(call QTOPIA4_QMAKE_SET,CXX,$(TARGET_CXX))
 	$(call QTOPIA4_QMAKE_SET,LINK,$(TARGET_CXX))
 	$(call QTOPIA4_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
-	$(call QTOPIA4_QMAKE_SET,AR,$(TARGET_AR))
+	$(call QTOPIA4_QMAKE_SET,AR,$(QTOPIA4_QMAKE_AR))
 	$(call QTOPIA4_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
 	$(call QTOPIA4_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
 	$(call QTOPIA4_QMAKE_SET,STRIP,$(TARGET_STRIP))
