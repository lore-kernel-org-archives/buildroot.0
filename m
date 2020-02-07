From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 12:43:47 +0100
Subject: [Buildroot] [PATCH 1/4] package/python-jmespath: new package.
In-Reply-To: <20200207114350.31365-1-raphael.melotte@essensium.com>
References: <20200207114350.31365-1-raphael.melotte@essensium.com>
Message-ID: <20200207114350.31365-2-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JMESPath is a query language for JSON.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-jmespath/Config.in            |  6 ++++++
 package/python-jmespath/python-jmespath.hash |  5 +++++
 package/python-jmespath/python-jmespath.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-jmespath/Config.in
 create mode 100644 package/python-jmespath/python-jmespath.hash
 create mode 100644 package/python-jmespath/python-jmespath.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8ea23e0b3..ea44b0709a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2076,6 +2076,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
+F:  package/python-jmespath/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/paho-mqtt-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..920de84a7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,6 +981,7 @@ menu "External python modules"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jinja2/Config.in"
+	source "package/python-jmespath/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-jmespath/Config.in b/package/python-jmespath/Config.in
new file mode 100644
index 0000000000..7bcd8f6a19
--- /dev/null
+++ b/package/python-jmespath/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JMESPATH
+	bool "python-jmespath"
+	help
+	  JMESPath is a query language for JSON.
+
+	  https://github.com/jmespath/jmespath.py
diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
new file mode 100644
index 0000000000..6114ff0192
--- /dev/null
+++ b/package/python-jmespath/python-jmespath.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jmespath/json
+md5	5c3380a84c565d7438e4766fd4b7a775  jmespath-0.9.4.tar.gz
+sha256	bde2aef6f44302dfb30320115b17d030798de8c4110e28d5cf6cf91a7a31074c  jmespath-0.9.4.tar.gz
+# Locally computed sha256 checksums
+sha256	66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
new file mode 100644
index 0000000000..4afd06fd48
--- /dev/null
+++ b/package/python-jmespath/python-jmespath.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jmespath
+#
+################################################################################
+
+PYTHON_JMESPATH_VERSION = 0.9.4
+PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/2c/30/f0162d3d83e398c7a3b70c91eef61d409dea205fb4dc2b47d335f429de32
+PYTHON_JMESPATH_SETUP_TYPE = setuptools
+PYTHON_JMESPATH_LICENSE = MIT
+PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.23.0
