From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  1 Oct 2007 05:57:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071001125738.6F0DAA45E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-01 05:57:36 -0700 (Mon, 01 Oct 2007)
New Revision: 20162

Log:
- pass configure args for the -target compiler


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 12:56:24 UTC (rev 20161)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 12:57:36 UTC (rev 20162)
@@ -393,6 +393,7 @@
 $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_GCC_FLAGS) \
 		$(GCC_SRC_DIR)/configure \
 		--prefix=/usr \
