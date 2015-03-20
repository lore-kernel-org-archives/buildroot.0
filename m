From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:05 -0400
Subject: [Buildroot] [PATCH v2 14/25] kodi: move systemd service file to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-15-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/kodi/kodi.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f40fc31..e0d49e6 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -256,11 +256,11 @@ endef
 
 define KODI_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/kodi/kodi.service \
-		$(TARGET_DIR)/etc/systemd/system/kodi.service
+		$(TARGET_DIR)/usr/lib/systemd/system/kodi.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../kodi.service \
+	ln -fs ../../../../usr/lib/systemd/system/kodi.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kodi.service
 endef
 
-- 
2.1.0
