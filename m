From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 21:06:30 +0200
Subject: [Buildroot] [PATCH] package: Fix source path for systemd's service
Message-ID: <1436814390-32042-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the link would appear broken in output/target it's not that
big a deal but at least it's coherent with what we already have.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/chrony/chrony.mk | 2 +-
 package/dcron/dcron.mk   | 2 +-
 package/exim/exim.mk     | 2 +-
 package/inadyn/inadyn.mk | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index f8012ac..72c4c4b 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -49,7 +49,7 @@ define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/chrony.service \
+	ln -sf ../../../../usr/lib/systemd/system/chrony.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/chrony.service
 endef
 
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 840471f..4a6fc47 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -37,7 +37,7 @@ define DCRON_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dcron/dcron.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/dcron.service \
+	ln -sf ../../../../usr/lib/systemd/system/dcron.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dcron.service
 endef
 
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index d8f41b0..ed6a309 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -137,7 +137,7 @@ define EXIM_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/exim/exim.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/exim.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/exim.service \
+	ln -sf ../../../../usr/lib/systemd/system/exim.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/exim.service
 endef
 
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5c3b0e3..8ceca4c 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -34,7 +34,7 @@ define INADYN_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf /usr/lib/systemd/system/inadyn.service \
+	ln -sf ../../../../usr/lib/systemd/system/inadyn.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/inadyn.service
 endef
 
-- 
2.1.4
