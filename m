From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101144.2C3F2F800D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:43 -0700 (Thu, 10 Jul 2008)
New Revision: 22745

Log:
fuse: don't build kernel module

it's been in the mainline kernel for ages (~3y) and the included stuff
doesn't seem to build with modern kernel headers.

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:36 UTC (rev 22744)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:43 UTC (rev 22745)
@@ -30,10 +30,9 @@
 		--program-prefix="" \
 		--disable-nls \
 		--disable-example \
-		--enable-kernel-module \
+		--disable-kernel-module \
 		--enable-lib \
 		--enable-util \
-		--with-kernel="$(LINUX_DIR)" \
 	);
 	touch $@
 #		--disable-example
