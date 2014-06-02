From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 21:42:34 +0200
Subject: [Buildroot] [git commit] xapp_twm: needs host-bison
Message-ID: <20140602194308.05DED9CE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be382d949c84fc12c37aacace4391046abadcd8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c68/c680a2fec88861f20a2cbb17078537a62924dab9/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_twm/xapp_twm.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index e004b8d..7f6ba4f 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -9,6 +9,7 @@ XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
 XAPP_TWM_LICENSE_FILES = COPYING
-XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
+XAPP_TWM_DEPENDENCIES = \
+	host-bison xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
 $(eval $(autotools-package))
