From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun,  7 Feb 2016 00:00:00 +0100
Subject: [Buildroot] [PATCH v4 14/17] python-wsaccel: new package
In-Reply-To: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454799603-5474-15-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

---
Changes v3 -> v4
  - removed spurious dependency to python2 Config.in (suggested by Y.Yefremov)
  - changed license (Apache -> Apache-2.0) in python-wsaccel.mk (suggested by Y.Yefremov; I am
    unable to understand where he got this info; LICENSE file missing in sources)

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                          |  1 +
 package/python-wsaccel/Config.in           |  6 ++++++
 package/python-wsaccel/python-wsaccel.hash |  3 +++
 package/python-wsaccel/python-wsaccel.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-wsaccel/Config.in
 create mode 100644 package/python-wsaccel/python-wsaccel.hash
 create mode 100644 package/python-wsaccel/python-wsaccel.mk

diff --git a/package/Config.in b/package/Config.in
index 0af00c6..7bda8d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "External python modules"
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
-- 
2.1.4
