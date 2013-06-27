From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 11:49:14 -0300
Subject: [Buildroot] [PATCH] xlib_libXpm: needs host-gettext
Message-ID: <1372344554-15562-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/00b/00b5c7745df5359908f6c77f90c1598b71638081/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.1.5
