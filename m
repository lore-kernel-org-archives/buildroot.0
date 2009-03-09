From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 19:47:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25592] trunk/buildroot/package/editors/vim
Message-ID: <20090309194755.9831D764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 19:47:55 +0000 (Mon, 09 Mar 2009)
New Revision: 25592

Log:
vim: fixup patch download location after change to DOWNLOAD macro.

Closes #161.

Modified:
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2009-03-09 17:22:16 UTC (rev 25591)
+++ trunk/buildroot/package/editors/vim/vim.mk	2009-03-09 19:47:55 UTC (rev 25592)
@@ -9,7 +9,7 @@
 VIM_SOURCE_SITE:=$(VIM_SITE)/unix
 VIM_PATCH_SITE:=$(VIM_SITE)/patches/7.1
 VIM_DIR:=$(BUILD_DIR)/vim71
-VIM_PATCHES:=$(shell sed -e 's:^:$(DL_DIR)/vim/$(VIM_VERSION).:' package/editors/vim/patches)
+VIM_PATCHES:=$(shell sed -e 's:^:$(DL_DIR)/$(VIM_VERSION).:' package/editors/vim/patches)
 VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
 VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
 
