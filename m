From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Nov 2007 23:13:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntfs-3g
Message-ID: <20071126071351.742C130045@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-25 23:13:50 -0800 (Sun, 25 Nov 2007)
New Revision: 20537

Log:
It is not OK to ALWAYS include ntfs-3g

Modified:
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2007-11-26 05:38:20 UTC (rev 20536)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2007-11-26 07:13:50 UTC (rev 20537)
@@ -77,6 +77,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-#ifeq ($(strip $(BR2_PACKAGE_NTFS-3G)),y)
+ifeq ($(strip $(BR2_PACKAGE_NTFS-3G)),y)
 TARGETS+=ntfs-3g
-#endif
+endif
