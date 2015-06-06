From: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
Date: Sat,  6 Jun 2015 20:41:56 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
Message-ID: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dynamic /dev management using eudev requires c++ support

Signed-off-by: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
---
 system/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 84cde94..9ef3897 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -114,13 +114,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ wchar, dynamic library"
+comment "eudev needs a toolchain w/ wchar, cxx, dynamic lib"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_BUILDROOT_CXX || BR2_STATIC_LIBS
 
 endchoice
 
-- 
2.4.2
