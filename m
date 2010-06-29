From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jun 2010 23:47:49 +0200
Subject: [Buildroot] [git commit master 1/1] Fix: convert leftover
	$(CONFIG)/conf to $(BUILD_DIR)/buildroot-config/conf
Message-ID: <20100629214854.2A68C818DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cf4689f8b1f8e2b3cc44b3395add5f0df4f3bd55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 09be31b..cdd16a2 100644
--- a/Makefile
+++ b/Makefile
@@ -514,13 +514,13 @@ allyesconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -y $(CONFIG_CONFIG_IN)
 
-allnoconfig: $(CONFIG)/conf
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -n $(CONFIG_CONFIG_IN)
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -528,7 +528,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -r $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
@@ -537,7 +537,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -y $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
@@ -546,14 +546,14 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -n $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $(CONFIG)/conf -d $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -d $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
 source-check: allyesconfig
-- 
1.7.1
