From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 May 2013 07:14:40 -0300
Subject: [Buildroot] [PATCH] hplip: needs threads
Message-ID: <1368180880-9843-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hplip needs threads because libusb needs them. Fixes:
http://autobuild.buildroot.net/results/12fb9bb8c93c1cc1f93ba8e15558d1630f2e7c3d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hplip/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index d8a1580..c67a8b2 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HPLIP
 	bool "hplip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_JPEG
 	help
@@ -14,5 +15,5 @@ config BR2_PACKAGE_HPLIP
 
 	  http://hplipopensource.com/
 
-comment "hplip requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "hplip requires a toolchain with C++ and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
