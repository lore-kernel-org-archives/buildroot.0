From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 19:30:50 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-janus: new package
Message-ID: <20191211023050.79110-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mixed sync-async queue to interoperate between asyncio
tasks and classic threads.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-janus/Config.in         |  8 ++++++++
 package/python-janus/python-janus.hash |  5 +++++
 package/python-janus/python-janus.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-janus/Config.in
 create mode 100644 package/python-janus/python-janus.hash
 create mode 100644 package/python-janus/python-janus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..90e1be6188 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1142,6 +1142,7 @@ F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
+F:	package/python-janus/
 F:	package/python-multidict/
 F:	package/python-pycares/
 F:	package/python-terminaltables/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..df4d3900bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
+	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
diff --git a/package/python-janus/Config.in b/package/python-janus/Config.in
new file mode 100644
index 0000000000..a1ba0463f9
--- /dev/null
+++ b/package/python-janus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JANUS
+	bool "python-janus"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Mixed sync-async queue to interoperate between asyncio
+	  tasks and classic threads.
+
+	  https://github.com/aio-libs/janus/
diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
new file mode 100644
index 0000000000..5098769901
--- /dev/null
+++ b/package/python-janus/python-janus.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/janus/json
+md5	26283b122439fbca4ae1db18ff839b7c  janus-0.4.0.tar.gz
+sha256	cfc221683160b91b35bae1917e2957b78dad10a2e634f4f8ed119ed72e2a88ef  janus-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
new file mode 100644
index 0000000000..f718d0c19d
--- /dev/null
+++ b/package/python-janus/python-janus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-janus
+#
+################################################################################
+
+PYTHON_JANUS_VERSION = 0.4.0
+PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/e2/39/41fd545b99eac81d47fe346b8c78c09a3b187ce2fd9f3c9656dfe035e39a
+PYTHON_JANUS_SETUP_TYPE = setuptools
+PYTHON_JANUS_LICENSE = Apache-2.0
+PYTHON_JANUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
