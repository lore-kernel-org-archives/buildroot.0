From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:28:52 +0100
Subject: [Buildroot] [git commit] package/efl/libevas: explicitly disable
	X11 support
Message-ID: <20150222212903.6F45F807B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b41073b651df9d0fe08837e7dd0a43592df3991
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bfc/bfc52a6f12789055ad376b40a00bc94847760469/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
