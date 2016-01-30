From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 10:45:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/ola: fix musl build
In-Reply-To: <1454147144-27111-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454147144-27111-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454147144-27111-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/17f/17fe88868acdbba074561da14c4417e31d506823/
http://autobuild.buildroot.net/results/d99/d99ca60cc4bf86c338fd61f9fd2de0bb9598d670/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0002-Fix-build-errors-with-musl-C-library.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ola/0002-Fix-build-errors-with-musl-C-library.patch

diff --git a/package/ola/0002-Fix-build-errors-with-musl-C-library.patch b/package/ola/0002-Fix-build-errors-with-musl-C-library.patch
new file mode 100644
index 0000000..7a0f21e
--- /dev/null
+++ b/package/ola/0002-Fix-build-errors-with-musl-C-library.patch
@@ -0,0 +1,41 @@
+From 3bd2646e4d6834ec25c193293841acc5da9060e7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 30 Jan 2016 10:41:30 +0100
+Subject: [PATCH 1/1] Fix build errors with musl C library.
+
+Patch sent upstream:
+https://github.com/OpenLightingProject/ola/pull/1024
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ common/network/NetworkUtils.cpp | 1 +
+ plugins/spi/SPIWriter.cpp       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/common/network/NetworkUtils.cpp b/common/network/NetworkUtils.cpp
+index dc1d166..38f1993 100644
+--- a/common/network/NetworkUtils.cpp
++++ b/common/network/NetworkUtils.cpp
+@@ -55,6 +55,7 @@ typedef uint32_t in_addr_t;
+ // Do something else if we don't have Netlink/on Windows
+ #endif
+ 
++#include <endian.h>
+ #include <errno.h>
+ #include <limits.h>
+ #include <stdlib.h>
+diff --git a/plugins/spi/SPIWriter.cpp b/plugins/spi/SPIWriter.cpp
+index 36b66c5..b50e5dc 100644
+--- a/plugins/spi/SPIWriter.cpp
++++ b/plugins/spi/SPIWriter.cpp
+@@ -18,6 +18,7 @@
+  * Copyright (C) 2013 Simon Newton
+  */
+ 
++#include <linux/ioctl.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <linux/spi/spidev.h>
+-- 
+2.7.0.rc3
+
-- 
2.7.0.rc3
