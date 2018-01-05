From: Dagg Stompler <daggs@gmx.com>
Date: Fri,  5 Jan 2018 11:35:01 +0200
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
Message-ID: <20180105093501.5793-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev is needed in order to detect usb based DVB cards.
reference for none SystemD systems can be found at https://github.com/tvheadend/tvheadend/blob/master/debian/tvheadend.init

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
v1 -> v2:
 - use BR2_PACKAGE_HAS_UDEV instead of ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV (Thomas)
 - add BR2_PACKAGE_HAS_UDEV dependecy to comment

 package/tvheadend/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 44a69a27ba..75bb7d0b62 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,6 +1,7 @@
-comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
+comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library, udev /dev management"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS || \
+		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_TVHEADEND
@@ -9,6 +10,7 @@ config BR2_PACKAGE_TVHEADEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
-- 
2.15.1
