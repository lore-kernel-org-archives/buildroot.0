From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 28 Feb 2007 14:01:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070228220112.D6747485D0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-28 14:01:12 -0800 (Wed, 28 Feb 2007)
New Revision: 17992

Log:
update to uClibc 0.9.28.3


Removed:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-02-28 21:36:09 UTC (rev 17991)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-02-28 22:01:12 UTC (rev 17992)
@@ -13,13 +13,9 @@
 		depends BR2_DEPRECATED
 		bool "uClibc 0.9.28"
 
-	config BR2_UCLIBC_VERSION_0_9_28_1
-		depends BR2_DEPRECATED
-		bool "uClibc 0.9.28.1"
+	config BR2_UCLIBC_VERSION_0_9_28_3
+		bool "uClibc 0.9.28.3"
 
-	config BR2_UCLIBC_VERSION_0_9_28_2
-		bool "uClibc 0.9.28.2"
-
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 

Deleted: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch	2007-02-28 21:36:09 UTC (rev 17991)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch	2007-02-28 22:01:12 UTC (rev 17992)
@@ -1,15 +0,0 @@
-Index: libc/misc/time/time.c
-===================================================================
---- a/libc/misc/time/time.c	(revision 17534)
-+++ b/libc/misc/time/time.c	(revision 17647)
-@@ -158,7 +158,9 @@
- #endif
- 
- #if defined (L_tzset) || defined (L_localtime_r) || defined(L_strftime) || \
--    defined(L__time_mktime) || defined(L__time_mktime_tzi)
-+	 defined(L__time_mktime) || defined(L__time_mktime_tzi) || \
-+	 ((defined(L_strftime) || defined(L_strftime_l)) && \
-+	  defined(__UCLIBC_HAS_XLOCALE__))
- 
- void _time_tzset (int);
- 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-28 21:36:09 UTC (rev 17991)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-28 22:01:12 UTC (rev 17992)
@@ -17,12 +17,9 @@
 UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.29.config
 endif
 else
-ifeq ($(BR2_UCLIBC_VERSION_0_9_28_2),y)
-UCLIBC_VER:=0.9.28.2
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
+UCLIBC_VER:=0.9.28.3
 endif
-ifeq ($(BR2_UCLIBC_VERSION_0_9_28_1),y)
-UCLIBC_VER:=0.9.28.1
-endif
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28),y)
 UCLIBC_VER:=0.9.28
 endif
