From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 24 Aug 2018 22:16:50 +0300
Subject: [Buildroot] [PATCH 1/1] python-fire: new package
Message-ID: <20180824191650.4200-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A library for automatically generating command line interfaces.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-fire/Config.in        |  8 ++++++++
 package/python-fire/python-fire.hash |  5 +++++
 package/python-fire/python-fire.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-fire/Config.in
 create mode 100644 package/python-fire/python-fire.hash
 create mode 100644 package/python-fire/python-fire.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 481c74f9f2..4832b004f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -199,6 +199,7 @@ F:	package/stress/
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/libuv/
+F:	package/python-fire/
 F:	package/python-jsonmodels/
 F:	package/python-reentry/
 F:	package/python-subprocess32/
diff --git a/package/Config.in b/package/Config.in
index eda0f698dc..653f8259a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -820,6 +820,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
+	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-babel/Config.in"
diff --git a/package/python-fire/Config.in b/package/python-fire/Config.in
new file mode 100644
index 0000000000..2c6e55ab6b
--- /dev/null
+++ b/package/python-fire/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FIRE
+	bool "python-fire"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A library for automatically generating command line
+	  interfaces.
+
+	  https://github.com/google/python-fire
diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
new file mode 100644
index 0000000000..d6304369d5
--- /dev/null
+++ b/package/python-fire/python-fire.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fire/json
+md5	44c51c634b61acc7ed42a413a64de38a  fire-0.1.3.tar.gz
+sha256	c299d16064ff81cbb649b65988300d4a28b71ecfb789d1fb74d99ea98ae4d2eb  fire-0.1.3.tar.gz
+# Locally computed sha256 checksums
+sha256	a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
new file mode 100644
index 0000000000..bdb5ee191c
--- /dev/null
+++ b/package/python-fire/python-fire.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fire
+#
+################################################################################
+
+PYTHON_FIRE_VERSION = 0.1.3
+PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/5a/b7/205702f348aab198baecd1d8344a90748cb68f53bdcd1cc30cbc08e47d3e
+PYTHON_FIRE_SETUP_TYPE = setuptools
+PYTHON_FIRE_LICENSE = Apache-2.0
+PYTHON_FIRE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
