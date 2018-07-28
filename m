From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:30:00 +0200
Subject: [Buildroot] [git commit] package/libdri2: switch to xorgproto
Message-ID: <20180728211151.98F118A392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb3a33b4bfcb64cf581a49149691f526565c9356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdri2/Config.in  | 2 +-
 package/libdri2/libdri2.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
index a10df7404a..fa3f76e8f3 100644
--- a/package/libdri2/Config.in
+++ b/package/libdri2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBDRI2
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Library for the DRI2 extension to the X Window System.
 
diff --git a/package/libdri2/libdri2.mk b/package/libdri2/libdri2.mk
index 22854b5060..79f38c680b 100644
--- a/package/libdri2/libdri2.mk
+++ b/package/libdri2/libdri2.mk
@@ -6,7 +6,7 @@
 
 LIBDRI2_VERSION = 4f1eef3183df2b270c3d5cbef07343ee5127a6a4
 LIBDRI2_SITE = $(call github,robclark,libdri2,$(LIBDRI2_VERSION))
-LIBDRI2_DEPENDENCIES = xlib_libXext xproto_dri2proto xlib_libXdamage libdrm
+LIBDRI2_DEPENDENCIES = xlib_libXext xlib_libXdamage xorgproto libdrm
 LIBDRI2_LICENSE = MIT
 LIBDRI2_LICENSE_FILES = COPYING
 
