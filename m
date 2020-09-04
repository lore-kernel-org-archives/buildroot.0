From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri,  4 Sep 2020 10:51:46 +0100
Subject: [Buildroot] [PATCH 2/3] package/libcamera: Update requirements for
 C++17
In-Reply-To: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
Message-ID: <20200904095148.844292-3-kieran.bingham@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libcamera project has moved to C++17. Update the toolchain
requirements accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 package/libcamera/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 1ea747d1c57e..262ea49a0ead 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -2,7 +2,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	# Invalid packing size of ControlValue struct on m68k
@@ -65,6 +65,6 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
-- 
2.25.1
