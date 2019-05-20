From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:16:08 +0200
Subject: [Buildroot] [git commit branch/next] package/murata-cyw-fw: new
 package
Message-ID: <20190520201019.C572B81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33aefde001586e73aabd9034fc76d10064a5c7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/murata-cyw-fw/Config.in          | 97 +++++++++++++++++++++++++++++++
 package/murata-cyw-fw/murata-cyw-fw.hash |  5 ++
 package/murata-cyw-fw/murata-cyw-fw.mk   | 98 ++++++++++++++++++++++++++++++++
 5 files changed, 202 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 94df850814..293a19530e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1390,6 +1390,7 @@ F:	package/easydbus/
 F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
+F:	package/murata-cyw-fw/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index 9e0624935f..03fdd91411 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ menu "Firmware"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
+	source "package/murata-cyw-fw/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/murata-cyw-fw/Config.in b/package/murata-cyw-fw/Config.in
new file mode 100644
index 0000000000..7530477511
--- /dev/null
+++ b/package/murata-cyw-fw/Config.in
@@ -0,0 +1,97 @@
+config BR2_PACKAGE_MURATA_CYW_FW
+	bool "murata-cyw-fw"
+	help
+	  Murata Wireless firmware, NVRAM and Bluetooth HCD patch files.
+
+	  https://github.com/murata-wireless/cyw-fmac-fw
+	  https://github.com/murata-wireless/cyw-fmac-nvram
+	  https://github.com/murata-wireless/cyw-bt-patch
+
+if BR2_PACKAGE_MURATA_CYW_FW
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43012
+	bool "CYW43012 (1LV)"
+	help
+	  Murata Wireless CYW43012 (1LV) module firmware files.
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43340
+	bool "CYW43340/CYW43341 (1BW)"
+	help
+	  Murata Wireless CYW43340/CYW43341 (1BW) module firmware files.
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43362
+	bool "CYW43362 (SN8000)"
+	help
+	  Murata Wireless CYW43362 (SN8000) module firmware files.
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4339
+	bool "CYW4339 (1CK/ZP)"
+	help
+	  Murata Wireless CYW4339 (1CK/ZP) module firmware files.
+
+choice
+	prompt "CYW4339 module" if BR2_PACKAGE_MURATA_CYW_FW_CYW4339
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK
+	bool "1CK"
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_ZP
+	bool "ZP"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43430
+	bool "CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)"
+	help
+	  Murata Wireless CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)
+	  module firmware files.
+
+choice
+	prompt "CYW43430/CYW4343W/CYW43364 module" if BR2_PACKAGE_MURATA_CYW_FW_CYW43430
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1DX
+	bool "1DX"
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1FX
+	bool "1FX"
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1LN
+	bool "1LN"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43455
+	bool "CYW43455 (1HK/1LC/1MW)"
+	help
+	  Murata Wireless CYW43455 (1HK/1LC/1MW) module firmware files.
+
+choice
+	prompt "CYW43455 module" if BR2_PACKAGE_MURATA_CYW_FW_CYW43455
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1HK
+	bool "1HK"
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1LC
+	bool "1LC"
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1MW
+	bool "1MW"
+
+endchoice
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4354
+	bool "CYW4354 (1BB)"
+	help
+	  Murata Wireless CYW4354 (1BB) module firmware files.
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4356
+	bool "CYW4356 (1CX)"
+	help
+	  Murata Wireless CYW4356 (1CX) module firmware files.
+
+config BR2_PACKAGE_MURATA_CYW_FW_CYW4359
+	bool "CYW4359 (1FD)"
+	help
+	  Murata Wireless CYW4359 (1FD) module firmware files.
+
+endif
diff --git a/package/murata-cyw-fw/murata-cyw-fw.hash b/package/murata-cyw-fw/murata-cyw-fw.hash
new file mode 100644
index 0000000000..c1afb229eb
--- /dev/null
+++ b/package/murata-cyw-fw/murata-cyw-fw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 c3ecf357786d6db6f3283c0ea36ec067b1728f801fd8871694aed1502a82e9bc murata-cyw-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
+sha256 03c140ae04f9c2036678262d6457b9c4b4a9ebb523c5e681af6d57b97c11da37 cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
+sha256 8f23ebb9a262112b62ace1e1bedcdeb00523d9a45e8d48a829d4ca35db4f0280 cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
+sha256 3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c LICENCE.cypress
diff --git a/package/murata-cyw-fw/murata-cyw-fw.mk b/package/murata-cyw-fw/murata-cyw-fw.mk
new file mode 100644
index 0000000000..b99168b875
--- /dev/null
+++ b/package/murata-cyw-fw/murata-cyw-fw.mk
@@ -0,0 +1,98 @@
+################################################################################
+#
+# murata-cyw-fw
+#
+################################################################################
+
+MURATA_CYW_FW_VERSION = 8d87950bfad28c65926695b7357bd8995b60016a
+MURATA_CYW_FW_VERSION_NVRAM = d27f1bf105fa1e5b828e355793b88d4b66188411
+MURATA_CYW_FW_VERSION_BT_PATCH = 748462f0b02ec4aeb500bedd60780ac51c37be31
+MURATA_CYW_FW_SITE = $(call github,murata-wireless,cyw-fmac-fw,$(MURATA_CYW_FW_VERSION))
+MURATA_CYW_FW_EXTRA_DOWNLOADS = \
+	$(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_CYW_FW_VERSION_NVRAM))/cyw-fmac-nvram-$(MURATA_CYW_FW_VERSION_NVRAM).tar.gz \
+	$(call github,murata-wireless,cyw-bt-patch,$(MURATA_CYW_FW_VERSION_BT_PATCH))/cyw-bt-patch-$(MURATA_CYW_FW_VERSION_BT_PATCH).tar.gz
+MURATA_CYW_FW_LICENSE = PROPRIETARY
+MURATA_CYW_FW_LICENSE_FILES = LICENCE.cypress
+MURATA_CYW_FW_REDISTRIBUTE = NO
+
+define MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
+	$(foreach tar,$(notdir $(MURATA_CYW_FW_EXTRA_DOWNLOADS)), \
+		$(call suitable-extractor,$(tar)) $(MURATA_CYW_FW_DL_DIR)/$(tar) | \
+		$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	)
+endef
+MURATA_CYW_FW_POST_EXTRACT_HOOKS += MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
+
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43012) += \
+	brcmfmac43012-sdio.bin \
+	brcmfmac43012-sdio.1LV.clm_blob \
+	brcmfmac43012-sdio.1LV.txt \
+	CYW43012C0.1LV.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43340) += \
+	brcmfmac43340-sdio.bin \
+	brcmfmac43340-sdio.1BW.txt \
+	CYW43341B0.1BW.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43362) += \
+	brcmfmac43362-sdio.bin \
+	brcmfmac43362-sdio.SN8000.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339) += \
+	brcmfmac4339-sdio.bin
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK) += \
+	brcmfmac4339-sdio.1CK.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339_ZP) += \
+	brcmfmac4339-sdio.ZP.txt \
+	CYW4335C0.ZP.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430) += \
+	brcmfmac43430-sdio.bin
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1DX) += \
+	brcmfmac43430-sdio.1DX.clm_blob \
+	brcmfmac43430-sdio.1DX.txt \
+	CYW43430A1.1DX.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1FX) += \
+	brcmfmac43430-sdio.1FX.clm_blob \
+	brcmfmac43430-sdio.1FX.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1LN) += \
+	brcmfmac43430-sdio.1LN.clm_blob \
+	brcmfmac43430-sdio.1LN.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455) += \
+	brcmfmac43455-sdio.bin
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1HK) += \
+	brcmfmac43455-sdio.1HK.clm_blob \
+	brcmfmac43455-sdio.1HK.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1LC) += \
+	brcmfmac43455-sdio.1LC.clm_blob \
+	brcmfmac43455-sdio.1LC.txt
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1MW) += \
+	brcmfmac43455-sdio.1MW.clm_blob \
+	brcmfmac43455-sdio.1MW.txt \
+	CYW4345C0.1MW.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4354) += \
+	brcmfmac4354-sdio.bin \
+	brcmfmac4354-sdio.1BB.clm_blob \
+	brcmfmac4354-sdio.1BB.txt \
+	CYW4350C0.1BB.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4356) += \
+	brcmfmac4356-pcie.bin \
+	brcmfmac4356-pcie.1CX.clm_blob \
+	brcmfmac4356-pcie.1CX.txt \
+	CYW4354A2.1CX.hcd
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4359) += \
+	brcmfmac4359-pcie.bin \
+	brcmfmac4359-pcie.1FD.clm_blob
+
+# Helper that assumes filename with model has two dots (CHIP.MODEL.EXT),
+# but filename without model has only single dot (CHIP.EXT).
+murata-cyw-fw-strip-model = $(shell echo -n $(1) | sed 's/\..*\./\./')
+
+# Helper that strips model name and renames Bluetooth patch files to the ones
+# expected by Linux kernel.
+murata-cyw-fw-file-rename = $(call murata-cyw-fw-strip-model,$(patsubst CYW%,BCM%,$(f)))
+
+define MURATA_CYW_FW_INSTALL_TARGET_CMDS
+	$(foreach f,$(MURATA_CYW_FW_FILES_y), \
+		$(INSTALL) -m 0644 -D $(@D)/$(f) \
+			$(TARGET_DIR)/lib/firmware/brcm/$(call murata-cyw-fw-file-rename,$(f))
+	)
+endef
+
+$(eval $(generic-package))
