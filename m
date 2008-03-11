From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:15:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080311181532.39F43120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:15:30 -0700 (Tue, 11 Mar 2008)
New Revision: 21301

Log:
added debug option

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-03-11 18:14:42 UTC (rev 21300)
+++ trunk/buildroot/package/Makefile.in	2008-03-11 18:15:30 UTC (rev 21301)
@@ -305,6 +305,11 @@
 TARGET_CONFIGURE_OPTS+=CXX=""
 endif
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+ENABLE_DEBUG:=--enable-debug
+else
+ENABLE_DEBUG:=
+endif
 
 
 # X Windowing system
