From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 29 Jun 2020 15:50:02 -0500
Subject: [Buildroot] [PATCH v1 3/3] package/qemu: add usb-redir support
In-Reply-To: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
Message-ID: <20200629205002.8087-3-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add usb-redir support to qemu if usbredir is enabled

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 520547e94e..3ed5565221 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -126,6 +126,13 @@ else
 QEMU_OPTS += --disable-spice
 endif
 
+ifeq ($(BR2_PACKAGE_USBREDIR),y)
+QEMU_OPTS += --enable-usb-redir
+QEMU_DEPENDENCIES += usbredir
+else
+QEMU_OPTS += --disable-usb-redir
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -158,7 +165,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-docs \
 			--disable-rbd \
 			--disable-libiscsi \
-			--disable-usb-redir \
 			--disable-strip \
 			--disable-sparse \
 			--disable-mpath \
-- 
2.17.1
