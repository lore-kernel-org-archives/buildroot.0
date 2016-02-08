From: Schenk, Michael <michael.schenk@albistechnologies.com>
Date: Mon, 8 Feb 2016 16:21:24 +0100
Subject: [Buildroot] [PATCH 1/1] fix typo for libilclient.so on target
Message-ID: <1454944884-49410-1-git-send-email-michael.schenk@albistechnologies.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Schenk, Michael <michael.schenk@albistechnologies.com>
---
 package/rpi-userland/rpi-userland.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 0a25b2d..fbf6fb4 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -35,14 +35,14 @@ RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
 define RPI_USERLAND_EXTRA_LIBS_TARGET
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
-		$(TARGET_DIR)/usr/lib/libilcient.so
+		$(TARGET_DIR)/usr/lib/libilclient.so
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
 
 define RPI_USERLAND_EXTRA_LIBS_STAGING
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
-		$(STAGING_DIR)/usr/lib/libilcient.so
+		$(STAGING_DIR)/usr/lib/libilclient.so
 endef
 RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
 
-- 
1.9.1
