From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 15:18:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20061213231802.85C764856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 15:18:02 -0800 (Wed, 13 Dec 2006)
New Revision: 16910

Log:
- Pass the correct compiler when building the target binutils.


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2006-12-13 23:08:48 UTC (rev 16909)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2006-12-13 23:18:02 UTC (rev 16910)
@@ -101,6 +101,7 @@
 $(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
 	mkdir -p $(BINUTILS_DIR2)
 	(cd $(BINUTILS_DIR2); \
+		CC_FOR_BUILD="$(HOSTCC)" \
 		PATH=$(TARGET_PATH) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		CFLAGS_FOR_BUILD="-O2 -g" \
