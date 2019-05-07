From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  7 May 2019 10:32:17 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/murata-wireless-cyw-fmac-nvram:
 new package
In-Reply-To: <20190507083218.24283-1-m.niestroj@grinn-global.com>
References: <20190507083218.24283-1-m.niestroj@grinn-global.com>
Message-ID: <20190507083218.24283-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v1 -> v2: none

 package/murata-wireless/Config.in             |  1 +
 .../murata-wireless-cyw-fmac-nvram/Config.in  | 91 +++++++++++++++++++
 .../murata-wireless-cyw-fmac-nvram.hash       |  3 +
 .../murata-wireless-cyw-fmac-nvram.mk         | 75 +++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash
 create mode 100644 package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk

diff --git a/package/murata-wireless/Config.in b/package/murata-wireless/Config.in
index 93fcb15e46..9d2ae8b29a 100644
--- a/package/murata-wireless/Config.in
+++ b/package/murata-wireless/Config.in
@@ -1,5 +1,6 @@
 menu "murata-wireless"
 
 source "package/murata-wireless/murata-wireless-cyw-fmac-fw/Config.in"
+source "package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in"
 
 endmenu
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in
new file mode 100644
index 0000000000..1e115f189c
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM
+	bool "cyw-fmac-nvram"
+	help
+	  Murata Wireless FMAC WiFi nvram.
+
+	  https://github.com/murata-wireless/cyw-fmac-nvram
+
+if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43012
+	bool "CYW43012 (1LV)"
+	help
+	  Murata Wireless FMAC WiFi CYW43012 (1LV) module nvram.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43340
+	bool "CYW43340/CYW43341 (1BW)"
+	help
+	  Murata Wireless FMAC WiFi CYW43340/CYW43341 (1BW) module
+	  nvram.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43362
+	bool "CYW43362 (SN8000)"
+	help
+	  Murata Wireless FMAC WiFi CYW43362 (SN8000) module nvram.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339
+	bool "CYW4339 (1CK/ZP)"
+	help
+	  Murata Wireless FMAC WiFi CYW4339 (1CK/ZP) module nvram.
+
+choice
+	prompt "CYW4339 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339_1CK
+	bool "1CK"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339_ZP
+	bool "ZP"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430
+	bool "CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)"
+	help
+	  Murata Wireless FMAC WiFi CYW43430/CYW4343W/CYW43364
+	  (1DX/1FX/1LN) module nvram.
+
+choice
+	prompt "CYW43430/CYW4343W/CYW43364 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1DX
+	bool "1DX"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1FX
+	bool "1FX"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1LN
+	bool "1LN"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455
+	bool "CYW43455 (1HK/1LC/1MW)"
+	help
+	  Murata Wireless FMAC WiFi CYW43455 (1HK/1LC/1MW) module nvram.
+
+choice
+	prompt "CYW43455 module" if BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1HK
+	bool "1HK"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1LC
+	bool "1LC"
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1MW
+	bool "1MW"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4354
+	bool "CYW4354 (1BB)"
+	help
+	  Murata Wireless FMAC WiFi CYW4354 (1BB) module nvram.
+
+config BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4356
+	bool "CYW4356 (1CX)"
+	help
+	  Murata Wireless FMAC WiFi CYW4356 (1CX) module nvram.
+
+endif
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash
new file mode 100644
index 0000000000..2759180241
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 03c140ae04f9c2036678262d6457b9c4b4a9ebb523c5e681af6d57b97c11da37 murata-wireless-cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
+sha256 3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c LICENCE.cypress
diff --git a/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk
new file mode 100644
index 0000000000..81413415e3
--- /dev/null
+++ b/package/murata-wireless/murata-wireless-cyw-fmac-nvram/murata-wireless-cyw-fmac-nvram.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# murata-wireless-cyw-fmac-nvram
+#
+################################################################################
+
+MURATA_WIRELESS_CYW_FMAC_NVRAM_VERSION = d27f1bf105fa1e5b828e355793b88d4b66188411
+MURATA_WIRELESS_CYW_FMAC_NVRAM_SITE = $(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_WIRELESS_CYW_FMAC_NVRAM_VERSION))
+MURATA_WIRELESS_CYW_FMAC_NVRAM_LICENSE = PROPRIETARY
+MURATA_WIRELESS_CYW_FMAC_NVRAM_LICENSE_FILES = LICENCE.cypress
+MURATA_WIRELESS_CYW_FMAC_NVRAM_REDISTRIBUTE = NO
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43012),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43012-sdio.1LV.txt
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43340),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43340-sdio.1BW.txt
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43362),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43362-sdio.SN8000.txt
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339),y)
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339_1CK),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac4339-sdio.1CK.txt
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4339_ZP),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac4339-sdio.ZP.txt
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430),y)
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1DX),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43430-sdio.1DX.txt
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1FX),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43430-sdio.1FX.txt
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43430_1LN),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43430-sdio.1LN.txt
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455),y)
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1HK),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43455-sdio.1HK.txt
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1LC),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43455-sdio.1LC.txt
+endif
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW43455_1MW),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac43455-sdio.1MW.txt
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4354),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac4354-sdio.1BB.txt
+endif
+
+ifeq ($(BR2_PACKAGE_MURATA_WIRELESS_CYW_FMAC_NVRAM_CYW4356),y)
+MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES += brcmfmac4356-pcie.1CX.txt
+endif
+
+ifneq ($(MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES),)
+define MURATA_WIRELESS_CYW_FMAC_NVRAM_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/brcm
+	$(foreach f,$(MURATA_WIRELESS_CYW_FMAC_NVRAM_FILES), \
+		$(INSTALL) -m 0644 $(@D)/$(f) \
+			$(TARGET_DIR)/lib/firmware/brcm/$(call murata-wireless-strip-model,$(f))$(sep))
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.21.0
