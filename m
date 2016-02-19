From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 00:02:45 +0100
Subject: [Buildroot] [git commit branch/next] python-setproctitle: new
	package
Message-ID: <20160219230340.71773803C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a7d79e99430bb9d03c9196761cd67c575db8304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                    |  1 +
 package/python-setproctitle/Config.in                |  6 ++++++
 package/python-setproctitle/python-setproctitle.hash |  3 +++
 package/python-setproctitle/python-setproctitle.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ce15775..4862280 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -713,6 +713,7 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
+	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-setproctitle/Config.in b/package/python-setproctitle/Config.in
new file mode 100644
index 0000000..d13afaa
--- /dev/null
+++ b/package/python-setproctitle/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SETPROCTITLE
+	bool "python-setproctitle"
+	help
+	  A Python module to customize the process title.
+
+	  https://pypi.python.org/pypi/setproctitle
diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
new file mode 100644
index 0000000..3b0fd71
--- /dev/null
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=95d9e56c69437246460a20804961d70d, sha256 locally computed.
+md5	95d9e56c69437246460a20804961d70d  setproctitle-1.1.9.tar.gz
+sha256	1c3414d18f9cacdab78b0ffd8e886d56ad45f22e55001a72aaa0b2aeb56a0ad7  setproctitle-1.1.9.tar.gz
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
new file mode 100644
index 0000000..63dfad0
--- /dev/null
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-setproctitle
+#
+################################################################################
+
+PYTHON_SETPROCTITLE_VERSION = 1.1.9
+PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
+PYTHON_SETPROCTITLE_SITE = http://pypi.python.org/packages/source/s/setproctitle
+PYTHON_SETPROCTITLE_LICENSE = BSD-3c
+PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
+PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
+
+$(eval $(python-package))
