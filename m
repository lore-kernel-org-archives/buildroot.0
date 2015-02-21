From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:52:54 +0100
Subject: [Buildroot] [git commit] package/efl/libevas: explicitly disable
	xlib support
Message-ID: <20150221155345.012B57FD15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6a62127afe6c3cac75379f48facdaca5524a9a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d69/d69a324434f370b490a53e6191d38a204ac28371

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 4868050..f327c02 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -72,6 +72,8 @@ LIBEVAS_CONF_OPTS += --enable-gl-xlib
 LIBEVAS_DEPENDENCIES += \
 	xproto_glproto xlib_libX11 xlib_libXrender \
 	xlib_libXext libeet
+else
+LIBEVAS_CONF_OPTS += --disable-gl-xlib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
