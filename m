From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri,  5 Feb 2016 19:18:53 +0100
Subject: [Buildroot] [PATCH v3 13/17] python-ujson: new package
In-Reply-To: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454696337-9692-14-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 2fbc06b..e3e621e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -725,6 +725,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
new file mode 100644
index 0000000..eab5bd3
--- /dev/null
+++ b/package/python-ujson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_UJSON
+	bool "python-ujson"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3.
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
index 0000000..f7bb0ed
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
+PYTHON_UJSON_LICENSE = BSD
+PYTHON_UJSON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4
