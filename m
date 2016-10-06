From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:40 +0200
Subject: [Buildroot] [PATCH 13/21] package/python-spidev: bump version to 3.2
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0001-Fix-build-with-musl-libc.patch, applied upstream:
https://github.com/doceme/py-spidev/pull/39/commits/3d6e59bff088783f249a60a5f1c900c7f99f933b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Fix-build-with-musl-libc.patch            | 43 ----------------------
 package/python-spidev/python-spidev.hash           |  5 ++-
 package/python-spidev/python-spidev.mk             |  4 +-
 3 files changed, 5 insertions(+), 47 deletions(-)
 delete mode 100644 package/python-spidev/0001-Fix-build-with-musl-libc.patch

diff --git a/package/python-spidev/0001-Fix-build-with-musl-libc.patch b/package/python-spidev/0001-Fix-build-with-musl-libc.patch
deleted file mode 100644
index b22a73a..0000000
--- a/package/python-spidev/0001-Fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3d6e59bff088783f249a60a5f1c900c7f99f933b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 31 Jan 2016 15:03:50 +0100
-Subject: [PATCH 1/1] Fix build with musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Include missing header to prevent build error:
-
-spidev_module.c: In function ?SpiDev_xfer?:
-spidev_module.c:330:27: error: ?_IOC_SIZEBITS? undeclared (first use in this function)
-  status = ioctl(self->fd, SPI_IOC_MESSAGE(1), &xfer);
-                           ^
-spidev_module.c:330:27: note: each undeclared identifier is reported only once for each function it appears in
-spidev_module.c: In function ?SpiDev_xfer2?:
-spidev_module.c:421:27: error: ?_IOC_SIZEBITS? undeclared (first use in this function)
-  status = ioctl(self->fd, SPI_IOC_MESSAGE(1), &xfer);
-                           ^
-
-Signed-off-by: Bernd Kuhls bernd.kuhls at t-online.de
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch sent upstream: https://github.com/doceme/py-spidev/pull/39
-
- spidev_module.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/spidev_module.c b/spidev_module.c
-index d58ef07..bccaacf 100644
---- a/spidev_module.c
-+++ b/spidev_module.c
-@@ -25,6 +25,7 @@
- #include <linux/spi/spidev.h>
- #include <linux/types.h>
- #include <sys/ioctl.h>
-+#include <linux/ioctl.h>
- 
- #define SPIDEV_MAXPATH 4096
- 
--- 
-2.7.0
-
diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index 49e8db8..dc08925 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	355391e9ad3024950590626b080324394c12e75bb21923dbd56a978a1eac6ac7	spidev-3.1.tar.gz
+# md5 from https://pypi.python.org/pypi/spidev/json, sha256 locally computed
+md5	f601676f1bb48b9aa3b3897f95216365  spidev-3.2.tar.gz
+sha256	09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456  spidev-3.2.tar.gz
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index 0a8dd15..d839bb3 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.1
+PYTHON_SPIDEV_VERSION = 3.2
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/source/s/spidev
+PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/36/83/73748b6e1819b57d8e1df8090200195cdae33aaa22a49a91ded16785eedd
 PYTHON_SPIDEV_SETUP_TYPE = distutils
 PYTHON_SPIDEV_LICENSE = GPLv2
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE.md
-- 
2.9.3
