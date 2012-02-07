From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue,  7 Feb 2012 14:12:53 +0100
Subject: [Buildroot] [PATCH] sam-ba is host only
In-Reply-To: <1328620373-8784-1-git-send-email-alexandre.belloni@piout.net>
References: <1328620373-8784-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <1328620373-8784-2-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 package/sam-ba/sam-ba.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index d00575c..ad02326 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,9 +1,9 @@
-SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-SAM_BA_VERSION = 2.10
-SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+HOST_SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+HOST_SAM_BA_VERSION = 2.10
+HOST_SAM_BA_SOURCE  = sam-ba_$(HOST_SAM_BA_VERSION).zip
 
 define HOST_SAM_BA_EXTRACT_CMDS
-        unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+        unzip -d $(BUILD_DIR) $(DL_DIR)/$(HOST_SAM_BA_SOURCE)
         mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
         rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
 endef
@@ -16,6 +16,7 @@ endef
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
+	mkdir -p $(HOST_DIR)/usr/bin/
 	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
 endef
 
-- 
1.7.5.4
