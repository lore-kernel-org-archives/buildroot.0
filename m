From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 02:16:47 +0200
Subject: [Buildroot] [PATCH 12/14 v4] [RFC] package/libusb: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <bc378aee22b40ce07c2e301a2e0fa0712d069546.1406765723.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libusb is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libusb/libusb.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 7e0f877..8a07cd8 100644
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
1.9.1
