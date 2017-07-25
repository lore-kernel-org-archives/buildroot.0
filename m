From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:06:58 +0200
Subject: [Buildroot] [git commit] Makefile: add alldefconfig target
Message-ID: <20170725210435.C3A888022D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dab80981d15979eab3aea28a33694396635a52a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is used by Kconfig's merge_config.sh.

No alldefpackageconfig is added, since it's rather pointless: it would
only enable busybox.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3712e47..4251803 100644
--- a/Makefile
+++ b/Makefile
@@ -128,7 +128,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 
 # List of targets and target patterns for which .config doesn't need to be read in
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
+	defconfig %_defconfig allyesconfig allnoconfig alldefconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-%
 
@@ -886,7 +886,7 @@ config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 # no values are set for the legacy options so a subsequent oldconfig
 # will query them. Therefore, run an additional olddefconfig.
 
-randconfig allyesconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --$@ $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
@@ -996,6 +996,7 @@ help:
 	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
+	@echo '  alldefconfig           - New config where all options are set to default'
 	@echo '  randpackageconfig      - New config with random answer to package options'
 	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
