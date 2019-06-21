From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:34:18 +0200
Subject: [Buildroot] [git commit] package/python-pycairo: new package
Message-ID: <20190621203327.C2DEF826B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=130f229b9607a28684dc2264592183a8022c6827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Python module providing bindings for the cairo graphics library.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-pycairo/Config.in           |  7 +++++++
 package/python-pycairo/python-pycairo.hash |  7 +++++++
 package/python-pycairo/python-pycairo.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32fa00fdd9..aa55d7c141 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1530,6 +1530,7 @@ F:	package/python-flask-cors/
 F:	package/python-iptables/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
+F:	package/python-pycairo/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/python-tinyrpc/
diff --git a/package/Config.in b/package/Config.in
index 9628243751..f980e979e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -986,6 +986,7 @@ menu "External python modules"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
new file mode 100644
index 0000000000..0d8de977e1
--- /dev/null
+++ b/package/python-pycairo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYCAIRO
+	bool "python-pycairo"
+	select BR2_PACKAGE_CAIRO
+	help
+	  Python interface for cairo.
+
+	  https://pycairo.readthedocs.io
diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
new file mode 100644
index 0000000000..32e1f091ba
--- /dev/null
+++ b/package/python-pycairo/python-pycairo.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/pycairo/json
+md5	7610da8a40a7bed548991aa3416431d1  pycairo-1.18.1.tar.gz
+sha256	70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786  pycairo-1.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256	22c7747e2decb1b26e395b45dbaeb627784ef7fdbf2b80ac09a26a560277e58a  COPYING
+sha256	d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
+sha256	53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING-MPL-1.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
new file mode 100644
index 0000000000..b509755680
--- /dev/null
+++ b/package/python-pycairo/python-pycairo.mk
@@ -0,0 +1,15 @@
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
+PYTHON_PYCAIRO_DEPENDENCIES = cairo
+PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
+PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
+
+$(eval $(python-package))
