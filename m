From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Thu, 7 Aug 2014 14:10:43 -0700
Subject: [Buildroot] [PATCH 1/1] ti-wl12xx_target_scripts: new package
Message-ID: <1407445843-24031-1-git-send-email-jtheou@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
---
 package/Config.in                                      |  1 +
 package/ti-wl12xx_target_scripts/Config.in             |  7 +++++++
 .../ti-wl12xx_target_scripts.mk                        | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/ti-wl12xx_target_scripts/Config.in
 create mode 100644 package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..d5cb827 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ endif
 	source "package/ti-gfx/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
+	source "package/ti-wl12xx_target_scripts/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
diff --git a/package/ti-wl12xx_target_scripts/Config.in b/package/ti-wl12xx_target_scripts/Config.in
new file mode 100644
index 0000000..0664b3f
--- /dev/null
+++ b/package/ti-wl12xx_target_scripts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TI_WL12XX_TARGET_SCRIPTS
+	bool "ti-wl12xx-target-scripts"
+	help
+	  Script for TI wireless solution - WL12xx and WL18xx
+
+	  https://github.com/TI-OpenLink/wl12xx_target_scripts
+
diff --git a/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk b/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk
new file mode 100644
index 0000000..5b12032
--- /dev/null
+++ b/package/ti-wl12xx_target_scripts/ti-wl12xx_target_scripts.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ti-wl12xx_target_scripts
+#
+################################################################################
+
+TI_WL12XX_TARGET_SCRIPTS_VERSION = 142042970a7827dfd74de2a4c4b91cff57c6b870
+TI_WL12XX_TARGET_SCRIPTS_SITE = $(call github,TI-OpenLink,wl12xx_target_scripts,$(TI_WL12XX_TARGET_SCRIPTS_VERSION))
+TI_WL12XX_TARGET_SCRIPTS_LICENSE = Apache-2.0
+
+define TI_WL12XX_TARGET_SCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/opt/ti/wl12xx_target_scripts
+	cp -R $(@D)/* \
+		$(TARGET_DIR)/opt/ti/wl12xx_target_scripts
+	chmod +x -R $(TARGET_DIR)/opt/ti/wl12xx_target_scripts
+endef
+
+$(eval $(generic-package))
-- 
2.0.3
