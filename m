From: Serhii Sakhno <sergei.sakhno@gmail.com>
Date: Sun, 26 May 2019 01:00:58 +0300
Subject: [Buildroot] [PATCH] package/python-entrypoints: new package
Message-ID: <20190525220058.2796-1-sergei.sakhno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>
---
 package/Config.in                                 |  1 +
 package/Config.in.host                            |  1 +
 package/python-entrypoints/Config.in              |  6 ++++++
 package/python-entrypoints/Config.in.host         |  6 ++++++
 .../python-entrypoints/python-entrypoints.hash    |  5 +++++
 package/python-entrypoints/python-entrypoints.mk  | 15 +++++++++++++++
 6 files changed, 34 insertions(+)
 create mode 100644 package/python-entrypoints/Config.in
 create mode 100644 package/python-entrypoints/Config.in.host
 create mode 100644 package/python-entrypoints/python-entrypoints.hash
 create mode 100644 package/python-entrypoints/python-entrypoints.mk

diff --git a/package/Config.in b/package/Config.in
index f592e74a99..1e0d8d35f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -877,6 +877,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
+	source "package/python-entrypoints/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-falcon/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index bc7e71882b..f81f498375 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -49,6 +49,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-entrypoints/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-entrypoints/Config.in b/package/python-entrypoints/Config.in
new file mode 100644
index 0000000000..8253a04591
--- /dev/null
+++ b/package/python-entrypoints/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ENTRYPOINTS
+	bool "python-entrypoints"
+	help
+	  Discover and load entry points from installed packages.
+
+	  https://github.com/takluyver/entrypoints
diff --git a/package/python-entrypoints/Config.in.host b/package/python-entrypoints/Config.in.host
new file mode 100644
index 0000000000..353cbf4bdc
--- /dev/null
+++ b/package/python-entrypoints/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_ENTRYPOINTS
+	bool "host python-entrypoints"
+	help
+	  Discover and load entry points from installed packages.
+
+	  https://github.com/takluyver/entrypoints
diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
new file mode 100644
index 0000000000..c645452109
--- /dev/null
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/entrypoints/json
+md5	c5c61ea2e46a0c50ea08f4af7955a0b1  entrypoints-0.3.tar.gz
+sha256	c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451  entrypoints-0.3.tar.gz
+# Locally computed sha256 checksums
+sha256	de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
new file mode 100644
index 0000000000..f30fce2dfd
--- /dev/null
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-entrypoints
+#
+################################################################################
+
+PYTHON_ENTRYPOINTS_VERSION = 0.3
+PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
+PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/b4/ef/063484f1f9ba3081e920ec9972c96664e2edb9fdc3d8669b0e3b8fc0ad7c
+PYTHON_ENTRYPOINTS_SETUP_TYPE = distutils
+PYTHON_ENTRYPOINTS_LICENSE = MIT
+PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
\ No newline at end of file
-- 
2.21.0
