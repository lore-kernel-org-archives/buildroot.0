From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:46:19 +0200
Subject: [Buildroot] [git commit branch/next] weston: remove dependency on
 mesa3d to enable egl
Message-ID: <20180519204520.0C1C68B8DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17ceb6affc1c422eb73c856b34ae791a33762704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other packages can actually provide Wayland libraries like imx-gpu-viv.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e9de56b2c6..efe12bc01e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -50,8 +50,7 @@ else
 WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
-# Needs wayland-egl, which normally only mesa provides
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),y)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
