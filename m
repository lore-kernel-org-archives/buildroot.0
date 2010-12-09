From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Dec 2010 22:31:28 +0100
Subject: [Buildroot] [git commit master 1/1] usbutils: bump to version 0.91
Message-ID: <20101209214025.2AC458E1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3252a0c1afec6bc9ddcd105975a1d91d317f0f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/usbutils/Config.in   |    4 ++++
 package/usbutils/usbutils.mk |    2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index de9dcf4..02fa4b0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: cloop, m4, openssh, qt, xz
+	Updated/fixed packages: cloop, m4, openssh, qt, usbutils, xz
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 4273252..0aabc4a 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,5 +1,9 @@
+comment "usbutils requires a toolchain with PROGRAM_INVOCATION support"
+	depends on !BR2_PROGRAM_INVOCATION
+
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
+	depends on BR2_PROGRAM_INVOCATION
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 508ca0d..46c889e 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.90
+USBUTILS_VERSION = 0.91
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
-- 
1.7.2.2
