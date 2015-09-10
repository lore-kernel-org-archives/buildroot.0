From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Sep 2015 12:33:52 +0200
Subject: [Buildroot] [PATCH] python-pyudev: new package
In-Reply-To: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
References: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1441881232-8107-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-pyudev/Config.in          | 13 +++++++++++++
 package/python-pyudev/python-pyudev.hash |  3 +++
 package/python-pyudev/python-pyudev.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-pyudev/Config.in
 create mode 100644 package/python-pyudev/python-pyudev.hash
 create mode 100644 package/python-pyudev/python-pyudev.mk

diff --git a/package/Config.in b/package/Config.in
index b53e089..edb21e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -651,6 +651,7 @@ menu "external python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyxml/Config.in"
diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
new file mode 100644
index 0000000..4b5e9c8
--- /dev/null
+++ b/package/python-pyudev/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYUDEV
+	bool "python-pyudev"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  pyudev is a LGPL licenced, pure Python 2/3 binding to libudev,
+	  the device and hardware management and information library of Linux.
+
+	  https://github.com/pyudev/pyudev
+
+comment "python-pyudev needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
new file mode 100644
index 0000000..128074f
--- /dev/null
+++ b/package/python-pyudev/python-pyudev.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0450afde50383538a987d16450853fb1, sha256 locally computed
+md5     0450afde50383538a987d16450853fb1  pyudev-0.17.tar.gz
+sha256  eb6f3c1f231ab3d11d6afee6a4b925c855030314568d9c6760d138465a092e8d  pyudev-0.17.tar.gz
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
new file mode 100644
index 0000000..7d3b403
--- /dev/null
+++ b/package/python-pyudev/python-pyudev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyudev
+#
+################################################################################
+
+PYTHON_PYUDEV_VERSION = 0.17
+PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
+PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/source/p/pyudev
+PYTHON_PYUDEV_LICENSE = LGPLv2.1+
+PYTHON_PYUDEV_LICENSE_FILES = COPYING
+PYTHON_PYUDEV_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.9.1
