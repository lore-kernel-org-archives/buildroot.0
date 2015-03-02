From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:23 -0000
Subject: [Buildroot] [git commit] barebox: qstrip the path to the custom
	configuration file
Message-ID: <20150302222717.E8FAE807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cd04c3139bfc409b3c680ae136a2627af40417d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though this is not strictly necessary with the current version
of barebox.mk, it becomes necessary when migrating barebox.mk to the
kconfig infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0fb7cec..f26c151 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -55,7 +55,7 @@ ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
 	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
 define BAREBOX_CONFIGURE_CMDS
