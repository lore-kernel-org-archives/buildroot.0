From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:19:04 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfs: bump version to
 1.2.0
Message-ID: <20171201205340.8D37D80E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e2135a71056ff16243bde1c892ec8118a11fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xfs was ported to use libXfont 2.x instead of 1.x:
https://cgit.freedesktop.org/xorg/app/xfs/diff/configure.ac?id=fedc90e8e3f6c36204de5562bfb726270064a4f1

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfs/Config.in     | 2 +-
 package/x11r7/xapp_xfs/xapp_xfs.hash | 7 +++++--
 package/x11r7/xapp_xfs/xapp_xfs.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index 0a5d711..b708af8 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XAPP_XFS
 	bool "xfs"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBFS
-	select BR2_PACKAGE_XLIB_LIBXFONT
+	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	help
 	  X font server
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index 6782374..27577ba 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-August/002472.html
-sha256	a40b75e674c091464f85739292b6bf24e2d153f4a2ac456d3ea6b8a64e269ffa	xfs-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-November/002826.html
+md5  b4d2e644bfb35cae8858d2411501b07e  xfs-1.2.0.tar.bz2
+sha1 00848fcc2915ed8b00e75ac311c4727327324f57  xfs-1.2.0.tar.bz2
+sha256 db2212115783498f8eeaaee1349461d6c4e9d2005e142bacd3a984fe57269860  xfs-1.2.0.tar.bz2
+sha512 557b08aa07919239ce345d60b288b886640200bb1a59649fc890c3ccaa8559cc6745189614e696ab1b390ec024b393be5493787b7b0d2b3545b342d743c2e0ef  xfs-1.2.0.tar.bz2
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 3e70455..f4fe35d 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.1.4
+XAPP_XFS_VERSION = 1.2.0
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
-XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
+XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xproto_fontsproto
 
 $(eval $(autotools-package))
