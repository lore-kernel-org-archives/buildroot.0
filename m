From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed,  9 Dec 2015 15:11:52 +0100
Subject: [Buildroot] [PATCH v2 2/3] python-pexpect: new package
In-Reply-To: <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1449670313-3613-3-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/Config.in                        |  1 +
 package/python-pexpect/Config.in         | 10 ++++++++++
 package/python-pexpect/python-pexpect.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-pexpect/Config.in
 create mode 100644 package/python-pexpect/python-pexpect.mk

diff --git a/package/Config.in b/package/Config.in
index 69bc347..77a92d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -638,6 +638,7 @@ menu "External python modules"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
+	source "package/python-pexpect/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
new file mode 100644
index 0000000..a42aec7
--- /dev/null
+++ b/package/python-pexpect/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PEXPECT
+	bool "python-pexpect"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PTYPROCESS
+	help
+	  Pexpect is a pure Python module for spawning child applications; controlling them; and responding to
+	  expected patterns in their output. Pexpect works like Don Libes? Expect. Pexpect allows your script
+	  to spawn a child application and control it as if a human were typing commands.
+
+	  https://pexpect.readthedocs.org
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
new file mode 100644
index 0000000..9de7849
--- /dev/null
+++ b/package/python-pexpect/python-pexpect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pexpect
+#
+################################################################################
+
+PYTHON_PEXPECT_VERSION = 4.0.1
+PYTHON_PEXPECT_SITE = $(call github,pexpect,pexpect,$(PYTHON_PEXPECT_VERSION))
+PYTHON_PEXPECT_LICENSE = ISC
+PYTHON_PEXPECT_LICENSE_FILES = LICENSE
+PYTHON_PEXPECT_SETUP_TYPE = distutils
+PYTHON_PEXPECT_DEPENDENCIES = python-ptyprocess
+
+$(eval $(python-package))
-- 
2.6.3
