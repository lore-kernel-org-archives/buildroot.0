From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:25:36 +0200
Subject: [Buildroot] [git commit] package/libdvdread: fix build with gcc-4.8
Message-ID: <20200412211133.54C698E93E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71a46eb5725d7dc51266bdee0b9aa27172f140d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/28a/28a2e837eae1dae9214fab1aec119a9aa6b2e5c0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvdread/libdvdread.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 9a8eb7cacd..aa91d3162a 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -10,6 +10,7 @@ LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_V
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPL-2.0+
 LIBDVDREAD_LICENSE_FILES = COPYING
+LIBDVDREAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 LIBDVDREAD_CONF_OPTS = --with-libdvdcss
 LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
 
