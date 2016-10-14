From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 14 Oct 2016 19:24:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXxf86dga: needs MMU
Message-ID: <20161014172427.29391-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f8f/f8f0b6cf9af21ff7d9ac76e670a7735ee9753315/
http://autobuild.buildroot.net/results/579/579e6db79929910ac53a914f65fc398a483134ae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXxf86dga/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index 5e21502..8276b71 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	bool "libXxf86dga"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-- 
2.9.3
