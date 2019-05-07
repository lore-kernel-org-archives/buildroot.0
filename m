From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  7 May 2019 10:32:18 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/murata-wireless-cyw-bt-patch:
 new package
In-Reply-To: <20190507083218.24283-1-m.niestroj@grinn-global.com>
References: <20190507083218.24283-1-m.niestroj@grinn-global.com>
Message-ID: <20190507083218.24283-4-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v1 -> v2:
 - fix mkdir directory path before installing firmware.

 package/murata-wireless/Config.in             |  1 +
 .../murata-wireless-cyw-bt-patch/Config.in    | 47 +++++++++++++++++
 .../murata-wireless-cyw-bt-patch.hash         |  3 ++
 .../murata-wireless-cyw-bt-patch.mk           | 50 +++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk

diff --git a/package/murata-wireless/Config.in b/package/murata-wireless/Config.in
index 9d2ae8b29a..3f26e2f803 100644
--- a/package/murata-wireless/Config.in
+++ b/package/murata-wireless/Config.in
@@ -1,5 +1,6 @@
 menu "murata-wireless"
 
+source "package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in"
 source "package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in"
 source "package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in"
 
diff --git a/package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in b/package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in
new file mode 100644
index 0000000000..61a519e20b
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-bt-patch/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH
+	bool "cyw-bt-patch"
+	help
+	  Murata Wireless Bluetooth HCD patch.
+
+	  https://github.com/murata-wireless/cyw-bt-patch
+
+if BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43012
+	bool "CYW43012 (1LV)"
+	help
+	  Murata Wireless Bluetooth CYW43012 (1LV) module HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43340
+	bool "CYW43340/CYW43341 (1BW)"
+	help
+	  Murata Wireless Bluetooth CYW43340/CYW43341 (1BW) module
+	  HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4339
+	bool "CYW4339 (1CK/ZP)"
+	help
+	  Murata Wireless Bluetooth CYW4339 (1CK/ZP) module
+	  HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43430
+	bool "CYW43430/CYW4343W/CYW43364 (1DX)"
+	help
+	  Murata Wireless Bluetooth CYW43430 (1DX) module HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43455
+	bool "CYW43455 (1MW)"
+	help
+	  Murata Wireless Bluetooth CYW43455 (1MW) module HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4354
+	bool "CYW4354 (1BB)"
+	help
+	  Murata Wireless Bluetooth CYW4354 (1BB) module HCD patch.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4356
+	bool "CYW4356 (1CX)"
+	help
+	  Murata Wireless Bluetooth CYW4356 (1CX) module HCD patch.
+
+endif
diff --git a/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash b/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash
new file mode 100644
index 0000000000..9b9f8db4d1
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8f23ebb9a262112b62ace1e1bedcdeb00523d9a45e8d48a829d4ca35db4f0280 murata-wireless-cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
+sha256 3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c LICENCE.cypress
diff --git a/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk b/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk
new file mode 100644
index 0000000000..abd143fd24
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-bt-patch/murata-wireless-cyw-bt-patch.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# murata-wireless-cyw-bt-patch
+#
+################################################################################
+
+MURATA_WIRELESS_CYW_BT_PATCH_VERSION = 748462f0b02ec4aeb500bedd60780ac51c37be31
+MURATA_WIRELESS_CYW_BT_PATCH_SITE = $(call github,murata-wireless,cyw-bt-patch,$(MURATA_WIRELESS_CYW_BT_PATCH_VERSION))
+MURATA_WIRELESS_CYW_BT_PATCH_LICENSE = PROPRIETARY
+MURATA_WIRELESS_CYW_BT_PATCH_LICENSE_FILES = LICENCE.cypress
+MURATA_WIRELESS_CYW_BT_PATCH_REDISTRIBUTE = NO
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43012),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW43012C0.1LV.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43340),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW43341B0.1BW.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4339),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW4335C0.ZP.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43430),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW43430A1.1DX.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW43455),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW4345C0.1MW.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4354),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW4350C0.1BB.hcd
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_BT_PATCH_CYW4356),y)
+MURATA_WIRELESS_CYW_BT_PATCH_FILES += CYW4354A2.1CX.hcd
+endif
+
+ifneq ($(MURATA_WIRELESS_CYW_BT_PATCH_FILES),)
+define MURATA_WIRELESS_CYW_BT_PATCH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/brcm
+	$(foreach f,$(MURATA_WIRELESS_CYW_BT_PATCH_FILES), \
+		$(INSTALL) -m 0644 $(@D)/$(f) \
+			$(TARGET_DIR)/lib/firmware/brcm/$(call murata-wireless-strip-model,$(patsubst CYW%,BCM%,$(f)))$(sep))
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.21.0
