From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:51:54 +0200
Subject: [Buildroot] [git commit] package/python-snappy: new package
Message-ID: <20200412193844.6D5A58E827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8c17ddcc73c56c568535acc4ffb2b559fd44c7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python library for the snappy compression library from Google.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-snappy/Config.in          | 12 ++++++++++++
 package/python-snappy/python-snappy.hash |  5 +++++
 package/python-snappy/python-snappy.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 644397eff5..ed6b3b699f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1201,6 +1201,7 @@ F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
 F:	package/python-pycares/
+F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-yarl/
diff --git a/package/Config.in b/package/Config.in
index 3657a15fad..ace7dde860 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1149,6 +1149,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
+	source "package/python-snappy/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
diff --git a/package/python-snappy/Config.in b/package/python-snappy/Config.in
new file mode 100644
index 0000000000..fd7f84050f
--- /dev/null
+++ b/package/python-snappy/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SNAPPY
+	bool "python-snappy"
+	depends on BR2_INSTALL_LIBSTDCPP # snappy
+	select BR2_PACKAGE_SNAPPY
+	help
+	  Python library for the snappy compression library from
+	  Google.
+
+	  http://github.com/andrix/python-snappy
+
+comment "python-snappy needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
new file mode 100644
index 0000000000..1e0f96054f
--- /dev/null
+++ b/package/python-snappy/python-snappy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-snappy/json
+md5	82e09ffd44204096fc70d6de14d0ea2f  python-snappy-0.5.4.tar.gz
+sha256	d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2  python-snappy-0.5.4.tar.gz
+# Locally computed sha256 checksums
+sha256	d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
new file mode 100644
index 0000000000..d087c83b10
--- /dev/null
+++ b/package/python-snappy/python-snappy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-snappy
+#
+################################################################################
+
+PYTHON_SNAPPY_VERSION = 0.5.4
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be
+PYTHON_SNAPPY_SETUP_TYPE = setuptools
+PYTHON_SNAPPY_LICENSE = BSD-3-Clause
+PYTHON_SNAPPY_LICENSE_FILES = LICENSE
+PYTHON_SNAPPY_DEPENDENCIES = snappy
+
+$(eval $(python-package))
