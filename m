From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 29 Dec 2017 15:06:04 +0200
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based rootfs
 creation
Message-ID: <20171229130604.9897-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is needed for tvheadend inorder
for the program to see usb based DVB cards.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/tvheadend/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 44a69a27ba..2a497b481d 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_TVHEADEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
-- 
2.15.1
