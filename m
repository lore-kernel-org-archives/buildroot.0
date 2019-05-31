From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 May 2019 12:16:51 -0500
Subject: [Buildroot] [PATCH 3/6] package/python-pycairo: new package
In-Reply-To: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190531171654.17906-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Python module providing bindings for the cairo graphics library.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-pycairo/Config.in           |  7 +++++++
 package/python-pycairo/python-pycairo.hash |  5 +++++
 package/python-pycairo/python-pycairo.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-pycairo/Config.in
 create mode 100644 package/python-pycairo/python-pycairo.hash
 create mode 100644 package/python-pycairo/python-pycairo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0aa5b1754d..e4c25e1877 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1523,6 +1523,7 @@ F:	package/python-flask-cors/
 F:	package/python-iptables/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
+F:	package/python-pycairo/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
diff --git a/package/Config.in b/package/Config.in
index 13b43ec0dd..d89bbbb4bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -980,6 +980,7 @@ menu "External python modules"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
new file mode 100644
index 0000000000..2d44dec85e
--- /dev/null
+++ b/package/python-pycairo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYCAIRO
+	bool "python-pycairo"
+	select on BR2_PACKAGE_CAIRO # runtime dependency
+	help
+	  Python interface for cairo.
+
+	  https://pycairo.readthedocs.io
diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
new file mode 100644
index 0000000000..6da73c04d3
--- /dev/null
+++ b/package/python-pycairo/python-pycairo.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pycairo/json
+md5	7610da8a40a7bed548991aa3416431d1  pycairo-1.18.1.tar.gz
+sha256	70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786  pycairo-1.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256	22c7747e2decb1b26e395b45dbaeb627784ef7fdbf2b80ac09a26a560277e58a  COPYING
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
new file mode 100644
index 0000000000..be03d58e82
--- /dev/null
+++ b/package/python-pycairo/python-pycairo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycairo
+#
+################################################################################
+
+PYTHON_PYCAIRO_VERSION = 1.18.1
+PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/48/20/5e83af98eb897935bf7dc39455e892ba866feebb9b7c3b392982866f9958
+PYTHON_PYCAIRO_SETUP_TYPE = setuptools
+PYTHON_PYCAIRO_LICENSE = LGPL-2.0, MPL-1.1
+PYTHON_PYCAIRO_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.17.1
