From: correa at uclibc.org <correa@uclibc.org>
Date: Tue,  2 Sep 2008 18:09:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080903010930.20F863C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-09-02 18:09:29 -0700 (Tue, 02 Sep 2008)
New Revision: 23307

Log:
Qtopia: don't build sqlite driver when SQL module is disabled.

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-02 13:54:58 UTC (rev 23306)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-09-03 01:09:29 UTC (rev 23307)
@@ -182,11 +182,17 @@
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE),y)
 QTOPIA4_CONFIGURE+= -qt-sql-sqlite
+else
+QTOPIA4_CONFIGURE+= -no-sql-sqlite
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE2),y)
 QTOPIA4_CONFIGURE+= -qt-sql-sqlite2
 endif
+else
 # By default, no SQL driver is turned on by configure.
+# but it seams sqlite isn't disabled despite what says
+# configure --help
+QTOPIA4_CONFIGURE+= -no-sql-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
