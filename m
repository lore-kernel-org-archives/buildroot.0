From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 12:43:49 +0100
Subject: [Buildroot] [PATCH 3/4] package/python-s3transfer: new package.
In-Reply-To: <20200207114350.31365-1-raphael.melotte@essensium.com>
References: <20200207114350.31365-1-raphael.melotte@essensium.com>
Message-ID: <20200207114350.31365-4-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An Amazon S3 Transfer Manager.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-s3transfer/Config.in              |  9 +++++++++
 package/python-s3transfer/python-s3transfer.hash |  5 +++++
 package/python-s3transfer/python-s3transfer.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-s3transfer/Config.in
 create mode 100644 package/python-s3transfer/python-s3transfer.hash
 create mode 100644 package/python-s3transfer/python-s3transfer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5aa26a88af..4d636ebb47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2079,6 +2079,7 @@ F:	package/ustream-ssl/
 N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
 F:  package/python-botocore/
 F:  package/python-jmespath/
+F:  package/python-s3transfer/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in b/package/Config.in
index 9279ad20c9..9d5d5dba6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1109,6 +1109,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
diff --git a/package/python-s3transfer/Config.in b/package/python-s3transfer/Config.in
new file mode 100644
index 0000000000..6587a5fe39
--- /dev/null
+++ b/package/python-s3transfer/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_S3TRANSFER
+	bool "python-s3transfer"
+	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
+	# runtime, not needed for python3:
+	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
+	help
+	  An Amazon S3 Transfer Manager.
+
+	  https://github.com/boto/s3transfer
diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
new file mode 100644
index 0000000000..6b554607da
--- /dev/null
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/s3transfer/json
+md5	8ca74015d9dc58af26c68276a8867eca  s3transfer-0.2.1.tar.gz
+sha256	6efc926738a3cd576c2a79725fed9afde92378aa5c6a957e3af010cb019fac9d  s3transfer-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
new file mode 100644
index 0000000000..86bdc19eae
--- /dev/null
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-s3transfer
+#
+################################################################################
+
+PYTHON_S3TRANSFER_VERSION = 0.2.1
+PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/39/12/150cd55c606ebca6725683642a8e7068cd6af10f837ce5419a9f16b7fb55
+PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
+PYTHON_S3TRANSFER_LICENSE = Apache-2.0
+PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.23.0
