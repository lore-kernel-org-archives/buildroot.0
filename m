From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:41:45 +0200
Subject: [Buildroot] [git commit] xapp_xfs: Fix compile errors after
	libXfont 1.5.0 update
Message-ID: <20140720094257.36DF39D08B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca7e3aebf4f4daf796f9c309f2e55d075517df60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/385/385cffbab4261337afa449998aa7457a8142db92/

[Thomas: add comment about the new xfont_font-util dependency being
needed only for autoreconf.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfs/xapp_xfs.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 0907fc3..343a033 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.1.3
-XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
-XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_VERSION = 1c8459eafc04997751ae3d200d0ec91e43e19b5b
+XAPP_XFS_SITE = git://anongit.freedesktop.org/xorg/app/xfs
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
-XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
+XAPP_XFS_AUTORECONF = YES
+# xfont_font-util is only needed due to autoreconf. When switching
+# back to a tarball release, it can be removed.
+XAPP_XFS_DEPENDENCIES = xfont_font-util xlib_libFS xlib_libXfont xproto_fontsproto
 
 $(eval $(autotools-package))
