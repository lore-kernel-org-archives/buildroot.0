From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 22:41:17 +0200
Subject: [Buildroot] [git commit] package/libcamera: bump version to e59713c6
Message-ID: <20200904203420.69DA888063@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a275fc05c6f1db12e4a98ffcc3b8e3c7aabe3e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcamera project has moved to C++17, therefore also update the
toolchain requirements accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
[yann.morin.1998 at free.fr: s/\t/  / in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/Config.in      | 6 +++---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 39741e4412..aadea56d19 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
@@ -70,7 +70,7 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 676d3ac739..41416da712 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  55b7d7e5d8c70b2586b31544e6c4891a994c4e69c18d0ebd760e87b75277c348  libcamera-565f95d64ff92e8712e8090988180c343dd3bcb5.tar.gz
+sha256  a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 4a4bc4ea90..e6cd714207 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 565f95d64ff92e8712e8090988180c343dd3bcb5
+LIBCAMERA_VERSION = e59713c68678f3eb6b6ebe97cabdc88c7042567f
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
