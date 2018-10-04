From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 13:45:11 +0200
Subject: [Buildroot] [git commit] python-passlib: new package
Message-ID: <20181004114850.EDC048C002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bad057ebaab1fa0c6c3040f59b69bc16dc6dbc86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

comprehensive password hashing framework supporting over 30
schemes.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Thomas: fix license, it is BSD-3-Clause]
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-passlib/Config.in           |  7 +++++++
 package/python-passlib/python-passlib.hash |  5 +++++
 package/python-passlib/python-passlib.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e740074b34..28cf84300c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,7 @@ F:	package/python-fire/
 F:	package/python-jsonmodels/
 F:	package/python-lxml/
 F:	package/python-paramiko/
+F:	package/python-passlib/
 F:	package/python-pyasn1/
 F:	package/python-pyroute2/
 F:	package/python-pytz/
diff --git a/package/Config.in b/package/Config.in
index 2e163f1852..73ba0ad8da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -899,6 +899,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-passlib/Config.in"
 	source "package/python-pathlib2/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
diff --git a/package/python-passlib/Config.in b/package/python-passlib/Config.in
new file mode 100644
index 0000000000..23546a18a5
--- /dev/null
+++ b/package/python-passlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PASSLIB
+	bool "python-passlib"
+	help
+	  comprehensive password hashing framework supporting over 30
+	  schemes.
+
+	  https://bitbucket.org/ecollins/passlib
diff --git a/package/python-passlib/python-passlib.hash b/package/python-passlib/python-passlib.hash
new file mode 100644
index 0000000000..8e7f790af0
--- /dev/null
+++ b/package/python-passlib/python-passlib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/passlib/json
+md5	254869dae3fd9f09f0746a3cb29a0b15  passlib-1.7.1.tar.gz
+sha256	3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0  passlib-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256	ae8cd74bd5be7be586c52def8bcddfe817872cf2e0782b159d37f88bf0ff11fc  LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
new file mode 100644
index 0000000000..1a3726b607
--- /dev/null
+++ b/package/python-passlib/python-passlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-passlib
+#
+################################################################################
+
+PYTHON_PASSLIB_VERSION = 1.7.1
+PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
+PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de
+PYTHON_PASSLIB_SETUP_TYPE = setuptools
+PYTHON_PASSLIB_LICENSE = BSD-3-Clause
+PYTHON_PASSLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
