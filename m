From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Jan 2015 23:46:09 +0100
Subject: [Buildroot] [git commit] python-zope-interface: new package
Message-ID: <20150125233550.7308F80170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1e3f66bf24ac451d9ca78bfab8a95c37c7f01e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/python-zope-interface/Config.in            |    9 +++++++++
 .../python-zope-interface.hash                     |    2 ++
 .../python-zope-interface/python-zope-interface.mk |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 043a350..7e22e92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -558,6 +558,7 @@ menu "external python modules"
 	source "package/python-versiontools/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
+	source "package/python-zope-interface/Config.in"
 endmenu
 endif
 	source "package/ruby/Config.in"
diff --git a/package/python-zope-interface/Config.in b/package/python-zope-interface/Config.in
new file mode 100644
index 0000000..01f4a94
--- /dev/null
+++ b/package/python-zope-interface/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
+	bool "python-zope-interface"
+	help
+	  This package provides an implementation of "object interfaces" for
+	  Python. Interfaces are a mechanism for labeling objects as conforming
+	  to a given API or contract. So, this package can be considered as
+	  implementation of the Design By Contract methodology support in Python.
+
+	  http://docs.zope.org/zope.interface/
diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
new file mode 100644
index 0000000..bdd05d7
--- /dev/null
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  441fefcac1fbac57c55239452557d3598571ab82395198b2565a29d45d1232f6  zope.interface-4.1.2.tar.gz
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
new file mode 100644
index 0000000..a271f77
--- /dev/null
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zope-interface
+#
+################################################################################
+
+PYTHON_ZOPE_INTERFACE_VERSION = 4.1.2
+PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/source/z/zope.interface/
+PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
+PYTHON_ZOPE_INTERFACE_LICENSE = ZPLv2.1
+PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
