From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  6 Apr 2008 03:30:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080406103020.114783C3E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-06 03:30:18 -0700 (Sun, 06 Apr 2008)
New Revision: 21652

Log:
* Dereference link when copying over kernel image, missed this one in my previous commit


Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-06 10:10:30 UTC (rev 21651)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-06 10:30:18 UTC (rev 21652)
@@ -391,7 +391,7 @@
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
-	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
+	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
 # -----------------------------------------------------------------------------
