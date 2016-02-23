From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 00:08:49 +0100
Subject: [Buildroot] [git commit] python-rpi-gpio: new package
Message-ID: <20160302202756.EBC2880203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b054fb3e14192ed94627a2b4eb2d96c557501e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ian Haylock <haylocki@yahoo.co.uk>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-rpi-gpio/Config.in            |  7 +++++++
 package/python-rpi-gpio/python-rpi-gpio.hash |  3 +++
 package/python-rpi-gpio/python-rpi-gpio.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dc68184..2b18147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -717,6 +717,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
new file mode 100755
index 0000000..4f59ebd
--- /dev/null
+++ b/package/python-rpi-gpio/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RPI_GPIO
+	bool "python-rpi-gpio"
+	depends on BR2_arm
+	help
+	  A Python module to control the GPIO on a Raspberry Pi.
+
+	  http://sourceforge.net/p/raspberry-gpio-python
diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
new file mode 100755
index 0000000..8b498f1
--- /dev/null
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -0,0 +1,3 @@
+# md5sum from http://sourceforge.net/projects/raspberry-gpio-python/files/, sha256 calculated locally
+md5	254d0443a436eb241367c487274e7197	RPi.GPIO-0.6.1.tar.gz
+sha256	54e5fb06d9ea1a1389a497fb5a06dfa950c86303b0f4ba89b68c55999d1df064	RPi.GPIO-0.6.1.tar.gz
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
new file mode 100755
index 0000000..e71fdea
--- /dev/null
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rpi-gpio
+#
+################################################################################
+
+PYTHON_RPI_GPIO_VERSION = 0.6.1
+PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
+PYTHON_RPI_GPIO_SITE = http://sourceforge.net/projects/raspberry-gpio-python/files
+PYTHON_RPI_GPIO_LICENSE = MIT
+PYTHON_RPI_GPIO_LICENSE_FILES = LICENSE.txt
+PYTHON_RPI_GPIO_SETUP_TYPE = distutils
+
+$(eval $(python-package))
