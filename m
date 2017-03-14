From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 14 Mar 2017 19:44:26 +0100
Subject: [Buildroot] [PATCH 2/3] tesseract-ocr: new package
In-Reply-To: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
References: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1489517067-3155-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in                                  |  2 ++
 package/tesseract-ocr-data/Config.in               | 15 ++++++++++
 .../tesseract-ocr-data-chi-sim/Config.in           |  6 ++++
 .../tesseract-ocr-data-chi-sim.hash                |  2 ++
 .../tesseract-ocr-data-chi-sim.mk                  | 21 +++++++++++++
 .../tesseract-ocr-data-chi-tra/Config.in           |  6 ++++
 .../tesseract-ocr-data-chi-tra.hash                |  2 ++
 .../tesseract-ocr-data-chi-tra.mk                  | 21 +++++++++++++
 .../tesseract-ocr-data-eng/Config.in               |  6 ++++
 .../tesseract-ocr-data-eng.hash                    |  2 ++
 .../tesseract-ocr-data-eng.mk                      | 21 +++++++++++++
 .../tesseract-ocr-data-fra/Config.in               |  5 ++++
 .../tesseract-ocr-data-fra.hash                    |  2 ++
 .../tesseract-ocr-data-fra.mk                      | 21 +++++++++++++
 .../tesseract-ocr-data-ger/Config.in               |  5 ++++
 .../tesseract-ocr-data-ger.hash                    |  2 ++
 .../tesseract-ocr-data-ger.mk                      | 21 +++++++++++++
 .../tesseract-ocr-data-spa/Config.in               |  5 ++++
 .../tesseract-ocr-data-spa.hash                    |  2 ++
 .../tesseract-ocr-data-spa.mk                      | 21 +++++++++++++
 package/tesseract-ocr-data/tesseract-ocr-data.mk   | 10 +++++++
 package/tesseract-ocr/Config.in                    | 35 ++++++++++++++++++++++
 package/tesseract-ocr/tesseract-ocr.hash           |  3 ++
 package/tesseract-ocr/tesseract-ocr.mk             | 31 +++++++++++++++++++
 24 files changed, 267 insertions(+)
 create mode 100644 package/tesseract-ocr-data/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.hash
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.mk
 create mode 100644 package/tesseract-ocr-data/tesseract-ocr-data.mk
 create mode 100644 package/tesseract-ocr/Config.in
 create mode 100644 package/tesseract-ocr/tesseract-ocr.hash
 create mode 100644 package/tesseract-ocr/tesseract-ocr.mk

