From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 Sep 2020 19:51:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/kbd: bump to version 2.3.0
Message-ID: <20200907175130.129970-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of COPYING and add CREDITS to license files as most of the
original COPYING content moved to CREDITS and COPYING now contains
GPL-2.0+ text since version 2.0.90 and
https://github.com/legionus/kbd/commit/1304c0c11c2281c942ea07cee6fd1e820a8ba6ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kbd/kbd.hash | 5 +++--
 package/kbd/kbd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index cf29c59860..66ffaeb05b 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,3 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88  kbd-2.0.4.tar.xz
-sha256  8682bd7a7fe88bad31bf94ee9795c73fd4bc27bfcd50fb135f36dd8762c52035  COPYING
+sha256  685056143cb8effd0a1d44b5c391eb50d80dcfd014b1a4d6e2650a28d61cb82a  kbd-2.3.0.tar.xz
+sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
+sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index c32d82a3e9..928b5ffed1 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.0.4
+KBD_VERSION = 2.3.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
@@ -14,7 +14,7 @@ KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 KBD_LICENSE = GPL-2.0+
-KBD_LICENSE_FILES = COPYING
+KBD_LICENSE_FILES = COPYING CREDITS
 
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
-- 
2.28.0
