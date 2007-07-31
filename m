From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 08:10:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070731151055.19772A6074@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 08:10:55 -0700 (Tue, 31 Jul 2007)
New Revision: 19354

Log:
- nil the CXX env var if we don't have a CXX cross-compiler


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-31 15:07:06 UTC (rev 19353)
+++ trunk/buildroot/package/Makefile.in	2007-07-31 15:10:55 UTC (rev 19354)
@@ -238,7 +238,7 @@
 DISABLE_IPV6= --disable-ipv6
 endif
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+ifneq ($(BR2_GCC_CROSS_CXX),y)
 TARGET_CONFIGURE_OPTS+=CXX=""
 endif
 
