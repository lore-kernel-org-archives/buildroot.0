From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:12 -0000
Subject: [Buildroot] [git commit branch/next] package/python-pydal: new
	package
Message-ID: <20150808105640.5947A7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84057b2eaddf093cfa97377c6f1aa01a3aa8cc4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package adds the python-pydal python package.  pyDAL is a pure
Python Database Abstraction Layer.

[Thomas:
  - rewrap Config.in help text
  - add upstream URL in Config.in help text.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-pydal/Config.in       |   16 ++++++++++++++++
 package/python-pydal/python-pydal.mk |   14 ++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9942e3a..a04a250 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ menu "external python modules"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycrypto/Config.in"
+	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyinotify/Config.in"
diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
new file mode 100644
index 0000000..9aa16f5
--- /dev/null
+++ b/package/python-pydal/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_PYDAL
+	bool python-pydal
+	help
+
+	  pyDAL is a pure Python Database Abstraction Layer.  It
+	  dynamically generates the SQL in real time using the
+	  specified dialect for the database back end, so that you do
+	  not have to write SQL code or learn different SQL dialects
+	  (the term SQL is used generically), and your code will be
+	  portable among different types of databases.
+
+	  pyDAL comes from the original web2py's DAL, with the aim of
+	  being wide-compatible.  pyDAL doesn't require web2py and can
+	  be used in any Python context.
+
+	  https://github.com/web2py/pydal
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
new file mode 100644
index 0000000..a99b61e
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
+$(eval $(python-package))
+$(eval $(host-python-package))
