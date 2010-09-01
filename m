From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:59 +0200
Subject: [Buildroot] [PATCH 07/11] Makefile: use long options names for the
	'conf' utility
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <abba28ac7d0cf1c1a83c5c240c45df7716fea6be.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The short option names have been removed as they were starting to
cause too much confusion. See
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=4062f1a4c030157216dc8932e27131975cf7253c
for details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index fd46972..77e0fc7 100644
--- a/Makefile
+++ b/Makefile
@@ -508,25 +508,25 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -o $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --oldconfig $(CONFIG_CONFIG_IN)
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -r $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --randconfig $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -y $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allyesconfig $(CONFIG_CONFIG_IN)
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -n $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allnoconfig $(CONFIG_CONFIG_IN)
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -534,7 +534,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -r $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
@@ -543,7 +543,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -y $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
@@ -552,20 +552,20 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -n $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -d $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --defconfig $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -D $(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
 source-check: allyesconfig
-- 
1.7.0.4
