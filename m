From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Dec 2015 22:48:33 +0100
Subject: [Buildroot] [PATCH 4/5 v3] boot/at91bootstrap3: Handled generated
	defconfigs
In-Reply-To: <cover.1449697131.git.yann.morin.1998@free.fr>
References: <cover.1449697131.git.yann.morin.1998@free.fr>
Message-ID: <55ecc9e3a3c579b382d1ebb54dfad4b58d20e892.1449697131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam bobroff <sam.bobroff@au1.ibm.com>

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
[yann.morin.1998 at free.fr: move the kconfig-package hunk to the
 corresponding patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index fa67ea6..1910d46 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -41,12 +41,11 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 endef
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_DIR)/board/*/$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
+AT91BOOTSTRAP3_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
 endif
 
-AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_SOURCE_CONFIG)
 AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
 AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 
@@ -55,13 +54,13 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
+ifeq ($(AT91BOOTSTRAP3_KCONFIG_DEFCONFIG),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
+ifeq ($(AT91BOOTSTRAP3_KCONFIG_FILE),)
 $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
 endif
 endif
-- 
1.9.1
