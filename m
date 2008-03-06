From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:22:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20080306182231.7AB031201BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:22:31 -0800 (Thu, 06 Mar 2008)
New Revision: 21222

Log:
fixes for readline makefile

Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2008-03-06 18:22:10 UTC (rev 21221)
+++ trunk/buildroot/package/readline/readline.mk	2008-03-06 18:22:31 UTC (rev 21222)
@@ -10,8 +10,8 @@
 READLINE_CAT:=$(ZCAT)
 READLINE_BINARY:=libhistory.a
 READLINE_SHARED_BINARY:=libhistory.so
-READLINE_TARGET_BINARY:=lib/$(READLINE_BINARY)
-READLINE_TARGET_SHARED_BINARY:=lib/$(READLINE_SHARED_BINARY)
+READLINE_TARGET_BINARY:=usr/lib/$(READLINE_BINARY)
+READLINE_TARGET_SHARED_BINARY:=usr/lib/$(READLINE_SHARED_BINARY)
 
 $(DL_DIR)/$(READLINE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(READLINE_SITE)/$(READLINE_SOURCE)
@@ -39,7 +39,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -73,8 +73,8 @@
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
 	$(MAKE1) DESTDIR=$(TARGET_DIR) \
 		-C $(READLINE_DIR) install-shared uninstall-doc
-	chmod 775 $(TARGET_DIR)/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/lib/libhistory.so.$(READLINE_VERSION)
-	$(STRIPCMD) $(TARGET_DIR)/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/lib/libhistory.so.$(READLINE_VERSION)
+	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
+	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 ifneq ($(strip $(BR2_PACKAGE_READLINE_HEADERS)),y)
 	rm -rf $(TARGET_DIR)/usr/include/readline
 endif
