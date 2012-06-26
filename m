From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Jun 2012 13:32:01 -0300
Subject: [Buildroot] [PATCH] libusb: needs thread support
Message-ID: <1340728321-24139-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libusb needs thread support, hence libusb-compat too and a whole other
bunch of packages or optionals too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bluez_utils/Config.in    |    1 +
 package/efl/libedbus/Config.in   |    1 +
 package/libfreefare/Config.in    |    4 ++++
 package/libftdi/Config.in        |    4 ++++
 package/libhid/Config.in         |    4 ++++
 package/libiqrf/Config.in        |    4 ++++
 package/libnfc/Config.in         |    4 ++++
 package/libusb-compat/Config.in  |    4 ++++
 package/libusb/Config.in         |    4 ++++
 package/openocd/Config.in        |    4 ++++
 package/usb_modeswitch/Config.in |    4 ++++
 package/usbutils/Config.in       |    4 ++++
 12 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 3517407..15ffd37 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
 
 config BR2_PACKAGE_BLUEZ_UTILS_USB
 	bool "USB support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB support
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 0914b37..e695589 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -14,6 +14,7 @@ if BR2_PACKAGE_LIBEDBUS
 
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 13a8630..6877000 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
 
 	  http://code.google.com/p/nfc-tools/wiki/libfreefare
+
+comment "libfreefare needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index e334d14..48e9ceb 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -16,3 +17,6 @@ config BR2_PACKAGE_LIBTFDI_CPP
 	  C++ bindings for libftdi
 
 endif # BR2_PACKAGE_LIBFTDI
+
+comment "libftdi needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index 73ff4b7..093b98f 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Userspace library for accessing USB HID devices
 
 	  http://libhid.alioth.debian.org
+
+comment "libhid needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
index aa25010..7222536 100644
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This library implement specific protocol
@@ -8,3 +9,6 @@ config BR2_PACKAGE_LIBIQRF
 	  libusb library.
 
 	  https://github.com/nandra/libiqrf
+
+comment "libiqrf needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 3d67d58..159578f 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -11,3 +12,6 @@ config BR2_PACKAGE_LIBNFC_EXAMPLES
 	bool "build libnfc examples"
 	depends on BR2_PACKAGE_LIBNFC
 	select BR2_PACKAGE_READLINE
+
+comment "libnfc needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index f6f49ca..f44aa93 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBUSB_COMPAT
 	bool "libusb-compat"
 	depends on BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
 	  http://libusb.sourceforge.net/
+
+comment "libusb-compat needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 7f7276f..2eed3fa 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBUSB
 	bool "libusb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace library for accessing USB devices
 
 	  http://libusb.sourceforge.net/
+
+comment "libusb needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index f67c0a8..4ea66a5 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -27,3 +28,6 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
 	bool "Versaloon-Link JTAG Programmr"
 
 endif # BR2_PACKAGE_OPENOCD
+
+comment "openocd needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index ae10a55..a27b3ee 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -7,3 +8,6 @@ config BR2_PACKAGE_USB_MODESWITCH
 	  Used to switch mode on multiple-function devices
 
 	  http://www.draisberghof.de/usb_modeswitch/
+
+comment "usb_modeswitch needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 23004d9..fd9926c 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
@@ -15,3 +16,6 @@ config BR2_PACKAGE_USBUTILS_ZLIB
 	  This makes the data file smaller if you're not using a compressed
 	  filesystem, but it also makes lsusb slower since it has
 	  to decompress the file every time it's run.
+
+comment "usbutils needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.3.4
