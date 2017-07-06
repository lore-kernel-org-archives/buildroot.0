From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Jul 2017 11:09:00 +0200
Subject: [Buildroot] [PATCH 3/3] python-automat: new package
In-Reply-To: <20170706090900.15999-1-yegorslists@googlemail.com>
References: <20170706090900.15999-1-yegorslists@googlemail.com>
Message-ID: <20170706090900.15999-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-automat/Config.in           |  8 ++++++++
 package/python-automat/python-automat.hash |  3 +++
 package/python-automat/python-automat.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-automat/Config.in
 create mode 100644 package/python-automat/python-automat.hash
 create mode 100644 package/python-automat/python-automat.mk

diff --git a/package/Config.in b/package/Config.in
index f178aec963..238e5c3123 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -687,6 +687,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
+	source "package/python-automat/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
new file mode 100644
index 0000000000..910b3d6aec
--- /dev/null
+++ b/package/python-automat/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AUTOMAT
+	bool "python-automat"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Self-service finite-state machines for the programmer on the go.
+
+	  https://github.com/glyph/Automat
diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
new file mode 100644
index 0000000000..c0e3505234
--- /dev/null
+++ b/package/python-automat/python-automat.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/automat/json, sha256 locally computed
+md5	ad7bba58d262d8956d732330cb5ef53d  Automat-0.6.0.tar.gz
+sha256	3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8  Automat-0.6.0.tar.gz
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
new file mode 100644
index 0000000000..96a4f51506
--- /dev/null
+++ b/package/python-automat/python-automat.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-automat
+#
+################################################################################
+
+PYTHON_AUTOMAT_VERSION = 0.6.0
+PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
+PYTHON_AUTOMAT_SITE = https://pypi.python.org/packages/de/05/b8e453085cf8a7f27bb1226596f4ccf5cc9e758377d60284f990bbdc592c
+PYTHON_AUTOMAT_SETUP_TYPE = setuptools
+PYTHON_AUTOMAT_LICENSE = MIT
+PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.11.0
