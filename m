From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 15 Apr 2015 22:36:12 +0200
Subject: [Buildroot] [PATCH] package/libfreeimage: needs C++ support
Message-ID: <1429130172-6287-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f52/f52dd2939984cd7a6926b8ad6d5be13dcf3afae8

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libfreeimage/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
-- 
1.9.3
