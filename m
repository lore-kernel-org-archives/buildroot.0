From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:24 -0500
Subject: [Buildroot] [PATCH 41/67] openobex: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-42-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/openobex/Config.in | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 6494b29..83522d9 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,6 +1,3 @@
-comment "openobex requires a toolchain with IPV6 support"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_OPENOBEX
 	bool "openobex"
 	depends on BR2_INET_IPV6
@@ -12,25 +9,25 @@ config BR2_PACKAGE_OPENOBEX
 
 if BR2_PACKAGE_OPENOBEX
 
-comment "bluez support require a toolchain with WCHAR and thread support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "enable bluez support"
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_BLUEZ_UTILS
 
-comment "libusb support require a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "bluez support require a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
 	bool "enable libusb support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBUSB
 
+comment "libusb support require a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_OPENOBEX_APPS
 	bool "install test applications"
 	help
@@ -43,3 +40,8 @@ config BR2_PACKAGE_OPENOBEX_DUMP
 	bool "enable protocol dumping for debugging"
 
 endif
+
+comment "openobex requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
+
+
-- 
1.8.1.2
