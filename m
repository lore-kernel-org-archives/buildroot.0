From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Oct 2016 16:38:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-pylru: new package
Message-ID: <20161007143801.3712-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fix license (Thomas)

 package/Config.in                      |  1 +
 package/python-pylru/Config.in         |  6 ++++++
 package/python-pylru/python-pylru.hash |  3 +++
 package/python-pylru/python-pylru.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-pylru/Config.in
 create mode 100644 package/python-pylru/python-pylru.hash
 create mode 100644 package/python-pylru/python-pylru.mk

diff --git a/package/Config.in b/package/Config.in
index 1ebdd68..f9020ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pylru/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
diff --git a/package/python-pylru/Config.in b/package/python-pylru/Config.in
new file mode 100644
index 0000000..c174576
--- /dev/null
+++ b/package/python-pylru/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYLRU
+	bool "python-pylru"
+	help
+	  A least recently used (LRU) cache implementation.
+
+	  https://github.com/jlhutch/pylru
diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
new file mode 100644
index 0000000..806ea36
--- /dev/null
+++ b/package/python-pylru/python-pylru.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pylru/json, sha256 locally computed
+md5	41369d58a1c4391c5cc36f84262abcdc  pylru-1.0.9.tar.gz
+sha256	71376192671f0ad1690b2a7427d39a29b1df994c8469a9b46b03ed7e28c0172c  pylru-1.0.9.tar.gz
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
new file mode 100644
index 0000000..e670f3d
--- /dev/null
+++ b/package/python-pylru/python-pylru.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pylru
+#
+################################################################################
+
+PYTHON_PYLRU_VERSION = 1.0.9
+PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
+PYTHON_PYLRU_SITE = https://pypi.python.org/packages/c0/7d/0de1055632f3871dfeaabe5a3f0510317cd98b93e7b792b44e4c7de2b17b
+PYTHON_PYLRU_SETUP_TYPE = distutils
+PYTHON_PYLRU_LICENSE = GPLv2
+PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.9.3
