From: Doug Kehn <rdkehn@yahoo.com>
Date: Sun,  7 Jun 2015 21:56:09 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/pppd: install pon, poff scripts
Message-ID: <1433732169-28125-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
Changes v1 -> v2
  - Remove config option and just install scripts (Baruch Siach)

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/pppd/pppd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0f9945f..554b830 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -98,6 +98,8 @@ define PPPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/openl2tp.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/pon $(TARGET_DIR)/usr/bin/pon
+	$(INSTALL) -D -m 0755 $(PPPD_DIR)/scripts/poff $(TARGET_DIR)/usr/bin/poff
 	$(PPPD_INSTALL_RADIUS)
 endef
 
-- 
2.4.2
