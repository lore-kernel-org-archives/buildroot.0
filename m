From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:05:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20071129130528.0E7D23009F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:05:28 -0800 (Thu, 29 Nov 2007)
New Revision: 20588

Log:
Update config for speex

Modified:
   trunk/buildroot/package/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2007-11-29 13:04:41 UTC (rev 20587)
+++ trunk/buildroot/package/speex/speex.mk	2007-11-29 13:05:28 UTC (rev 20588)
@@ -23,6 +23,7 @@
 
 $(SPEEX_DIR)/.unpacked: $(DL_DIR)/$(SPEEX_SOURCE)
 	$(SPEEX_CAT) $(DL_DIR)/$(SPEEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SPEEX_DIR)
 	touch $(SPEEX_DIR)/.unpacked
 
 $(SPEEX_DIR)/Makefile: $(SPEEX_DIR)/.unpacked
