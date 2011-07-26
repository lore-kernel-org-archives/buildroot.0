From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jul 2011 10:41:31 +0200
Subject: [Buildroot] [git commit] udev: extras needs BR2_PROGRAM_INVOCATION
Message-ID: <20110726084213.3ECE48B4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f0e9c42bd157733409da478435f78fe9cff7ae09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For usbutils.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/Config.in |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 254a8f4..48391e5 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -9,8 +9,9 @@ if BR2_PACKAGE_UDEV
 
 config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	bool "enable all extras"
-	depends on BR2_LARGEFILE
-	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE # acl
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PROGRAM_INVOCATION # usbutils
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
@@ -21,7 +22,7 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  Enable all extras with external dependencies like
 	  libacl, libusb, libusb-compat, usbutils, hwdata
 
-comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "udev extras requires a toolchain with LARGEFILE/WCHAR/PROGRAM_INVOCATION support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
 
 endif
-- 
1.7.3.4
