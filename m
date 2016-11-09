From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 12:03:52 +0100
Subject: [Buildroot] [PATCH] grub2: enable grub-mkfont host tool
Message-ID: <20161109110352.7222-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 boot/grub2/grub2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc4e51e..a3352c2 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,7 +9,7 @@ GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPLv3+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex
+GRUB2_DEPENDENCIES = host-bison host-flex host-freetype
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
@@ -63,7 +63,6 @@ GRUB2_CONF_ENV = \
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
 	--with-platform=$(GRUB2_PLATFORM) \
-	--disable-grub-mkfont \
 	--enable-efiemu=no \
 	ac_cv_lib_lzma_lzma_code=no \
 	--enable-device-mapper=no \
-- 
2.9.3