diff --git a/package/Config.in b/package/Config.in
index 390560e..a2834a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,8 @@ comment "Graphic applications"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/tesseract-ocr/Config.in"
+	source "package/tesseract-ocr-data/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui06/Config.in"
diff --git a/package/tesseract-ocr-data/Config.in b/package/tesseract-ocr-data/Config.in
new file mode 100644
index 0000000..6fba5bf
--- /dev/null
+++ b/package/tesseract-ocr-data/Config.in
@@ -0,0 +1,15 @@
+menuconfig BR2_PACKAGE_TESSERACT_OCR_DATA
+	bool "tesseract-ocr languages training data"
+	depends on BR2_PACKAGE_TESSERACT_OCR
+	help
+	  This will install the language training data files for tesseract-ocr
+
+if BR2_PACKAGE_TESSERACT_OCR_DATA
+source "package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in"
+source "package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in"
+source "package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in"
+source "package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in"
+source "package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in"
+source "package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in"
+endif
+
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in
new file mode 100644
index 0000000..9e82ef5
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_CHI_SIM
+	bool "Simplified Chinese"
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install Simplified Chinese language training data files
+	  for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.hash b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.hash
new file mode 100644
index 0000000..ccbdbaf
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  323ae74d4a2ff49e932dbb4d6282fe0e67ddfafda075ec85803ecd077207454c  chi_sim.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.mk b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.mk
new file mode 100644
index 0000000..ad31ed5
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/tesseract-ocr-data-chi-sim.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-chi_sim
+#
+################################################################################
+
+TESSERACT_OCR_DATA_CHI_SIM_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_CHI_SIM_SOURCE = chi_sim.traineddata
+TESSERACT_OCR_DATA_CHI_SIM_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_CHI_SIM_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_CHI_SIM_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_CHI_SIM_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_CHI_SIM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_CHI_SIM_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_CHI_SIM_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in
new file mode 100644
index 0000000..c8f2fea
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_CHI_TRA
+	bool "Traditional Chinese"
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install Traditional Chinese language training data files
+	  for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.hash b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.hash
new file mode 100644
index 0000000..9b537bf
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  774d566bd0b36e4b6c07415dfa5b6b57feb2575b1f5f231d7fe01a52dac5dd0e  chi_tra.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.mk b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.mk
new file mode 100644
index 0000000..e2eb732
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/tesseract-ocr-data-chi-tra.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-chi_tra
+#
+################################################################################
+
+TESSERACT_OCR_DATA_CHI_TRA_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_CHI_TRA_SOURCE = chi_tra.traineddata
+TESSERACT_OCR_DATA_CHI_TRA_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_CHI_TRA_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_CHI_TRA_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_CHI_TRA_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_CHI_TRA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_CHI_TRA_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_CHI_TRA_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in
new file mode 100644
index 0000000..f23b9b2
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_ENG
+	bool "English"
+	default y
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install English language training data files for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.hash b/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.hash
new file mode 100644
index 0000000..e46e7d6
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  c0515c9f1e0c79e1069fcc05c2b2f6a6841fb5e1082d695db160333c1154f06d  eng.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.mk b/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.mk
new file mode 100644
index 0000000..0972dc3
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-eng/tesseract-ocr-data-eng.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-eng
+#
+################################################################################
+
+TESSERACT_OCR_DATA_ENG_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_ENG_SOURCE = eng.traineddata
+TESSERACT_OCR_DATA_ENG_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_ENG_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_ENG_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_ENG_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_ENG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_ENG_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_ENG_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in
new file mode 100644
index 0000000..404cd2f
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_FRA
+	bool "French"
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install French language training data files for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.hash b/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.hash
new file mode 100644
index 0000000..fc82376
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  86afb23ad146467f263e8ade56fd3951b1cc28f8c4eebc34f993d3c02d88a7ab  fra.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.mk b/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.mk
new file mode 100644
index 0000000..60908af
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-fra/tesseract-ocr-data-fra.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-fra
+#
+################################################################################
+
+TESSERACT_OCR_DATA_FRA_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_FRA_SOURCE = fra.traineddata
+TESSERACT_OCR_DATA_FRA_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_FRA_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_FRA_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_FRA_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_FRA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_FRA_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_FRA_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in
new file mode 100644
index 0000000..d3c6e85
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_GER
+	bool "German"
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install German language training data files for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.hash b/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.hash
new file mode 100644
index 0000000..7f7f9c9
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  cb7eb42a7e972cec7ef904fe81825d7b547c46df684c814fdb11a930b13bca3a  deu.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.mk b/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.mk
new file mode 100644
index 0000000..dcb2a39
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-ger/tesseract-ocr-data-ger.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-ger
+#
+################################################################################
+
+TESSERACT_OCR_DATA_GER_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_GER_SOURCE = deu.traineddata
+TESSERACT_OCR_DATA_GER_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_GER_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_GER_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_GER_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_GER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_GER_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_GER_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in b/package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in
new file mode 100644
index 0000000..4edb3be
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TESSERACT_OCR_DATA_SPA
+	bool "Spanish"
+	depends on BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  This will install Spanish language training data files for tesseract-ocr
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.hash b/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.hash
new file mode 100644
index 0000000..ce993a0
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  f23985996bbcfe2b57864ccb082783c1c74c87429f04411a04a6ba4d3da2efda  spa.traineddata
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.mk b/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.mk
new file mode 100644
index 0000000..20016fa
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data-spa/tesseract-ocr-data-spa.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tesseract-ocr-data-spa
+#
+################################################################################
+
+TESSERACT_OCR_DATA_SPA_VERSION = $(TESSERACT_OCR_DATA_VERSION)
+TESSERACT_OCR_DATA_SPA_SOURCE = spa.traineddata
+TESSERACT_OCR_DATA_SPA_SITE = $(TESSERACT_OCR_DATA_SITE)
+TESSERACT_OCR_DATA_SPA_LICENSE = Apache-2.0
+
+define TESSERACT_OCR_DATA_SPA_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TESSERACT_OCR_DATA_SPA_SOURCE) $(@D)
+endef
+
+define TESSERACT_OCR_DATA_SPA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TESSERACT_OCR_DATA_SPA_SOURCE) \
+		$(TARGET_DIR)/usr/share/tessdata/$(TESSERACT_OCR_DATA_SPA_SOURCE)
+endef
+
+$(eval $(generic-package))
diff --git a/package/tesseract-ocr-data/tesseract-ocr-data.mk b/package/tesseract-ocr-data/tesseract-ocr-data.mk
new file mode 100644
index 0000000..9434d0c
--- /dev/null
+++ b/package/tesseract-ocr-data/tesseract-ocr-data.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# tesseract-ocr-data
+#
+################################################################################
+
+TESSERACT_OCR_DATA_VERSION = 3.04.00
+TESSERACT_OCR_DATA_SITE = https://github.com/tesseract-ocr/tessdata/raw/$(TESSERACT_OCR_DATA_VERSION)
+
+include $(sort $(wildcard package/tesseract-ocr-data/*/*.mk))
diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
new file mode 100644
index 0000000..7aa4ca6
--- /dev/null
+++ b/package/tesseract-ocr/Config.in
@@ -0,0 +1,35 @@
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8 (C++11)"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+menuconfig BR2_PACKAGE_TESSERACT_OCR
+	bool "tesseract-ocr"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_LEPTONICA
+	select BR2_PACKAGE_TESSERACT_OCR_DATA
+	help
+	  Tesseract is an OCR (Optical Character Recognition) engine,
+	  It can be used directly, or (for programmers) using an API.
+	  It supports a wide variety of languages.
+
+	  https://github.com/tesseract-ocr/tesseract
+
+if BR2_PACKAGE_TESSERACT_OCR
+
+config BR2_PACKAGE_TESSERACT_OCR_JPEG
+    bool "JPEG support"
+    select BR2_PACKAGE_JPEG
+    default y
+
+config BR2_PACKAGE_TESSERACT_OCR_PNG
+    bool "PNG support"
+    select BR2_PACKAGE_LIBPNG
+    default y
+
+config BR2_PACKAGE_TESSERACT_OCR_TIFF
+    bool "TIFF support"
+    select BR2_PACKAGE_TIFF
+
+endif
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
new file mode 100644
index 0000000..84c5ad9
--- /dev/null
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  3fe83e06d0f73b39f6e92ed9fc7ccba3ef734877b76aa5ddaaa778fac095d996  tesseract-ocr-3.05.00.tar.gz
+
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
new file mode 100644
index 0000000..37ac72f
--- /dev/null
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# tesseract-ocr
+#
+################################################################################
+
+TESSERACT_OCR_VERSION = 3.05.00
+TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
+TESSERACT_OCR_LICENSE = Apache-2.0
+TESSERACT_OCR_LICENSE_FILES = COPYING
+
+TESSERACT_OCR_AUTORECONF = YES
+
+TESSERACT_OCR_DEPENDENCIES += leptonica \
+	$(if $(BR2_PACKAGE_TESSERACT_OCR_JPEG),jpeg) \
+	$(if $(BR2_PACKAGE_TESSERACT_OCR_PNG),libpng) \
+	$(if $(BR2_PACKAGE_TESSERACT_OCR_TIFF),tiff)
+
+TESSERACT_OCR_INSTALL_STAGING = YES
+
+TESSERACT_OCR_CONF_ENV += \
+    LIBLEPT_HEADERSDIR=$(STAGING_DIR)/usr/include/leptonica
+
+define TESSERACT_OCR_PRECONFIGURE
+    # Autoreconf step fails due to missing m4 directory
+    mkdir -p $(@D)/m4
+endef
+
+TESSERACT_OCR_PRE_CONFIGURE_HOOKS += TESSERACT_OCR_PRECONFIGURE
+
+$(eval $(autotools-package))
-- 
2.5.0
