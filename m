From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 12 Nov 2019 22:22:29 +0100
Subject: [Buildroot] [PATCH/next] package/raspi-gpio: new package
Message-ID: <1573593749-31151-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/raspi-gpio/Config.in       | 12 ++++++++++++
 package/raspi-gpio/raspi-gpio.hash |  3 +++
 package/raspi-gpio/raspi-gpio.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/raspi-gpio/Config.in
 create mode 100644 package/raspi-gpio/raspi-gpio.hash
 create mode 100644 package/raspi-gpio/raspi-gpio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a196b0..ce9ebd7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1943,6 +1943,7 @@ F:	package/libxml2/
 F:	package/mongoose/
 F:	package/mxml/
 F:	package/python-periphery/
+F:	package/raspi-gpio/
 F:	package/sbc/
 F:	package/stunnel/
 F:	package/tree/
diff --git a/package/Config.in b/package/Config.in
index ec68f89..2afdee7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,7 @@ endmenu
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
+	source "package/raspi-gpio/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/raspi-gpio/Config.in b/package/raspi-gpio/Config.in
new file mode 100644
index 0000000..25c1db0
--- /dev/null
+++ b/package/raspi-gpio/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RASPI_GPIO
+	bool "raspi-gpio"
+	help
+	  Tool to help debug / hack at the BCM283x GPIO.
+	  You can dump the state of a GPIO or (all GPIOs).
+	  You can change a GPIO mode and pulls (and level
+	  if set as an output).
+
+	  Beware this tool writes directly to the BCM283x GPIO reisters,
+	  ignoring anything else that may be using them (like Linux drivers).
+
+	  https://github.com/RPi-Distro/raspi-gpio
diff --git a/package/raspi-gpio/raspi-gpio.hash b/package/raspi-gpio/raspi-gpio.hash
new file mode 100644
index 0000000..8a808b6
--- /dev/null
+++ b/package/raspi-gpio/raspi-gpio.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8f3fb411746d339d69adc398497892883c11d2d715ccbe6d8b0b5a401da73bd5  raspi-gpio-2eaa8b8755a550e34d07c898b90b0d9b3d66fd81.tar.gz
+sha256 6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
diff --git a/package/raspi-gpio/raspi-gpio.mk b/package/raspi-gpio/raspi-gpio.mk
new file mode 100644
index 0000000..7381f75
--- /dev/null
+++ b/package/raspi-gpio/raspi-gpio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# raspi-gpio
+#
+################################################################################
+
+RASPI_GPIO_VERSION = 2eaa8b8755a550e34d07c898b90b0d9b3d66fd81
+RASPI_GPIO_SITE = $(call github,RPi-Distro,raspi-gpio,$(RASPI_GPIO_VERSION))
+RASPI_GPIO_LICENSE = BSD-3-Clause
+RASPI_GPIO_LICENSE_FILES = LICENSE
+RASPI_GPIO_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
