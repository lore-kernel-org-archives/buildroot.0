From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 22:33:35 +0200
Subject: [Buildroot] [PATCH] hplip: needs dynamic library
Message-ID: <1471552415-1818-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hplip needs libdl functionality, so it should depend on
!BR2_STATIC_LIBS.

Fixes:

  http://autobuild.buildroot.net/results/afc01af153b42d13845e2f2828f642e8ccea7e06/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hplip/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index 7565671..176dc6a 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HPLIP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_STATIC_LIBS # libdl
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_JPEG
 	help
@@ -15,6 +16,7 @@ config BR2_PACKAGE_HPLIP
 
 	  http://hplipopensource.com/
 
-comment "hplip needs a toolchain w/ C++, threads"
+comment "hplip needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_CUPS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
2.7.4
