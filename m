From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:11:26 +0100
Subject: [Buildroot] [git commit] python-pysmb: new package
Message-ID: <20151221223113.D7DF782571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16649b439bd0c9c9de0d34cad93ad371e8667fc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-pysmb/Config.in         | 15 +++++++++++++++
 package/python-pysmb/python-pysmb.hash |  3 +++
 package/python-pysmb/python-pysmb.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 066aa06..b57c3ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "External python modules"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
+	source "package/python-pysmb/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
new file mode 100644
index 0000000..42a9984
--- /dev/null
+++ b/package/python-pysmb/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_PYSMB
+	bool "python-pysmb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYTHON_PYASN
+	help
+	  pysmb is an experimental SMB/CIFS library written in Python.
+	  It implements the client-side SMB/CIFS protocol (SMB1 and SMB2)
+	  which allows your Python application to access and transfer files
+	  to/from SMB/CIFS shared folders like your Windows file sharing and
+	  Samba folders.
+
+	  https://miketeo.net/wp/index.php/projects/pysmb
+
+comment "python-pysmb needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
new file mode 100644
index 0000000..b3c91fe
--- /dev/null
+++ b/package/python-pysmb/python-pysmb.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=256b94bdeb63e6cc63f4b6a380b5918b, sha256 locally computed
+md5     256b94bdeb63e6cc63f4b6a380b5918b  pysmb-1.1.17.tar.gz
+sha256  267def5aef2f0f41be4ba141b29dce9c23214667e84bddefd285b56fd481d813  pysmb-1.1.17.tar.gz
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
new file mode 100644
index 0000000..1a00a4d
--- /dev/null
+++ b/package/python-pysmb/python-pysmb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pysmb
+#
+################################################################################
+
+PYTHON_PYSMB_VERSION = 1.1.17
+PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
+PYTHON_PYSMB_SITE = https://pypi.python.org/packages/source/p/pysmb
+PYTHON_PYSMB_LICENSE = libpng license
+PYTHON_PYSMB_LICENSE_FILES = LICENSE
+PYTHON_PYSMB_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
