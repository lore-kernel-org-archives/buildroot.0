From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 7 Sep 2008 01:15:02 +0200
Subject: [Buildroot] [PATCH] concierge: fix paths
Message-ID: <200809070115.02913.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

concierge: fix paths

---
 package/java/concierge/concierge.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/java/concierge/concierge.mk b/package/java/concierge/concierge.mk
index e080b20..7426f4c 100644
--- a/package/java/concierge/concierge.mk
+++ b/package/java/concierge/concierge.mk
@@ -20,11 +20,11 @@ $(TARGET_DIR)/usr/lib/concierge/: $(DL_DIR)/concierge
 	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/lib/concierge
 	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
-	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
+	cp -dpf package/java/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/concierge:
-	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
+	cp -dpf package/java/concierge/files/concierge $(TARGET_DIR)/usr/bin/
 	chmod +x $(TARGET_DIR)/usr/bin/concierge
 	touch -c $@
 
-- 
1.5.6.4
