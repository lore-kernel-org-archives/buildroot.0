From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 22 Nov 2014 10:46:00 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
Message-ID: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: add MPL incense

 package/Config.in                        |  1 +
 package/python-certifi/Config.in         |  6 ++++++
 package/python-certifi/python-certifi.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/python-certifi/Config.in
 create mode 100644 package/python-certifi/python-certifi.mk

diff --git a/package/Config.in b/package/Config.in
index a6977ce..cffa8d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -482,6 +482,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 	source "package/python-bottle/Config.in"
+	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
new file mode 100644
index 0000000..9390b4f
--- /dev/null
+++ b/package/python-certifi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CERTIFI
+	bool "python-certifi"
+	help
+	  Python package for providing Mozilla's CA Bundle.
+
+	  https://pypi.python.org/pypi/certifi
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
new file mode 100644
index 0000000..1458a53
--- /dev/null
+++ b/package/python-certifi/python-certifi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-certifi
+#
+################################################################################
+
+PYTHON_CERTIFI_VERSION = 14.05.14
+PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
+PYTHON_CERTIFI_SETUP_TYPE = setuptools
+PYTHON_CERTIFI_LICENSE = ISC, MPL
+PYTHON_CERTIFI_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
1.8.3.2
