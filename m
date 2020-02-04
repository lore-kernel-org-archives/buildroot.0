From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Feb 2020 18:58:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: add all blue5_utils
 dependencies
Message-ID: <20200204175847.2888280-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 61a813339af43024ec05e749a05886fff1bf2a39 forgot to add all the
bluez5_utils dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 049d98123e..a42abd70b7 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -48,13 +48,17 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_MMU # bluez5_utils -> dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
 	depends on !BR2_STATIC_LIBS # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Bluetooth module for Sconeserver
 
-comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library"
+comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library, headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 config BR2_PACKAGE_SCONESERVER_RSS
 	bool "rss"
-- 
2.24.1
