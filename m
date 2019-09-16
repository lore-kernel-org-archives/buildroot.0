From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 16 Sep 2019 15:52:13 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-simplelogging: new package
Message-ID: <20190916135214.16271-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simplelogging is easier implementation of logging.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 Changeq v2 to v3
 Generate package with scanpypi
 
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-simplelogging/Config.in             |  7 +++++++
 .../python-simplelogging/python-simplelogging.hash |  5 +++++
 .../python-simplelogging/python-simplelogging.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-simplelogging/Config.in
 create mode 100644 package/python-simplelogging/python-simplelogging.hash
 create mode 100644 package/python-simplelogging/python-simplelogging.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9283fa3af1..e5c3d0d39a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1227,6 +1227,7 @@ F:	package/supervisor/
 
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog
+F:	package/python-simplelogging
 
 N:	J??rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
diff --git a/package/Config.in b/package/Config.in
index 84de744420..32f8572985 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1070,6 +1070,7 @@ menu "External python modules"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-simplelogging/Config.in"
 	source "package/python-simplesqlite/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
diff --git a/package/python-simplelogging/Config.in b/package/python-simplelogging/Config.in
new file mode 100644
index 0000000000..db95efa25f
--- /dev/null
+++ b/package/python-simplelogging/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SIMPLELOGGING
+	bool "python-simplelogging"
+	select BR2_PACKAGE_PYTHON_COLORLOG # runtime
+	help
+	  Logging made simple, no excuse for any debug print call.
+
+	  https://github.com/vpoulailleau/simplelogging
diff --git a/package/python-simplelogging/python-simplelogging.hash b/package/python-simplelogging/python-simplelogging.hash
new file mode 100644
index 0000000000..86698fe88c
--- /dev/null
+++ b/package/python-simplelogging/python-simplelogging.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/simplelogging/json
+md5	e3f9da393098d8fd8ebd8349a00692f2  simplelogging-0.10.0.tar.gz
+sha256	c070e0d82b68eff6918076a0edbf0a48b2c9a263854bd35f48a12c6adbbe9d80  simplelogging-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256	bd2a0fe3b3bab7092ffa7f58d46bb05d98f12f107b3a6be947c098f7c2ad1d1a  LICENSE
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
new file mode 100644
index 0000000000..0216bfa8b5
--- /dev/null
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simplelogging
+#
+################################################################################
+
+PYTHON_SIMPLELOGGING_VERSION = 0.10.0
+PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
+PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/17/85/3d2431f971e703916c7254e4560ed15451faedf2461eb484da9e1ebc5da6
+PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
+PYTHON_SIMPLELOGGING_LICENSE = FIXME: please specify the exact BSD version
+PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
