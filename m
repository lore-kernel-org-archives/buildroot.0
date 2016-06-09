From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:37:07 +0200
Subject: [Buildroot] [git commit] python-dataproperty: new package
Message-ID: <20160609083947.CAA6A81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0ff433b77691a5d7fde3d42b244571e0f55ff1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                    |  1 +
 package/python-dataproperty/Config.in                |  9 +++++++++
 package/python-dataproperty/python-dataproperty.hash |  4 ++++
 package/python-dataproperty/python-dataproperty.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0cb2e7e..d4662f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,6 +654,7 @@ menu "External python modules"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
+	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-django/Config.in"
diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
new file mode 100644
index 0000000..a490b98
--- /dev/null
+++ b/package/python-dataproperty/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DATAPROPERTY
+	bool "python-dataproperty"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Python library for extract property from data.
+
+	  https://github.com/thombashi/DataProperty
diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
new file mode 100644
index 0000000..bed956b
--- /dev/null
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/dataproperty/json
+md5	2c513428b63d7988631c2e6f6c067cb6  DataProperty-0.3.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	566a5e693ed51582df36a066d40673167095ce22187348038b07b7ac1ef9bc64  DataProperty-0.3.0.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
new file mode 100644
index 0000000..0bbe680
--- /dev/null
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dataproperty
+#
+################################################################################
+
+PYTHON_DATAPROPERTY_VERSION = 0.3.0
+PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/05/07/2eb3d18d3efd4d90ac8d532255da04d0c10359eb3bc65d5690579b8bd7b0
+PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
+PYTHON_DATAPROPERTY_LICENSE = MIT
+PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
