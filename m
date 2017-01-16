From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 16 Jan 2017 16:46:19 +0100
Subject: [Buildroot] [PATCH 2/3] python-logbook: new package
In-Reply-To: <20170116154620.27358-1-yegorslists@googlemail.com>
References: <20170116154620.27358-1-yegorslists@googlemail.com>
Message-ID: <20170116154620.27358-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-logbook/Config.in           |  6 ++++++
 package/python-logbook/python-logbook.hash |  3 +++
 package/python-logbook/python-logbook.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-logbook/Config.in
 create mode 100644 package/python-logbook/python-logbook.hash
 create mode 100644 package/python-logbook/python-logbook.mk

diff --git a/package/Config.in b/package/Config.in
index 1766089b0..e03b003fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -709,6 +709,7 @@ menu "External python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-lmdb/Config.in"
+	source "package/python-logbook/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
diff --git a/package/python-logbook/Config.in b/package/python-logbook/Config.in
new file mode 100644
index 000000000..9ae914432
--- /dev/null
+++ b/package/python-logbook/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LOGBOOK
+	bool "python-logbook"
+	help
+	  A logging replacement for Python.
+
+	  http://logbook.pocoo.org/
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
new file mode 100644
index 000000000..1a79046c3
--- /dev/null
+++ b/package/python-logbook/python-logbook.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/logbook/json, sha256 locally computed
+md5	22fea705e067c118925898f0c30b0508  Logbook-1.0.0.tar.gz
+sha256	87da2515a6b3db866283cb9d4e5a6ec44e52a1d556ebb2ea3b6e7e704b5f1872  Logbook-1.0.0.tar.gz
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
new file mode 100644
index 000000000..291237973
--- /dev/null
+++ b/package/python-logbook/python-logbook.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-logbook
+#
+################################################################################
+
+PYTHON_LOGBOOK_VERSION = 1.0.0
+PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
+PYTHON_LOGBOOK_SITE = https://pypi.python.org/packages/34/e8/6419c217bbf464fe8a902418120cccaf476201bd03b50958db24d6e90f65
+PYTHON_LOGBOOK_SETUP_TYPE = setuptools
+PYTHON_LOGBOOK_LICENSE = BSD-3c
+
+$(eval $(python-package))
-- 
2.11.0
