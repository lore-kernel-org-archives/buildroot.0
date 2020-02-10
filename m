From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Mon, 10 Feb 2020 14:31:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-pbkdf2: new package.
In-Reply-To: <20200207153106.5042-1-raphael.melotte@essensium.com>
References: <20200207153106.5042-1-raphael.melotte@essensium.com>
Message-ID: <20200210133102.2654-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module implements the password-based key derivation function,
PBKDF2, specified in RSA PKCS#5 v2.0.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>

---
Changes v1 -> v2:
  - add README.txt as the license file (+hash) (suggested by Yegor)
  - update the description to be more explicit (suggested by Yegor)

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/python-pbkdf2/Config.in          |  7 +++++++
 package/python-pbkdf2/python-pbkdf2.hash |  6 ++++++
 package/python-pbkdf2/python-pbkdf2.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-pbkdf2/Config.in
 create mode 100644 package/python-pbkdf2/python-pbkdf2.hash
 create mode 100644 package/python-pbkdf2/python-pbkdf2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8ea23e0b3..7701958beb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2076,6 +2076,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
+F:  package/python-pbkdf2/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/paho-mqtt-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..2142b4e978 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1029,6 +1029,7 @@ menu "External python modules"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
+	source "package/python-pbkdf2/Config.in"
 	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
diff --git a/package/python-pbkdf2/Config.in b/package/python-pbkdf2/Config.in
new file mode 100644
index 0000000000..bd6a32907d
--- /dev/null
+++ b/package/python-pbkdf2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PBKDF2
+	bool "python-pbkdf2"
+	help
+      This module implements the password-based key derivation function,
+      PBKDF2, specified in RSA PKCS#5 v2.0.
+
+	  http://www.dlitz.net/software/python-pbkdf2/
diff --git a/package/python-pbkdf2/python-pbkdf2.hash b/package/python-pbkdf2/python-pbkdf2.hash
new file mode 100644
index 0000000000..b372a7fde8
--- /dev/null
+++ b/package/python-pbkdf2/python-pbkdf2.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pbkdf2/json
+md5	40cda566f61420490206597243dd869f  pbkdf2-1.3.tar.gz
+sha256	ac6397369f128212c43064a2b4878038dab78dab41875364554aaf2a684e6979  pbkdf2-1.3.tar.gz
+
+# Locally computed:
+sha256 903898253c5953a86a9b2333578a0e2403eb780b1b49d9ebca85a3c47aa2f9c1  README.txt
diff --git a/package/python-pbkdf2/python-pbkdf2.mk b/package/python-pbkdf2/python-pbkdf2.mk
new file mode 100644
index 0000000000..b1e011f752
--- /dev/null
+++ b/package/python-pbkdf2/python-pbkdf2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pbkdf2
+#
+################################################################################
+
+PYTHON_PBKDF2_VERSION = 1.3
+PYTHON_PBKDF2_SOURCE = pbkdf2-$(PYTHON_PBKDF2_VERSION).tar.gz
+PYTHON_PBKDF2_SITE = https://files.pythonhosted.org/packages/02/c0/6a2376ae81beb82eda645a091684c0b0becb86b972def7849ea9066e3d5e
+PYTHON_PBKDF2_SETUP_TYPE = setuptools
+PYTHON_PBKDF2_LICENSE = MIT
+PYTHON_PBKDF2_LICENSE_FILES = README.txt
+
+$(eval $(python-package))
-- 
2.23.0
