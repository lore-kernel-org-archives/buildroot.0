From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:21 -0700
Subject: [Buildroot] [PATCH 13/15 v6] [RFC] package/libusb: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <db3ec0735b694a2990797590f9028dbe0cee9d0f.1414442699.git.yann.morin.1998@free.fr>
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
index 33a7157..5f05c24 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -21,8 +21,9 @@ ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPTS += --disable-timerfd
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBUSB_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBUSB_CONF_OPTS += --enable-udev
+LIBUSB_DEPENDENCIES += libudev
 else
 LIBUSB_CONF_OPTS += --disable-udev
 endif
-- 
1.9.1
