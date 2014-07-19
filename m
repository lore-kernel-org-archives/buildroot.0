From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jul 2014 00:41:11 +0200
Subject: [Buildroot] [PATCH 2/2] xapp_xfs: Fix compile errors after libXfont
	1.5.0 update
In-Reply-To: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405809671-4609-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/385/385cffbab4261337afa449998aa7457a8142db92/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfs/xapp_xfs.mk |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 0907fc3..bd5ac55 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.1.3
-XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
-XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+#XAPP_XFS_VERSION = 1.1.3
+#XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
+#XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
+# this section is needed to fix compile errors after libXfont 1.5.0 update
+# it can be removed after the release of the next version of xapp_xfs
+XAPP_XFS_VERSION = 1c8459eafc04997751ae3d200d0ec91e43e19b5b
+XAPP_XFS_SITE = git://anongit.freedesktop.org/xorg/app/xfs
+XAPP_XFS_AUTORECONF = YES
+XAPP_XFS_DEPENDENCIES += xfont_font-util
+
 $(eval $(autotools-package))
-- 
1.7.10.4
