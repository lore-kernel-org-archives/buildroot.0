From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  8 Apr 2015 10:40:09 +0200
Subject: [Buildroot] [PATCH] package/sam-ba: bump to version 2.15
Message-ID: <1428482409-13380-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps to version 2.15 and fixes to the new folder naming.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sam-ba/sam-ba.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index f46cbce..2a3c2a1 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -5,16 +5,15 @@
 ################################################################################
 
 SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
-SAM_BA_VERSION = 2.12
+SAM_BA_VERSION = 2.15
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION).zip
-SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
 define HOST_SAM_BA_EXTRACT_CMDS
 	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-	mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
-	rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
+	mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
+	rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
 endef
 
 # Since it's a prebuilt application and it does not conform to the
-- 
1.9.1
