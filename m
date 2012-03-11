From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:47:55 -0300
Subject: [Buildroot] [PATCH 06/20] usbutils: bump version to 005
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump usbutils version to 005 and also switch to a debian mirror since
it's still missing upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/usbutils.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index e89f02e..cebc085 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 004
-USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
+USBUTILS_VERSION = 005
+USBUTILS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbutils
+USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
+USBUTILS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
-- 
1.7.3.4
