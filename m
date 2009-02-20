From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Feb 2009 15:13:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090220151352.4F77D76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-20 15:13:50 +0000 (Fri, 20 Feb 2009)
New Revision: 25403

Log:
php: don't use DOWNLOAD macro

php.net only offers downloads though a strange php script with the file name
embedded in the *MIDDLE* of the URL, which isn't compatible with the DOWNLOAD
macro. Fix it by reverting php.mk hunk of r24689 to go back to $(WGET).

This ofcourse means that the primary site / fallback mirror stuff isn't used.

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-02-20 15:02:14 UTC (rev 25402)
+++ trunk/buildroot/package/php/php.mk	2009-02-20 15:13:50 UTC (rev 25403)
@@ -126,7 +126,7 @@
 endif
 
 $(DL_DIR)/$(PHP_SOURCE):
-	 $(call DOWNLOAD,$(PHP_SITE))
+	$(WGET) -P $(DL_DIR) $(PHP_SITE)
 
 php-source: $(DL_DIR)/$(PHP_SOURCE)
 
