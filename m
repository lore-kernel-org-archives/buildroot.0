From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:49 +0100
Subject: [Buildroot] [PATCH 09/10] barebox: qstrip the path to the custom
	configuration file
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <d3e8d44175fe53020642388bd3dfe0290245eb1f.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Even though this is not strictly necessary with the current version
of barebox.mk, it becomes necessary when migrating barebox.mk to the
kconfig infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
