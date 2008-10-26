From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 05:13:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/vim
Message-ID: <20081026121328.DA75F3C7FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 05:13:28 -0700 (Sun, 26 Oct 2008)
New Revision: 23800

Log:
vim: add TARGET_CONFIGURE_OPTS

Patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 11:08:14 UTC (rev 23799)
+++ trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 12:13:28 UTC (rev 23800)
@@ -36,11 +36,12 @@
 
 $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
 	(cd $(VIM_DIR)/src; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		STRIP="$(TARGET_STRIP)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-        $(TARGET_CONFIGURE_ARGS) \
 		./configure --prefix=/usr \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
