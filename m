From: Mike Williams <mike@mikebwilliams.com>
Date: Fri,  6 May 2016 14:30:19 -0400
Subject: [Buildroot] [PATCH 2/2] bluez5_utils: start systemd service on boot
In-Reply-To: <1462559419-20212-1-git-send-email-mike@mikebwilliams.com>
References: <1462559419-20212-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1462559419-20212-2-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/bluez5_utils/bluez5_utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 0a76738..659f05d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -79,4 +79,10 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
+define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bluetooth.service
+endef
+
 $(eval $(autotools-package))
-- 
2.5.0
