From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2020 14:34:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: fix build with gcc-4.8
Message-ID: <20200411123451.52419-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/28a/28a2e837eae1dae9214fab1aec119a9aa6b2e5c0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
 
-- 
2.25.0
