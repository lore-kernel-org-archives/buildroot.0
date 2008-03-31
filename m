From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 07:32:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20080331143238.7A7EA3C516@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 07:32:38 -0700 (Mon, 31 Mar 2008)
New Revision: 21595

Log:
readline: ignore errors in target-clean target


Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2008-03-31 14:28:38 UTC (rev 21594)
+++ trunk/buildroot/package/readline/readline.mk	2008-03-31 14:32:38 UTC (rev 21595)
@@ -91,7 +91,7 @@
 readline-target: readline $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
 
 readline-target-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
 
 ifeq ($(strip $(BR2_READLINE)),y)
 TARGETS+=readline
