From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:38:44 +0200
Subject: [Buildroot] [PATCH] minidlna: fix systemd service activation symlink
Message-ID: <1436812724-30857-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/minidlna/minidlna.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 7adb832..3a9ad41 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -37,11 +37,11 @@ endef
 
 define MINIDLNA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
-		$(TARGET_DIR)/lib/systemd/system/minidlnad.service
+		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../minidlnad.service \
+	ln -fs  ../../../../usr/lib/systemd/system/minidlnad.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minidlnad.service
 endef
 
-- 
2.4.5
