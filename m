From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:41:30 +0200
Subject: [Buildroot] [git commit] python-ptyprocess: new package
Message-ID: <20160415204628.27F2A802AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b937ad0e679cc6bb42a398205d13affde69fdda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
[Thomas:
 - fix hash file
 - fix <pkg>_SITE variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/python-ptyprocess/Config.in              |  7 +++++++
 package/python-ptyprocess/python-ptyprocess.hash |  3 +++
 package/python-ptyprocess/python-ptyprocess.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c1dccfd..25b43c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -691,6 +691,7 @@ menu "External python modules"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
+	source "package/python-ptyprocess/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-ptyprocess/Config.in b/package/python-ptyprocess/Config.in
new file mode 100644
index 0000000..b95dacb
--- /dev/null
+++ b/package/python-ptyprocess/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PTYPROCESS
+	bool "python-ptyprocess"
+	help
+	  Launch a subprocess in a pseudo terminal (pty), and interact
+	  with both the process and its pty.
+
+	  https://github.com/pexpect/ptyprocess
diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
new file mode 100644
index 0000000..0e2e0ae
--- /dev/null
+++ b/package/python-ptyprocess/python-ptyprocess.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org, sha256 locally computed
+md5	94e537122914cc9ec9c1eadcd36e73a1 ptyprocess-0.5.1.tar.gz
+sha256 0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6  ptyprocess-0.5.1.tar.gz
diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
new file mode 100644
index 0000000..59329d0
--- /dev/null
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ptyprocess
+#
+################################################################################
+
+PYTHON_PTYPROCESS_VERSION = 0.5.1
+PYTHON_PTYPROCESS_SITE = https://pypi.python.org/packages/source/p/ptyprocess
+PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
+PYTHON_PTYPROCESS_LICENSE = ISC
+PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
+PYTHON_PTYPROCESS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
