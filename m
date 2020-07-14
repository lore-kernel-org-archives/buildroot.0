From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:19:04 +0200
Subject: [Buildroot] [git commit] package/qemu: add optional usb-redir
 support
Message-ID: <20200714201523.BD9CA7FFF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eab44d9a3bf776204bfe9f871f3b0828b566c07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a68f37542c..c2872a2748 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -140,6 +140,13 @@ else
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
@@ -172,7 +179,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-docs \
 			--disable-rbd \
 			--disable-libiscsi \
-			--disable-usb-redir \
 			--disable-strip \
 			--disable-sparse \
 			--disable-mpath \
