From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 21:21:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-demos: X11 support depends
	on HAS_LIBGL
Message-ID: <1415478110-22543-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8f2/8f292f1151089d20f33c599320941cb5435c0199/
http://autobuild.buildroot.net/results/f3d/f3db50d0c5c74fecafd6b4bdd89f97e8e566d820/
http://autobuild.buildroot.net/results/ac0/ac0f22bf87e2b48bd2191de88999404d1c55de9b/
http://autobuild.buildroot.net/results/da8/da87a3e81b19ad038661f5653b544f4c8cfd389d/
http://autobuild.buildroot.net/results/d51/d51d22754a37f790d2de5a4836237b8eea417124/
http://autobuild.buildroot.net/results/347/347b2f79111548ae00f40879c1b5f3c4c1c7091e/
http://autobuild.buildroot.net/results/aef/aef73a3bc770c3784025642f6a2c276944117112/
http://autobuild.buildroot.net/results/901/90152f1cfa09ad4d37700b340204f8b75850c582/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-demos/mesa3d-demos.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 9b60dc9..07ec3e8 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -13,9 +13,9 @@ MESA3D_DEMOS_LICENSE = MIT
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu
-MESA3D_DEMOS_CONF_OPTS += --enable-gl
+MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gl
+MESA3D_DEMOS_CONF_OPTS += --disable-gl --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-- 
1.7.10.4
