From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat,  6 Feb 2016 23:59:59 +0100
Subject: [Buildroot] [PATCH v4 13/17] python-ujson: new package
In-Reply-To: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454799603-5474-14-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

---
Changes v3 -> v4
  - removed spurious dependency to python2 Config.in (suggested by Y.Yefremov)
  - removed spurious dependency to python2 in python-ujson.mk (suggested by Y.Yefremov)
  - changed license (BSD -> BSD-3c) in python-ujson.mk (suggested by Y.Yefremov; I am
    unable to understand where he got this info; LICENSE file missing in sources)

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                      |  1 +
 package/python-ujson/Config.in         |  7 +++++++
 package/python-ujson/python-ujson.hash |  3 +++
 package/python-ujson/python-ujson.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-ujson/Config.in
 create mode 100644 package/python-ujson/python-ujson.hash
 create mode 100644 package/python-ujson/python-ujson.mk

diff --git a/package/Config.in b/package/Config.in
index 8c079b0..0af00c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
new file mode 100644
index 0000000..d185c98
--- /dev/null
+++ b/package/python-ujson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_UJSON
+	bool "python-ujson"
+	help
+	  UltraJSON is an ultra fast JSON encoder and decoder written
+	  in pure C with bindings for Python 2.5+ and 3.
+
+	  https://pypi.python.org/pypi/ujson
diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
new file mode 100644
index 0000000..2132034
--- /dev/null
+++ b/package/python-ujson/python-ujson.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=42f77b0cce686dfa4da2e68480b1dd24,sha256 locally computed.
+md5	42f77b0cce686dfa4da2e68480b1dd24  ujson-1.35.tar.gz
+sha256	f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86  ujson-1.35.tar.gz
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
new file mode 100644
index 0000000..8d4a12b
--- /dev/null
+++ b/package/python-ujson/python-ujson.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-ujson
+#
+################################################################################
+
+PYTHON_UJSON_VERSION = 1.35
+PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
+PYTHON_UJSON_SITE = http://pypi.python.org/packages/source/u/ujson
+PYTHON_UJSON_LICENSE = BSD-3c
+PYTHON_UJSON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4
