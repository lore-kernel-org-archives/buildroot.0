From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:56:34 +0100
Subject: [Buildroot] [git commit] python-ujson: new package
Message-ID: <20160302202753.88B7380203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0226a0af0f19a90d822cd01e9720cdc20cc771f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-ujson/Config.in         |  7 +++++++
 package/python-ujson/python-ujson.hash |  3 +++
 package/python-ujson/python-ujson.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 11ba42d..ce15775 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -726,6 +726,7 @@ menu "External python modules"
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
