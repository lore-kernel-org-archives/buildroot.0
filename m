From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:05 +0200
Subject: [Buildroot] [PATCH 01/13] package/xdriver_xf86-video-ati: depends
	on x86
In-Reply-To: <cover.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <a00b28f75409c0cd28dc6ae9f4ee3262ada481f3.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

xdriver_xf86-video-ati selects BR2_PACKAGE_LIBDRM_RADEON which
depends on x86.

This can generate "unmet direct dependencies" warnings.

Propagate the dependency from BR2_PACKAGE_LIBDRM_RADEON.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 3c0cac3..e32256c 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
+	depends on BR2_i386 || BR2_x86_64 # libdrm-radeon
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_MESA3D
-- 
1.8.3.2
