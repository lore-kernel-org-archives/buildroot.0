From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:12:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tcpdump
Message-ID: <20071013231205.B62FBA682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:12:05 -0700 (Sat, 13 Oct 2007)
New Revision: 20249

Log:
Config update of tcpdump

Modified:
   trunk/buildroot/package/tcpdump/tcpdump.mk


Changeset:
Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-10-13 23:11:17 UTC (rev 20248)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-10-13 23:12:05 UTC (rev 20249)
@@ -26,6 +26,7 @@
 $(TCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(TCPDUMP_SOURCE)
 	$(TCPDUMP_CAT) $(DL_DIR)/$(TCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(TCPDUMP_DIR) package/tcpdump tcpdump\*.patch
+	$(CONFIG_UPDATE) $(TCPDUMP_DIR)
 	touch $@
 
 $(TCPDUMP_DIR)/.configured: $(TCPDUMP_DIR)/.unpacked
