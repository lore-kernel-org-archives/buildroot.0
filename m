From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Aug 2007 01:14:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070828081451.D9F88A60F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-28 01:14:51 -0700 (Tue, 28 Aug 2007)
New Revision: 19710

Log:
- add apropriate variables for the host-toolchain to HOST_CONFIGURE_OPTS


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-28 08:05:25 UTC (rev 19709)
+++ trunk/buildroot/package/Makefile.in	2007-08-28 08:14:51 UTC (rev 19710)
@@ -159,6 +159,12 @@
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		AR="$(HOSTAR)" \
+		AS="$(HOSTAS)" \
+		CC="$(HOSTCC) $(HOST_CFLAGS)" \
+		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
+		CXX="$(HOSTCXX)" \
+		LD="$(HOSTLD) $(HOST_LDFLAGS)" \
 		AR_FOR_TARGET=$(TARGET_CROSS)ar \
 		AS_FOR_TARGET=$(TARGET_CROSS)as \
 		LD_FOR_TARGET=$(TARGET_CROSS)ld \
