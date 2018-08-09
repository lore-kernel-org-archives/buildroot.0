From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:40:12 +0200
Subject: [Buildroot] [git commit branch/next] python-pip: new package
Message-ID: <20180809203350.84E6A7F8BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5e2de1fd7a05b53d1775c1b710983a4204dd852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A useful tool for managing and installing python packages.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-pip/Config.in       |  6 ++++++
 package/python-pip/python-pip.hash |  5 +++++
 package/python-pip/python-pip.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 67adc08b9a..e0e37a031a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -53,6 +53,7 @@ F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
+F:	package/python-pip/
 F:	package/python-psycopg2/
 F:	package/python-sqlalchemy/
 F:	package/python-visitor/
diff --git a/package/Config.in b/package/Config.in
index 18813b3965..bc6df3a3b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -874,6 +874,7 @@ menu "External python modules"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-pillow/Config.in"
+	source "package/python-pip/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
new file mode 100644
index 0000000000..4fcd55e5ab
--- /dev/null
+++ b/package/python-pip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PIP
+	bool "python-pip"
+	help
+	  The PyPA recommended tool for installing Python packages.
+
+	  https://pip.pypa.io/
diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
new file mode 100644
index 0000000000..c9b574a6dd
--- /dev/null
+++ b/package/python-pip/python-pip.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pip/json
+md5	52f75ceb21e96c258f289859a2996b60  pip-18.0.tar.gz
+sha256	a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76  pip-18.0.tar.gz
+# Locally computed sha256 checksums
+sha256	391a8784e319dae5431477d4cc9bc504fc5d71fd9e89e1c80f1cd3855f5d7cfa  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
new file mode 100644
index 0000000000..0a0dce5bca
--- /dev/null
+++ b/package/python-pip/python-pip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pip
+#
+################################################################################
+
+PYTHON_PIP_VERSION = 18.0
+PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/69/81/52b68d0a4de760a2f1979b0931ba7889202f302072cc7a0d614211bc7579
+PYTHON_PIP_SETUP_TYPE = setuptools
+PYTHON_PIP_LICENSE = MIT
+PYTHON_PIP_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
