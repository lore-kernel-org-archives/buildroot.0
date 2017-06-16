From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Jun 2017 09:27:55 +0200
Subject: [Buildroot] [PATCH 1/4] python-tempora: new package
Message-ID: <20170616072758.13871-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-tempora/Config.in           |  8 ++++++++
 package/python-tempora/python-tempora.hash |  3 +++
 package/python-tempora/python-tempora.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-tempora/Config.in
 create mode 100644 package/python-tempora/python-tempora.hash
 create mode 100644 package/python-tempora/python-tempora.mk

diff --git a/package/Config.in b/package/Config.in
index c997e2a30..ac62a1a05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -852,6 +852,7 @@ menu "External python modules"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
+	source "package/python-tempora/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
new file mode 100644
index 000000000..ab5c57f6c
--- /dev/null
+++ b/package/python-tempora/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TEMPORA
+	bool "python-tempora"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Objects and routines pertaining to date and time.
+
+	  https://github.com/jaraco/tempora
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
new file mode 100644
index 000000000..a8367b942
--- /dev/null
+++ b/package/python-tempora/python-tempora.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/tempora/json, sha256 locally computed
+md5	cd0dd5c51c9645285ff505ec531cbcc8  tempora-1.7.tar.gz
+sha256	a264672b7f39198eb90b531490ade4e873f6e13839253636c3bd6a5549be1984  tempora-1.7.tar.gz
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
new file mode 100644
index 000000000..0bae36a2c
--- /dev/null
+++ b/package/python-tempora/python-tempora.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tempora
+#
+################################################################################
+
+PYTHON_TEMPORA_VERSION = 1.7
+PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
+PYTHON_TEMPORA_SITE = https://pypi.python.org/packages/db/2d/c838e9e553d774962a71b832b2c6390194904bfe49fd0d9d792ce8091e8a
+PYTHON_TEMPORA_LICENSE = MIT
+PYTHON_TEMPORA_SETUP_TYPE = setuptools
+PYTHON_TEMPORA_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.11.0
