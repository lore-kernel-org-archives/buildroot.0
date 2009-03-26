From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Thu, 26 Mar 2009 16:55:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [25827] trunk/buildroot/package/automake
Message-ID: <20090326165522.5C989771F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-03-26 16:55:21 +0000 (Thu, 26 Mar 2009)
New Revision: 25827

Log:
/usr/share/aclocal is now in $(HOST_DIR) and not $(STAGING_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/automake/automake.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-26 13:48:46 UTC (rev 25826)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-26 16:55:21 UTC (rev 25827)
@@ -20,7 +20,7 @@
 
 # variables used by other packages
 AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
+ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
 
 $(DL_DIR)/$(AUTOMAKE_SOURCE):
