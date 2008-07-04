From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 13:35:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20080704203541.E0C103C5FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 13:35:41 -0700 (Fri, 04 Jul 2008)
New Revision: 22635

Log:
The build of 'file', needs to run 'file' natively, so provide a valid link

Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-07-04 11:18:58 UTC (rev 22634)
+++ trunk/buildroot/package/file/file.mk	2008-07-04 20:35:41 UTC (rev 22635)
@@ -85,6 +85,7 @@
 	touch $@
 
 $(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOL_BUILD_DIR)/bin/file
+	ln -sf $(FILE_DIR1)/install/bin/file $(FILE_DIR2)/magic/file
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="-static" -C $(FILE_DIR2)
 
 $(TARGET_DIR)/$(FILE_TARGET_BINARY): $(FILE_DIR2)/$(FILE_BINARY)
