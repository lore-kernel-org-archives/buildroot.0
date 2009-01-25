From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:44:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20090125234456.42F3E76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:44:53 +0000 (Sun, 25 Jan 2009)
New Revision: 25032

Log:
Avoid the use of subshell in microperl

Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2009-01-25 23:42:09 UTC (rev 25031)
+++ trunk/buildroot/package/microperl/microperl.mk	2009-01-25 23:44:53 UTC (rev 25032)
@@ -23,7 +23,7 @@
 
 $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	(cd $(MICROPERL_DIR); chmod -R u+w *)
+	chmod -R u+w $(MICROPERL_DIR)
 	touch $@
 
 $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
