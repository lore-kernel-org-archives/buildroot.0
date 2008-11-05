From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 00:43:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/make
Message-ID: <20081105084304.B10773C871@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 00:43:04 -0800 (Wed, 05 Nov 2008)
New Revision: 23931

Log:
make: add gettext dependency to make rule instead of TARGETS

This patch adds gettext dependency to make: rule instead of the TARGETS
variable if locale is selected. Just to conform with common syntax.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/make/make.mk


Changeset:
Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2008-11-05 08:18:16 UTC (rev 23930)
+++ trunk/buildroot/package/make/make.mk	2008-11-05 08:43:04 UTC (rev 23931)
@@ -56,7 +56,7 @@
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
-make: uclibc $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
+make: uclibc $(if $(BR2_PACKAGE_GETTEXT),gettext) $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
 
 make-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) uninstall
@@ -71,5 +71,5 @@
 #
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_MAKE)),y)
-TARGETS+=$(if $(BR2_PACKAGE_GETTEXT),gettext) make
+TARGETS+=make
 endif
