From: Julien Corjon <corjon.j@ecagroup.com>
Date: Mon, 16 Apr 2018 15:20:35 +0200
Subject: [Buildroot] [PATCH] package/swupdate: default website have a new API
Message-ID: <20180416132035.22491-1-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018.03 introduce a new website with Websocket asynchronous
communication[1]

[1] https://github.com/sbabic/swupdate/blob/master/doc/source/mongoose.rst

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 8649931eb7..abf46c9256 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -125,7 +125,7 @@ define SWUPDATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
 	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
 		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
-		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
+		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.14.1
