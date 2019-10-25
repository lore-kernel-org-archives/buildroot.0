From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 21:37:19 +0200
Subject: [Buildroot] [git commit] package/qemu: use libusb (for usb
 passthrough) if it's selected
Message-ID: <20191025193119.A70C488170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29f26fd6f4fe7421f847ff278eed79f9b1af3942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows sharing a host USB port with the guest, which is helpful for
the upcoming libvirt package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3c8b0f43d8..4e39fce8a6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,6 +97,13 @@ else
 QEMU_OPTS += --disable-libssh2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+QEMU_OPTS += --enable-libusb
+QEMU_DEPENDENCIES += libusb
+else
+QEMU_OPTS += --disable-libusb
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 QEMU_OPTS += --enable-nettle
 QEMU_DEPENDENCIES += nettle
