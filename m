From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 05:03:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070723120318.52818A6AAF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 05:03:17 -0700 (Mon, 23 Jul 2007)
New Revision: 19223

Log:
- fix typo in previous commit


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-23 12:02:35 UTC (rev 19222)
+++ trunk/buildroot/package/Makefile.in	2007-07-23 12:03:17 UTC (rev 19223)
@@ -34,11 +34,11 @@
 #TARGET_LDFLAGS=-Wl,$(BR2_SYSROOT)
 endif
 
-CC_TARGET_TUNE_:=$(strip $(subst ",,BR2_GCC_TARGET_TUNE))
+CC_TARGET_TUNE_:=$(strip $(subst ",,$(BR2_GCC_TARGET_TUNE)))
 #"))
-CC_TARGET_ARCH_:=$(strip $(subst ",,BR2_GCC_TARGET_ARCH))
+CC_TARGET_ARCH_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ARCH)))
 #"))
-CC_TARGET_ABI_:=$(strip $(subst ",,BR2_GCC_TARGET_ABI))
+CC_TARGET_ABI_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ABI)))
 #"))
 ifneq ($(CC_TARGET_TUNE_),)
 TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
