From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 19:17:17 +0100
Subject: [Buildroot] [PATCH v2,1/3] python-vcversioner: new package
Message-ID: <1482085039-64073-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add python-vcversioner in host-package version as
   host-python-jsonschema depends on it
 - Add python-jsonschema in host-package version
 - Retrieve first soletta patch from upstream
 - Add a soletta patch to remove multiple targets in the same rule as 
   this is not supported by old versions of make

 package/Config.in                                  |  1 +
 package/python-vcversioner/Config.in               |  6 ++++++
 package/python-vcversioner/python-vcversioner.hash |  3 +++
 package/python-vcversioner/python-vcversioner.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-vcversioner/Config.in
 create mode 100644 package/python-vcversioner/python-vcversioner.hash
 create mode 100644 package/python-vcversioner/python-vcversioner.mk

diff --git a/package/Config.in b/package/Config.in
index be0d150..7e2f913 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -805,6 +805,7 @@ menu "External python modules"
 	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-vcversioner/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
diff --git a/package/python-vcversioner/Config.in b/package/python-vcversioner/Config.in
new file mode 100644
index 0000000..9383ef4
--- /dev/null
+++ b/package/python-vcversioner/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VCVERSIONER
+	bool "python-vcversioner"
+	help
+	  Use version control tags to discover version numbers.
+
+	  https://github.com/habnabit/vcversioner
diff --git a/package/python-vcversioner/python-vcversioner.hash b/package/python-vcversioner/python-vcversioner.hash
new file mode 100644
index 0000000..58573a1
--- /dev/null
+++ b/package/python-vcversioner/python-vcversioner.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/vcversioner/json, sha256 locally computed
+md5	aab6ef5e0cf8614a1b1140ed5b7f107d  vcversioner-2.16.0.0.tar.gz
+sha256	dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b  vcversioner-2.16.0.0.tar.gz
diff --git a/package/python-vcversioner/python-vcversioner.mk b/package/python-vcversioner/python-vcversioner.mk
new file mode 100644
index 0000000..8f598f3
--- /dev/null
+++ b/package/python-vcversioner/python-vcversioner.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-vcversioner
+#
+################################################################################
+
+PYTHON_VCVERSIONER_VERSION = 2.16.0.0
+PYTHON_VCVERSIONER_SOURCE = vcversioner-$(PYTHON_VCVERSIONER_VERSION).tar.gz
+PYTHON_VCVERSIONER_SITE = https://pypi.python.org/packages/c5/cc/33162c0a7b28a4d8c83da07bc2b12cee58c120b4a9e8bba31c41c8d35a16
+PYTHON_VCVERSIONER_SETUP_TYPE = setuptools
+PYTHON_VCVERSIONER_LICENSE = ISC License (ISCL)
+
+$(eval $(host-python-package))
-- 
2.5.0
