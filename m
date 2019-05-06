From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  6 May 2019 21:45:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/murata-wireless-cyw-fmac-fw: new
 package
Message-ID: <20190506194559.11850-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in                             |  1 +
 package/murata-wireless/Config.in             |  5 +
 .../murata-wireless-cyw-fmac-fw/Config.in     | 91 +++++++++++++++++++
 .../murata-wireless-cyw-fmac-fw.hash          |  3 +
 .../murata-wireless-cyw-fmac-fw.mk            | 80 ++++++++++++++++
 package/murata-wireless/murata-wireless.mk    |  9 ++
 6 files changed, 189 insertions(+)
 create mode 100644 package/murata-wireless/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk
 create mode 100644 package/murata-wireless/murata-wireless.mk

diff --git a/package/Config.in b/package/Config.in
index f592e74a99..2133ab9100 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ menu "Firmware"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
+	source "package/murata-wireless/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/murata-wireless/Config.in b/package/murata-wireless/Config.in
new file mode 100644
index 0000000000..93fcb15e46
--- /dev/null
+++ b/package/murata-wireless/Config.in
@@ -0,0 +1,5 @@
+menu "murata-wireless"
+
+source "package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in"
+
+endmenu
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in b/package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in
new file mode 100644
index 0000000000..d4dde56912
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW
+	bool "cyw-fmac-fw"
+	help
+	  Murata Wireless FMAC WiFi firmware.
+
+	  https://github.com/murata-wireless/cyw-fmac-fw
+
+if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43012
+	bool "CYW43012 (1LV)"
+	help
+	  Murata Wireless FMAC WiFi CYW43012 (1LV) module firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43340
+	bool "CYW43340/CYW43341 (1BW)"
+	help
+	  Murata Wireless FMAC WiFi CYW43340/CYW43341 (1BW) module
+	  firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43362
+	bool "CYW43362 (SN8000)"
+	help
+	  Murata Wireless FMAC WiFi CYW43362 (SN8000) module
+	  firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4339
+	bool "CYW4339 (1CK/ZP)"
+	help
+	  Murata Wireless FMAC WiFi CYW4339 (1CK/ZP) module
+	  firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430
+	bool "CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)"
+	help
+	  Murata Wireless FMAC WiFi CYW43430/CYW4343W/CYW43364
+	  (1DX/1FX/1LN) module firmware.
+
+choice
+	prompt "CYW43430/CYW4343W/CYW43364 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1DX
+	bool "1DX"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1FX
+	bool "1FX"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1LN
+	bool "1LN"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455
+	bool "CYW43455 (1HK/1LC/1MW)"
+	help
+	  Murata Wireless FMAC WiFi CYW43455 (1HK/1LC/1MW) module
+	  firmware.
+
+choice
+	prompt "CYW43455 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1HK
+	bool "1HK"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1LC
+	bool "1LC"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1MW
+	bool "1MW"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4354
+	bool "CYW4354 (1BB)"
+	help
+	  Murata Wireless FMAC WiFi CYW4354 (1BB) module
+	  firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4356
+	bool "CYW4356 (1CX)"
+	help
+	  Murata Wireless FMAC WiFi CYW4356 (1CX) module
+	  firmware.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4359
+	bool "CYW4359 (1FD)"
+	help
+	  Murata Wireless FMAC WiFi CYW4359 (1FD) module
+	  firmware.
+
+endif
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash b/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash
new file mode 100644
index 0000000000..42ec54e2fa
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c3ecf357786d6db6f3283c0ea36ec067b1728f801fd8871694aed1502a82e9bc murata-wireless-cyw-fmac-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
+sha256 3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c LICENCE.cypress
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk b/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk
new file mode 100644
index 0000000000..9f6355e340
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-fw/murata-wireless-cyw-fmac-fw.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# murata-wireless-cyw-fmac-fw
+#
+################################################################################
+
+MURATA_WIRELESS_CYW_FMAC_FW_VERSION = 8d87950bfad28c65926695b7357bd8995b60016a
+MURATA_WIRELESS_CYW_FMAC_FW_SITE = $(call github,murata-wireless,cyw-fmac-fw,$(MURATA_WIRELESS_CYW_FMAC_FW_VERSION))
+MURATA_WIRELESS_CYW_FMAC_FW_LICENSE = PROPRIETARY
+MURATA_WIRELESS_CYW_FMAC_FW_LICENSE_FILES = LICENCE.cypress
+MURATA_WIRELESS_CYW_FMAC_FW_REDISTRIBUTE = NO
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43012),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43012-sdio.bin
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43012-sdio.1LV.clm_blob
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43340),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43340-sdio.bin
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43362),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43362-sdio.bin
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4339),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4339-sdio.bin
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43430-sdio.bin
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1DX),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43430-sdio.1DX.clm_blob
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1FX),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43430-sdio.1FX.clm_blob
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43430_1LN),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43430-sdio.1LN.clm_blob
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43455-sdio.bin
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1HK),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43455-sdio.1HK.clm_blob
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1LC),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43455-sdio.1LC.clm_blob
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW43455_1MW),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac43455-sdio.1MW.clm_blob
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4354),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4354-sdio.bin
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4354-sdio.1BB.clm_blob
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4356),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4356-pcie.bin
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4356-pcie.1CX.clm_blob
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_FW_CYW4359),y)
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4359-pcie.bin
+MURATA_WIRELESS_CYW_FMAC_FW_FILES += brcmfmac4359-pcie.1FD.clm_blob
+endif
+
+ifneq ($(MURATA_WIRELESS_CYW_FMAC_FW_FILES),)
+define MURATA_WIRELESS_CYW_FMAC_FW_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/brcm
+	$(foreach f,$(MURATA_WIRELESS_CYW_FMAC_FW_FILES), \
+		$(INSTALL) -m 0644 $(@D)/$(f) \
+			$(TARGET_DIR)/lib/firmware/brcm/$(call murata-wireless-strip-model,$(f))$(sep))
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/package/murata-wireless/murata-wireless.mk b/package/murata-wireless/murata-wireless.mk
new file mode 100644
index 0000000000..e5434f09f0
--- /dev/null
+++ b/package/murata-wireless/murata-wireless.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# murata-wireless
+#
+################################################################################
+
+murata-wireless-strip-model = $(shell echo -n $(1) | sed 's/\..*\./\./')
+
+include $(sort $(wildcard package/murata-wireless/*/*.mk))
-- 
2.21.0
