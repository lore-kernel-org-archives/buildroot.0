From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 20:51:10 +0100
Subject: [Buildroot] [git commit] qt: needs MMU (fork)
Message-ID: <20140223195503.28D5F9B92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bb561444b74bc8177ec2fa7d0d1c21e3df0a4ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/4f7/4f744595efceba2d5a54151bf5f1802eb1268fac/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in        |    1 +
 package/openpowerlink/Config.in |    2 ++
 package/qt/Config.in            |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 9e952ca..96ff6d8 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -169,6 +169,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt backend support"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_avr32 # qt
+	depends on BR2_USE_MMU # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	default y
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index cdb09a2..8573961 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -1,4 +1,5 @@
 comment "openpowerlink needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
@@ -7,6 +8,7 @@ config BR2_PACKAGE_OPENPOWERLINK
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # qt
 	help
 	  openPOWERLINK is an Open Source Industrial Ethernet
 	  stack implementing the POWERLINK protocol for Managing Node
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 926d54c..5105e5d 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,10 +1,12 @@
 comment "qt needs a toolchain w/ C++, threads"
 	depends on !BR2_avr32
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
 	bool "Qt"
 	depends on !BR2_avr32 # lacks TLS
+	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
