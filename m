From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 10 Sep 2008 19:22:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080911022247.7FC9C3C651@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-10 19:22:47 -0700 (Wed, 10 Sep 2008)
New Revision: 23374

Log:
Applied patch from Brian Foster <brian.foster@innova-card.com>:
make "make clean" remove the .root stamp, so that everything will
be reinstalled properly on a subsequent build. (bug id 4304)
Also remove new autotools-stamps directory.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-09-11 02:15:07 UTC (rev 23373)
+++ trunk/buildroot/Makefile	2008-09-11 02:22:47 UTC (rev 23374)
@@ -358,10 +358,10 @@
 #
 #############################################################
 clean: $(TARGETS_CLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
 
 dirclean: $(TARGETS_DIRCLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
 
 distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
