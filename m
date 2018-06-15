From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 14:54:55 +0200
Subject: [Buildroot] [PATCH] package: add python-validators
Message-ID: <20180615125455.30537-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simple data validation library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-validators/Config.in              |  8 ++++++++
 package/python-validators/python-validators.hash |  5 +++++
 package/python-validators/python-validators.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-validators/Config.in
 create mode 100644 package/python-validators/python-validators.hash
 create mode 100644 package/python-validators/python-validators.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e276b45565..07c24acb91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1534,6 +1534,7 @@ F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/python-request-id/
 F:	package/python-texttable/
+F:	package/python-validators/
 F:	package/python-webob/
 F:	package/python-websocket-client/
 F:	package/triggerhappy/
diff --git a/package/Config.in b/package/Config.in
index fcabed4fde..368c05df0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -965,6 +965,7 @@ menu "External python modules"
 	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-visitor/Config.in"
 	source "package/python-watchdog/Config.in"
diff --git a/package/python-validators/Config.in b/package/python-validators/Config.in
new file mode 100644
index 0000000000..e700369910
--- /dev/null
+++ b/package/python-validators/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_VALIDATORS
+	bool "python-validators"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	help
+	  Python Data Validation for Humans.
+
+	  https://github.com/kvesteri/validators
diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
new file mode 100644
index 0000000000..8c6e3f9ecc
--- /dev/null
+++ b/package/python-validators/python-validators.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/validators/json
+md5	9c9583f91972163b3b736033bb929d8a  validators-0.12.2.tar.gz
+sha256	172ac45f7d1944ce4beca3c5c53ca7c83e9759e39fd3fedc1cf28e2130268706  validators-0.12.2.tar.gz
+# Locally computed sha256 checksums
+sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
new file mode 100644
index 0000000000..e94476f834
--- /dev/null
+++ b/package/python-validators/python-validators.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-validators
+#
+################################################################################
+
+PYTHON_VALIDATORS_VERSION = 0.12.2
+PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/45/7b/5b7b74208a3e0744d1a0efbfb1935fa46fa4cfe58d3d63f17c49c58c429c
+PYTHON_VALIDATORS_SETUP_TYPE = setuptools
+PYTHON_VALIDATORS_LICENSE = BSD
+PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
