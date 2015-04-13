From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Apr 2015 15:57:26 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-pydal: new package
In-Reply-To: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1428933447-32061-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the python-pydal dependency for web2py.
This is a submodule and used by web2py only.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-pydal/Config.in       |  2 ++
 package/python-pydal/python-pydal.mk | 13 +++++++++++++
 3 files changed, 16 insertions(+)
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
index 0000000..eda2f77
--- /dev/null
+++ b/package/python-pydal/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_PYTHON_PYDAL
+	bool
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
new file mode 100644
index 0000000..a88bf8b
--- /dev/null
+++ b/package/python-pydal/python-pydal.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pydal
+#
+################################################################################
+
+PYTHON_PYDAL_VERSION = v15.03
+PYTHON_PYDAL_SITE = https://github.com/web2py/pydal.git
+PYTHON_PYDAL_SITE_METHOD = git
+PYTHON_PYDAL_LICENSE = BSDv3
+PYTHON_PYDAL_LICENSE_FILES = LICENSE
+
+$(eval $(generic-package))
-- 
1.9.1
