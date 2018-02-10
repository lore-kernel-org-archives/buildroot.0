From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:19:29 +0100
Subject: [Buildroot] [git commit branch/next] python-sqlalchemy: new package
Message-ID: <20180210152053.8E8928822E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133a0a3b9e0ec743ac3e673e97a551e6be403c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that
gives application developers the full power and flexibility of SQL.

It provides a full suite of well known enterprise-level persistence
patterns, designed for efficient and high-performing database access,
adapted into a simple and Pythonic domain language.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: fix check-package warnings.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-sqlalchemy/Config.in              | 13 +++++++++++++
 package/python-sqlalchemy/python-sqlalchemy.hash |  4 ++++
 package/python-sqlalchemy/python-sqlalchemy.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0605af387..f859ebe984 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -52,6 +52,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/python-sqlalchemy/
 F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/selinux-python/
diff --git a/package/Config.in b/package/Config.in
index 5929cfea2d..6bd95e3bf0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -919,6 +919,7 @@ menu "External python modules"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
+	source "package/python-sqlalchemy/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-sqlalchemy/Config.in b/package/python-sqlalchemy/Config.in
new file mode 100644
index 0000000000..f7ec3a6ad4
--- /dev/null
+++ b/package/python-sqlalchemy/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_SQLALCHEMY
+	bool "python-sqlalchemy"
+	help
+	  SQLAlchemy is the Python SQL toolkit and Object Relational
+	  Mapper that gives application developers the full power and
+	  flexibility of SQL.
+
+	  It provides a full suite of well known enterprise-level
+	  persistence patterns, designed for efficient and
+	  high-performing database access, adapted into a simple and
+	  Pythonic domain language.
+
+	  http://www.sqlalchemy.org
diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
new file mode 100644
index 0000000000..9e13a2f20f
--- /dev/null
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/SQLAlchemy/json, sha256 locally computed
+md5    968e07dc0aa92f9205bb3877f33f498f  SQLAlchemy-1.2.2.tar.gz
+sha256 64b4720f0a8e033db0154d3824f5bf677cf2797e11d44743cf0aebd2a0499d9d  SQLAlchemy-1.2.2.tar.gz
+sha256 73bda3d7d6c568f494c1d12520a97d41a38b7ce91d88c21f1b469b747b17f7fd  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
new file mode 100644
index 0000000000..c0023712a2
--- /dev/null
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sqlalchemy
+#
+################################################################################
+
+PYTHON_SQLALCHEMY_VERSION = 1.2.2
+PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
+PYTHON_SQLALCHEMY_SITE = https://pypi.python.org/packages/b9/fb/a56d2fc0ce3571328fa872734ad124cae25a4cea422088987f865fb71787
+PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
+PYTHON_SQLALCHEMY_LICENSE = MIT
+PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
