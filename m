From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:01 +0200
Subject: [Buildroot] [PATCH 50/83 v2] package/libgtk3: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <8ece3f70580a2a5b4d7fd058978acdee0d69a58f.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgtk3 has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libgtk3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 39105ac..a9fac0c 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -10,7 +10,7 @@ comment "libgtk3 needs an OpenGL or OpenGL EGL backend provided by mesa3d"
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && \
 		!BR2_PACKAGE_HAS_LIBGL
 
-config BR2_PACKAGE_LIBGTK3
+menuconfig BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
-- 
2.7.4
