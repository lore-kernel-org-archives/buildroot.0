From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 00:04:16 +0100
Subject: [Buildroot] [git commit] python-wsaccel: new package
Message-ID: <20160302202753.A186980203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c8633ed6914a6c1f12b2ce56f18ac08979d3c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-wsaccel/Config.in           |  6 ++++++
 package/python-wsaccel/python-wsaccel.hash |  3 +++
 package/python-wsaccel/python-wsaccel.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4862280..7a9ed0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -735,6 +735,7 @@ menu "External python modules"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-ws4py/Config.in"
+	source "package/python-wsaccel/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-wsaccel/Config.in b/package/python-wsaccel/Config.in
new file mode 100644
index 0000000..ee61e8a
--- /dev/null
+++ b/package/python-wsaccel/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_WSACCEL
+	bool "python-wsaccel"
+	help
+	  Accelerator for ws4py and AutobahnPython.
+
+	  https://pypi.python.org/pypi/wsaccel
diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
new file mode 100644
index 0000000..a02b5a8
--- /dev/null
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b4ea3d6847855c0587d37fca9db0557, sha256 locally computed.
+md5	2b4ea3d6847855c0587d37fca9db0557  wsaccel-0.6.2.tar.gz
+sha256	425706acf0724d2f6bfa391ec37b4ef121d3432c956029de3cea4e101c218e0c  wsaccel-0.6.2.tar.gz
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
new file mode 100644
index 0000000..3e7b332
--- /dev/null
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-wsaccel
+#
+################################################################################
+
+PYTHON_WSACCEL_VERSION = 0.6.2
+PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
+PYTHON_WSACCEL_SITE = http://pypi.python.org/packages/source/w/wsaccel
+PYTHON_WSACCEL_LICENSE = Apache-2.0
+PYTHON_WSACCEL_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
