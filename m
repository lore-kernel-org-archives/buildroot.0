From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 18 Jun 2017 21:41:59 +0300
Subject: [Buildroot]  [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170618184200.31167-1-geomatsi@gmail.com>
References: <20170618184200.31167-1-geomatsi@gmail.com>
Message-ID: <20170618184200.31167-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds xradio wireless driver for SDIO WiFi chip XR819.
The out-of-tree driver is sourced from fifteenhex's work
on github https://github.com/fifteenhex/xradio

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/Config.in                      |  1 +
 package/xr819-xradio/Config.in         | 10 ++++++++++
 package/xr819-xradio/xr819-xradio.hash |  2 ++
 package/xr819-xradio/xr819-xradio.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/xr819-xradio/Config.in
 create mode 100644 package/xr819-xradio/xr819-xradio.hash
 create mode 100644 package/xr819-xradio/xr819-xradio.mk

diff --git a/package/Config.in b/package/Config.in
index c997e2a30..1fb84cf3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ endmenu
 	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
+	source "package/xr819-xradio/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
new file mode 100644
index 000000000..5539004be
--- /dev/null
+++ b/package/xr819-xradio/Config.in
@@ -0,0 +1,10 @@
+comment "xradio wireless driver needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_XR819_XRADIO
+	bool "xr819-xradio"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver for SDIO WiFi chip XR819
+
+	  https://github.com/fifteenhex/xradio
diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
new file mode 100644
index 000000000..bdb0f96cd
--- /dev/null
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5e9f59942b3880768b4812ab6db395bd1fa6d423cae9c09504baa416f064a10d xr819-xradio-014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded.tar.gz
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
new file mode 100644
index 000000000..dfe2ee6ed
--- /dev/null
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xr819-xradio
+#
+################################################################################
+
+XR819_XRADIO_VERSION = 014dfdd203102c5fd2370a73ec4ae3e6dd4e9ded
+XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
+XR819_XRADIO_LICENSE = GPL-2.0
+XR819_XRADIO_LICENSE_FILES = LICENSE
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.11.0
