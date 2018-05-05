From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  5 May 2018 15:09:44 +0300
Subject: [Buildroot] [PATCH 2/2] python-reentry: new package
In-Reply-To: <20180505120944.18604-1-asafka7@gmail.com>
References: <20180505120944.18604-1-asafka7@gmail.com>
Message-ID: <20180505120944.18604-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A plugin manager based on setuptools entry points mechanism.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-reentry/Config.in           |  8 ++++++++
 package/python-reentry/python-reentry.hash |  4 ++++
 package/python-reentry/python-reentry.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-reentry/Config.in
 create mode 100644 package/python-reentry/python-reentry.hash
 create mode 100644 package/python-reentry/python-reentry.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c0b7f0f28..261c556ad8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -192,6 +192,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/python-jsonmodels/
 F:	package/python-py/
+F:	package/python-reentry/
 F:	package/python-subprocess32/
 F:	package/python-yieldfrom/
 F:	package/zeromq/
diff --git a/package/Config.in b/package/Config.in
index 5c3c92d68b..6d57a2fd43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -914,6 +914,7 @@ menu "External python modules"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-remi/Config.in"
+	source "package/python-reentry/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
diff --git a/package/python-reentry/Config.in b/package/python-reentry/Config.in
new file mode 100644
index 0000000000..25c721724a
--- /dev/null
+++ b/package/python-reentry/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_REENTRY
+	bool "python-reentry"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_PY # runtime
+	help
+	  A plugin manager based on setuptools entry points mechanism.
diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
new file mode 100644
index 0000000000..7a3bbf4d99
--- /dev/null
+++ b/package/python-reentry/python-reentry.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/pypi/reentry/json
+sha256	00df980d8c61713f5002d4d893ba6ea38e9a721cd04aef5a520b974e700ab550  reentry-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
new file mode 100644
index 0000000000..d3f0e03ef0
--- /dev/null
+++ b/package/python-reentry/python-reentry.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-reentry
+#
+################################################################################
+
+PYTHON_REENTRY_VERSION = 1.2.0
+PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/e2/b4/46dfac6613302fea51454a01aebedae9440aff9d813aedbbc5f687552e3b
+PYTHON_REENTRY_SETUP_TYPE = setuptools
+PYTHON_REENTRY_LICENSE = MIT
+PYTHON_REENTRY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0
