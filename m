From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 23:31:56 +0200
Subject: [Buildroot] [git commit] mesa3d: Fix gbm related compile error
Message-ID: <20140512214905.348B09CAF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95a30471da61bd8b1396d85fd4401c0cf7901c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://bugs.freedesktop.org/show_bug.cgi?id=78225#c1
"AFAICS both gbm backends require DRI"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8c0678c..63ba574 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -69,7 +69,6 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-	--disable-dri \
 	--without-dri-drivers
 else
 MESA3D_CONF_OPT += \
@@ -102,7 +101,6 @@ MESA3D_CONF_OPT += \
 	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
 else
 MESA3D_CONF_OPT += \
-	--disable-gbm \
 	--disable-egl
 endif
 
