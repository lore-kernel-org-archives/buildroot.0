From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 06:32:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/elf2flt
Message-ID: <20090128063234.489D2769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 06:32:33 +0000 (Wed, 28 Jan 2009)
New Revision: 25085

Log:
elf2flt: fix link

Seems like recent binutils has pulled in inflate support, so we need to
link with zlib.

Modified:
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk


Changeset:
Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2009-01-28 06:32:28 UTC (rev 25084)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2009-01-28 06:32:33 UTC (rev 25085)
@@ -24,6 +24,7 @@
 
 $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
+		LDFLAGS=-lz \
 		$(ELF2FLT_DIR)/configure \
 		--with-bfd-include-dir=$(BINUTILS_DIR1)/bfd/ \
                --with-binutils-include-dir=$(BINUTILS_DIR)/include/ \
