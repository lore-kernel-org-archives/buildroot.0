From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 12 Apr 2012 10:25:14 +0200
Subject: [Buildroot] [PATCH] Bump sam-ba version to 2.11
Message-ID: <1334219114-9988-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/sam-ba/sam-ba.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index d00575c..d5ab9f6 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,11 +1,11 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-SAM_BA_VERSION = 2.10
+SAM_BA_VERSION = 2.11
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 
 define HOST_SAM_BA_EXTRACT_CMDS
         unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-        mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
-        rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
+        mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
+        rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
 endef
 
 # Since it's a prebuilt application and it does not conform to the
-- 
1.7.5.4
