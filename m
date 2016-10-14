From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 00:44:54 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86dga: needs MMU
Message-ID: <20161014224526.8C1227FDD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1625b8d35623559e7dbffae8982c6e737d5304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/f8f/f8f0b6cf9af21ff7d9ac76e670a7735ee9753315/
http://autobuild.buildroot.net/results/579/579e6db79929910ac53a914f65fc398a483134ae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
