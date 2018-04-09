From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  9 Apr 2018 21:04:03 +0300
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: new package
Message-ID: <20180409180403.11728-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-package that is able to shorten the load time of entry_points declared
in setup.py of python packages.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in.host                             |  1 +
 package/python-fastentrypoints/Config.in.host      |  6 ++++++
 .../python-fastentrypoints.hash                    |  4 ++++
 .../python-fastentrypoints.mk                      | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-fastentrypoints/Config.in.host
 create mode 100644 package/python-fastentrypoints/python-fastentrypoints.hash
 create mode 100644 package/python-fastentrypoints/python-fastentrypoints.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b797087191..ac0bab8c47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -189,6 +189,7 @@ F:	package/sqlcipher/
 F:	package/stress/
 
 N:	Asaf Kahlon <asafka7@gmail.com>
+F:	package/python-fastentrypoints/
 F:	package/python-jsonmodels/
 F:	package/python-yieldfrom/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 563a277795..8cf8106895 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -42,6 +42,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-fastentrypoints/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-fastentrypoints/Config.in.host b/package/python-fastentrypoints/Config.in.host
new file mode 100644
index 0000000000..91605509ab
--- /dev/null
+++ b/package/python-fastentrypoints/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_FASTENTRYPOINTS
+	bool "host python-fastentrypoints"
+	help
+	  Makes entry_points specified in setup.py load more quickly.
+
+	  https://github.com/ninjaaron/fast-entry_points
diff --git a/package/python-fastentrypoints/python-fastentrypoints.hash b/package/python-fastentrypoints/python-fastentrypoints.hash
new file mode 100644
index 0000000000..84e9b78287
--- /dev/null
+++ b/package/python-fastentrypoints/python-fastentrypoints.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/fastentrypoints/json, sha256 locally computed
+md5	9bd2a34697eb8279d87e7b927f4f7e85  fastentrypoints-0.10.tar.gz
+sha256	ed418146ed87230694ec2d8890b9b3e2967e95d857e5ce933cafecb1067cca82  fastentrypoints-0.10.tar.gz
+sha256	2da210da31c033faa270503884a3ac9058874543e6fdd0b094000720bf2ffb66  fastentrypoints.py
diff --git a/package/python-fastentrypoints/python-fastentrypoints.mk b/package/python-fastentrypoints/python-fastentrypoints.mk
new file mode 100644
index 0000000000..c4eb3e862f
--- /dev/null
+++ b/package/python-fastentrypoints/python-fastentrypoints.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fastentrypoints
+#
+################################################################################
+
+PYTHON_FASTENTRYPOINTS_VERSION = 0.10
+PYTHON_FASTENTRYPOINTS_SOURCE = fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
+PYTHON_FASTENTRYPOINTS_SITE = https://pypi.python.org/packages/e8/c8/c2902c9c9da43d8be8c75a730f15f0c51933c42c39b91d1d7b605a88e907
+PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools
+PYTHON_FASTENTRYPOINTS_LICENSE = BSD-2-Clause
+PYTHON_FASTENTRYPOINTS_LICENSE_FILES = fastentrypoints.py
+
+$(eval $(host-python-package))
-- 
2.17.0
