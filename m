From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:17:53 +0200
Subject: [Buildroot] [git commit] package/python-colorlog: new package
Message-ID: <20190919211726.1AD0B8EC66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de35edfed4377f2e3ca500bd817e4d927a741a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Colorlog is a formatter for the python logging module.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-colorlog/Config.in            |  6 ++++++
 package/python-colorlog/python-colorlog.hash |  5 +++++
 package/python-colorlog/python-colorlog.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 329bed30a7..b1f62edd57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1226,6 +1226,9 @@ N:	Jonathan Liu <net147@gmail.com>
 F:	package/python-meld3/
 F:	package/supervisor/
 
+N:	Joris Offouga <offougajoris@gmail.com>
+F:	package/python-colorlog/
+
 N:	J??rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
diff --git a/package/Config.in b/package/Config.in
index b5bf6b45c5..e227f7c46f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -859,6 +859,7 @@ menu "External python modules"
 	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
 	source "package/python-colorama/Config.in"
+	source "package/python-colorlog/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
diff --git a/package/python-colorlog/Config.in b/package/python-colorlog/Config.in
new file mode 100644
index 0000000000..673f97aad2
--- /dev/null
+++ b/package/python-colorlog/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COLORLOG
+	bool "python-colorlog"
+	help
+	  Log formatting with colors.
+
+	  https://github.com/borntyping/python-colorlog
diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
new file mode 100644
index 0000000000..c31c5c7ca8
--- /dev/null
+++ b/package/python-colorlog/python-colorlog.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/colorlog/json
+md5	292f0e1ecdea0910f4ea514378c6be29  colorlog-4.0.2.tar.gz
+sha256	3cf31b25cbc8f86ec01fef582ef3b840950dea414084ed19ab922c8b493f9b42  colorlog-4.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256	915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
new file mode 100644
index 0000000000..8191dbaa0f
--- /dev/null
+++ b/package/python-colorlog/python-colorlog.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-colorlog
+#
+################################################################################
+
+PYTHON_COLORLOG_VERSION = 4.0.2
+PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/fc/30/6ba1282b773e9f44d9cfaafa38b6cc180441307c5fe0edd8db13a8903e3f
+PYTHON_COLORLOG_SETUP_TYPE = setuptools
+PYTHON_COLORLOG_LICENSE = MIT
+PYTHON_COLORLOG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
