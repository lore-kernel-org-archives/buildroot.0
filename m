From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 21:53:53 +0200
Subject: [Buildroot] [git commit] python-portend: new package
Message-ID: <20170620200317.2C3D57FDF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e677a54f55fd440a835b7da5f2e2430151dc22d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-portend/Config.in           |  7 +++++++
 package/python-portend/python-portend.hash |  3 +++
 package/python-portend/python-portend.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3d225ff..b852dd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -783,6 +783,7 @@ menu "External python modules"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-pillow/Config.in"
+	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
diff --git a/package/python-portend/Config.in b/package/python-portend/Config.in
new file mode 100644
index 0000000..6b21078
--- /dev/null
+++ b/package/python-portend/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PORTEND
+	bool "python-portend"
+	select BR2_PACKAGE_PYTHON_TEMPORA # runtime
+	help
+	  TCP port monitoring utilities.
+
+	  https://github.com/jaraco/portend
diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
new file mode 100644
index 0000000..ce4d5f6
--- /dev/null
+++ b/package/python-portend/python-portend.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/portend/json, sha256 locally computed
+md5	a45e001d40227c4529b1a7186f4442f5  portend-1.8.tar.gz
+sha256	7de919b82c4ac60d4768fe80a2557290661aa665b7c427de6249d8cb2fde5561  portend-1.8.tar.gz
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
new file mode 100644
index 0000000..b0e89b1
--- /dev/null
+++ b/package/python-portend/python-portend.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-portend
+#
+################################################################################
+
+PYTHON_PORTEND_VERSION = 1.8
+PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
+PYTHON_PORTEND_SITE = https://pypi.python.org/packages/3f/37/f3ab6c4a00632d53d7dfb74ba4a695e86605b92b0a94bd41fa443b60ccb6
+PYTHON_PORTEND_LICENSE = MIT
+PYTHON_PORTEND_SETUP_TYPE = setuptools
+PYTHON_PORTEND_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
