From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 18:24:40 +0200
Subject: [Buildroot] [git commit] package/openlayers: do not rely on install
 -D -t
Message-ID: <20191025161920.51B22870DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ec8fa1c747dea07bcdb82b44a4271c55ac8886c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a more standard $(INSTALL) -D solution instead of -D -t, as it
causes some failures in the autobuilders.

Fixes:

  http://autobuild.buildroot.net/results/b473c44ae953dec3e4f88c4e363fb1a84b5e0dc8/

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openlayers/openlayers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 6dadc6d96a..946f1454e4 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -17,8 +17,8 @@ define OPENLAYERS_EXTRACT_CMDS
 endef
 
 define OPENLAYERS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/var/www/ \
-		$(@D)/ol.css $(@D)/ol.js
+	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
+	$(INSTALL) -D -m 0644 $(@D)/ol.js $(TARGET_DIR)/var/www/ol.js
 endef
 
 $(eval $(generic-package))
