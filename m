From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:49:05 +0200
Subject: [Buildroot] [git commit] package/libfreeimage: needs C++ support
Message-ID: <20150416055852.B097080454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db6cda67acf406ac1346d632f01a9ed3319470b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f52/f52dd2939984cd7a6926b8ad6d5be13dcf3afae8

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfreeimage/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
index 546593b..914c0af 100644
--- a/package/libfreeimage/Config.in
+++ b/package/libfreeimage/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFREEIMAGE
 	bool "libfreeimage"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	help
 	  FreeImage is an Open Source library project for developers who
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBFREEIMAGE
 
 	  http://freeimage.sourceforge.net
 
-comment "libfreeimage needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libfreeimage needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
