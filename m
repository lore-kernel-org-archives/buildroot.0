From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Jan 2019 09:53:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-i128: bump
 version to 1.4.0
Message-ID: <20190126085332.5178-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream, added all hashes provided by upstream
and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-mbstring.patch                       | 35 -------------------
 .../xdriver_xf86-video-i128.hash              |  9 +++--
 .../xdriver_xf86-video-i128.mk                |  2 +-
 3 files changed, 8 insertions(+), 38 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch

diff --git a/package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch b/package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch
deleted file mode 100644
index 40bb1ea2bd..0000000000
--- a/package/x11r7/xdriver_xf86-video-i128/0001-mbstring.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c87753733a6e1f85d1d037dced0b47ce0cf41658 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 12:54:40 +0000
-Subject: Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-i128/commit/?id=c87753733a6e1f85d1d037dced0b47ce0cf41658
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/i128_driver.c b/src/i128_driver.c
-index a0f08c0..51a4135 100644
---- a/src/i128_driver.c
-+++ b/src/i128_driver.c
-@@ -50,8 +50,6 @@
- /* All drivers initialising the SW cursor need this */
- #include "mipointer.h"
- 
--/* All drivers implementing backing store need this */
--#include "mibstore.h"
- #include "micmap.h"
- 
- #include "xf86DDC.h"
-@@ -1556,7 +1554,6 @@ I128ScreenInit(SCREEN_INIT_ARGS_DECL)
-         return FALSE;
-     }
-     
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
index 9600c4565f..325e754fb3 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002012.html
-sha256	f8827e4c988f90cf5a677554b30d61f0a07eb86d872478751cdc94dc17452b9c	xf86-video-i128-1.3.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-December/002932.html
+md5  a980f1b8532ccfe81932580bc4e0f2a0  xf86-video-i128-1.4.0.tar.bz2
+sha1 56d5b897b2695222c13e59d2ade74620a99e1011  xf86-video-i128-1.4.0.tar.bz2
+sha256 8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea  xf86-video-i128-1.4.0.tar.bz2
+sha512 d58baee3f20b3ad2ece6853da0ff20a6d54b984c6e3289bad2715cc003b277a0b44d20ded25cfc116400468df552390bdb5d80fbd3fb60861488ee5d027664b2  xf86-video-i128-1.4.0.tar.bz2
+# Locally computed
+sha256 7677424d79633dbf255a81bd4e05dd621931b89997af33c31522269ec2ed391e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 148fc3d1d0..e44deaf621 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.6
+XDRIVER_XF86_VIDEO_I128_VERSION = 1.4.0
 XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
-- 
2.20.1
