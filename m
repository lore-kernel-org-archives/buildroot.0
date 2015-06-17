From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 17 Jun 2015 17:57:58 +0200
Subject: [Buildroot] [PATCH] package/i2c-tools: bump to version 3.1.2
Message-ID: <1434556678-32346-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps version to 3.1.2 and adds support for the recently
introduced python3 support for py-smbus.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/i2c-tools/i2c-tools.hash |  2 +-
 package/i2c-tools/i2c-tools.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index a6c376f..c12ffe8 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256	14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700  i2c-tools-3.1.1.tar.bz2
+sha256	db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441  i2c-tools-3.1.2.tar.bz2
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 6c156ca..5fe4a6f 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,16 +4,23 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.1
+I2C_TOOLS_VERSION = 3.1.2
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
-# Build/install steps mirror the distutil python package type in the python package
-# infrastructure
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+I2C_TOOLS_DEPENDENCIES += python3
+endif
+
+# Build/install steps mirror the distutil python package type in the python package
+# infrastructure
+ifneq ($(filter y,$(BR2_PACKAGE_PYTHON) $(BR2_PACKAGE_PYTHON3)),)
 # BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
 I2C_TOOLS_PYTHON_BASE_ENV = \
 	$(PKG_PYTHON_DISTUTILS_ENV) \
-- 
1.9.1
