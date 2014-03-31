From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 23:59:59 +0200
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: is a full-openGL provider
	if X.org is present
In-Reply-To: <cover.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <7b289a2d0fd88d16d66a9ce87db4a3a43821c630.1396302677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In combination with X.org, mesa3d is a full-openGL provider, as long
as at least one driver is being built.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>

---
Thanks to Paul for explaining this on IRC! :-)
In parallel, Bernd posted his patch to the list, which was very similar
to this one.
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8ed0c07..f3d855b 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -34,6 +34,7 @@ comment "DRI drivers need shared libdrm"
 
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_HAS_OPENGL
 
 menu "Drivers"
 
@@ -106,6 +107,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endmenu
 
+config BR2_PACKAGE_PROVIDES_OPENGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRIVER
+
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
-- 
1.8.3.2
