From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 22:35:16 +0200
Subject: [Buildroot] [git commit master 1/1] lzma: mark old package as
	deprecated
Message-ID: <20100920203550.A5D678B3CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=06d0378954e77c185e017fae68a1a85ffc15342c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xz-utils should be used instead nowadays.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 ++
 package/lzma/Config.in |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1127f89..ccc6007 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,6 +30,8 @@
 	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
 	which, xlib_libX11, zlib
 
+	Deprecated packages: lzma
+
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
 
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index ab1ea59..4904721 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LZMA
 	bool "lzma"
 	depends on BR2_GCC_CROSS_CXX
+	depends on BR2_DEPRECATED
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
 	  algorithm with high compression ratio.
@@ -8,4 +9,4 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma requires a toolchain with C++ support"
-        depends on !BR2_GCC_CROSS_CXX
+        depends on !BR2_GCC_CROSS_CXX && BR2_DEPRECATED
-- 
1.7.1
