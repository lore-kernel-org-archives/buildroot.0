From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Feb 2020 18:58:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/cwiid: add all blue5_utils
 dependencies
Message-ID: <20200204175800.2888163-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 61a813339af43024ec05e749a05886fff1bf2a39 forgot to add all the
bluez5_utils dependencies

Fixes:
 - http://autobuild.buildroot.org/results/a125a27814aba007b06fabe3db2d402684d173db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cwiid/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 35e0c45557..9dab5d1070 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez5_utils -> dbus, libglib2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  A collection of Linux tools written in C for interfacing to
@@ -25,6 +27,9 @@ config BR2_PACKAGE_CWIID_WMGUI
 	select BR2_PACKAGE_LIBGTK2
 endif
 
-comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.4"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on !BR2_USE_MMU
-- 
2.24.1
