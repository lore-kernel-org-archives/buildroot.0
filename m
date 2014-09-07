From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 12:08:05 +0200
Subject: [Buildroot] [PATCH] xapp_xfs: Bump version to 1.1.4
Message-ID: <1410084487-6023-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfs/xapp_xfs.mk |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 343a033..3e70455 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1c8459eafc04997751ae3d200d0ec91e43e19b5b
-XAPP_XFS_SITE = git://anongit.freedesktop.org/xorg/app/xfs
+XAPP_XFS_VERSION = 1.1.4
+XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
+XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
-XAPP_XFS_AUTORECONF = YES
-# xfont_font-util is only needed due to autoreconf. When switching
-# back to a tarball release, it can be removed.
-XAPP_XFS_DEPENDENCIES = xfont_font-util xlib_libFS xlib_libXfont xproto_fontsproto
+XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
 $(eval $(autotools-package))
-- 
1.7.10.4
