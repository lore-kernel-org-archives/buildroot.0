From: hyfinglists at gmail.com <hyfinglists@gmail.com>
Date: Wed, 14 Mar 2018 12:15:28 +0100
Subject: [Buildroot] [PATCH] python-pymodbus: new package
Message-ID: <1521026128-23638-1-git-send-email-hyfinglists@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Falco Hyfing <hyfinglists@gmail.com>

Add python-pymodbus to be used for Modbus operations

Signed-off-by: Falco Hyfing <hyfinglists@gmail.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-pymodbus/Config.in            |  5 +++++
 package/python-pymodbus/python-pymodbus.hash |  3 +++
 package/python-pymodbus/python-pymodbus.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/python-pymodbus/Config.in
 create mode 100644 package/python-pymodbus/python-pymodbus.hash
 create mode 100644 package/python-pymodbus/python-pymodbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e..48d3426 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -663,6 +663,9 @@ F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
 
+N:	Falco Hyfing <hyfinglists@gmail.com>
+F:	package/python-pymodbus/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index 449ffcc..a6efa1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -872,6 +872,7 @@ menu "External python modules"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
+	source "package/python-pymodbus/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
new file mode 100644
index 0000000..cafab6f
--- /dev/null
+++ b/package/python-pymodbus/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_PYMODBUS
+	bool "python-pymodbus"
+	select BR2_PACKAGE_PYTHON_SIX
+	help
+		Pymodbus is a full Modbus protocol implementation.
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
new file mode 100644
index 0000000..c930795
--- /dev/null
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  e33bd0dfbd2cbd4dbc686ca87f809aebb7d72e940eb5846d5d38bb0f3371b26a  python-pymodbus-v1.4.0.tar.gz
+sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
new file mode 100644
index 0000000..40470fe
--- /dev/null
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pymodbus
+#
+################################################################################
+
+PYTHON_PYMODBUS_VERSION = v1.4.0
+PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_SETUP_TYPE = setuptools
+PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
+PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
+
+$(eval $(python-package))
-- 
2.1.4
