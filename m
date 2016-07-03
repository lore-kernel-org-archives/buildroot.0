From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:31:49 +0200
Subject: [Buildroot] [git commit] xapp_mkfontscale: add explicit
	dependencies for host variant
Message-ID: <20160703073818.86ABE7FD74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48c10fb06bdf74a2b7b6011dcfd44d2bef818ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index b99a646..d7abf6c 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -10,6 +10,8 @@ XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
+HOST_XAPP_MKFONTSCALE_DEPENDENCIES = \
+	host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
