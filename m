From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:57:03 +0200
Subject: [Buildroot] [git commit] package/libdvdnav: fix build with gcc-4.8
Message-ID: <20200418124250.AEDC58EE24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85f9ba0caa14c1003b05daedf1b9b62b0c10cb6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/c9514368b98bc3a7f7ab92cb33c54bd3ffd9a232/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvdnav/libdvdnav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index d4c3b0c200..c5bebd4926 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -8,6 +8,7 @@ LIBDVDNAV_VERSION = 6.1.0
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
+LIBDVDNAV_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
