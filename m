From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Jul 2007 01:06:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070709080631.701A030065@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-09 01:06:27 -0700 (Mon, 09 Jul 2007)
New Revision: 19053

Log:
- wipe config related files in distclean


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-09 05:04:01 UTC (rev 19052)
+++ trunk/buildroot/Makefile	2007-07-09 08:06:27 UTC (rev 19053)
@@ -244,7 +244,8 @@
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
 	rm -rf $(DL_DIR)
 endif
-	rm -rf $(BUILD_DIR) $(LINUX_KERNEL) $(IMAGE)
+	rm -rf $(BUILD_DIR) $(LINUX_KERNEL) $(IMAGE) $(BASE_DIR)/include \
+		.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
 sourceball:
