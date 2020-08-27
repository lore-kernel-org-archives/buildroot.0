From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:01:04 +0200
Subject: [Buildroot] [git commit] package/python-packaging: new package
Message-ID: <20200902161636.B980585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1563a5b101e7ed838f363d1c04b3430c2db0f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-packaging/Config.in             |  8 ++++++++
 package/python-packaging/python-packaging.hash |  7 +++++++
 package/python-packaging/python-packaging.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0c6de8d5d..d49b927756 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1597,6 +1597,7 @@ F:	package/luaossl/
 F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
+F:	package/python-packaging/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 85a6f44910..15329929e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1046,6 +1046,7 @@ menu "External python modules"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
+	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
new file mode 100644
index 0000000000..5a8135cd57
--- /dev/null
+++ b/package/python-packaging/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PACKAGING
+	bool "python-packaging"
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Core utilities for Python packages.
+
+	  https://github.com/pypa/packaging
diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
new file mode 100644
index 0000000000..112bc695f6
--- /dev/null
+++ b/package/python-packaging/python-packaging.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/packaging/json
+md5  19e0d1f82a9007b448650ccfeffd0a26  packaging-20.3.tar.gz
+sha256  3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3  packaging-20.3.tar.gz
+# Locally computed sha256 checksums
+sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
+sha256  b70e7e9b742f1cc6f948b34c16aa39ffece94196364bc88ff0d2180f0028fac5  LICENSE.BSD
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
new file mode 100644
index 0000000000..bd5177e8e5
--- /dev/null
+++ b/package/python-packaging/python-packaging.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-packaging
+#
+################################################################################
+
+PYTHON_PACKAGING_VERSION = 20.3
+PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/65/37/83e3f492eb52d771e2820e88105f605335553fe10422cba9d256faeb1702
+PYTHON_PACKAGING_SETUP_TYPE = setuptools
+PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
+PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+
+$(eval $(python-package))
