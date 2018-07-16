From: Daniel Nicoletti <dantti12@gmail.com>
Date: Mon, 16 Jul 2018 17:49:12 -0300
Subject: [Buildroot] [PATCH] cutelyst: new package
Message-ID: <20180716204912.8915-1-dantti12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A C++ Web Framework built on top of Qt, using
the simple approach of Catalyst (Perl) framework.

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
---
 package/Config.in              |  1 +
 package/cutelyst/Config.in     |  8 ++++++++
 package/cutelyst/cutelyst.hash |  2 ++
 package/cutelyst/cutelyst.mk   | 17 +++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/cutelyst/Config.in
 create mode 100644 package/cutelyst/cutelyst.hash
 create mode 100644 package/cutelyst/cutelyst.mk

diff --git a/package/Config.in b/package/Config.in
index eedce83616..08a3eac48a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Other GUIs"
 	source "package/kf5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
+	source "package/cutelyst/Config.in"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
new file mode 100644
index 0000000000..ef59947fc7
--- /dev/null
+++ b/package/cutelyst/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CUTELYST
+	bool "cutelyst"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE_SQL
+	select BR2_PACKAGE_QT5BASE_GUI
+	help
+	  A C++ Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework.
+
+	  https://cutelyst.org
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
new file mode 100644
index 0000000000..ae3f26c1fa
--- /dev/null
+++ b/package/cutelyst/cutelyst.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256  781e5da74ff5a03df415c70e9af0290d6aff5731d9f1978bf1bd4052bfe9cf05    cutelyst-2.5.0.tar.gz
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
new file mode 100644
index 0000000000..34a2323682
--- /dev/null
+++ b/package/cutelyst/cutelyst.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cutelyst
+#
+################################################################################
+
+CUTELYST_VERSION = 2.5.0
+CUTELYST_SOURCE = cutelyst-$(CUTELYST_VERSION).tar.gz
+CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
+CUTELYST_INSTALL_STAGING = YES
+CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
+CUTELYST_LICENSE = LGPL-2.1+
+CUTELYST_LICENSE_FILES = COPYING.LIB
+CUTELYST_DEPENDENCIES = qt5base
+CUTELYST_MAKE = $(MAKE1)
+
+$(eval $(cmake-package))
-- 
2.17.1
