From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 22:11:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20090114221114.73CB776C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 22:11:13 +0000 (Wed, 14 Jan 2009)
New Revision: 24845

Log:
Force use of HOST_GLIB instead of /usr/bin for libgtk2

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-14 22:08:36 UTC (rev 24844)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-14 22:11:13 UTC (rev 24845)
@@ -122,6 +122,8 @@
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
+LIBGTK2_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
+
 $(eval $(call AUTOTARGETS,package,libgtk2))
 
 $(LIBGTK2_HOOK_POST_INSTALL):
