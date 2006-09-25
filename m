From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Sep 2006 01:48:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20060925084847.87853486B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-25 01:48:47 -0700 (Mon, 25 Sep 2006)
New Revision: 16216

Log:
Valgrind works on PPC and AMD64 as well nowadays.
Use Kconfig to ensure valgrind can only be enabled on supported archs.


Modified:
   trunk/buildroot/package/valgrind/Config.in
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/Config.in
===================================================================
--- trunk/buildroot/package/valgrind/Config.in	2006-09-25 07:38:13 UTC (rev 16215)
+++ trunk/buildroot/package/valgrind/Config.in	2006-09-25 08:48:47 UTC (rev 16216)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	default n
+	depends BR2_i386 || BR2_powerpc || BR2_x86_64
 	help
 	  Tool for debugging and profiling Linux programs.
 

Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2006-09-25 07:38:13 UTC (rev 16215)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2006-09-25 08:48:47 UTC (rev 16216)
@@ -77,11 +77,7 @@
 	#cp $(VALGRIND_DIR)/woody.supp $(TARGET_DIR)/usr/lib/valgrind/
 	touch -c $(TARGET_DIR)/usr/bin/valgrind
 
-ifeq ($(BR2_i386),y)
 valgrind: $(TARGET_DIR)/usr/bin/valgrind
-else
-valgrind:
-endif
 
 valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
 
