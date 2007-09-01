From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:06:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7
Message-ID: <20070901170654.5DADDA65B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:06:53 -0700 (Sat, 01 Sep 2007)
New Revision: 19747

Log:
- Only include the XORG7 makefiles if we were asked to build any xorg package


Modified:
   trunk/buildroot/package/x11r7/x11r7.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/x11r7.mk
===================================================================
--- trunk/buildroot/package/x11r7/x11r7.mk	2007-09-01 16:37:55 UTC (rev 19746)
+++ trunk/buildroot/package/x11r7/x11r7.mk	2007-09-01 17:06:53 UTC (rev 19747)
@@ -1,2 +1,3 @@
+ifeq ($(BR2_PACKAGE_XORG7),y)
 include package/x11r7/*/*.mk
-
+endif
