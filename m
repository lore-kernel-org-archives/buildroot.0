From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 16:40:24 +0300
Subject: [Buildroot] [PATCH 1/2] package/python-entrypoints: new package
In-Reply-To: <20191021134031.20586-1-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
Message-ID: <20191021134031.20586-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-entrypoints/Config.in               |  6 ++++++
 package/python-entrypoints/python-entrypoints.hash |  5 +++++
 package/python-entrypoints/python-entrypoints.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-entrypoints/Config.in
 create mode 100644 package/python-entrypoints/python-entrypoints.hash
 create mode 100644 package/python-entrypoints/python-entrypoints.mk

diff --git a/package/Config.in b/package/Config.in
index c8ff524e83..bdaa310177 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
+	source "package/python-entrypoints/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-falcon/Config.in"
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
index 0000000000..7ab1b4d64a
--- /dev/null
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -0,0 +1,14 @@
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
-- 
2.20.1
