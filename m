From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 29 Jun 2020 15:50:01 -0500
Subject: [Buildroot] [PATCH v1 2/3] package/qemu: add vnc support
In-Reply-To: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
Message-ID: <20200629205002.8087-2-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add vnc support to qemu if libvncserver is
selected

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0b76e432e0..520547e94e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -98,6 +98,13 @@ else
 QEMU_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
+QEMU_OPTS += --enable-vnc
+QEMU_DEPENDENCIES += libvncserver
+else
+QEMU_OPTS += --disable-vnc
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 QEMU_OPTS += --enable-nettle
 QEMU_DEPENDENCIES += nettle
@@ -140,7 +147,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-bsd-user \
 			--disable-containers \
 			--disable-xen \
-			--disable-vnc \
 			--disable-virtfs \
 			--disable-brlapi \
 			--disable-curses \
-- 
2.17.1
