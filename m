From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 04:38:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20071213123816.2C05D12010E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 04:38:13 -0800 (Thu, 13 Dec 2007)
New Revision: 20649

Log:
make e2fsprogs generate relative symlinks in the root

Added:
   trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch


Changeset:
Added: trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch	                        (rev 0)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch	2007-12-13 12:38:13 UTC (rev 20649)
@@ -0,0 +1,12 @@
+diff -ur e2fsprogs-1.39/lib/Makefile.elf-lib e2fsprogs-1.39.fixed/lib/Makefile.elf-lib
+--- e2fsprogs-1.39/lib/Makefile.elf-lib	2006-03-11 10:37:57.000000000 +1100
++++ e2fsprogs-1.39.fixed/lib/Makefile.elf-lib	2007-10-31 17:37:43.000000000 +1100
+@@ -45,7 +45,7 @@
+ 	@echo "	SYMLINK $(ELF_INSTALL_DIR)/$(ELF_SONAME)"
+ 	@$(LN_S) -f $(ELF_LIB) $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME)
+ 	@echo "	SYMLINK $(libdir)/$(ELF_IMAGE).so"
+-	@$(LN_S) -f $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
++	@$(LN_S) -f $(ELF_SONAME) \
+ 		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
+ 	@echo "	LDCONFIG"
+ 	@-$(LDCONFIG)
