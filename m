From: Joris Offouga <offougajoris@gmail.com>
Date: Sun, 15 Sep 2019 23:45:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-colorlog: new package
Message-ID: <20190915214525.17779-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Colorlog is a formatter for the python logging module.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-colorlog/Config.in          |  6 ++++++
 package/python-colorlog/python-colorlog.mk | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-colorlog/Config.in
 create mode 100644 package/python-colorlog/python-colorlog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4467688779..9283fa3af1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1225,6 +1225,9 @@ N:	Jonathan Liu <net147@gmail.com>
 F:	package/python-meld3/
 F:	package/supervisor/
 
+N:	Joris Offouga <offougajoris@gmail.com>
+F:	package/python-colorlog
+
 N:	J?rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
diff --git a/package/Config.in b/package/Config.in
index ab43543c7f..84de744420 100644
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
index 0000000000..f468b37ae8
--- /dev/null
+++ b/package/python-colorlog/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COLORLOG
+	bool "python-colorlog"
+	help
+	  A colored formatter for the python logging module
+
+	  https://github.com/borntyping/python-colorlog
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
new file mode 100644
index 0000000000..a15e1c56cf
--- /dev/null
+++ b/package/python-colorlog/python-colorlog.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-colorlog
+#
+################################################################################
+
+PYTHON_COLORLOG_VERSION = v4.0.1
+PYTHON_COLORLOG_SITE = $(call github,borntyping,python-colorlog,$(PYTHON_COLORLOG_VERSION))
+PYTHON_COLORLOG_LICENSE = MIT
+PYTHON_COLORLOG_LICENSE_FILES = LICENSE
+PYTHON_COLORLOG_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.20.1
