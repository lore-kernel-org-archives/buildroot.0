From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 19:40:34 +0200
Subject: [Buildroot] [git commit] xlib_libXpm: needs host-gettext
Message-ID: <20130627174332.2E2C19AF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79c55aadd54d098696644d77f9e60cd200e08753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/00b/00b5c7745df5359908f6c77f90c1598b71638081/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 6e72281..e0b4f2f 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -10,6 +10,7 @@ XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING
 XLIB_LIBXPM_INSTALL_STAGING = YES
-XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
+XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
+	host-gettext
 
 $(eval $(autotools-package))
