From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:56:02 +0100
Subject: [Buildroot] [git commit] package/libnfc: pn53x_usb driver needs gcc
 >= 4.9
Message-ID: <20201230223829.573258399F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3beaa26e38dc310269891d4a362fe5edd4040464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate
gcc >= 4.9 dependency

Fixes:
 - http://autobuild.buildroot.org/results/6586f4aecf9a47612bfedfc503c9c2948a17e9d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnfc/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 073b8f37f5..ead61e4529 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -64,13 +64,15 @@ config BR2_PACKAGE_LIBNFC_PN53X_USB
 	bool "pn53x_usb driver"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  support for pn53x_usb driver
 
-comment "pn53x_usb driver needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "pn53x_usb driver needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_LIBNFC_EXAMPLES
 	bool "build libnfc examples"
