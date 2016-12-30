From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 30 Dec 2016 17:22:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/efl: enable Wayland support if
	selectable
In-Reply-To: <20161230162250.2735-1-romain.naour@gmail.com>
References: <20161230162250.2735-1-romain.naour@gmail.com>
Message-ID: <20161230162250.2735-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If all the dependencies are available to select the efl wayland
support, enable it by default.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f6ec579..39a6303 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -162,6 +162,7 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	select BR2_PACKAGE_EFL_DRM
+	default y
 
 comment "Wayland support needs OpenGL ES w/ EGL, threads"
 	depends on BR2_PACKAGE_WAYLAND
-- 
2.9.3
