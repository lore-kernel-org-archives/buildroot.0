From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 07:32:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20070626143210.B23F9A4667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 07:32:10 -0700 (Tue, 26 Jun 2007)
New Revision: 18939

Log:
- don't bail out on cc warnings


Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-06-26 14:02:29 UTC (rev 18938)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-06-26 14:32:10 UTC (rev 18939)
@@ -75,8 +75,8 @@
 	(cd $(GDB_TARGET_DIR); rm -rf config.cache ; \
 		gdb_cv_func_sigsetjmp=yes \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
+		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
 		$(GDB_TARGET_CONFIGURE_VARS) \
 		$(GDB_DIR)/configure \
 		--build=$(GNU_HOST_NAME) \
@@ -88,6 +88,7 @@
 		--disable-tui --disable-gdbtk --without-x \
 		--disable-sim --enable-gdbserver \
 		--without-included-gettext \
+		--disable-werror \
 	);
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
