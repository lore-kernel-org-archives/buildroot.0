From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:17:58 +0100
Subject: [Buildroot] [git commit branch/next] python-pygments: new package
Message-ID: <20160219212020.C64C58183B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f17c345d9df90a1661816392a97ab18bde751f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-pygments/Config.in            |  6 ++++++
 package/python-pygments/python-pygments.hash |  3 +++
 package/python-pygments/python-pygments.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b69a481..ca3d063 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -686,6 +686,7 @@ menu "External python modules"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
+	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
diff --git a/package/python-pygments/Config.in b/package/python-pygments/Config.in
new file mode 100644
index 0000000..f097c52
--- /dev/null
+++ b/package/python-pygments/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYGMENTS
+	bool "python-pygments"
+	help
+	  Pygments is a syntax highlighting package written in Python.
+
+	  https://pypi.python.org/pypi/Pygments
diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
new file mode 100644
index 0000000..bb954dd
--- /dev/null
+++ b/package/python-pygments/python-pygments.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=84533d22f72de894f6d3907c3ca9eddf, sha256 locally computed.
+md5	84533d22f72de894f6d3907c3ca9eddf  Pygments-2.1.tar.gz
+sha256	13a0ef5fafd7b16cf995bc28fe7aab0780dab1b2fda0fc89e033709af8b8a47b  Pygments-2.1.tar.gz
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
new file mode 100644
index 0000000..eafd775
--- /dev/null
+++ b/package/python-pygments/python-pygments.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pygments
+#
+################################################################################
+
+PYTHON_PYGMENTS_VERSION = 2.1
+PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
+PYTHON_PYGMENTS_SITE = http://pypi.python.org/packages/source/P/Pygments
+PYTHON_PYGMENTS_LICENSE = BSD-2c
+PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
+PYTHON_PYGMENTS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
