From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 11 Dec 2007 12:21:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/elf2flt
Message-ID: <20071211202139.2A21D12802E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-11 12:21:35 -0800 (Tue, 11 Dec 2007)
New Revision: 20641

Log:
enable symlinks for the elft2flt binaries

Modified:
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk


Changeset:
Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2007-12-11 20:13:13 UTC (rev 20640)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2007-12-11 20:21:35 UTC (rev 20641)
@@ -35,6 +35,9 @@
 $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
 	$(MAKE) -C $(ELF2FLT_DIR) all
 	$(MAKE) -C $(ELF2FLT_DIR) install
+	ln -snf $(REAL_GNU_TARGET_NAME)-elf2flt $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-elf2flt
+	ln -snf $(REAL_GNU_TARGET_NAME)-flthdr  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-flthdr
+	ln -snf $(REAL_GNU_TARGET_NAME)-ld.real $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-ld.real
 
 elf2flt: uclibc_target uclibc-configured binutils gcc $(ELF2FLT_DIR)/$(ELF2FLT_BINARY)
 
