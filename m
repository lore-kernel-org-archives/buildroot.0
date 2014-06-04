From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue,  3 Jun 2014 21:53:23 -0400
Subject: [Buildroot] [PATCH 1/2] busybox: use SED macro instead of 'sed -i'
Message-ID: <1401846804-2026-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/busybox/busybox.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index af1d13f..3d87cd7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -184,7 +184,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
 		install -D -m 0755 package/busybox/S15watchdog \
 			$(TARGET_DIR)/etc/init.d/S15watchdog && \
-		sed -i s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
+		$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
 			$(TARGET_DIR)/etc/init.d/S15watchdog
 endef
 endif
-- 
1.7.9.5
