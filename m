From: Joris Offouga <offougajoris@gmail.com>
Date: Sun, 15 Sep 2019 23:45:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-simplelogging: new package
In-Reply-To: <20190915214525.17779-1-offougajoris@gmail.com>
References: <20190915214525.17779-1-offougajoris@gmail.com>
Message-ID: <20190915214525.17779-2-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simplelogging is easier implementation of logging.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 package/Config.in                                   |  1 +
 package/python-simplelogging/Config.in              |  8 ++++++++
 .../python-simplelogging/python-simplelogging.mk    | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-simplelogging/Config.in
 create mode 100644 package/python-simplelogging/python-simplelogging.mk

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
