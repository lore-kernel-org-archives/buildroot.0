From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Thu, 19 Aug 2010 12:19:17 -0700
Subject: [Buildroot] [PATCH] pppd.mk installs radattr.so twice and omits
	radrealms.so
Message-ID: <1282245557.29366.8.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the pppd.mk (for pppd package) the radattr.so plugin (for radiua) is
installed twice (the second install overwriting the first) but the
radrealms.so plugin is omitted from the install.  This appears to be a
copy-paste error.

Below is patch that corrects this.

signed-off by: Darcy Watkins <dwatkins@tranzeo.com>

Index: buildroot-2010.08_powerpc/package/pppd/pppd.mk
===================================================================
--- buildroot-2010.08_powerpc.orig/package/pppd/pppd.mk
+++ buildroot-2010.08_powerpc/package/pppd/pppd.mk
@@ -55,8 +55,8 @@ $(PPPD_TARGET_INSTALL_TARGET):
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
 	for m in $(PPPD_MANPAGES); do \
 		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
 			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \


Regards,

Darcy
