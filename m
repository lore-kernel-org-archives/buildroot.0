From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:39:56 +0200
Subject: [Buildroot] [git commit] python-pymodbus: new package
Message-ID: <20180325214007.987AE83BC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b30ee93248f93012d427ebd0211039095a6a3fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Falco Hyfing <hyfinglists@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-pymodbus/Config.in            |  7 +++++++
 package/python-pymodbus/python-pymodbus.hash |  3 +++
 package/python-pymodbus/python-pymodbus.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 031af3cdd0..fcc057aac1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -668,6 +668,9 @@ F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
 
+N:	Falco Hyfing <hyfinglists@gmail.com>
+F:	package/python-pymodbus/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index 992d670bb8..2f9210a04e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -874,6 +874,7 @@ menu "External python modules"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
+	source "package/python-pymodbus/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
new file mode 100644
index 0000000000..49043c10b3
--- /dev/null
+++ b/package/python-pymodbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYMODBUS
+	bool "python-pymodbus"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Pymodbus is a full Modbus protocol implementation.
+
+	  https://github.com/riptideio/pymodbus
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
new file mode 100644
index 0000000000..c930795eb1
--- /dev/null
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  e33bd0dfbd2cbd4dbc686ca87f809aebb7d72e940eb5846d5d38bb0f3371b26a  python-pymodbus-v1.4.0.tar.gz
+sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
new file mode 100644
index 0000000000..40470fe92e
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
