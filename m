From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  2 Jul 2007 01:58:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070702085856.10FE5A65EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-02 01:58:56 -0700 (Mon, 02 Jul 2007)
New Revision: 18990

Log:
- udhcp was merged into busybox some years ago; use a recent busybox instead!


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-01 22:25:33 UTC (rev 18989)
+++ trunk/buildroot/package/Config.in	2007-07-02 08:58:56 UTC (rev 18990)
@@ -175,9 +175,10 @@
 endif
 source "package/tn5250/Config.in"
 source "package/ttcp/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/udhcp/Config.in"
-endif
+#if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# ATTENTION! This was merged into busybox! 
+#source "package/udhcp/Config.in"
+#endif
 source "package/vtun/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/wget/Config.in"
