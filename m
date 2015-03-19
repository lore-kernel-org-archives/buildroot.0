From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:39 -0400
Subject: [Buildroot] [PATCH 07/15] irqbalance: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-8-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/irqbalance/irqbalance.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index e3ef0bb..536d0e0 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -26,9 +26,9 @@ endef
 
 define IRQBALANCE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/irqbalance/irqbalance.service \
-		$(TARGET_DIR)/etc/systemd/system/irqbalance.service
+		$(TARGET_DIR)/usr/lib/systemd/system/irqbalance.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../irqbalance.service \
+	ln -fs /usr/lib/systemd/system/irqbalance.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/irqbalance.service
 endef
 
-- 
2.1.0
