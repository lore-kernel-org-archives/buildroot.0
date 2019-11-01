From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 21:18:27 -0600
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: enable drbd.service
Message-ID: <20191101031827.17006-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/drbd-utils/drbd-utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index bb28729b40..89c68e2435 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -26,4 +26,10 @@ else
 DRBD_UTILS_CONF_OPTS += --with-udev=no
 endif
 
+define DRBD_UTILS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/drbd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/drbd.service
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
