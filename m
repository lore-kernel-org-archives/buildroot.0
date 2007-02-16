From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 05:01:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dhcp
Message-ID: <20070216130107.9878548561@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 05:01:06 -0800 (Fri, 16 Feb 2007)
New Revision: 17905

Log:
- provide -source targets for the 3 parts of the split dhcp.
  Closes #1223. Thanks


Modified:
   trunk/buildroot/package/dhcp/dhcp.mk


Changeset:
Modified: trunk/buildroot/package/dhcp/dhcp.mk
===================================================================
--- trunk/buildroot/package/dhcp/dhcp.mk	2007-02-16 09:34:11 UTC (rev 17904)
+++ trunk/buildroot/package/dhcp/dhcp.mk	2007-02-16 13:01:06 UTC (rev 17905)
@@ -23,6 +23,10 @@
 
 dhcp-source: $(DL_DIR)/$(DHCP_SOURCE)
 
+dhcp_server-source: dhcp-source
+dhcp_relay-source: dhcp-source
+dhcp_client-source: dhcp-source
+
 $(DHCP_DIR)/.unpacked: $(DL_DIR)/$(DHCP_SOURCE)
 	$(DHCP_CAT) $(DL_DIR)/$(DHCP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(DHCP_DIR) package/dhcp/ dhcp\*.patch
