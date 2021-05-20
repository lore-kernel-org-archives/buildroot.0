From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:53:26 +0200
Subject: [Buildroot] [git commit branch/next] package/raspberrypi-usbboot:
 enable for BR2_aarch64
Message-ID: <20210520073019.B182B7FAF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53b4004d52594b4da24d771d33307ac9ef8d212e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
