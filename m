From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 12:00:54 +0200
Subject: [Buildroot] [PATCH v2 4/5] python-configshell-fb: new package
In-Reply-To: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1411034455-19670-5-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configshell-fb is a Python library that provides a framework for
building simple but nice CLI-based applications.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                      |  1 +
 package/python-configshell-fb/Config.in                | 11 +++++++++++
 package/python-configshell-fb/python-configshell-fb.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/python-configshell-fb/Config.in
 create mode 100644 package/python-configshell-fb/python-configshell-fb.mk

diff --git a/package/Config.in b/package/Config.in
index 7447036..096d8c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-configobj/Config.in"
+	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
new file mode 100644
index 0000000..05de585
--- /dev/null
+++ b/package/python-configshell-fb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
+	bool "python-configshell-fb"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYPARSING
+	select BR2_PACKAGE_PYTHON_READLINE
+	select BR2_PACKAGE_PYTHON_URWID
+	help
+	  configshell-fb is a Python library that provides a framework
+	  for building simple but nice CLI-based applications.
+
+	  https://github.com/agrover/configshell-fb
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
new file mode 100644
index 0000000..64b27fe
--- /dev/null
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-configshell-fb
+#
+################################################################################
+
+PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb14
+PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
+PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
+PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
+PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-urwid
+
+$(eval $(python-package))
-- 
2.1.0
