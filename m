From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Apr 2020 18:55:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdnav: fix build with gcc-4.8
Message-ID: <20200417165514.18540-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c95/c9514368b98bc3a7f7ab92cb33c54bd3ffd9a232/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdnav/libdvdnav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index d4c3b0c200..4d1d49f1a1 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -8,6 +8,7 @@ LIBDVDNAV_VERSION = 6.1.0
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
+LIBDVDNAV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
-- 
2.26.1
