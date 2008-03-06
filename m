From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:24:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20080306182427.64892120273@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:24:27 -0800 (Thu, 06 Mar 2008)
New Revision: 21227

Log:
cleanup sed makefile

Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2008-03-06 18:23:59 UTC (rev 21226)
+++ trunk/buildroot/package/sed/sed.mk	2008-03-06 18:24:27 UTC (rev 21227)
@@ -107,7 +107,7 @@
 $(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(SED_DIR2)/config
-	touch $(SED_DIR2)/.unpacked
+	touch $@
 
 $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
 	(cd $(SED_DIR2); rm -rf config.cache; \
