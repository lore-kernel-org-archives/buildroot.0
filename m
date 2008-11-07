From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Nov 2008 00:58:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20081107085800.0741E3C928@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-07 00:57:59 -0800 (Fri, 07 Nov 2008)
New Revision: 23956

Log:
Makefile: revert HOST_GLIB_BIN staging_dir fix (r23920,23923)

It causes more trouble than it's worth, and we should move to building those
host tools ourselves to not get into version issues anyway.

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-07 08:56:02 UTC (rev 23955)
+++ trunk/buildroot/Makefile	2008-11-07 08:57:59 UTC (rev 23956)
@@ -122,8 +122,7 @@
 HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
-# ignore version in staging_dir
-HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "(which -a glib-genmarshal; echo /usr/bin/glib-genmarshal)|grep -v $(BR2_STAGING_DIR)|head -n 1")`
+HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
 HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
 
 
