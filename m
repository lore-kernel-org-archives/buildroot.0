From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 23:29:09 +0200
Subject: [Buildroot] [git commit] mesa3d: use --enable-shared-glapi also for
	Gallium drivers
Message-ID: <20140512214905.2E6289CBAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b11289752e5f862afeced9f34bfab2e6a521b776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed since this upstream commit:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=0432aa064bf5d4d0ad8fc3c4d648b8feb238ddfa

Remove --disable-shared-glapi from the non-DRI-block, this
would break with enabled Gallium drivers.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a09e4c6..8c0678c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -63,13 +63,13 @@ MESA3D_CONF_OPT += \
 	--without-gallium-drivers
 else
 MESA3D_CONF_OPT += \
+	--enable-shared-glapi \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--disable-dri \
-	--disable-shared-glapi \
 	--without-dri-drivers
 else
 MESA3D_CONF_OPT += \
