From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Aug 2016 00:33:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/cryptsetup: move depends on above
	select
Message-ID: <1471991636-29161-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/cryptsetup/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 80671ee..cd95956 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
-	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
-	depends on BR2_USE_WCHAR # util-linux
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
-- 
2.5.5
