From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:24:16 +0200
Subject: [Buildroot] [git commit] package/python-soupsieve: new package
Message-ID: <20191014201852.86C458DF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=521e36f48aff2c1a8362ad7255ab7fa0f570cb8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A modern CSS selector implementation for Beautiful Soup.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-soupsieve/Config.in             |  8 ++++++++
 package/python-soupsieve/python-soupsieve.hash |  5 +++++
 package/python-soupsieve/python-soupsieve.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 96ce12e388..c835545fae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1090,6 +1090,7 @@ menu "External python modules"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers/Config.in"
+	source "package/python-soupsieve/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqlparse/Config.in"
diff --git a/package/python-soupsieve/Config.in b/package/python-soupsieve/Config.in
new file mode 100644
index 0000000000..c7571b3136
--- /dev/null
+++ b/package/python-soupsieve/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SOUPSIEVE
+	bool "python-soupsieve"
+	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
+               if BR2_PACKAGE_PYTHON # runtime
+	help
+	  A modern CSS selector implementation for Beautiful Soup.
+
+	  https://github.com/facelessuser/soupsieve
diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
new file mode 100644
index 0000000000..c4c1273e5a
--- /dev/null
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/soupsieve/json
+md5	43d8ea20c58494446aa65ba5cc6320fe  soupsieve-1.9.4.tar.gz
+sha256	605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3  soupsieve-1.9.4.tar.gz
+# Locally computed sha256 checksums
+sha256	0eee19bf360e5f7a8180e2f6d613d716f7115a456f670e3d8bb35c45a0db1838  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
new file mode 100644
index 0000000000..1203b26ce0
--- /dev/null
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-soupsieve
+#
+################################################################################
+
+PYTHON_SOUPSIEVE_VERSION = 1.9.4
+PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7f/4e/95a13527e18b6f1a15c93f1c634b86d5fa634c5619dce695f4e0cd68182f
+PYTHON_SOUPSIEVE_SETUP_TYPE = setuptools
+PYTHON_SOUPSIEVE_LICENSE = MIT
+PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
