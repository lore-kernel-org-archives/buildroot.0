From: Falco Hyfing <hyfinglists@gmail.com>
Date: Tue, 13 Mar 2018 13:26:03 +0100
Subject: [Buildroot] [PATCH] Add python-pymodbus
Message-ID: <CAChPQeAwwwuAaqHB4+YbmAfphM_E+2CemmJL-uNZuFAK4DjSHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add python-pymodbus to be used for Modbus operations

Signed-off-by: Falco Hyfing <hyfinglists@gmail.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-pymodbus/Config.in          |  5 +++++
 package/python-pymodbus/python-pymodbus.mk | 12 ++++++++++++
 4 files changed, 21 insertions(+)
 create mode 100644 package/python-pymodbus/Config.in
 create mode 100644 package/python-pymodbus/python-pymodbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e..48d3426 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -663,6 +663,9 @@ F:    package/safeclib/
 F:    package/tinycbor/
 F:    package/tinydtls/

+N:    Falco Hyfing <hyfinglists@gmail.com>
+F:    package/python-pymodbus/
+
 N:    Floris Bos <bos@je-eigen-domein.nl>
 F:    package/ipmitool/
 F:    package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index 449ffcc..a6efa1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -872,6 +872,7 @@ menu "External python modules"
     source "package/python-pyinotify/Config.in"
     source "package/python-pylibftdi/Config.in"
     source "package/python-pylru/Config.in"
+    source "package/python-pymodbus/Config.in"
     source "package/python-pymysql/Config.in"
     source "package/python-pynacl/Config.in"
     source "package/python-pyopenssl/Config.in"
diff --git a/package/python-pymodbus/Config.in
b/package/python-pymodbus/Config.in
new file mode 100644
index 0000000..493ed4e
--- /dev/null
+++ b/package/python-pymodbus/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_PYMODBUS
+    bool "python-pymodbus"
+    select BR2_PACKAGE_PYTHON_SIX
+    help
+        Pymodbus is a full Modbus protocol implementation
diff --git a/package/python-pymodbus/python-pymodbus.mk
b/package/python-pymodbus/python-pymodbus.mk
new file mode 100644
index 0000000..5af7803
--- /dev/null
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-pymodbus
+#
+################################################################################
+
+PYTHON_PYMODBUS_VERSION = v1.4.0
+PYTHON_PYMODBUS_SITE = $(call
github,riptideio,pymodbus,$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_LICENSE = BSD License
+PYTHON_PYMODBUS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4
