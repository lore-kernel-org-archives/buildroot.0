From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon,  9 Nov 2020 20:12:10 +0100
Subject: [Buildroot] [PATCH] package/python-esptool: bump version to v3.0
Message-ID: <20201109191210.1037530-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib module is required since the v3.0 version.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/python-esptool/Config.in           | 1 +
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 08b84e3e08..7d3579abdc 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
 	select BR2_PACKAGE_PYTHON_PYAES # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB # runtime
 	help
 	  A serial utility to communicate & flash code to Espressif
 	  ESP8266 & ESP32 chips.
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index b4dac7ed51..3b030ec75b 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5	d17b9293910773045b9de0d5caa0597d  esptool-2.8.tar.gz
-sha256	1e4288d9f00e55ba36809cc79c493643c623bfa036d7b019a0ebe396284bc317  esptool-2.8.tar.gz
+md5	ccd2855e14c298712aeb37ac063baad5  esptool-3.0.tar.gz
+sha256	87953d235fed2c9adb1292b3769df0149686c9afdb1896dd963f730453cbc934  esptool-3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 0cdc98ce16..e9e3eb6b59 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 2.8
+PYTHON_ESPTOOL_VERSION = 3.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/68/91/08c182f66fa3f12a96e754ae8ec7762abb2d778429834638f5746f81977a
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/dd/3d/d1d4c004927e6e6807c441ce70330ed969c725d2906053fbd2ff994b4439
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.29.2
