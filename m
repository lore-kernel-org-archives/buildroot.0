From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 12 Dec 2006 09:01:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061212170127.39996485CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-12 09:01:26 -0800 (Tue, 12 Dec 2006)
New Revision: 16854

Log:
- workaround vi's syntax highlighting


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2006-12-12 14:38:03 UTC (rev 16853)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2006-12-12 17:01:26 UTC (rev 16854)
@@ -5,18 +5,20 @@
 # the top level.
 
 GCC_VERSION:=$(strip $(subst ",, $(BR2_GCC_VERSION)))
-#"
+#"))
 TARGET_OPTIMIZATION:=$(strip $(subst ",, $(BR2_TARGET_OPTIMIZATION)))
-#"
+#"))
 EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
-#"
+#"))
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
+#"))
 GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
+#"))
 else
 GCC_SNAP_DATE:=
 endif
+#")))
 
-
 ifeq ($(strip $(BR2_GCC_USE_SJLJ_EXCEPTIONS)),y)
 GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
 endif
