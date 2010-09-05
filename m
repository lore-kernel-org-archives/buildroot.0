From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Add support for savedefconfig
Message-ID: <20100905213834.300D48A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e1b1a18ab63ae3ef4eeb7f7cb4406a9cfbb12035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

savedefconfig allows to create a minimal defconfig file from an
existing configuration. For example :

 make O=/path/to/some/buildroot/build/directory savedefconfig

will generate a minimal 'defconfig' file in the main Buildroot source
directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index abe1aa0..c897db7 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig allyesconfig allnoconfig release \
+	defconfig %_defconfig savedefconfig allyesconfig allnoconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
 
@@ -547,6 +547,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(TOPDIR)/defconfig $(CONFIG_CONFIG_IN)
+
 # check if download URLs are outdated
 source-check: allyesconfig
 	$(MAKE) $(EXTRAMAKEARGS) _source-check
-- 
1.7.1
