From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:39 +0200
Subject: [Buildroot] [PATCH 15/20 RFC] package/libusb: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <9f0792f43adcbd3a24dff51ed67fdb466d971e2e.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

libusb is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libusb/libusb.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 417b2ce..6e1c6a5 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -21,8 +21,9 @@ ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPT += --disable-timerfd
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBUSB_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBUSB_CONF_OPT += --enable-udev
+LIBUSB_DEPENDENCIES += libudev
 else
 LIBUSB_CONF_OPT += --disable-udev
 endif
-- 
1.8.3.2
