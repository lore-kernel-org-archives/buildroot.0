From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Mon, 6 Jan 2014 15:18:17 -0600
Subject: [Buildroot] [PATCH 1/1] python-posix-ipc: new package
Message-ID: <1389043097-30018-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on the original new pkg patch submitted last Jan
and is part of the "Patchwork oldest patches cleanup #5".  It combines
the original "[1/2]/[2/2] new package: python-posix_ipc" patch files.

The libc wrapper code is written in C has dependencies on the rt lib.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in                            |    1 +
 package/python-posix-ipc/Config.in           |   10 ++++++++++
 package/python-posix-ipc/python-poxix-ipc.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/python-posix-ipc/Config.in
 create mode 100644 package/python-posix-ipc/python-poxix-ipc.mk

diff --git a/package/Config.in b/package/Config.in
index e502cde..501bd3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-posix-ipc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
 source "package/python-pycrypto/Config.in"
diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
new file mode 100644
index 0000000..2fbc7a7
--- /dev/null
+++ b/package/python-posix-ipc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_POSIX_IPC
+	bool "python-posix-ipc"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  The Python extension module posix_ipc gives access to POSIX
+	  inter-process semaphores, shared memory and message queues
+	  on systems that support the POSIX Realtime Extensions
+	  a.k.a. POSIX 1003.1b-1993.
+
+	  http://semanchuk.com/philip/posix_ipc/
diff --git a/package/python-posix-ipc/python-poxix-ipc.mk b/package/python-posix-ipc/python-poxix-ipc.mk
new file mode 100644
index 0000000..24518b2
--- /dev/null
+++ b/package/python-posix-ipc/python-poxix-ipc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-posix-ipc
+#
+################################################################################
+
+PYTHON_POSIX_IPC_VERSION = 0.9.6
+PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
+PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc/
+PYTHON_POSIX_IPC_LICENSE = BSD-2c
+PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
+PYTHON_POSIX_IPC_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
1.7.1
