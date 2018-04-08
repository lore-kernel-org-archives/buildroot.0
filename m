From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Apr 2018 10:12:31 +0200
Subject: [Buildroot] [PATCH] package/kmod: enable compression in host variant
Message-ID: <20180408081231.24250-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the modules are compressed by the kernel at install, it needs a
depmod with compression support to br able to generate the modules.dep
and associated files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kmod/kmod.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e1149b7b65..c6264e16ab 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -9,7 +9,7 @@ KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
-HOST_KMOD_DEPENDENCIES = host-pkgconf
+HOST_KMOD_DEPENDENCIES = host-pkgconf host-xz host-zlib
 
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPL-2.1+ (library)
@@ -26,7 +26,7 @@ endif
 KMOD_CONF_OPTS = --disable-static --enable-shared
 
 KMOD_CONF_OPTS += --disable-manpages
-HOST_KMOD_CONF_OPTS = --disable-manpages
+HOST_KMOD_CONF_OPTS = --disable-manpages --with-xz --with-zlib
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
-- 
2.14.1
