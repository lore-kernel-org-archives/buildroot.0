From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:27:26 +0200
Subject: [Buildroot] [git commit] python-tomako: new package
Message-ID: <20160701132941.A5E4B81D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a4f44802baf4cbb34c674e167dda6029df9282f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-tomako/Config.in          |  9 +++++++++
 package/python-tomako/python-tomako.hash |  4 ++++
 package/python-tomako/python-tomako.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8eeca31..ead675b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -769,6 +769,7 @@ menu "External python modules"
 	source "package/python-socketio/Config.in"
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
