From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jan 2016 01:11:46 +0100
Subject: [Buildroot] [PATCH 2/6] package/mesa3d: select packages required by
	dri3proto support dependencies
In-Reply-To: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1451866310-10246-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_MESA3D_DRI_DRIVER and BR2_PACKAGE_XPROTO_DRI3PROTO
are selected, xlib_libxshmfence and xproto_presentproto packages
build are trigged at Makefile level.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Fixes:
http://autobuild.buildroot.net/results/6a4/6a471d2873ff7e645b0f0962d1719632e290993c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.4.3
