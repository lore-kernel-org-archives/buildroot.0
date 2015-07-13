From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:53:10 +0200
Subject: [Buildroot] [PATCH] nginx: activate the systemd service
Message-ID: <1436813590-3644-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/nginx/nginx.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index c617f68..32a337c 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -230,6 +230,11 @@ endef
 define NGINX_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/nginx/nginx.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nginx.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nginx.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nginx.service
 endef
 
 define NGINX_INSTALL_INIT_SYSV
-- 
2.4.5
