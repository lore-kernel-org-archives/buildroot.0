From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 09:57:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070712165748.0D6A3A6827@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 09:57:47 -0700 (Thu, 12 Jul 2007)
New Revision: 19076

Log:
Workaround for vi bug in syntax highlighting

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-12 16:53:13 UTC (rev 19075)
+++ trunk/buildroot/Makefile	2007-07-12 16:57:47 UTC (rev 19076)
@@ -156,9 +156,9 @@
 TARGETS:=uclibc
 endif
 
-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))  # "))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME))) # " ))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER))) # " ))
 
 
 include toolchain/Makefile.in
