From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 13 Mar 2019 23:02:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/aioblescan: new package
Message-ID: <20190313220253.26245-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python library to scan and decode advertised BLE info.
Uses asyncio.

https://github.com/frawau/aioblescan

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-aioblescan/Config.in              |  7 +++++++
 package/python-aioblescan/python-aioblescan.hash |  5 +++++
 package/python-aioblescan/python-aioblescan.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-aioblescan/Config.in
 create mode 100644 package/python-aioblescan/python-aioblescan.hash
 create mode 100644 package/python-aioblescan/python-aioblescan.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bff5a58a5b..10ba19b647 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -933,6 +933,7 @@ F:	fs/f2fs/
 F:	package/bluez5_utils-headers/
 F:	package/f2fs-tools/
 F:	package/pigpio/
+F:	package/python-aioblescan/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
diff --git a/package/Config.in b/package/Config.in
index 420e6e95a3..f0ddfb76e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -799,6 +799,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
+	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
diff --git a/package/python-aioblescan/Config.in b/package/python-aioblescan/Config.in
new file mode 100644
index 0000000000..dd1acfa095
--- /dev/null
+++ b/package/python-aioblescan/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOBLESCAN
+	bool "python-aioblescan"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Scanning Bluetooth for advertised info with asyncio.
+
+	  https://github.com/frawau/aioblescan
diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
new file mode 100644
index 0000000000..d33162850a
--- /dev/null
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aioblescan/json
+md5	b662f44828a99430d4ed42c843ddb89c  aioblescan-0.2.4.tar.gz
+sha256	d613f24ffdb3dae48d6157443f76708f0c791034036330d00272af6b408b2c6c  aioblescan-0.2.4.tar.gz
+# Locally computed sha256 checksums
+sha256	c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
new file mode 100644
index 0000000000..8a6bda3a65
--- /dev/null
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aioblescan
+#
+################################################################################
+
+PYTHON_AIOBLESCAN_VERSION = 0.2.4
+PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/a9/ad/1e2f41b2036bd76079f88cd94ce35b5a996d937dccaf432ea6b8092d3e11
+PYTHON_AIOBLESCAN_SETUP_TYPE = distutils
+PYTHON_AIOBLESCAN_LICENSE = MIT
+PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.20.1
