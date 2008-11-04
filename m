From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 04:50:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20081104125039.199A23C8D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 04:50:38 -0800 (Tue, 04 Nov 2008)
New Revision: 23923

Log:
Makefile: glib-genmarshal: use BR2_STAGING_DIR instead of hardcoded staging_dir

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-04 11:31:58 UTC (rev 23922)
+++ trunk/buildroot/Makefile	2008-11-04 12:50:38 UTC (rev 23923)
@@ -123,7 +123,7 @@
 HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
 # ignore version in staging_dir
-HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "(which -a glib-genmarshal; echo /usr/bin/glib-genmarshal)|grep -v staging_dir|head -n 1")`
+HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "(which -a glib-genmarshal; echo /usr/bin/glib-genmarshal)|grep -v $(BR2_STAGING_DIR)|head -n 1")`
 HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
 
 
