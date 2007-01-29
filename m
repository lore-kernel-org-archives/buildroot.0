From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 29 Jan 2007 14:23:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070129222300.56FD7485B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-29 14:22:59 -0800 (Mon, 29 Jan 2007)
New Revision: 17651

Log:
fix broken spot caused by my having checked in the wrong dst patch for 0.9.28


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.1-time-locale.patch	2007-01-29 22:22:59 UTC (rev 17651)
@@ -0,0 +1,15 @@
+Index: libc/misc/time/time.c
+===================================================================
+--- a/libc/misc/time/time.c	(revision 17534)
++++ b/libc/misc/time/time.c	(revision 17647)
+@@ -158,7 +158,9 @@
+ #endif
+ 
+ #if defined (L_tzset) || defined (L_localtime_r) || defined(L_strftime) || \
+-    defined(L__time_mktime) || defined(L__time_mktime_tzi)
++	 defined(L__time_mktime) || defined(L__time_mktime_tzi) || \
++	 ((defined(L_strftime) || defined(L_strftime_l)) && \
++	  defined(__UCLIBC_HAS_XLOCALE__))
+ 
+ void _time_tzset (int);
+ 
