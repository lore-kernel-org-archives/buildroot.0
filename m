From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 14:14:33 +0200
Subject: [Buildroot] [PATCH] systemd: Pretty fixes
Message-ID: <1436703273-8690-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0a1f00f..ddc3441 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -73,15 +73,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
-	xz 		\
+	xz \
 	libgcrypt
-SYSTEMD_CONF_OPTS += 	\
-	--enable-xz 	\
+SYSTEMD_CONF_OPTS += \
+	--enable-xz	\
 	--enable-gcrypt	\
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-SYSTEMD_CONF_OPTS += 	\
-	--disable-xz 	\
+SYSTEMD_CONF_OPTS += \
+	--disable-xz \
 	--disable-gcrypt
 endif
 
@@ -143,7 +143,8 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
 
-	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs ../../../lib/systemd/system/multi-user.target \
+		$(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
-- 
2.1.4
