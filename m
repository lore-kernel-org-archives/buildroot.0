From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 23:19:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltt
Message-ID: <20061213071959.80C8948570@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 23:19:58 -0800 (Tue, 12 Dec 2006)
New Revision: 16873

Log:
fix broken shell fragment


Modified:
   trunk/buildroot/package/ltt/ltt.mk


Changeset:
Modified: trunk/buildroot/package/ltt/ltt.mk
===================================================================
--- trunk/buildroot/package/ltt/ltt.mk	2006-12-13 06:59:34 UTC (rev 16872)
+++ trunk/buildroot/package/ltt/ltt.mk	2006-12-13 07:19:58 UTC (rev 16873)
@@ -29,7 +29,7 @@
 	touch $(LTT_DIR1)/.unpacked
 
 # Build without GTK if not available
-LTT_WITHOUT_GTK:=$(shell which gtk-config >& /dev/null || echo "--without-gtk")
+LTT_WITHOUT_GTK:=$(shell which gtk-config > /dev/null 2>&1 || echo "--without-gtk")
 
 $(LTT_DIR1)/.configured: $(LTT_DIR1)/.unpacked
 	(cd $(LTT_DIR1); rm -rf config.cache; \
