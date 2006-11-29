From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 05:21:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20061129132129.77DEF48579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 05:21:28 -0800 (Wed, 29 Nov 2006)
New Revision: 16719

Log:
- it helps to actually apply the patches.. ;)


Modified:
   trunk/buildroot/package/openswan/openswan.mk


Changeset:
Modified: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2006-11-29 12:59:56 UTC (rev 16718)
+++ trunk/buildroot/package/openswan/openswan.mk	2006-11-29 13:21:28 UTC (rev 16719)
@@ -21,7 +21,7 @@
 
 $(OPENSWAN_DIR)/.unpacked: $(DL_DIR)/$(OPENSWAN_SOURCE)
 	$(OPENSWAN_CAT) $(DL_DIR)/$(OPENSWAN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(OPENSWAN_DIR) package/openswan/ openswan.patch
+	toolchain/patch-kernel.sh $(OPENSWAN_DIR) package/openswan/ openswan\*.patch
 	touch $(OPENSWAN_DIR)/.unpacked
 
 $(OPENSWAN_DIR)/.configured: $(OPENSWAN_DIR)/.unpacked
