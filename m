From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu,  9 May 2013 15:22:01 -0700
Subject: [Buildroot] [PATCH 1/2] hplip: needs toolchain with threads support
Message-ID: <1368138122-5950-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hplip uses libusb that requires a toolchain with threads support
Fixes:
http://autobuild.buildroot.org/results/12fb9bb8c93c1cc1f93ba8e15558d1630f2e7c3d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/hplip/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index d8a1580..c496513 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_JPEG
@@ -14,5 +15,5 @@ config BR2_PACKAGE_HPLIP
 
 	  http://hplipopensource.com/
 
-comment "hplip requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "hplip requires a toolchain with threads and C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.4.1
