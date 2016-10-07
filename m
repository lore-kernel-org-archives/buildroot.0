From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Oct 2016 16:36:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-futures: new package
Message-ID: <20161007143631.24720-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fix license (Thomas)

 package/Config.in                          |  1 +
 package/python-futures/Config.in           |  7 +++++++
 package/python-futures/python-futures.hash |  3 +++
 package/python-futures/python-futures.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-futures/Config.in
 create mode 100644 package/python-futures/python-futures.hash
 create mode 100644 package/python-futures/python-futures.mk

diff --git a/package/Config.in b/package/Config.in
index 68d23b8..1ebdd68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ menu "External python modules"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-futures/Config.in b/package/python-futures/Config.in
new file mode 100644
index 0000000..2eb40e9
--- /dev/null
+++ b/package/python-futures/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FUTURES
+	bool "python-futures"
+	depends on BR2_PACKAGE_PYTHON # not needed for python3
+	help
+	  Backport of the concurrent.futures package from Python 3.2.
+
+	  https://github.com/agronholm/pythonfutures
diff --git a/package/python-futures/python-futures.hash b/package/python-futures/python-futures.hash
new file mode 100644
index 0000000..f0948ae
--- /dev/null
+++ b/package/python-futures/python-futures.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/futures/json, sha256 locally computed
+md5	ced2c365e518242512d7a398b515ff95  futures-3.0.5.tar.gz
+sha256	0542525145d5afc984c88f914a0c85c77527f65946617edb5274f72406f981df  futures-3.0.5.tar.gz
diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
new file mode 100644
index 0000000..8a1afa3
--- /dev/null
+++ b/package/python-futures/python-futures.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-futures
+#
+################################################################################
+
+PYTHON_FUTURES_VERSION = 3.0.5
+PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
+PYTHON_FUTURES_SITE = https://pypi.python.org/packages/55/db/97c1ca37edab586a1ae03d6892b6633d8eaa23b23ac40c7e5bbc55423c78
+PYTHON_FUTURES_SETUP_TYPE = setuptools
+PYTHON_FUTURES_LICENSE = BSD-2c
+PYTHON_FUTURES_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.9.3
