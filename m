From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:01 -0400
Subject: [Buildroot] [PATCH v2 10/25] dropbear: move systemd service file to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-11-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/dropbear/dropbear.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index f2ae403..bc65d69 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -53,9 +53,9 @@ endef
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
-		$(TARGET_DIR)/lib/systemd/system/dropbear.service
+		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs /lib/systemd/system/dropbear.service \
+	ln -fs ../../../../usr/lib/systemd/system/dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 endef
 
-- 
2.1.0
