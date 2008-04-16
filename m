From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 16 Apr 2008 15:54:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080416225446.E3C283C628@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-16 15:54:46 -0700 (Wed, 16 Apr 2008)
New Revision: 21748

Log:
Avoid duplicate rules for downloading kernel source, if kernel and headers are the same

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-16 22:45:47 UTC (rev 21747)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-16 22:54:46 UTC (rev 21748)
@@ -184,7 +184,9 @@
 	LZMA="$(LZMA)" 
 
 # =============================================================================
-ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
+# ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
+
+ifneq ($(strip $(LINUX26_SOURCE)),$(strip $(LINUX_HEADERS_SOURCE)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
