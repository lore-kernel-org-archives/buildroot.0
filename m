From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:34:03 +0100
Subject: [Buildroot] [git commit] rapidjson: simplify install commands
Message-ID: <20141201104836.443CD7FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc3f5258d214d435bbe4a4f5a76caba5977421be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/rapidjson.mk |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

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
