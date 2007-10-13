From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:08:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpcap
Message-ID: <20071013230855.B151CA65EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:08:55 -0700 (Sat, 13 Oct 2007)
New Revision: 20246

Log:
Config update in libpcap

Modified:
   trunk/buildroot/package/libpcap/libpcap.mk


Changeset:
Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-10-13 23:08:01 UTC (rev 20245)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-10-13 23:08:55 UTC (rev 20246)
@@ -35,6 +35,7 @@
 $(LIBPCAP_DIR)/.unpacked: $(DL_DIR)/$(LIBPCAP_SOURCE)
 	$(LIBPCAP_CAT) $(DL_DIR)/$(LIBPCAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
+	$(CONFIG_UPDATE) $(LIBPCAP_DIR)
 	touch $@
 
 $(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked
