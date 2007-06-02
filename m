From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Jun 2007 01:49:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070602084946.70B7C48562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-02 01:49:45 -0700 (Sat, 02 Jun 2007)
New Revision: 18724

Log:
- correct extensions for apple (thanks Heikki Lindholm for pointing this out)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-01 22:16:28 UTC (rev 18723)
+++ trunk/buildroot/Makefile	2007-06-02 08:49:45 UTC (rev 18724)
@@ -72,8 +72,8 @@
 SHREXT:=.so
 endif
 ifneq (,$(findstring apple,$(BR2_GNU_BUILD_SUFFIX)))
-EXEEXT:=.pear
-LIBEXT:=.dunno
+EXEEXT:=
+LIBEXT:=.a
 SHREXT:=.dylib
 endif
 ifneq (,$(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)))
