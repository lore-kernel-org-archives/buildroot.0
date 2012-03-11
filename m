From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Mar 2012 00:02:49 +0100
Subject: [Buildroot] [git commit] usbutils: bump version to 005
Message-ID: <20120311230541.E4F3590D48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3df335ff8c5582771eceecd647323c8da528627b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump usbutils version to 005 and also switch to a debian mirror since
it's still missing upstream.

[Peter: add comment about autoreconf, use snapshot.debian.org]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbutils/usbutils.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index e89f02e..a242f93 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,10 +4,13 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 004
-USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
+USBUTILS_VERSION = 005
+USBUTILS_SITE = http://snapshot.debian.org/archive/debian/20111211T214105Z/pool/main/u/usbutils/
+USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
+# no configure in tarball
+USBUTILS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
