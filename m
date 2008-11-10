From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 10 Nov 2008 15:50:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpcap
Message-ID: <20081110235058.41E083C96F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-11-10 15:50:57 -0800 (Mon, 10 Nov 2008)
New Revision: 23993

Log:
Remove .rej file included in the upstream tarball before patching


Modified:
   trunk/buildroot/package/libpcap/libpcap.mk


Changeset:
Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2008-11-10 22:23:20 UTC (rev 23992)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2008-11-10 23:50:57 UTC (rev 23993)
@@ -34,6 +34,7 @@
 
 $(LIBPCAP_DIR)/.unpacked: $(DL_DIR)/$(LIBPCAP_SOURCE)
 	$(LIBPCAP_CAT) $(DL_DIR)/$(LIBPCAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	rm -f $(LIBPCAP_DIR)/gencode.c.rej
 	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
 	$(CONFIG_UPDATE) $(LIBPCAP_DIR)
 	touch $@
