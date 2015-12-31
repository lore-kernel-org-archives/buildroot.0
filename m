From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 31 Dec 2015 23:08:30 +0100
Subject: [Buildroot] [PATCH] python-smbus-cffi: new package
Message-ID: <1451599710-7304-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-smbus-cffi/Config.in              |  9 +++++++++
 package/python-smbus-cffi/python-smbus-cffi.hash |  3 +++
 package/python-smbus-cffi/python-smbus-cffi.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-smbus-cffi/Config.in
 create mode 100644 package/python-smbus-cffi/python-smbus-cffi.hash
 create mode 100644 package/python-smbus-cffi/python-smbus-cffi.mk

diff --git a/package/Config.in b/package/Config.in
index 8379007..2873d4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "External python modules"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-smbus-cffi/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
diff --git a/package/python-smbus-cffi/Config.in b/package/python-smbus-cffi/Config.in
new file mode 100644
index 0000000..b5c38f5
--- /dev/null
+++ b/package/python-smbus-cffi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SMBUS_CFFI
+	bool "python-smbus-cffi"
+	select BR2_PACKAGE_PYTHON_CFFI
+	help
+	  This Python module allows SMBus access through the I2C /dev
+	  interface on Linux hosts. The host kernel must have I2C
+	  support, I2C device interface support, and a bus adapter driver.
+
+	  https://github.com/bivab/smbus-cffi
diff --git a/package/python-smbus-cffi/python-smbus-cffi.hash b/package/python-smbus-cffi/python-smbus-cffi.hash
new file mode 100644
index 0000000..1e28df9
--- /dev/null
+++ b/package/python-smbus-cffi/python-smbus-cffi.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f621c871bd658ee665751ad78e3b2df9, sha256 locally computed
+md5     f621c871bd658ee665751ad78e3b2df9  smbus-cffi-0.5.1.tar.gz
+sha256  fb4195aaabfc01586863f60d3190b5cb1bf8f12622fd597e23e48768dad6bde8  smbus-cffi-0.5.1.tar.gz
diff --git a/package/python-smbus-cffi/python-smbus-cffi.mk b/package/python-smbus-cffi/python-smbus-cffi.mk
new file mode 100644
index 0000000..8cb78b0
--- /dev/null
+++ b/package/python-smbus-cffi/python-smbus-cffi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-smbus-cffi
+#
+################################################################################
+
+PYTHON_SMBUS_CFFI_VERSION = 0.5.1
+PYTHON_SMBUS_CFFI_SOURCE = smbus-cffi-$(PYTHON_SMBUS_CFFI_VERSION).tar.gz
+PYTHON_SMBUS_CFFI_SITE = https://pypi.python.org/packages/source/s/smbus-cffi
+PYTHON_SMBUS_CFFI_SETUP_TYPE = setuptools
+PYTHON_SMBUS_CFFI_LICENSE = GPLv2+
+PYTHON_SMBUS_CFFI_LICENSE_FILES = LICENSE
+PYTHON_SMBUS_CFFI_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
-- 
2.1.4
