From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:46 +0200
Subject: [Buildroot] [PATCH 30/30] package/android-tools: re-enable fastboot
 on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-31-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is now available on ARC, so we can re-enable the fastboot
option on this architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/android-tools/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 881fa3b2a6..a36c4db189 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,7 +38,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on !BR2_arc # libselinux
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
@@ -48,7 +47,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	  implementing the fastboot protocol.
 
 comment "fastboot needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
-- 
2.21.0
