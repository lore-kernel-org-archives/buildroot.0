From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 14 Nov 2019 11:59:47 +0100
Subject: [Buildroot] [PATCH] package/rauc/rauc.mk: add systemd service file
 hook
Message-ID: <20191114105947.21758-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/rauc/rauc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index a49a580..f3434e9 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -30,6 +30,12 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
+define RAUC_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/rauc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rauc.service
+endef
+
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \
-- 
2.11.0
