From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 08:02:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070731150206.EA16DA45A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 08:02:06 -0700 (Tue, 31 Jul 2007)
New Revision: 19352

Log:
- add variable BR2_DEPENDS_DIR to point to the Kconfig depend hierarchy


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-31 14:59:58 UTC (rev 19351)
+++ trunk/buildroot/Makefile	2007-07-31 15:02:06 UTC (rev 19352)
@@ -147,8 +147,9 @@
 endif
 PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 
+BR2_DEPENDS_DIR=$(BASE_DIR)/package/config/buildroot-config/
 
-#############################################################
+##############################################################
 #
 # The list of stuff to build for the target toolchain
 # along with the packages to build for the target.
