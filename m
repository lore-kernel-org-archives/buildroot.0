From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:21:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
Message-ID: <20070728152155.4F4C4A4653@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:21:54 -0700 (Sat, 28 Jul 2007)
New Revision: 19287

Log:
Update config for proftpd

Modified:
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2007-07-28 15:09:19 UTC (rev 19286)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-07-28 15:21:54 UTC (rev 19287)
@@ -22,6 +22,7 @@
 
 $(PROFTPD_DIR)/.unpacked: $(DL_DIR)/$(PROFTPD_SOURCE)
 	$(PROFTPD_CAT) $(DL_DIR)/$(PROFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(PROFTPD_DIR)
 	touch $(PROFTPD_DIR)/.unpacked
 
 $(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
