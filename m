From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Sun,  8 Mar 2015 09:28:13 +0100
Subject: [Buildroot] [PATCH V2] python: spidev: add spidev plugin to manage
	spi from userspace
Message-ID: <1425803293-25109-1-git-send-email-michael@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

---

Changes for V2:
- this package supports both Python 2.x and 3.x.
  Remove depends on BR2_PACKAGE_PYTHON.

---
 package/Config.in                      |  1 +
 package/python-spidev/Config.in        |  7 +++++++
 package/python-spidev/python-spidev.mk | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-spidev/Config.in
 create mode 100644 package/python-spidev/python-spidev.mk

diff --git a/package/Config.in b/package/Config.in
index 584887b..8814a07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,6 +576,7 @@ menu "external python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-spidev/Config.in b/package/python-spidev/Config.in
new file mode 100644
index 0000000..8540d55
--- /dev/null
+++ b/package/python-spidev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SPIDEV
+	bool "python-spidev"
+	help
+	  Python module for interfacing with SPI devices from user
+	  space via the spidev linux kernel driver.
+
+	  https://pypi.python.org/pypi/spidev
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
new file mode 100644
index 0000000..b6e1fce
--- /dev/null
+++ b/package/python-spidev/python-spidev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-spidev
+#
+################################################################################
+
+PYTHON_SPIDEV_VERSION = 3.0
+PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
+PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/source/s/spidev
+PYTHON_SPIDEV_SETUP_TYPE = distutils
+PYTHON_SPIDEV_LICENSE = GPLv2
+PYTHON_SPIDEV_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
1.9.1
