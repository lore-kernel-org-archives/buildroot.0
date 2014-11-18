From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 14:21:41 +0100
Subject: [Buildroot] [git commit branch/next] rapidjson: bump to latest
	GitHub master
Message-ID: <20141118132439.87CF0B4872@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30a208b9ef21a7b830b04e68828653407a7af1bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

RapidJSON is now hosted on GitHub and its latest version
includes many fixes and features added since 2012.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/rapidjson.mk |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 68e010e..ff516c4 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,27 +4,26 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = 0.11
-RAPIDJSON_SOURCE = rapidjson-$(RAPIDJSON_VERSION).zip
-RAPIDJSON_SITE = http://rapidjson.googlecode.com/files
+RAPIDJSON_VERSION = 39f5eeb764c6d1e1cbff1717410d9710bf943009
+RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
-define RAPIDJSON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDJSON_SOURCE)
-	mv $(@D)/rapidjson/* $(@D)
-	$(RM) -r $(@D)/rapidjson
-endef
-
 define RAPIDJSON_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson
 	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/internal
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/error
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/msinttypes
 	$(INSTALL) -m 0644 $(@D)/include/rapidjson/*.h \
 		$(STAGING_DIR)/usr/include/rapidjson
 	$(INSTALL) -m 0644 $(@D)/include/rapidjson/internal/*.h \
 		$(STAGING_DIR)/usr/include/rapidjson/internal
+	$(INSTALL) -m 0644 $(@D)/include/rapidjson/error/*.h \
+		$(STAGING_DIR)/usr/include/rapidjson/error
+	$(INSTALL) -m 0644 $(@D)/include/rapidjson/msinttypes/*.h \
+		$(STAGING_DIR)/usr/include/rapidjson/msinttypes
 endef
 
 $(eval $(generic-package))
