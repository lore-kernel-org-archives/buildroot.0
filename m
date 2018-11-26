From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:49:50 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 package/x11r7/xlib_libfontenc: add missing dependency on host-pkgconf
Message-ID: <20181126084641.2B905885F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d8ac31601373df93305e97558b0c94e03540b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The xlib_libfontenc configure.ac uses PKG_CHECK_MODULES(), but the
Buildroot package does not have a dependency on host-pkgconf. This
causes a build failure with per-package host/target folders, or if one
builds just with "make xlib_libfontenc", which is why it was never
detected by the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7b1238055c2d369df335711c04cf8007c5b7edba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 526aea9fe5..cb84ae4ee1 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -10,8 +10,8 @@ XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
 XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
-XLIB_LIBFONTENC_DEPENDENCIES = zlib xorgproto
-HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xorgproto
+XLIB_LIBFONTENC_DEPENDENCIES = zlib xorgproto host-pkgconf
+HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xorgproto host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
