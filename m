From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 21:40:18 +0100
Subject: [Buildroot] [git commit] python-pyxb: new package
Message-ID: <20150123204619.3D75D80E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b32323f80da4f612080388cc1a2f642b27528247
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix license tag, white space]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/python-pyxb/Config.in        |    7 +++++++
 package/python-pyxb/python-pyxb.hash |    2 ++
 package/python-pyxb/python-pyxb.mk   |   13 +++++++++++++
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 32d6755..5f6ebc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -545,6 +545,7 @@ menu "external python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
+	source "package/python-pyxb/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
new file mode 100644
index 0000000..f122671
--- /dev/null
+++ b/package/python-pyxb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYXB
+	bool "python-pyxb"
+	help
+	  PyXB is a pure Python package that generates Python code
+	  for classes that correspond to data structures defined by XMLSchema.
+
+	  http://pyxb.sourceforge.net/
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
new file mode 100644
index 0000000..d8b43f8
--- /dev/null
+++ b/package/python-pyxb/python-pyxb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  14ced19ecce51e7cd26434446f9bd6b4e309e91806f1f6fc5e21f4ac736aa0de  python-pyxb-1.2.4.tar.gz
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
new file mode 100644
index 0000000..eb9ffce
--- /dev/null
+++ b/package/python-pyxb/python-pyxb.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pyxb
+#
+################################################################################
+
+PYTHON_PYXB_VERSION = 1.2.4
+PYTHON_PYXB_SITE = $(call github,pabigot,pyxb,PyXB-$(PYTHON_PYXB_VERSION))
+PYTHON_PYXB_LICENSE = Apache-2.0
+PYTHON_PYXB_LICENSE_FILES = LICENSE
+PYTHON_PYXB_SETUP_TYPE = distutils
+
+$(eval $(python-package))
