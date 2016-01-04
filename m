From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 00:17:33 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: select
	xlib_libxshmfence required by dri3proto support dependencies
Message-ID: <20160104232302.B9DF7822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cb8f160c2ebac03d29314511501271239f399ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_XPROTO_DRI3PROTO and
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR are selected, xlib_libxshmfence
package build is triggered at Makefile level.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Fixes:
http://autobuild.buildroot.net/results/a25/a253d19191dbc8bcc54f9e9d7fddae03d6695b4b/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 71697ef..f407d34 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -96,6 +96,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
 		BR2_PACKAGE_XPROTO_DRI2PROTO)
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
