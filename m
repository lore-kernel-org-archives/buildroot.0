From: Joris Offouga <offougajoris@gmail.com>
Date: Sun, 15 Sep 2019 23:50:55 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/python-simplelogging: new package
Message-ID: <20190915215055.19100-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simplelogging is easier implementation of logging.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>

---
Changes v1 -> V2
Add missing entry in developers

 DEVELOPERS                                          |  1 +
 package/Config.in                                   |  1 +
 package/python-simplelogging/Config.in              |  8 ++++++++
 .../python-simplelogging/python-simplelogging.mk    | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-simplelogging/Config.in
 create mode 100644 package/python-simplelogging/python-simplelogging.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9283fa3af1..e5c3d0d39a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1227,6 +1227,7 @@ F:	package/supervisor/
 
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog
+F:	package/python-simplelogging
 
 N:	J?rg Krause <joerg.krause@embedded.rocks>
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
index 0000000000..70765205cc
--- /dev/null
+++ b/package/python-simplelogging/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SIMPLELOGGING
+	bool "python-simplelogging"
+	depends on BR2_PACKAGE_PYTHON_COLORLOG
+	select BR2_PACKAGE_PYTHON_COLORLOG
+	help
+	  Logging made simple, no excuse for any debug print call.
+
+	  https://github.com/vpoulailleau/simplelogging
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
new file mode 100644
index 0000000000..939efb090c
--- /dev/null
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-simplelogging
+#
+################################################################################
+
+PYTHON_SIMPLELOGGING_VERSION = cc92abd7991789cb1f577decf0f2b88517e8a613
+PYTHON_SIMPLELOGGING_SITE = $(call github,vpoulailleau,simplelogging,$(PYTHON_SIMPLELOGGING_VERSION))
+PYTHON_SIMPLELOGGING_LICENSE = BSD 3-Clause
+PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
+PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.20.1
