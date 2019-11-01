From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  1 Nov 2019 02:01:35 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: new package
Message-ID: <20191101080135.23413-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-greenlet/Config.in            |  6 ++++++
 package/python-greenlet/python-greenlet.hash |  5 +++++
 package/python-greenlet/python-greenlet.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-greenlet/Config.in
 create mode 100644 package/python-greenlet/python-greenlet.hash
 create mode 100644 package/python-greenlet/python-greenlet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 22332894de..c59d5c551d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1126,6 +1126,7 @@ F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
+F:	package/python-greenlet/
 F:	package/python-multidict/
 F:	package/python-pycares/
 F:	package/python-terminaltables/
diff --git a/package/Config.in b/package/Config.in
index 2819cab4ae..15dd3f0938 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -913,6 +913,7 @@ menu "External python modules"
 	source "package/python-functools32/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
new file mode 100644
index 0000000000..ef82375b0b
--- /dev/null
+++ b/package/python-greenlet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GREENLET
+	bool "python-greenlet"
+	help
+	  Lightweight in-process concurrent programming.
+
+	  https://github.com/python-greenlet/greenlet
diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
new file mode 100644
index 0000000000..51a3c7efbb
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/greenlet/json
+md5	10fa304f673fc18b28fa6d8c6658cb80  greenlet-0.4.15.tar.gz
+sha256	9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc  greenlet-0.4.15.tar.gz
+# Locally computed sha256 checksums
+sha256	bbde55d5456a1e912633ed3f66d1dbd9504e3e3dce4f4c2015043cdcbc56e697  LICENSE
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
new file mode 100644
index 0000000000..8dcf1fd693
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-greenlet
+#
+################################################################################
+
+PYTHON_GREENLET_VERSION = 0.4.15
+PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7
+PYTHON_GREENLET_SETUP_TYPE = distutils
+PYTHON_GREENLET_LICENSE = MIT
+PYTHON_GREENLET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
