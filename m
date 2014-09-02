From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Sep 2014 09:38:37 +0200
Subject: [Buildroot] [git commit] libphidget: needs dynamic library support
Message-ID: <20140902073856.602B79D52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9fe74733c7ea0ed11601b6de685f4632039d06e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/932/9322c930a545bb500b5193a84b26895a03a6b7f7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libphidget/Config.in        |    4 +++-
 package/phidgetwebservice/Config.in |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
index 9f3e4bf..18a3207 100644
--- a/package/libphidget/Config.in
+++ b/package/libphidget/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPHIDGET
 	bool "libphidget"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The libphidget library provides an API for controlling Phidgets
@@ -20,5 +21,6 @@ config BR2_PACKAGE_LIBPHIDGET
 
 	  http://phidgets.com/
 
-comment "libphidget needs a toolchain w/ threads"
+comment "libphidget needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
index 7bb6f33..b85166e 100644
--- a/package/phidgetwebservice/Config.in
+++ b/package/phidgetwebservice/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHIDGETWEBSERVICE
 	bool "phidgetwebservice"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
+	depends on !BR2_PREFER_STATIC_LIB # libphidget
 	select BR2_PACKAGE_LIBPHIDGET
 	help
           phidgetwebservice (the Phidget WebService) provides an HTTP
@@ -15,5 +16,6 @@ config BR2_PACKAGE_PHIDGETWEBSERVICE
 
 	  http://phidgets.com/
 
-comment "phidgetwebservice needs a toolchain w/ threads"
+comment "phidgetwebservice needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PREFER_STATIC_LIB
