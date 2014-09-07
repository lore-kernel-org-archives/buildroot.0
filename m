From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 21:53:45 +0200
Subject: [Buildroot] [git commit] xapp_xfs: Bump version to 1.1.4
Message-ID: <20140907195715.5CD3D9D5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a441f8c4c06cae7736364b4fb11d70a6e632df9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xfs/xapp_xfs.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

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
