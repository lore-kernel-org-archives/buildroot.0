From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 14:25:18 +0100
Subject: [Buildroot] [git commit] python-twisted: new package
Message-ID: <20150126133028.1643080795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=953be8f39d57b7ac0d73ccade50294580b6af008
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |    1 +
 package/python-twisted/Config.in           |    8 ++++++++
 package/python-twisted/python-twisted.hash |    2 ++
 package/python-twisted/python-twisted.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 127ced3..51d4c15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,6 +548,7 @@ menu "external python modules"
 	source "package/python-simplejson/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-twisted/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-webpy/Config.in"
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
new file mode 100644
index 0000000..b302101
--- /dev/null
+++ b/package/python-twisted/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TWISTED
+	bool "python-twisted"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+	help
+	  Twisted is an event-driven networking engine written in Python.
+
+	  https://twistedmatrix.com/trac/
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
new file mode 100644
index 0000000..937cab3
--- /dev/null
+++ b/package/python-twisted/python-twisted.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  038096be8723b678e2ead323b14d0d3e2db161e0c7ce3c98fdd18ca5869acb71  Twisted-14.0.2.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
new file mode 100644
index 0000000..792bb05
--- /dev/null
+++ b/package/python-twisted/python-twisted.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-twisted
+#
+################################################################################
+
+PYTHON_TWISTED_VERSION = 14.0.2
+PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted/
+PYTHON_TWISTED_SETUP_TYPE = setuptools
+PYTHON_TWISTED_LICENSE = MIT
+PYTHON_TWISTED_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
