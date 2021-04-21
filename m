From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 23:14:11 +0200
Subject: [Buildroot] [git commit] package/python-iwlib: new package
Message-ID: <20210421205800.5D1CD843B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2fe5c119cedf0668286fed47238c407f398a3b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A package for interfacing with iwlib, providing an implementation to
the wireless tools in Linux.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-iwlib/Config.in         |  8 ++++++++
 package/python-iwlib/python-iwlib.hash |  3 +++
 package/python-iwlib/python-iwlib.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 678c1825ad..95b52d76be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1789,6 +1789,7 @@ F:	package/python-filelock/
 F:	package/python-flask-cors/
 F:	package/python-iptables/
 F:	package/python-ipy/
+F:	package/python-iwlib/
 F:	package/python-posix-ipc/
 F:	package/python-pycairo/
 F:	package/python-pypcap/
diff --git a/package/Config.in b/package/Config.in
index 0d7cb0f446..b9d277428d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1031,6 +1031,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
+	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
diff --git a/package/python-iwlib/Config.in b/package/python-iwlib/Config.in
new file mode 100644
index 0000000000..eb28d674d9
--- /dev/null
+++ b/package/python-iwlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_IWLIB
+	bool "python-iwlib"
+	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	help
+	  python-iwlib is a package for interfacing with iwlib,
+	  providing an implementation to the wireless tools in Linux.
+
+	  https://github.com/nhoad/python-iwlib
diff --git a/package/python-iwlib/python-iwlib.hash b/package/python-iwlib/python-iwlib.hash
new file mode 100644
index 0000000000..4d71a3fea6
--- /dev/null
+++ b/package/python-iwlib/python-iwlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7f1ad4354284a452388e178b5d9b191fa5a68a9183423a90a1d261ba2ebd1cac  python-iwlib-1.5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
new file mode 100644
index 0000000000..9d0985567d
--- /dev/null
+++ b/package/python-iwlib/python-iwlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iwlib
+#
+################################################################################
+
+PYTHON_IWLIB_VERSION = 1.5
+PYTHON_IWLIB_SITE = $(call github,nhoad,python-iwlib,$(PYTHON_IWLIB_VERSION))
+PYTHON_IWLIB_LICENSE = GPL-2.0
+PYTHON_IWLIB_LICENSE_FILES = COPYING
+PYTHON_IWLIB_SETUP_TYPE = setuptools
+PYTHON_IWLIB_DEPENDENCIES = wireless_tools
+
+$(eval $(python-package))
