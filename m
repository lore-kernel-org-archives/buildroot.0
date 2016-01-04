From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 00:15:41 +0100
Subject: [Buildroot] [git commit] package/mesa3d: select packages required
	by dri3proto support dependencies
Message-ID: <20160104232302.91A2A826FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b42fbdf2ac728f82a29fb5ce4191abc82d05793d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_MESA3D_DRI_DRIVER and BR2_PACKAGE_XPROTO_DRI3PROTO
are selected, xlib_libxshmfence and xproto_presentproto packages
build are trigged at Makefile level.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Fixes:
http://autobuild.buildroot.net/results/6a4/6a471d2873ff7e645b0f0962d1719632e290993c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fd7e7f8..8c72a3d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -30,6 +30,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGL
