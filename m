From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:18:57 +0200
Subject: [Buildroot] [git commit] package/python-pymodbus: switch back to
 github
Message-ID: <20191022201311.96E7C83CF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96c37418b7f0d020ced03d7d0edc965c880bd456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pypi tarball does not contain the license file so switch back to github
until upstream fixes this issue, see
https://github.com/riptideio/pymodbus/issues/401

Fixes:
 - http://autobuild.buildroot.org/results/6701b1e038b58fcd49240ceb7f972885e2e037aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/python-pymodbus.hash | 7 +++----
 package/python-pymodbus/python-pymodbus.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index c44f65e6fc..8fe31f9d71 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5	8842c91cfc5704f8208ce83d233ce947  pymodbus-2.2.0.tar.gz
-sha256	f30bc17c5f0affb017215f28c04c669fcb9f2947a1e1da57984e4854c04cf852  pymodbus-2.2.0.tar.gz
-# Locally computed sha256 checksums
+# # sha256 locally computed
+sha256	088c7ece2a11cad652939719695c457f26f9148cd7d2f4a79872167925180ad5  pymodbus-2.2.0.tar.gz
+# Hash for license file
 sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 9905df5143..d96e21a55c 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYMODBUS_VERSION = 2.2.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/d5/24/9d24899fd9fbea9e9bde5d0073e00649e7eb6f3bbec2bc1fec8df282fa53
+PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,v$(PYTHON_PYMODBUS_VERSION))
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
