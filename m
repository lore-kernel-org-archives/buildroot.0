From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:29:16 +0100
Subject: [Buildroot] [git commit] python-cssselect: new package
Message-ID: <20160119212949.F3E927FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa112f239630cf8e94fbc3d58b6cb73290c54d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-cssselect/Config.in             |  6 ++++++
 package/python-cssselect/python-cssselect.hash |  4 ++++
 package/python-cssselect/python-cssselect.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b04c690..3470643 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -629,6 +629,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-django/Config.in"
diff --git a/package/python-cssselect/Config.in b/package/python-cssselect/Config.in
new file mode 100644
index 0000000..9c1ffe4
--- /dev/null
+++ b/package/python-cssselect/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CSSSELECT
+	bool "python-cssselect"
+	help
+	  cssselect parses CSS3 Selectors and translates them to XPath 1.0
+
+	  http://packages.python.org/cssselect/
diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
new file mode 100644
index 0000000..08c81e5
--- /dev/null
+++ b/package/python-cssselect/python-cssselect.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/cssselect/json
+md5	c74f45966277dc7a0f768b9b0f3522ac  cssselect-0.9.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	0535a7e27014874b27ae3a4d33e8749e345bdfa62766195208b7996bf1100682  cssselect-0.9.1.tar.gz
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
new file mode 100644
index 0000000..c6b476b
--- /dev/null
+++ b/package/python-cssselect/python-cssselect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cssselect
+#
+################################################################################
+
+PYTHON_CSSSELECT_VERSION = 0.9.1
+PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
+PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/source/c/cssselect
+PYTHON_CSSSELECT_SETUP_TYPE = setuptools
+PYTHON_CSSSELECT_LICENSE = BSD-3c
+PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
