From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  9 Oct 2008 11:36:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20081009183637.211233C8E0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-09 11:36:36 -0700 (Thu, 09 Oct 2008)
New Revision: 23645

Log:
Fix dependency on libungif

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2008-10-09 18:36:18 UTC (rev 23644)
+++ trunk/buildroot/package/directfb/directfb.mk	2008-10-09 18:36:36 UTC (rev 23645)
@@ -84,6 +84,7 @@
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
 DIRECTFB_GIF:=--enable-gif
+DIRECTFB_DEP+= libungif
 else
 DIRECTFB_GIF:=--disable-gif
 endif
