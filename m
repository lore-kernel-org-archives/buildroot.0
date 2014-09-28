From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:45:10 +0200
Subject: [Buildroot] [git commit] mesa3d: fix build without dri drivers
Message-ID: <20140928204703.B66C59D795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0edceb9d4e9ba6536af5b6687e8523f1c5ea5d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If no dri drivers are enabled, then mesa shouldn't get built with dri
support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8fc5075..ec76872 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -75,7 +75,7 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-	--without-dri-drivers
+	--without-dri-drivers --without-dri
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
