From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Apr 2015 17:05:03 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-pydal: new package
In-Reply-To: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1429023904-20194-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the python-pydal python package.
pyDAL is a pure Python Database Abstraction Layer.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:

v2 -> v3:
 * Moved pydal to a pure python-package.
 * Added the host variant to make it usable in host side scripts.
 * Moved to github download helper.
 * License update.
 * Added a package help.


 package/Config.in                    |  1 +
 package/python-pydal/Config.in       | 15 +++++++++++++++
 package/python-pydal/python-pydal.mk | 14 ++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/python-pydal/Config.in
 create mode 100644 package/python-pydal/python-pydal.mk

diff --git a/package/Config.in b/package/Config.in
index c27fc20..839b80a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -592,6 +592,7 @@ menu "external python modules"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycrypto/Config.in"
+	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyinotify/Config.in"
diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
new file mode 100644
index 0000000..590bcd4
--- /dev/null
+++ b/package/python-pydal/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_PYDAL
+	bool python-pydal
+	help
+	  pyDAL is a pure Python Database Abstraction Layer.
+	  It dynamically generates the SQL in real time using
+	  the specified dialect for the database back end,
+	  so that you do not have to write SQL code or learn
+	  different SQL dialects (the term SQL is used generically),
+	  and your code will be portable
+	  among different types of databases.
+
+	  pyDAL comes from the original web2py's DAL,
+	  with the aim of being wide-compatible.
+	  pyDAL doesn't require web2py and can be used
+	  in any Python context.
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
new file mode 100644
index 0000000..1ad4588
--- /dev/null
+++ b/package/python-pydal/python-pydal.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pydal
+#
+################################################################################
+
+PYTHON_PYDAL_VERSION = v15.03
+PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_LICENSE = BSD-3c
+PYTHON_PYDAL_LICENSE_FILES = LICENSE
+PYTHON_PYDAL_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
+$(eval $(python-package))
-- 
1.9.1
