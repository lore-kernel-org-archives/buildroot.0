From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 13:13:32 +0200
Subject: [Buildroot] [git commit] xapp_xkbcomp: preseed xkbparse.c check
Message-ID: <20120923111411.6675C996DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0b4b5a06867fd1ac71fd8f32ac837245fbbcd03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3fd3f1c7dfd17178c33d8c7f6f4b184019709967

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 5208f1d..5bfb01b 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -8,6 +8,7 @@ XAPP_XKBCOMP_VERSION = 1.2.0
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+XAPP_XKBCOMP_CONF_ENV = ac_cv_file___xkbparse_c=yes
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
