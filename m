From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 May 2018 17:52:00 +0200
Subject: [Buildroot] [PATCH 2/3] weston: remove dependency on mesa3d to
 enable egl
In-Reply-To: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
Message-ID: <20180516155201.10279-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other packages can actually provide Wayland libraries like imx-gpu-viv.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
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
-- 
2.17.0
