From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 15:59:00 2006
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20060718225858.A242248B55@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 15:58:58 -0700 (Tue, 18 Jul 2006)
New Revision: 15719

Log:
move TAR_OPTIONS to its rightful place


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-07-18 18:32:17 UTC (rev 15718)
+++ trunk/buildroot/Makefile	2006-07-18 22:58:58 UTC (rev 15719)
@@ -35,9 +35,6 @@
 -include $(TOPDIR).config
 endif
 
-TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
-#"
-
 ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
 #############################################################

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-07-18 18:32:17 UTC (rev 15718)
+++ trunk/buildroot/package/Makefile.in	2006-07-18 22:58:58 UTC (rev 15719)
@@ -8,6 +8,8 @@
 #"
 SVN:=$(strip $(subst ",, $(BR2_SVN)))
 #"
+TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
+#"
 
 
 
