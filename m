From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Aug 2011 14:09:57 +0200
Subject: [Buildroot] [git commit] usbmount: depend on udev rather than
	selecting it
Message-ID: <20110815121044.054CD8C8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c1009d38d20885e7543da7e9af45a8265051311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev is much more than a library, so we shouldn't use select to silently
enable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbmount/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 6980c8c..30c7b5a 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
-	select BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -13,4 +13,4 @@ config BR2_PACKAGE_USBMOUNT
 	  http://usbmount.alioth.debian.org/
 
 comment "usbmount requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR) && BR2_PACKAGE_UDEV
-- 
1.7.3.4
