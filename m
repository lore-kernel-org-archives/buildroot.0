From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:26 +0200
Subject: [Buildroot] [PATCH 14/14] xapp_xdriinfo: depends on the virtual
	package libgl
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <fe9609b515ce099c8679a377896ea168b201bb39.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes http://autobuild.buildroot.net/results/90a/90a8226a8a2978eb13d02645cb9e3d95d9b95757/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: fix comment, trim the commit log from unneeded info]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xdriinfo/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 970bff5..36dc577 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  query configuration information of DRI drivers
+
+comment "xdriinfo needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
-- 
1.8.3.2
