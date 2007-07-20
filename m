From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 04:36:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070720113652.11FFBA65B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 04:36:52 -0700 (Fri, 20 Jul 2007)
New Revision: 19180

Log:
Add additional include directory, required by some packages

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-20 11:27:45 UTC (rev 19179)
+++ trunk/buildroot/package/Makefile.in	2007-07-20 11:36:52 UTC (rev 19180)
@@ -26,7 +26,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/usr/include
+	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
