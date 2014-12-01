From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:22:19 +0100
Subject: [Buildroot] [git commit] lighttpd: install configuration files with
	sensible (0644) permissions
Message-ID: <20141201233009.4254F80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb231c7c2fa1e5cd70372aa416a7c63e641e8b09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use the same (0-prefixed) form everywhere.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 804bdd4..8f34561 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -62,29 +62,29 @@ endif
 define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
-	$(INSTALL) -D -m 755 $(@D)/doc/config/lighttpd.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.conf \
 		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
-	$(INSTALL) -D -m 755 $(@D)/doc/config/modules.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/modules.conf \
 		$(TARGET_DIR)/etc/lighttpd/modules.conf
-	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/access_log.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/access_log.conf \
 		$(TARGET_DIR)/etc/lighttpd/conf.d/access_log.conf
-	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/debug.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/debug.conf \
 		$(TARGET_DIR)/etc/lighttpd/conf.d/debug.conf
-	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/dirlisting.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/dirlisting.conf \
 		$(TARGET_DIR)/etc/lighttpd/conf.d/dirlisting.conf
-	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/mime.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/mime.conf \
 		$(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf
 endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
 define LIGHTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/lighttpd/S50lighttpd \
+	$(INSTALL) -D -m 0755 package/lighttpd/S50lighttpd \
 		$(TARGET_DIR)/etc/init.d/S50lighttpd
 endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/lighttpd/lighttpd.service \
+	$(INSTALL) -D -m 0644 package/lighttpd/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
