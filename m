From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 29 Dec 2015 23:43:48 +0100
Subject: [Buildroot] [PATCH] python-serial: bump to 3.0
Message-ID: <1451429028-10049-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file, switch to setuptools and change project's home page to
GitHub.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-serial/Config.in          | 2 +-
 package/python-serial/python-serial.hash | 3 +++
 package/python-serial/python-serial.mk   | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 package/python-serial/python-serial.hash

diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index 09a4c39..ca12d12 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_SERIAL
 	help
 	  python-serial is a Python library to access serial ports.
 
-	  http://pyserial.sf.net
+	  https://github.com/pyserial/pyserial
diff --git a/package/python-serial/python-serial.hash b/package/python-serial/python-serial.hash
new file mode 100644
index 0000000..7400624
--- /dev/null
+++ b/package/python-serial/python-serial.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f94bc6e141d60f17edc7bf8757c4d922, sha256 locally computed
+md5     f94bc6e141d60f17edc7bf8757c4d922  pyserial-3.0.tar.gz
+sha256  056c2d96c83c009d8d04aad43a90f91f10f6a97d42c0d9656c2655c63fb8ff07  pyserial-3.0.tar.gz
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index b9b5931..ba871ea 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_VERSION = 2.6
+PYTHON_SERIAL_VERSION = 3.0
 PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE = http://pypi.python.org/packages/source/p/pyserial
 PYTHON_SERIAL_LICENSE = Python Software Foundation License
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
-PYTHON_SERIAL_SETUP_TYPE = distutils
+PYTHON_SERIAL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.1.4
