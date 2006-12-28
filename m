From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Dec 2006 00:46:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20061228084631.85AAD485B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-28 00:46:30 -0800 (Thu, 28 Dec 2006)
New Revision: 17096

Log:
- add missing namespace specifiers. Fixes compilation error.


Added:
   trunk/buildroot/toolchain/gcc/4.2/306-libstdc++-namespace.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2/306-libstdc++-namespace.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/306-libstdc++-namespace.patch	2006-12-28 05:44:47 UTC (rev 17095)
+++ trunk/buildroot/toolchain/gcc/4.2/306-libstdc++-namespace.patch	2006-12-28 08:46:30 UTC (rev 17096)
@@ -0,0 +1,36 @@
+diff -rup gcc-4.2.orig/libstdc++-v3/config/locale/uclibc/messages_members.h gcc-4.2/libstdc++-v3/config/locale/uclibc/messages_members.h
+--- gcc-4.2.orig/libstdc++-v3/config/locale/uclibc/messages_members.h	2006-12-22 13:06:56.000000000 +0100
++++ gcc-4.2/libstdc++-v3/config/locale/uclibc/messages_members.h	2006-12-22 15:23:41.000000000 +0100
+@@ -32,7 +32,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+@@ -115,3 +116,4 @@
+ 	   this->_S_create_c_locale(this->_M_c_locale_messages, __s); 
+ 	 }
+      }
++}
+diff -rup gcc-4.2.orig/libstdc++-v3/config/locale/uclibc/time_members.h gcc-4.2/libstdc++-v3/config/locale/uclibc/time_members.h
+--- gcc-4.2.orig/libstdc++-v3/config/locale/uclibc/time_members.h	2006-12-22 13:06:56.000000000 +0100
++++ gcc-4.2/libstdc++-v3/config/locale/uclibc/time_members.h	2006-12-22 15:20:31.000000000 +0100
+@@ -33,7 +33,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+   template<typename _CharT>
+     __timepunct<_CharT>::__timepunct(size_t __refs) 
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL), 
+@@ -74,3 +75,4 @@
+       delete _M_data; 
+       _S_destroy_c_locale(_M_c_locale_timepunct); 
+     }
++}
