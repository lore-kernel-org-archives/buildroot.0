From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:22:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libfloat
Message-ID: <20070901172201.28DDCA610D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:22:00 -0700 (Sat, 01 Sep 2007)
New Revision: 19753

Log:
- libfloat has to depend on gcc_initial


Modified:
   trunk/buildroot/package/libfloat/libfloat.mk


Changeset:
Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 17:12:48 UTC (rev 19752)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 17:22:00 UTC (rev 19753)
@@ -47,7 +47,7 @@
 	(cd $(TARGET_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
 	(cd $(TARGET_DIR)/usr/lib; ln -snf /lib/libfloat.so libfloat.so)
 
-libfloat: gcc $(STAGING_DIR)/lib/libfloat.so
+libfloat: gcc_initial $(STAGING_DIR)/lib/libfloat.so
 
 libfloat-clean:
 	-$(MAKE) -C $(LIBFLOAT_DIR) clean
