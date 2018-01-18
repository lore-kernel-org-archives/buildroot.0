From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:16:16 +0100
Subject: [Buildroot] [git commit] python-txtorcon: new package
Message-ID: <20180118211629.3168483F41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f570c706bf13148b76798705f549cef7d46c0fb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-txtorcon/Config.in            | 15 +++++++++++++++
 package/python-txtorcon/python-txtorcon.hash |  4 ++++
 package/python-txtorcon/python-txtorcon.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 85bb985..00451f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -928,6 +928,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-txtorcon/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
new file mode 100644
index 0000000..c4081ab
--- /dev/null
+++ b/package/python-txtorcon/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_TXTORCON
+	bool "python-txtorcon"
+	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+	help
+	  Twisted-based Tor controller client, with state-tracking and
+	  configuration abstractions.
+
+	  https://github.com/meejah/txtorcon
diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
new file mode 100644
index 0000000..71a2ec5
--- /dev/null
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/txtorcon/json, sha256 locally computed
+md5	4d7380fa7e721c77cac103d971882374  txtorcon-0.19.3.tar.gz
+sha256	f73396667909a3c7a98f4dd865edf4ed6a2518ee5a935d92e18b8a479ec244fd  txtorcon-0.19.3.tar.gz
+sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
new file mode 100644
index 0000000..f75f504
--- /dev/null
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-txtorcon
+#
+################################################################################
+
+PYTHON_TXTORCON_VERSION = 0.19.3
+PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
+PYTHON_TXTORCON_SITE = https://pypi.python.org/packages/05/4b/d2fbfdc08ab83c299f2ad22ba38ea35f71f1c966684f5754e079108a1f64
+PYTHON_TXTORCON_SETUP_TYPE = setuptools
+PYTHON_TXTORCON_LICENSE = MIT
+PYTHON_TXTORCON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
