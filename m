From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  6 Jul 2017 19:43:35 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/linuxptp: fix coding style issue
Message-ID: <20170706174336.12294-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Yann for the live review during the Buildroot summer camp.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Petr Kulhavy <brain@jikos.cz>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linuxptp/linuxptp.mk | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index beb2591..0fc85b0 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -11,15 +11,22 @@ LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 
 define LINUXPTP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(MAKE) \
+		KBUILD_OUTPUT=$(TARGET_DIR) \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		-C $(@D) all
 endef
 
 define LINUXPTP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) \
-		$(TARGET_CONFIGURE_OPTS) -C $(@D) install
+	$(TARGET_MAKE_ENV) \
+	$(MAKE) \
+		prefix=/usr \
+		DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) install
 
 	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
 		$(TARGET_DIR)/etc/linuxptp.cfg
-- 
2.9.4
