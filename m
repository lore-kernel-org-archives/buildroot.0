From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Apr 2014 00:00:02 +0200
Subject: [Buildroot] [PATCH 6/6] package/xorg-server: do not force-select
	xf86driproto for mesa3d
In-Reply-To: <cover.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <1b076cbf2210b52a525e05b9a560f6b916561938.1396302677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is already handled by mesa3d itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index dfa7d10..e191dce 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -45,7 +45,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-- 
1.8.3.2
