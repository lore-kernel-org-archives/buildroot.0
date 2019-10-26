From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 17:29:41 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/python-cheetah3: new package
In-Reply-To: <20191026152943.122511-1-titouan.christophe@railnova.eu>
References: <20191026152943.122511-1-titouan.christophe@railnova.eu>
Message-ID: <20191026152943.122511-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

host-python-cheetah3 for host-python3 is required for mongodb 4.1.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Titouan: Fix comment line contains UTF-8 characters]
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-cheetah3/Config.in            |  6 ++++++
 package/python-cheetah3/python-cheetah3.hash |  5 +++++
 package/python-cheetah3/python-cheetah3.mk   | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-cheetah3/Config.in
 create mode 100644 package/python-cheetah3/python-cheetah3.hash
 create mode 100644 package/python-cheetah3/python-cheetah3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b9e6881419..952b49fa17 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -867,6 +867,7 @@ F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/python-backcall/
+F:	package/python-cheetah3/
 F:	package/python-jedi/
 F:	package/python-parso/
 F:	package/rygel/
diff --git a/package/Config.in b/package/Config.in
index 901c25fe02..9a22aa1e52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -860,6 +860,7 @@ menu "External python modules"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
+	source "package/python-cheetah3/Config.in"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
diff --git a/package/python-cheetah3/Config.in b/package/python-cheetah3/Config.in
new file mode 100644
index 0000000000..9c5761f556
--- /dev/null
+++ b/package/python-cheetah3/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHEETAH3
+	bool "python-cheetah3"
+	help
+	  Cheetah is a template engine and code generation tool.
+
+	  http://cheetahtemplate.org/
diff --git a/package/python-cheetah3/python-cheetah3.hash b/package/python-cheetah3/python-cheetah3.hash
new file mode 100644
index 0000000000..67f4a720db
--- /dev/null
+++ b/package/python-cheetah3/python-cheetah3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cheetah3/json
+md5	e0cbd10b6fa0d4b294f7fb6453d85a2a  Cheetah3-3.2.1.tar.gz
+sha256	685f961d2761e140bfea67156a013313acda66a229edc6c8708b71d9080ece9c  Cheetah3-3.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	21b356594daaefc1b482b7f7ef2b7a83910c95ebd49d7170ce6ec5a18f084442  LICENSE
diff --git a/package/python-cheetah3/python-cheetah3.mk b/package/python-cheetah3/python-cheetah3.mk
new file mode 100644
index 0000000000..38a0921297
--- /dev/null
+++ b/package/python-cheetah3/python-cheetah3.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-cheetah3
+#
+################################################################################
+
+PYTHON_CHEETAH3_VERSION = 3.2.1
+PYTHON_CHEETAH3_SOURCE = Cheetah3-$(PYTHON_CHEETAH3_VERSION).tar.gz
+PYTHON_CHEETAH3_SITE = https://files.pythonhosted.org/packages/d8/49/25d1d310c274433e1bc82736483f2c57f870688deddb0c56f296dcfe36f7
+PYTHON_CHEETAH3_SETUP_TYPE = setuptools
+PYTHON_CHEETAH3_LICENSE = MIT
+PYTHON_CHEETAH3_LICENSE_FILES = LICENSE
+
+# Needed to build mongodb
+HOST_PYTHON_CHEETAH3_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.21.0
