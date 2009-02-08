From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  8 Feb 2009 11:00:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/vim
Message-ID: <20090208110047.B229A764A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-08 11:00:44 +0000 (Sun, 08 Feb 2009)
New Revision: 25264

Log:
vim: cleanup sed invocation

Modified:
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2009-02-08 02:04:26 UTC (rev 25263)
+++ trunk/buildroot/package/editors/vim/vim.mk	2009-02-08 11:00:44 UTC (rev 25264)
@@ -9,7 +9,7 @@
 VIM_SOURCE_SITE:=$(VIM_SITE)/unix
 VIM_PATCH_SITE:=$(VIM_SITE)/patches/7.1
 VIM_DIR:=$(BUILD_DIR)/vim71
-VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\(.\+\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
+VIM_PATCHES:=$(shell sed -e 's:^:$(DL_DIR)/vim/$(VIM_VERSION).:' package/editors/vim/patches)
 VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
 VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
 
