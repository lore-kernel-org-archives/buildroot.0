From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 20 Sep 2017 17:31:02 +0200
Subject: [Buildroot] [PATCH] package/dfu-util: allow to build it for the
	target as well
Message-ID: <cb5803af-b598-5a40-b0ae-25b560f91dc7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/Config.in            | 1 +
 package/dfu-util/Config.in   | 8 ++++++++
 package/dfu-util/dfu-util.mk | 2 ++
 3 files changed, 11 insertions(+)
 create mode 100644 package/dfu-util/Config.in

diff --git a/package/Config.in b/package/Config.in
index 48d1381..b493201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -389,6 +389,7 @@ endmenu
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
 	source "package/devmem2/Config.in"
+	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
 	source "package/dt-utils/Config.in"
diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
new file mode 100644
index 0000000..77b7f2d
--- /dev/null
+++ b/package/dfu-util/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DFU_UTIL
+	bool "dfu-util"
+	help
+	  Dfu-util is the host side implementation of the DFU 1.0
+	  specification of the USB forum. DFU is intended to download
+	  and upload firmware to devices connected over USB.
+
+	  http://dfu-util.sourceforge.net/
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index c494485..5e8ba5a 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -9,6 +9,8 @@ DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPL-2.0+
 DFU_UTIL_LICENSE_FILES = COPYING
 
+DFU_UTIL_DEPENDENCIES = libusb
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
