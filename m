From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:30:20 +0200
Subject: [Buildroot] [git commit] package/qemu: add optional spice support
Message-ID: <20200713212652.EA3AA86DA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5865124b9395d4f9f4336543c204a4dd6be95c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cb138fd488..c013e6ffa0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -112,6 +112,13 @@ else
 QEMU_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_SPICE),y)
+QEMU_OPTS += --enable-spice
+QEMU_DEPENDENCIES += spice
+else
+QEMU_OPTS += --disable-spice
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -143,7 +150,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-linux-io-uring \
 			--disable-cap-ng \
 			--disable-docs \
-			--disable-spice \
 			--disable-rbd \
 			--disable-libiscsi \
 			--disable-usb-redir \
