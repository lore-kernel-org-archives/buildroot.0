From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  2 Nov 2017 09:34:18 -0700
Subject: [Buildroot] [PATCH 1/2] package: add python-raven
Message-ID: <20171102163419.24155-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-raven/Config.in         |  6 ++++++
 package/python-raven/python-raven.hash |  3 +++
 package/python-raven/python-raven.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-raven/Config.in
 create mode 100644 package/python-raven/python-raven.hash
 create mode 100644 package/python-raven/python-raven.mk

diff --git a/package/Config.in b/package/Config.in
index dbfb288d53..efb69b8f10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -875,6 +875,7 @@ menu "External python modules"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-raven/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
new file mode 100644
index 0000000000..1fbd1d8c03
--- /dev/null
+++ b/package/python-raven/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_RAVEN
+	bool "python-raven"
+	help
+	  Raven is a client for Sentry (https://getsentry.com).
+
+	  https://github.com/getsentry/raven-python
diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
new file mode 100644
index 0000000000..1de6975658
--- /dev/null
+++ b/package/python-raven/python-raven.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
+md5	a08d910e05a228d55cb3388910930d66  raven-6.2.1.tar.gz
+sha256	c0a30bcc3e3206059f79656d80362ce080b1c991c95d867edce559a7294570fe  raven-6.2.1.tar.gz
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
new file mode 100644
index 0000000000..cb40839343
--- /dev/null
+++ b/package/python-raven/python-raven.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-raven
+#
+################################################################################
+
+PYTHON_RAVEN_VERSION = 6.2.1
+PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
+PYTHON_RAVEN_SITE = https://pypi.python.org/packages/c1/97/38e74c7521737c965281b43440b274955e211b1d5319c256d8525d9d2cad
+PYTHON_RAVEN_SETUP_TYPE = setuptools
+PYTHON_RAVEN_LICENSE = BSD-3-Clause
+PYTHON_RAVEN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.15.0
