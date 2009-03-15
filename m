From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Mar 2009 13:51:30 +0000 (UTC)
Subject: [Buildroot] svn commit: [25662] trunk/buildroot/package/editors/vim
Message-ID: <20090315135130.8A912763D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-15 13:51:30 +0000 (Sun, 15 Mar 2009)
New Revision: 25662

Log:
vim: really fix patch download

Thanks to Markus Heidelberg for noticing.

Modified:
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2009-03-15 07:28:12 UTC (rev 25661)
+++ trunk/buildroot/package/editors/vim/vim.mk	2009-03-15 13:51:30 UTC (rev 25662)
@@ -16,8 +16,8 @@
 $(DL_DIR)/$(VIM_SOURCE):
 	$(call DOWNLOAD,$(VIM_SOURCE_SITE),$(VIM_SOURCE))
 
-$(DL_DIR)/vim/%:
-	$(call DOWNLOAD,$(VIM_PATCH_SITE),$*)
+$(DL_DIR)/$(VIM_VERSION).%:
+	$(call DOWNLOAD,$(VIM_PATCH_SITE),$(notdir $@))
 
 vim-source: $(DL_DIR)/$(VIM_SOURCE) $(VIM_PATCHES)
 
