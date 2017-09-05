From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 22:00:49 +0200
Subject: [Buildroot] [git commit] package/mesa3d: bump version to 17.2.0
Message-ID: <20170905195343.6ED0081EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88b5e583a3b9389159c0b008f140aaa1cf578a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependency to wayland-protocols needed by upstream:
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.2&id=02cc359372773800de817950aebdf9be2c7973d1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in   | 1 +
 package/mesa3d/mesa3d.hash | 7 ++-----
 package/mesa3d/mesa3d.mk   | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 13c118e..787e266 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 82a97d5..cca595b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000352.html
-md5 829777b6a95090e8ea58be93f00e75c7  mesa-17.1.8.tar.xz
-sha1 dee665bfc495c992967e439463f25f5061c9be16  mesa-17.1.8.tar.xz
-sha256 75ed2eaeae26ddd536150f294386468ae2e1a7717948c41cd14b7875be5269db  mesa-17.1.8.tar.xz
-sha512 d29fd999d75967683f5aa836cf0b701705f54de428ebbbac059c3e335e94552c0b455aa67fa2870464a086dc58994f2f320710a1abc265dea363241aede71c5b  mesa-17.1.8.tar.xz
+# From https://www.mesa3d.org/relnotes/17.2.0.html
+sha256 3123448f770eae58bc73e15480e78909defb892f10ab777e9116c9b218094943  mesa-17.2.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 76f632d..84ec70e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.8
+MESA3D_VERSION = 17.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -151,7 +151,7 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_PLATFORMS = drm
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MESA3D_DEPENDENCIES += wayland
+MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
 endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
