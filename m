From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:57 +0100
Subject: [Buildroot] [PATCH 28/38] python-configobj: new package
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

[Thomas: convert to the Python package infrastructure.]

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-configobj/Config.in           | 10 ++++++++++
 package/python-configobj/python-configobj.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-configobj/Config.in
 create mode 100644 package/python-configobj/python-configobj.mk

diff --git a/package/Config.in b/package/Config.in
index 283b5f6..42c5fc8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
+source "package/python-configobj/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
new file mode 100644
index 0000000..fc57e26
--- /dev/null
+++ b/package/python-configobj/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  ConfigObj is a simple but powerful config file reader and
+	  writer: an ini file round tripper. Its main feature is that
+	  it is very easy to use, with a straightforward programmer's
+	  interface and a simple syntax for config files.
+
+	  http://www.voidspace.org.uk/python/configobj.html
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
new file mode 100644
index 0000000..5211b1d
--- /dev/null
+++ b/package/python-configobj/python-configobj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-configobj
+#
+################################################################################
+
+PYTHON_CONFIGOBJ_VERSION = 4.7.2
+PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
+PYTHON_CONFIGOBJ_SITE = http://pypi.python.org/packages/source/c/configobj
+PYTHON_CONFIGOBJ_LICENSE = BSD-3c
+# License only mentioned in the source
+PYTHON_CONFIGOBJ_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
1.8.1.2
