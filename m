From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:34:50 +0200
Subject: [Buildroot] [git commit] package/hidapi: bump to version 0.9.0
Message-ID: <20190927213015.BB7BE8F2EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15f8ff0762abe5f1f777bb9aa8bf53df6dc68d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github.com/libusb/hidapi to get latest version, see
  https://github.com/signal11/hidapi/issues/431
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/Config.in   | 2 +-
 package/hidapi/hidapi.hash | 6 +++++-
 package/hidapi/hidapi.mk   | 6 ++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index b98c2db91c..d7d8cd53d7 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_HIDAPI
 	  to interface with USB and Bluetooth HID-Class devices on
 	  Windows, Linux, and Mac OS X.
 
-	  http://www.signal11.us/oss/hidapi/
+	  http://github.com/libusb/hidapi/
 
 comment "hidapi needs udev /dev management and a toolchain w/ NPTL threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index ed22c78866..232c1ec48d 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,2 +1,6 @@
 # Locally calculated
-sha256 f2ffe5dbba12dfa0a647ae71b1ec5612fed4c20322ef6f6fd46f6f9713ed1a8e  hidapi-b5b2e1779b6cd2edda3066bbbf0921a2d6b1c3c0.tar.gz
+sha256 630ee1834bdd5c5761ab079fd04f463a89585df8fcae51a7bfe4229b1e02a652  hidapi-0.9.0.tar.gz
+sha256 7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
+sha256 30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
+sha256 fb5436aa63d1b71a8dfbf74ecaf1a5b4e1ec4df7f80074d11fec99284f69ca5f  LICENSE-orig.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 7eed800326..abbe5878e8 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-# Use master version as the current stable is very old and some bugs
-# have been fixed since then.
-HIDAPI_VERSION = b5b2e1779b6cd2edda3066bbbf0921a2d6b1c3c0
-HIDAPI_SITE = $(call github,signal11,hidapi,$(HIDAPI_VERSION))
+HIDAPI_VERSION = 0.9.0
+HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
 HIDAPI_AUTORECONF = YES
