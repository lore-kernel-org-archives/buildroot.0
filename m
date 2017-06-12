From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 12 Jun 2017 16:30:02 +0200
Subject: [Buildroot] [PATCH] python-bcrypt: new package
Message-ID: <20170612143002.31178-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-bcrypt/Config.in          |  8 ++++++++
 package/python-bcrypt/python-bcrypt.hash |  3 +++
 package/python-bcrypt/python-bcrypt.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-bcrypt/Config.in
 create mode 100644 package/python-bcrypt/python-bcrypt.hash
 create mode 100644 package/python-bcrypt/python-bcrypt.mk

diff --git a/package/Config.in b/package/Config.in
index 3a99c86db..9869a58b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ menu "External python modules"
 	source "package/python-autobahn/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
diff --git a/package/python-bcrypt/Config.in b/package/python-bcrypt/Config.in
new file mode 100644
index 000000000..4fa6c31a9
--- /dev/null
+++ b/package/python-bcrypt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BCRYPT
+	bool "python-bcrypt"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Modern password hashing for your software and your servers.
+
+	  https://github.com/pyca/bcrypt/
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
new file mode 100644
index 000000000..574cbe155
--- /dev/null
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/bcrypt/json, sha256 locally computed
+md5	20da8b40790caad99c4086dba533154b  bcrypt-3.1.3.tar.gz
+sha256	6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488  bcrypt-3.1.3.tar.gz
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
new file mode 100644
index 000000000..aa6f9815a
--- /dev/null
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-bcrypt
+#
+################################################################################
+
+PYTHON_BCRYPT_VERSION = 3.1.3
+PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
+PYTHON_BCRYPT_SITE = https://pypi.python.org/packages/58/e9/6d7f1d883d8c5876470b5d187d72c04f2a9954d61e71e7eb5d2ea2a50442
+PYTHON_BCRYPT_SETUP_TYPE = setuptools
+PYTHON_BCRYPT_LICENSE = Apache-2.0
+PYTHON_BCRYPT_LICENSE_FILES = LICENSE
+PYTHON_BCRYPT_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
-- 
2.11.0
