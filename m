From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri,  5 Feb 2016 19:18:55 +0100
Subject: [Buildroot] [PATCH v3 15/17] python-setproctitle: new package
In-Reply-To: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454696337-9692-16-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                    |  1 +
 package/python-setproctitle/Config.in                |  7 +++++++
 package/python-setproctitle/python-setproctitle.hash |  3 +++
 package/python-setproctitle/python-setproctitle.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-setproctitle/Config.in
 create mode 100644 package/python-setproctitle/python-setproctitle.hash
 create mode 100644 package/python-setproctitle/python-setproctitle.mk

diff --git a/package/Config.in b/package/Config.in
index ef0ce7b..bf5f0f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -712,6 +712,7 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
+	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-setproctitle/Config.in b/package/python-setproctitle/Config.in
new file mode 100644
index 0000000..b39f3cc
--- /dev/null
+++ b/package/python-setproctitle/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SETPROCTITLE
+	bool "python-setproctitle"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A Python module to customize the process title.
+
+	  https://pypi.python.org/pypi/setproctitle
diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
new file mode 100644
index 0000000..3b0fd71
--- /dev/null
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=95d9e56c69437246460a20804961d70d, sha256 locally computed.
+md5	95d9e56c69437246460a20804961d70d  setproctitle-1.1.9.tar.gz
+sha256	1c3414d18f9cacdab78b0ffd8e886d56ad45f22e55001a72aaa0b2aeb56a0ad7  setproctitle-1.1.9.tar.gz
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
new file mode 100644
index 0000000..63dfad0
--- /dev/null
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-setproctitle
+#
+################################################################################
+
+PYTHON_SETPROCTITLE_VERSION = 1.1.9
+PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
+PYTHON_SETPROCTITLE_SITE = http://pypi.python.org/packages/source/s/setproctitle
+PYTHON_SETPROCTITLE_LICENSE = BSD-3c
+PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
+PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4
