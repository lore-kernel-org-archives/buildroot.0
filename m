From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 23:29:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080330062931.81FDF3C491@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 23:29:30 -0700 (Sat, 29 Mar 2008)
New Revision: 21569

Log:
Easy update of defconfig

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-29 23:10:47 UTC (rev 21568)
+++ trunk/buildroot/Makefile	2008-03-30 06:29:30 UTC (rev 21569)
@@ -475,6 +475,9 @@
 	cp $(shell find ./target/ -name $@) .config
 	-@$(MAKE) oldconfig
 
+update:
+	cp .config $(BOARD_PATH)/$(BOARD_NAME)_defconfig
+
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
 cross: $(BASE_TARGETS)
