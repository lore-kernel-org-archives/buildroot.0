From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 31 Aug 2007 07:27:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzma
Message-ID: <20070831142708.5770BA4656@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-31 07:27:07 -0700 (Fri, 31 Aug 2007)
New Revision: 19740

Log:
- make sure that the path for the lzma-host-binary exist


Modified:
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-08-31 12:04:00 UTC (rev 19739)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-08-31 14:27:07 UTC (rev 19740)
@@ -56,7 +56,7 @@
 .PHONY: lzma-host use-lzma-host-binary
 use-lzma-host-binary:
 	if [ ! -f "$(TOOL_BUILD_DIR)/bin/lzma" ]; then \
-		[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir $(TOOL_BUILD_DIR)/bin; \
+		[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir -p $(TOOL_BUILD_DIR)/bin; \
 		ln -sf "$(HOST_LZMA_IF_ANY)" "$(TOOL_BUILD_DIR)/bin/lzma"; \
 	fi
 
