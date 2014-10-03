From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 20:46:30 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Really disable dri3 support
Message-ID: <20141003184644.48AD99D80C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4082367e6cadea84a0da6f62a9a73f8efe9b085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/49c/49c5ee7a8a0adff325f4cb484b91347de9e36ebb/
http://autobuild.buildroot.net/results/b02/b02f1c42ac9467626a21242770440e52baf9e4d2/
http://autobuild.buildroot.net/results/01a/01a3a3da833cbe8268af55320c6f354ef5b4f863/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ec76872..a53ce07 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -75,7 +75,7 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-	--without-dri-drivers --without-dri
+	--without-dri-drivers --without-dri --disable-dri3
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
