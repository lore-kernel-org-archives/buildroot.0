From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 30 Jun 2016 09:55:04 +0200
Subject: [Buildroot] [PATCH] python-tomako: new package
Message-ID: <1467273304-2848-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-tomako/Config.in          |  9 +++++++++
 package/python-tomako/python-tomako.hash |  4 ++++
 package/python-tomako/python-tomako.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-tomako/Config.in
 create mode 100644 package/python-tomako/python-tomako.hash
 create mode 100644 package/python-tomako/python-tomako.mk

diff --git a/package/Config.in b/package/Config.in
index 60020e2..af2f8fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ menu "External python modules"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
+	source "package/python-tomako/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-tomako/Config.in b/package/python-tomako/Config.in
new file mode 100644
index 0000000..bd6d299
--- /dev/null
+++ b/package/python-tomako/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TOMAKO
+	bool "python-tomako"
+	select BR2_PACKAGE_PYTHON_TORNADO # runtime
+	select BR2_PACKAGE_PYTHON_MAKO # runtime
+	help
+	  Tomako is the easiest way to use Mako as a template engine for
+	  Tornado.
+
+	  https://github.com/rcmachado/tomako
diff --git a/package/python-tomako/python-tomako.hash b/package/python-tomako/python-tomako.hash
new file mode 100644
index 0000000..678944a
--- /dev/null
+++ b/package/python-tomako/python-tomako.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/tomako/json
+md5	74597762d156f52b8716aced94d51f2a  tomako-0.1.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	e541e6bad009d3f61956b135757d491bf42c97cb441e7c11ef7a0ef6e9460a9f  tomako-0.1.0.tar.gz
diff --git a/package/python-tomako/python-tomako.mk b/package/python-tomako/python-tomako.mk
new file mode 100644
index 0000000..a9eef64
--- /dev/null
+++ b/package/python-tomako/python-tomako.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-tomako
+#
+################################################################################
+
+PYTHON_TOMAKO_VERSION = 0.1.0
+PYTHON_TOMAKO_SOURCE = tomako-$(PYTHON_TOMAKO_VERSION).tar.gz
+PYTHON_TOMAKO_SITE = https://pypi.python.org/packages/66/6f/de5449d401ca6953691c765d7465941e772cf99a3547646edc58cdca452d
+PYTHON_TOMAKO_SETUP_TYPE = setuptools
+PYTHON_TOMAKO_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.1.4
