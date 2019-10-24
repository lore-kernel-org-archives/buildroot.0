From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu, 24 Oct 2019 12:05:58 +0200
Subject: [Buildroot] [PATCH 1/1] openlayers: do not rely on install -D -t
Message-ID: <20191024100559.23415-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot autobuild's install binary seems to incorrectly handle
install -D -t ...  Thus, use mkdir and avoid install -t.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 6dadc6d96a..b46e5b5aeb 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -17,8 +17,8 @@ define OPENLAYERS_EXTRACT_CMDS
 endef
 
 define OPENLAYERS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/var/www/ \
-		$(@D)/ol.css $(@D)/ol.js
+	mkdir -p $(TARGET_DIR)/var/www/
+	$(INSTALL) -m 0644 $(@D)/ol.css $(@D)/ol.js $(TARGET_DIR)/var/www/
 endef
 
 $(eval $(generic-package))
-- 
2.23.0
