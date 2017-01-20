From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:18:55 +1100
Subject: [Buildroot] [git commit] python-toml: new package
Message-ID: <20170120021901.8EB0581810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23f0a280d1d75fc739e6847ebe9b27e3b5c03707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use GitHub instead of PyPI because PyPI release if out-of-date.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-toml/Config.in        |  6 ++++++
 package/python-toml/python-toml.hash |  2 ++
 package/python-toml/python-toml.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8c8c33e..1766089 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -800,6 +800,7 @@ menu "External python modules"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
+	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-toml/Config.in b/package/python-toml/Config.in
new file mode 100644
index 0000000..a41622f
--- /dev/null
+++ b/package/python-toml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TOML
+	bool "python-toml"
+	help
+	  Python Library for Tom's Obvious, Minimal Language.
+
+	  https://github.com/uiri/toml
diff --git a/package/python-toml/python-toml.hash b/package/python-toml/python-toml.hash
new file mode 100644
index 0000000..cbc71a9
--- /dev/null
+++ b/package/python-toml/python-toml.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	aee9679726f42fb09f48b9701a321571e0b6a51305c3e0f3913b3057d8bf7083  python-toml-0.9.2.tar.gz
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
new file mode 100644
index 0000000..fec113e
--- /dev/null
+++ b/package/python-toml/python-toml.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-toml
+#
+################################################################################
+
+PYTHON_TOML_VERSION = 0.9.2
+PYTHON_TOML_SITE = $(call github,uiri,toml,$(PYTHON_TOML_VERSION))
+PYTHON_TOML_SETUP_TYPE = distutils
+PYTHON_TOML_LICENSE = MIT
+PYTHON_TOML_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
