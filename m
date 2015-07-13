From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:37:39 +0200
Subject: [Buildroot] [PATCH] lighttpd: fix systemd service activation symlink
Message-ID: <1436812659-30430-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/lighttpd/lighttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 626cd69..d602556 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -88,7 +88,7 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../../../../usr/lib/systemd/lighttpd.service \
+	ln -fs ../../../../usr/lib/systemd/system/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
-- 
2.4.5
