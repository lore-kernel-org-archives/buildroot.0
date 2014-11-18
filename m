From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 18 Nov 2014 09:29:39 -0500
Subject: [Buildroot] [PATCH] rapidjson: simplify install commands
Message-ID: <1416320979-16563-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/rapidjson/rapidjson.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index ff516c4..6658da2 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -12,18 +12,7 @@ RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
 define RAPIDJSON_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson
-	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/internal
-	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/error
-	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/msinttypes
-	$(INSTALL) -m 0644 $(@D)/include/rapidjson/*.h \
-		$(STAGING_DIR)/usr/include/rapidjson
-	$(INSTALL) -m 0644 $(@D)/include/rapidjson/internal/*.h \
-		$(STAGING_DIR)/usr/include/rapidjson/internal
-	$(INSTALL) -m 0644 $(@D)/include/rapidjson/error/*.h \
-		$(STAGING_DIR)/usr/include/rapidjson/error
-	$(INSTALL) -m 0644 $(@D)/include/rapidjson/msinttypes/*.h \
-		$(STAGING_DIR)/usr/include/rapidjson/msinttypes
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include
 endef
 
 $(eval $(generic-package))
-- 
2.1.3
