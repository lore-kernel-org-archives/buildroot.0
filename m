From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 22 Feb 2015 18:16:44 +0100
Subject: [Buildroot] [PATCH] package/efl/libevas: explicitly disable X11
	support
Message-ID: <1424625404-29836-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bfc/bfc52a6f12789055ad376b40a00bc94847760469/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas/libevas.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index f327c02..40a01e7 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -65,6 +65,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
 LIBEVAS_CONF_OPTS += --enable-software-xlib
 LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+LIBEVAS_CONF_OPTS += --disable-software-xlib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
-- 
1.9.3
