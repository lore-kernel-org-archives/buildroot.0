From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 22:51:45 +0100
Subject: [Buildroot] [git commit] python-gunicorn: new package
Message-ID: <20170205220332.D489081E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0ccf24082a7c9133366184412f96284a7dd35c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gunicorn ???Green Unicorn??? is a Python WSGI HTTP Server for UNIX. It???s a
pre-fork worker model ported from Ruby???s Unicorn project. The Gunicorn
server is broadly compatible with various web frameworks, simply
implemented, light on server resource usage, and fairly speedy.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-gunicorn/Config.in            | 13 +++++++++++++
 package/python-gunicorn/python-gunicorn.hash |  3 +++
 package/python-gunicorn/python-gunicorn.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d1c517a..cb6c12e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -697,6 +697,7 @@ menu "External python modules"
 	source "package/python-flup/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-gunicorn/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
new file mode 100644
index 0000000..79cda3e
--- /dev/null
+++ b/package/python-gunicorn/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_GUNICORN
+	bool "python-gunicorn"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Gunicorn ???Green Unicorn??? is a Python WSGI HTTP Server for
+	  UNIX. It???s a pre-fork worker model ported from Ruby???s
+	  Unicorn project. The Gunicorn server is broadly compatible
+	  with various web frameworks, simply implemented, light on
+	  server resource usage, and fairly speedy.
+
+	  http://gunicorn.org/
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
new file mode 100644
index 0000000..a282bc9
--- /dev/null
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/gunicorn/json, sha256 locally computed
+md5	338e5e8a83ea0f0625f768dba4597530  gunicorn-19.6.0.tar.gz
+sha256	813f6916d18a4c8e90efde72f419308b357692f81333cb1125f80013d22fb618  gunicorn-19.6.0.tar.gz
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
new file mode 100644
index 0000000..426e809
--- /dev/null
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gunicorn
+#
+################################################################################
+
+PYTHON_GUNICORN_VERSION = 19.6.0
+PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
+PYTHON_GUNICORN_SITE = https://pypi.python.org/packages/84/ce/7ea5396efad1cef682bbc4068e72a0276341d9d9d0f501da609fab9fcb80
+PYTHON_GUNICORN_SETUP_TYPE = setuptools
+PYTHON_GUNICORN_LICENSE = MIT
+PYTHON_GUNICORN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
