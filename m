From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Mar 2017 14:30:21 +0200
Subject: [Buildroot] [PATCH] mesa3d: drop unneeded libsha1 logic from
	Config.in
Message-ID: <20170328123021.18091-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7f4e9490b647 (package/mesa3d: remove sha1 external dependency)
removed the --with-sha1 logic from mesa3d.mk, but didn't remove the
corresponding logic / comment from Config.in.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 2b085ab59..57e88ec66 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -153,10 +153,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xproto_dri3proto
-	# We need a SHA1 implementation. If either openssl or
-	# libgcrypt are already part of the build, we'll use one of
-	# them, otherwise, use the small libsha1 library.
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XPROTO_DRI3PROTO
-- 
2.11.0
