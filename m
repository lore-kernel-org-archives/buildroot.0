From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 21:39:38 +0100
Subject: [Buildroot] [git commit] python-posix-ipc: new package
Message-ID: <20140112204757.A54549C488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b73ae969bd14b6af4aa1a2a8f70fa6bada00fc1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is based on the original new pkg patch submitted last Jan
and is part of the "Patchwork oldest patches cleanup #5".  It combines
the original "[1/2]/[2/2] new package: python-posix_ipc" patch files.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |    1 +
 package/python-posix-ipc/Config.in           |   14 ++++++++++++++
 package/python-posix-ipc/python-poxix-ipc.mk |   14 ++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de1132b..aac6f02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -409,6 +409,7 @@ source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-posix-ipc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
 source "package/python-pycrypto/Config.in"
diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
new file mode 100644
index 0000000..eba36ed
--- /dev/null
+++ b/package/python-posix-ipc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_POSIX_IPC
+	bool "python-posix-ipc"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The Python extension module posix_ipc gives access to POSIX
+	  inter-process semaphores, shared memory and message queues
+	  on systems that support the POSIX Realtime Extensions
+	  a.k.a. POSIX 1003.1b-1993.
+
+	  http://semanchuk.com/philip/posix_ipc/
+
+comment "python-posix-ipc needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-posix-ipc/python-poxix-ipc.mk b/package/python-posix-ipc/python-poxix-ipc.mk
new file mode 100644
index 0000000..3e81bbf
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
+PYTHON_POSIX_IPC_LICENSE = BSD-3c
+PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
+PYTHON_POSIX_IPC_SETUP_TYPE = distutils
+
+$(eval $(python-package))
