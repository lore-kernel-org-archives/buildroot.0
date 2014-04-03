From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:12 +0200
Subject: [Buildroot] [PATCH v4 17/37] DO NOT COMMIT - package/mesa3d: is a
	full-openGL provider if X.org is present
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-18-git-send-email-bernd.kuhls@t-online.de>
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
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 324f1b6..12ec068 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -34,6 +34,7 @@ comment "DRI drivers need shared libdrm"
 
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_HAS_OPENGL
 
 menu "Drivers"
 
@@ -109,6 +110,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endmenu
 
+config BR2_PACKAGE_PROVIDES_OPENGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRIVER
+
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
-- 
1.7.10.4
