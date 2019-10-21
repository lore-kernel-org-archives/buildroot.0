From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:10:45 +0200
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 2.2.0
Message-ID: <20191021170447.795CC8363F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acaa18c13393f68907a21f2612f20eefc7f91443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list.
* Take tarball from PyPI.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/Config.in            | 1 +
 package/python-pymodbus/python-pymodbus.hash | 6 ++++--
 package/python-pymodbus/python-pymodbus.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 49043c10b3..0ba6fb88f0 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
 	  Pymodbus is a full Modbus protocol implementation.
 
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 25f8586752..c44f65e6fc 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,3 +1,5 @@
-# sha256 locally computed
-sha256  e33bd0dfbd2cbd4dbc686ca87f809aebb7d72e940eb5846d5d38bb0f3371b26a  python-pymodbus-1.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pymodbus/json
+md5	8842c91cfc5704f8208ce83d233ce947  pymodbus-2.2.0.tar.gz
+sha256	f30bc17c5f0affb017215f28c04c669fcb9f2947a1e1da57984e4854c04cf852  pymodbus-2.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 0040afd894..9905df5143 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 1.4.0
-PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,v$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_VERSION = 2.2.0
+PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/d5/24/9d24899fd9fbea9e9bde5d0073e00649e7eb6f3bbec2bc1fec8df282fa53
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
