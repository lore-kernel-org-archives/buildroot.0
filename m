From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:14:51 +0100
Subject: [Buildroot] [git commit] python-pyparted: new package
Message-ID: <20160203221503.26A168175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd3e72b642e56b33a0cdeb377eb14004bfbcf9a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-pyparted/Config.in            | 12 ++++++++++++
 package/python-pyparted/python-pyparted.hash |  2 ++
 package/python-pyparted/python-pyparted.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 532b10a..529ad33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
+	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
new file mode 100644
index 0000000..1501595
--- /dev/null
+++ b/package/python-pyparted/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PYPARTED
+	bool "python-pyparted"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PARTED
+	help
+	  Python bindings for GNU parted (libparted).
+
+	  https://github.com/rhinstaller/pyparted
+
+comment "pyparted needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
new file mode 100644
index 0000000..a2adc41
--- /dev/null
+++ b/package/python-pyparted/python-pyparted.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5914e3a60437fe3e3758a9e86ee4a539dfa46cfe18e3df386a5cf1f75a963431  python-pyparted-v3.10.7.tar.gz
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
new file mode 100644
index 0000000..4bf58c4
--- /dev/null
+++ b/package/python-pyparted/python-pyparted.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyparted
+#
+################################################################################
+
+PYTHON_PYPARTED_VERSION = v3.10.7
+PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,$(PYTHON_PYPARTED_VERSION))
+PYTHON_PYPARTED_SETUP_TYPE = distutils
+PYTHON_PYPARTED_LICENSE = GPLv2+
+PYTHON_PYPARTED_LICENSE_FILES = COPYING
+PYTHON_PYPARTED_DEPENDENCIES = host-python-cffi parted
+
+$(eval $(python-package))
