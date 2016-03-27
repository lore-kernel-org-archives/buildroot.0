From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sun, 27 Mar 2016 03:31:23 +0200
Subject: [Buildroot] [PATCH v4 2/3] python-pexpect: new package
In-Reply-To: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1459042284-6684-3-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4
* source https://pypi.python.org/pypi/pexpect
* added hash file

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in                          |  1 +
 package/python-pexpect/Config.in           | 11 +++++++++++
 package/python-pexpect/python-pexpect.hash |  4 ++++
 package/python-pexpect/python-pexpect.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-pexpect/Config.in
 create mode 100644 package/python-pexpect/python-pexpect.hash
 create mode 100644 package/python-pexpect/python-pexpect.mk

diff --git a/package/Config.in b/package/Config.in
index fda5231..1c995ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -686,6 +686,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pexpect/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
new file mode 100644
index 0000000..4d04c01
--- /dev/null
+++ b/package/python-pexpect/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PEXPECT
+	bool "python-pexpect"
+	select BR2_PACKAGE_PYTHON_PTYPROCESS
+	help
+	  Pexpect is a pure Python module for spawning child applications;
+	  controlling them; and responding to expected patterns in their
+	  output. Pexpect works like Don Libes? Expect. Pexpect allows your
+	  script to spawn a child application and control it as if a human
+	  were typing commands.
+
+	  https://pexpect.readthedocs.org
diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
new file mode 100644
index 0000000..0d1e1fe
--- /dev/null
+++ b/package/python-pexpect/python-pexpect.hash
@@ -0,0 +1,4 @@
+# got from https://pypi.python.org
+md5sum	056df81e6ca7081f1015b4b147b977b7
+# computed manually:
+sha256sum 232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c  pexpect-4.0.1.tar.gz
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
new file mode 100644
index 0000000..8b2809b
--- /dev/null
+++ b/package/python-pexpect/python-pexpect.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pexpect
+#
+################################################################################
+
+PYTHON_PEXPECT_VERSION = 4.0.1
+PYTHON_PEXPECT_SITE = https://pypi.python.org/pypi/pexpect
+PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
+PYTHON_PEXPECT_LICENSE = ISC
+PYTHON_PEXPECT_LICENSE_FILES = LICENSE
+PYTHON_PEXPECT_SETUP_TYPE = distutils
+PYTHON_PEXPECT_DEPENDENCIES = python-ptyprocess
+
+$(eval $(python-package))
-- 
2.7.0
