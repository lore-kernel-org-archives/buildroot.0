From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 May 2021 23:51:11 +0200
Subject: [Buildroot] [PATCH/next v1 2/6] package/raspberrypi-usbboot: enable
 for BR2_aarch64
In-Reply-To: <20210519215115.21684-1-ps.report@gmx.net>
References: <20210519215115.21684-1-ps.report@gmx.net>
Message-ID: <20210519215115.21684-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/raspberrypi-usbboot/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/raspberrypi-usbboot/Config.in.host b/package/raspberrypi-usbboot/Config.in.host
index b1a434f36e..e5772e3aa1 100644
--- a/package/raspberrypi-usbboot/Config.in.host
+++ b/package/raspberrypi-usbboot/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
 	bool "host raspberrypi-usbboot"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
 	  This package builds and install the "rpiboot" tool for the
@@ -13,5 +13,5 @@ config BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
 	  https://github.com/raspberrypi/usbboot
 
 comment "host raspberrypi-usbboot needs a toolchain w/ host gcc >= 4.9"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.31.1
