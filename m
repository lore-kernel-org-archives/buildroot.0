From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 24 Oct 2019 22:28:20 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable usb passthrough on host
 variant
Message-ID: <20191024202820.18814-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usb passthrough is a useful feature while using qemu for debugging
purpose.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qemu/qemu.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1d3759a850..4cf1c60030 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -264,6 +264,11 @@ else
 HOST_QEMU_OPTS += --disable-virtfs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+HOST_QEMU_OPTS += --enable-libusb
+HOST_QEMU_DEPENDENCIES += host-libusb
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.17.1
